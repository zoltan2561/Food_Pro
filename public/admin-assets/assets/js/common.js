(function () {
    'use strict';
    const token = () => document.querySelector('meta[name="csrf-token"]')?.content || document.querySelector('input[name="_token"]')?.value || '';
    const showError = message => window.toastr ? toastr.error(message) : alert(message);
    async function send(url, values) {
        const response = await fetch(url, {
            method: 'POST',
            headers: { 'X-CSRF-TOKEN': token(), 'X-Requested-With': 'XMLHttpRequest', 'Accept': 'application/json', 'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8' },
            body: new URLSearchParams(values)
        });
        const content = await response.text();
        let result;
        try { result = JSON.parse(content); } catch (_) { result = content.trim(); }
        if (!response.ok || result === 0 || result === '0' || result?.status === 0) throw new Error(result?.message || wrong || 'A művelet nem sikerült.');
        return result;
    }
    async function confirmAction() {
        if (!window.Swal) return confirm(typeof are_you_sure === 'string' ? are_you_sure : 'Biztosan folytatod?');
        const answer = await Swal.fire({ title: typeof are_you_sure === 'string' ? are_you_sure : 'Biztosan folytatod?', icon: 'warning', showCancelButton: true, confirmButtonText: typeof yes === 'string' ? yes : 'Igen', cancelButtonText: typeof no === 'string' ? no : 'Mégse' });
        return answer.isConfirmed;
    }
    window.StatusUpdate = async function (id, status, url) {
        try { await send(url, { id, status }); location.reload(); } catch (error) { showError(error.message); }
    };
    window.Delete = window.DeleteData = async function (id, url) {
        if (!await confirmAction()) return;
        try { await send(url, { id }); location.reload(); } catch (error) { showError(error.message); }
    };
    window.changeStatus = async function (status, url) {
        try { await send(url, { status }); location.reload(); } catch (error) { showError(error.message); }
    };
    window.logout = function (url) { window.location.href = url; };
    window.myFunction = function () { showError('A bemutató módban ez a művelet nem érhető el.'); };
    window.delete_social_links = window.delete_features = async function (url) {
        if (!await confirmAction()) return;
        window.location.href = url;
    };
    window.add_social_link = function (iconLabel, linkLabel) {
        const host = document.querySelector('.extra_social_links');
        if (!host) return;
        const row = document.createElement('div'); row.className = 'row mb-2';
        const first = document.createElement('div'); first.className = 'col-md-6 form-group';
        const second = document.createElement('div'); second.className = 'col-md-6 form-group';
        const icon = document.createElement('input'); icon.className = 'form-control'; icon.name = 'social_icon[]'; icon.placeholder = iconLabel; icon.required = true;
        const link = document.createElement('input'); link.className = 'form-control'; link.name = 'social_link[]'; link.placeholder = linkLabel; link.required = true;
        first.append(icon); second.append(link); row.append(first, second); host.append(row);
    };
    window.add_features = function (iconLabel, titleLabel, descriptionLabel) {
        const host = document.querySelector('.extra_footer_features');
        if (!host) return;
        const row = document.createElement('div'); row.className = 'row mb-2';
        for (const [name, label, size] of [['feature_icon[]', iconLabel, 3], ['feature_title[]', titleLabel, 3], ['feature_description[]', descriptionLabel, 6]]) {
            const cell = document.createElement('div'); cell.className = 'col-md-' + size + ' form-group';
            const input = document.createElement('input'); input.className = 'form-control'; input.name = name; input.placeholder = label; input.required = true;
            cell.append(input); row.append(cell);
        }
        host.append(row);
    };
    window.show_feature_icon = function (input) { const target = input.closest('.input-group')?.querySelector('.input-group-text'); if (target) target.textContent = input.value; };
    window.statusupdate = async function (url) {
        if (await confirmAction()) window.location.href = url;
    };
    document.querySelectorAll('.open-table-modal').forEach(button => button.addEventListener('click', () => {
        const id = document.getElementById('bookingid');
        const number = document.getElementById('booking_number');
        if (id) id.value = button.dataset.id || '';
        if (number) number.value = button.dataset.bookingNumber || '';
    }));
    window.set_table_number = async function (status, url) {
        const id = document.getElementById('bookingid')?.value;
        const table_number = document.getElementById('table_number')?.value.trim();
        if (!id || !table_number) { showError('Add meg az asztalszámot.'); return; }
        try { await send(url, { id, status, table_number }); location.reload(); }
        catch (error) { showError(error.message); }
    };
    if (window.jQuery && $.fn.DataTable) {
        $(function () {
            $('table.zero-configuration').each(function () {
                if (!$.fn.DataTable.isDataTable(this)) $(this).DataTable({ pageLength: 25, order: [] });
            });
        });
    }
})();
