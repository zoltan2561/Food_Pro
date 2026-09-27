(function () {
    'use strict';
    window.deleteaddress = async function (id, url) {
        const confirmed = window.Swal ? (await Swal.fire({ text: 'Törlöd a címet?', icon: 'warning', showCancelButton: true })).isConfirmed : confirm('Törlöd a címet?');
        if (!confirmed) return;
        const token = document.querySelector('meta[name="csrf-token"]')?.content || '';
        try {
            const response = await fetch(url.trim(), { method: 'POST', headers: { 'X-CSRF-TOKEN': token, 'X-Requested-With': 'XMLHttpRequest' }, body: new URLSearchParams({ id }) });
            if (!response.ok || (await response.text()).trim() !== '1') throw new Error('A cím törlése nem sikerült.');
            location.reload();
        } catch (error) { window.toastr ? toastr.error(error.message) : alert(error.message); }
    };
})();
