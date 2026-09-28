(function () {
    'use strict';
    window.foodProPlaceOrder = async function () {
        const button = document.getElementById('place-order-btn');
        const first = document.getElementById('first_name');
        const last = document.getElementById('last_name');
        const email = document.getElementById('email');
        const mobile = document.getElementById('mobile');
        const orderType = document.getElementById('order_type')?.value || '1';
        const payment = document.querySelector('input[name="transaction_type"]:checked');
        const notify = message => window.toastr ? toastr.error(message) : alert(message);
        for (const field of [first, last, mobile]) {
            if (!field?.value.trim()) { notify('Töltsd ki a kötelező mezőket.'); field?.focus(); return; }
        }
        if (!email?.value.trim() || !email.checkValidity()) { notify('Adj meg egy érvényes e-mail címet.'); email?.focus(); return; }
        if (!payment) { notify('Válassz fizetési módot.'); return; }
        if (![1, 17].includes(Number(payment.value))) { notify('Ez a fizetési mód jelenleg nem érhető el.'); return; }
        if (orderType === '1') {
            for (const field of [document.getElementById('new_address'), document.getElementById('new_city'), document.getElementById('delivery_area')]) {
                if (!field?.value.trim()) { notify('Add meg a szállítási címet és területet.'); field?.focus(); return; }
            }
        }
        const scheduleMode = document.querySelector('input[name="schedule_mode"]:checked')?.value || 'now';
        if (scheduleMode === 'scheduled') {
            for (const field of [document.getElementById('delivery_date'), document.getElementById('deliverytime')]) {
                if (!field?.value) { notify('Válassz napot és idősávot.'); (field?._flatpickr?.altInput || field)?.focus(); return; }
            }
        }
        const body = new URLSearchParams();
        document.querySelectorAll('#first_name, #last_name, #email, #mobile, #new_address, #new_city, #delivery_area, #delivery_date, #deliverytime, #order_notes, #order_type, #grand_total, #delivery_charge, #tax, #tax_name, #buynow').forEach(input => {
            const key = ({ new_address: 'address', new_city: 'city', deliverytime: 'delivery_time' })[input.id] || input.name || input.id;
            body.set(key, input.value);
        });
        if (orderType !== '1') {
            for (const key of ['address', 'city', 'delivery_area']) body.delete(key);
        }
        body.set('name', [first.value.trim(), last.value.trim()].join(' '));
        body.set('transaction_type', payment.value);
        body.set('schedule_mode', scheduleMode);
        body.set('terms', document.getElementById('terms')?.checked ? '1' : '0');
        body.set('address_type', orderType === '1' ? (document.getElementById('address_type')?.value || '') : '');
        body.set('pincode', orderType === '1' ? (document.getElementById('pincode')?.value || '') : '');
        body.set('landmark', orderType === '1' ? (document.getElementById('landmark')?.value || '') : '');
        body.set('country', orderType === '1' ? (document.getElementById('country')?.value || '') : '');
        body.set('state', orderType === '1' ? (document.getElementById('state')?.value || '') : '');
        if (payment.dataset.orderNotes) body.set('order_notes', [body.get('order_notes'), payment.dataset.orderNotes].filter(Boolean).join(' · '));
        button.disabled = true;
        try {
            const response = await fetch(document.getElementById('orderurl').value, {
                method: 'POST',
                headers: { 'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]')?.content || '', 'X-Requested-With': 'XMLHttpRequest', 'Accept': 'application/json', 'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8' },
                body
            });
            const result = await response.json();
            if (!response.ok || Number(result.status) !== 1) throw new Error(result.message || 'A rendelés nem sikerült.');
            window.location.href = siteurl + '/success-' + encodeURIComponent(result.order_id);
        } catch (error) { notify(error.message); button.disabled = false; }
    };
})();
