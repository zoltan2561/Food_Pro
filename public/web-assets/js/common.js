(function () {
    'use strict';

    const csrf = () => document.querySelector('meta[name="csrf-token"]')?.content || '';
    const value = id => document.getElementById(id)?.value || '';
    const notice = message => window.toastr ? toastr.error(message) : alert(message);
    const success = message => window.toastr ? toastr.success(message) : null;

    async function post(url, values) {
        const response = await fetch(url, {
            method: 'POST',
            headers: { 'X-CSRF-TOKEN': csrf(), 'X-Requested-With': 'XMLHttpRequest', 'Accept': 'application/json', 'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8' },
            body: new URLSearchParams(values)
        });
        const result = await response.json();
        if (!response.ok || Number(result.status) === 0) throw new Error(result.message || 'A művelet nem sikerült.');
        return result;
    }

    window.showitem = async function (slug, url) {
        try {
            const response = await fetch(url + '?slug=' + encodeURIComponent(slug), { headers: { 'X-Requested-With': 'XMLHttpRequest', 'Accept': 'application/json' } });
            const result = await response.json();
            if (!response.ok || Number(result.status) !== 1) throw new Error(result.message || 'A termék nem érhető el.');
            document.getElementById('modalitem_body').innerHTML = result.output;
            bootstrap.Modal.getOrCreateInstance(document.getElementById('modalitemdetails')).show();
            window.getaddons(result.id);
        } catch (error) { notice(error.message); }
    };

    window.changeqty = function (slug, direction) {
        const input = document.getElementById('item_qty_' + slug);
        if (!input) return;
        input.value = Math.max(1, Math.min(99, Number(input.value || 1) + (direction === 'plus' ? 1 : -1)));
        const item = [...document.querySelectorAll('[id^="slug_"]')].find(node => node.value === slug);
        if (item) window.getaddons(item.id.slice(5));
    };

    window.getaddons = function (id) {
        const item = document.querySelector('.subtotal_' + id);
        const base = Number(value('item_price_' + id)) || 0;
        const extra = [...document.querySelectorAll('.addons_chk_' + id + ':checked, .extras_chk_' + id + ':checked')]
            .reduce((sum, input) => sum + Number(input.dataset.addonsPrice || input.dataset.extrasPrice || 0), 0);
        if (typeof window.currency_format !== 'function') return;
        if (item) item.textContent = currency_format(base + extra);
        const slug = value('slug_' + id);
        const qty = Math.max(1, Number(value('item_qty_' + slug)) || 1);
        document.querySelectorAll('.foodpro-selection-total[data-item-id="' + id + '"]')
            .forEach(node => { node.textContent = currency_format((base + extra) * qty); });
    };

    window.addtocart = async function (url, id, buynow) {
        const slug = value('slug_' + id);
        const groups = document.getElementById('addongroup_' + id);
        let rules = [];
        try { rules = JSON.parse(groups?.dataset.addongroup_val || '[]'); } catch (_) { /* no groups */ }
        for (const group of rules) {
            if (!document.getElementById('item_addons_group_' + id + '_' + group.id)) continue;
            const selected = document.querySelectorAll('[name="addons_id_' + group.id + '_' + id + '"]:checked:not([value=""])');
            const required = Number(group.selection_type) === 1;
            const minimum = required ? (Number(group.selection_count) === 1 ? 1 : Math.max(1, Number(group.min_count) || 1)) : 0;
            const maximum = Number(group.selection_count) === 1 ? 1 : Math.max(1, Number(group.max_count) || 1);
            if (selected.length < minimum || selected.length > maximum) {
                notice('Válassz megfelelő számú feltétet: ' + group.name);
                return;
            }
        }
        const addons = [...document.querySelectorAll('.addons_chk_' + id + ':checked')];
        const extras = [...document.querySelectorAll('.extras_chk_' + id + ':checked')];
        const withoutGroups = addons.filter(input => input.dataset.groupId).map(input => input.dataset.groupId);
        const join = (items, field) => items.map(input => input.dataset[field] || '').join('| ');
        const data = {
            slug, item_name: value('item_name_' + id), item_type: value('item_type_' + id),
            image_name: value('image_name_' + id), tax: value('item_tax_' + id), item_price: value('item_price_' + id),
            addons_id: join(addons, 'addonsId'), addons_name: join(addons, 'addonsName'), addons_price: join(addons, 'addonsPrice'),
            extras_id: join(extras, 'extrasId'), extras_name: join(extras, 'extrasName'), extras_price: join(extras, 'extrasPrice'),
            without_groups: withoutGroups.join('|'), item_notes: value('item_notes_' + id).trim(),
            qty: value('item_qty_' + slug) || '1', buynow
        };
        try {
            const result = await post(url, data);
            if (Number(result.status) !== 1) throw new Error(result.message || 'A kosárba helyezés nem sikerült.');
            if (Number(buynow) === 1) {
                window.location.href = siteurl + '/checkout?buynow=1';
                return;
            }
            document.querySelectorAll('.qut_counter, .js-cart-count').forEach(node => { node.textContent = result.data; });
            bootstrap.Modal.getInstance(document.getElementById('modalitemdetails'))?.hide();
            success('A termék a kosárba került.');
        } catch (error) { notice(error.message); }
    };

    window.qtyupdate = async function (id, type, url) {
        try { await post(url, { id, type }); window.location.reload(); }
        catch (error) { notice(error.message); }
    };

    window.isopenclose = async function (url, qty, amount) {
        try {
            const check = await post(url, {
                qty, order_amount: amount, buynow: value('buynow') || '0',
                schedule_mode: document.querySelector('input[name="schedule_mode"]:checked')?.value || 'now'
            });
            if (![1, 3].includes(Number(check.status))) {
                if (Number(check.status) === 4) window.location.href = siteurl + '/login';
                else notice(check.message || 'A rendelés jelenleg nem adható le.');
                return;
            }
            if (document.getElementById('place-order-btn')) {
                if (typeof window.foodProPlaceOrder === 'function') return window.foodProPlaceOrder();
                notice('A fizetési folyamat nem érhető el.');
            } else {
                window.location.href = siteurl + '/checkout?buynow=0';
            }
        } catch (error) { notice(error.message); }
    };

    window.showlogin = function () { window.location.href = siteurl + '/login'; };
    window.getoffercode = function (code) { const input = document.getElementById('offer_code'); if (input) input.value = code; };
    window.managefavorite = async function (id, type, url) {
        try {
            await post(url, { id, type, favurl: url });
            window.location.reload();
        } catch (error) { notice(error.message); }
    };
    window.removefromcart = function (url, message, label) {
        if (window.Swal) Swal.fire({ text: message, icon: 'info', showCancelButton: true, confirmButtonText: label }).then(result => {
            if (result.isConfirmed) window.location.href = url;
        });
        else if (confirm(message)) window.location.href = url;
    };
    window.cancelorder = async function (number, url) {
        const confirmed = window.Swal ? (await Swal.fire({ text: 'Lemondod a rendelést?', icon: 'warning', showCancelButton: true })).isConfirmed : confirm('Lemondod a rendelést?');
        if (!confirmed) return;
        try { await post(url, { id: number }); window.location.reload(); }
        catch (error) { notice(error.message); }
    };
    window.showaddons = function (addonNames, addonPrices, extraNames, extraPrices, itemName) {
        const modal = document.getElementById('modal_selected_addons');
        if (!modal) return;
        const title = modal.querySelector('#addon_item_name');
        if (title) title.textContent = itemName;
        for (const [listId, names, prices] of [['item-addons', addonNames, addonPrices], ['item-extras', extraNames, extraPrices]]) {
            const list = modal.querySelector('#' + listId);
            if (!list) continue;
            list.replaceChildren();
            const amounts = String(prices || '').split('| ');
            String(names || '').split('| ').filter(Boolean).forEach((name, index) => {
                const row = document.createElement('li');
                row.className = 'd-flex justify-content-between gap-3';
                const label = document.createElement('span'); label.textContent = name;
                const amount = document.createElement('span'); amount.textContent = typeof window.currency_format === 'function' ? currency_format(amounts[index] || 0) : amounts[index] || '';
                row.append(label, amount); list.append(row);
            });
            list.parentElement?.classList.toggle('d-none', list.childElementCount === 0);
        }
        bootstrap.Modal.getOrCreateInstance(modal).show();
    };
    window.itemsallergens = async function (id, url) {
        try {
            const address = new URL(url, location.href); address.searchParams.set('item_id', id);
            const response = await fetch(address);
            if (!response.ok) throw new Error('Az allergének nem érhetők el.');
            const data = await response.json();
            const modal = document.getElementById('itemallergens');
            modal.querySelector('#allergensDisplay').textContent = String(data.item_allergens || 'Nincs megadott allergén.').replace(/<[^>]*>/g, ' ').replace(/\s+/g, ' ').trim();
            bootstrap.Modal.getOrCreateInstance(modal).show();
        } catch (error) { notice(error.message); }
    };

    if ('IntersectionObserver' in window && !window.matchMedia('(prefers-reduced-motion: reduce)').matches) {
        document.addEventListener('DOMContentLoaded', function () {
            const cards = document.querySelectorAll('.reveal');
            if (!cards.length) return;
            document.documentElement.classList.add('has-reveal');
            const observer = new IntersectionObserver(entries => {
                entries.forEach(entry => {
                    if (!entry.isIntersecting) return;
                    entry.target.classList.add('is-visible');
                    observer.unobserve(entry.target);
                });
            }, { rootMargin: '0px 0px -24px 0px', threshold: .08 });
            cards.forEach(card => observer.observe(card));
        });
    }
})();
