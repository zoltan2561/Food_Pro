(function () {
    'use strict';
    const field = document.getElementById('data');
    const host = document.querySelector('.sharing-section');
    if (!field || !host) return;
    const copy = document.createElement('button');
    copy.type = 'button'; copy.className = 'btn btn-primary me-2'; copy.textContent = 'Hivatkozás másolása';
    copy.addEventListener('click', async () => {
        try {
            await navigator.clipboard.writeText(field.value);
            if (window.toastr) toastr.success('A hivatkozás kimásolva.');
        } catch (_) { field.select(); document.execCommand('copy'); }
    });
    host.append(copy);
    if (navigator.share) {
        const share = document.createElement('button');
        share.type = 'button'; share.className = 'btn btn-outline-primary'; share.textContent = 'Megosztás';
        share.addEventListener('click', () => navigator.share({ title: document.title, url: field.value }).catch(() => {}));
        host.append(share);
    }
})();
