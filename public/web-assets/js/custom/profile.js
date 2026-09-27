document.addEventListener('DOMContentLoaded', () => {
    const picker = document.getElementById('imageupload');
    const preview = document.getElementById('imgupload');
    if (!picker || !preview) return;

    let previousPreview;
    picker.addEventListener('change', () => {
        const file = picker.files?.[0];
        if (!file || !file.type.startsWith('image/')) return;
        if (previousPreview) URL.revokeObjectURL(previousPreview);
        previousPreview = URL.createObjectURL(file);
        preview.src = previousPreview;
    });
});
