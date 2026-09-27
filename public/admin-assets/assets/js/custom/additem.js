(function () {
    'use strict';
    const token = () => document.querySelector('meta[name="csrf-token"]')?.content || '';
    const error = message => window.toastr ? toastr.error(message) : alert(message);
    const category = document.getElementById('cat_id');
    const subcategory = document.getElementById('subcat_id');
    if (category && subcategory) category.addEventListener('change', async () => {
        const previous = subcategory.value;
        subcategory.replaceChildren(new Option('Válassz alkategóriát', ''));
        if (!category.value) return;
        try {
            const address = new URL(category.dataset.url, location.href);
            address.searchParams.set('id', category.value);
            const response = await fetch(address, { headers: { 'X-Requested-With': 'XMLHttpRequest' } });
            const data = await response.json();
            for (const item of data.data || []) subcategory.add(new Option(item.subcategory_name, item.id, false, String(item.id) === previous));
        } catch (cause) { error('Az alkategóriák betöltése sikertelen.'); }
    });
    function extraRow(nameLabel, priceLabel) {
        const row = document.createElement('div');
        row.className = 'row mb-2';
        const name = document.createElement('div'); name.className = 'col-md-6';
        const price = document.createElement('div'); price.className = 'col-md-5';
        const action = document.createElement('div'); action.className = 'col-md-1';
        const nameInput = document.createElement('input'); nameInput.name = 'extras_name[]'; nameInput.className = 'form-control'; nameInput.placeholder = nameLabel; nameInput.required = true;
        const priceInput = document.createElement('input'); priceInput.name = 'extras_price[]'; priceInput.className = 'form-control'; priceInput.type = 'number'; priceInput.min = '0'; priceInput.step = '0.01'; priceInput.placeholder = priceLabel; priceInput.required = true;
        const remove = document.createElement('button'); remove.type = 'button'; remove.className = 'btn btn-outline-danger'; remove.textContent = '×'; remove.setAttribute('aria-label', 'Extra eltávolítása'); remove.onclick = () => row.remove();
        name.append(nameInput); price.append(priceInput); action.append(remove); row.append(name, price, action);
        return row;
    }
    window.extras_fields = function (name, price) { document.getElementById('more_extras_fields')?.append(extraRow(name, price)); };
    window.more_editextras_fields = function (name, price) { document.getElementById('more_editextras_fields')?.append(extraRow(name, price)); };
    window.global_extras = async function (url, name, price) {
        try {
            const response = await fetch(url, { headers: { 'X-Requested-With': 'XMLHttpRequest' } });
            const data = await response.json();
            if (!response.ok || Number(data.status) !== 1) throw new Error('Az extrák betöltése sikertelen.');
            const host = document.getElementById('global-extras');
            if (!host) return;
            const existing = new Set([...document.querySelectorAll('[name="extras_name[]"]')].map(input => input.value.toLowerCase()));
            for (const item of data.responsdata || []) {
                if (existing.has(String(item.name).toLowerCase())) continue;
                const row = extraRow(name, price);
                row.querySelector('[name="extras_name[]"]').value = item.name;
                row.querySelector('[name="extras_price[]"]').value = item.price;
                host.append(row);
            }
        } catch (cause) { error(cause.message); }
    };
    async function send(url, values) {
        const response = await fetch(url, { method: 'POST', headers: { 'X-CSRF-TOKEN': token(), 'X-Requested-With': 'XMLHttpRequest' }, body: new URLSearchParams(values) });
        const body = await response.text();
        if (!response.ok || body.trim() !== '1') throw new Error('A művelet nem sikerült.');
        return body;
    }
    window.StatusFeatured = async function (id, status, url) { try { await send(url, { id, status }); location.reload(); } catch (cause) { error(cause.message); } };
    window.deleteItemExtras = async function (id, item_id, url) { try { await send(url, { id, item_id }); location.reload(); } catch (cause) { error(cause.message); } };
    window.deleteItemImage = async function (id, item_id, url) { try { await send(url, { id, item_id }); location.reload(); } catch (cause) { error(cause.message); } };
    window.updateItemImage = async function (id, url) {
        try {
            const response = await fetch(url, { method: 'POST', headers: { 'X-CSRF-TOKEN': token(), 'X-Requested-With': 'XMLHttpRequest' }, body: new URLSearchParams({ id }) });
            const data = await response.json();
            if (Number(data.ResponseCode) !== 1) throw new Error('A kép nem tölthető be.');
            document.getElementById('idd').value = id;
            document.getElementById('old_img').value = data.ResponseData.image;
            bootstrap.Modal.getOrCreateInstance(document.getElementById('EditImages')).show();
        } catch (cause) { error(cause.message); }
    };
    for (const [formId, urlId] of [['editimg', 'updateimageurl'], ['addproduct', 'storeimagesurl']]) {
        const form = document.getElementById(formId);
        if (!form) continue;
        form.addEventListener('submit', async event => {
            event.preventDefault();
            const values = new FormData(form); values.append('_token', token());
            try {
                const response = await fetch(document.getElementById(urlId).value, { method: 'POST', body: values });
                const data = await response.json();
                if (!response.ok || (data.error && data.error.length)) throw new Error('A kép mentése sikertelen.');
                location.reload();
            } catch (cause) { error(cause.message); }
        });
    }
})();
