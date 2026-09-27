(function () {
    'use strict';
    const token = () => document.querySelector('meta[name="csrf-token"]')?.content || '';
    const showError = message => window.toastr ? toastr.error(message) : alert(message);
    async function send(url, values) {
        const response = await fetch(url, { method: 'POST', headers: { 'X-CSRF-TOKEN': token(), 'X-Requested-With': 'XMLHttpRequest' }, body: new URLSearchParams(values) });
        const body = await response.text();
        if (!response.ok || body.trim() === '0') throw new Error('A módosítás nem sikerült.');
        return body;
    }
    window.OrderStatusUpdate = async function (id, status, statustype, url) {
        const confirmed = window.Swal ? (await Swal.fire({ text: 'Módosítod a rendelés állapotát?', icon: 'question', showCancelButton: true })).isConfirmed : confirm('Módosítod a rendelés állapotát?');
        if (!confirmed) return;
        try { await send(url, { id, status, statustype }); location.reload(); }
        catch (error) { showError(error.message); }
    };
    window.assigndriver = async function () {
        const orderId = document.getElementById('order_id')?.value;
        const driverId = document.getElementById('driver_id')?.value;
        const url = document.getElementById('driverurl')?.value;
        if (!orderId || !driverId || !url) { showError('Válassz futárt és rendelést.'); return; }
        try { await send(url, { order_id: orderId, driver_id: driverId }); location.reload(); }
        catch (error) { showError(error.message); }
    };
})();
