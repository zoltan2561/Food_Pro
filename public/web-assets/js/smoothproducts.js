(function ($) {
    'use strict';
    $.fn.smoothproducts = function () {
        return this.each(function () {
            const gallery = this;
            const links = [...gallery.querySelectorAll(':scope > a')];
            if (!links.length) return;
            gallery.classList.add('foodpro-gallery');
            links.forEach((link, index) => {
                link.classList.toggle('is-active', index === 0);
                link.setAttribute('aria-label', 'Termékkép ' + (index + 1));
                link.addEventListener('click', event => {
                    event.preventDefault();
                    links.forEach(item => item.classList.remove('is-active'));
                    link.classList.add('is-active');
                });
            });
        });
    };
})(jQuery);
