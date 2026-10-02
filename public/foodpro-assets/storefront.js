(function () {
    'use strict';

    const body = document.body;
    const navigation = document.querySelector('.mobile_menu_footer');
    const cart = document.querySelector('.cart-modal');
    const mobile = window.matchMedia('(max-width: 991.98px)');
    const reducedMotion = window.matchMedia('(prefers-reduced-motion: reduce)');

    function measureBars() {
        const navigationVisible = !!navigation && navigation.getBoundingClientRect().height > 0;
        const cartVisible = !!cart && !cart.hidden;
        body.classList.toggle('storefront-has-mobile-nav', navigationVisible);
        body.classList.toggle('storefront-has-cart', cartVisible);
        if (navigationVisible) body.style.setProperty('--storefront-nav-height', Math.ceil(navigation.getBoundingClientRect().height) + 'px');
        if (cartVisible) body.style.setProperty('--storefront-cart-height', Math.ceil(cart.getBoundingClientRect().height) + 20 + 'px');
    }

    function updateCart(count) {
        const quantity = Number(count);
        if (!Number.isFinite(quantity) || quantity < 0) return;
        document.querySelectorAll('.js-cart-count').forEach(node => { node.textContent = String(quantity); });
        if (cart) cart.hidden = quantity === 0;
        measureBars();
    }

    document.addEventListener('storefront:cart-updated', event => updateCart(event.detail?.count));
    window.addEventListener('pageshow', measureBars);
    window.addEventListener('resize', measureBars, { passive: true });
    if ('ResizeObserver' in window) {
        const observer = new ResizeObserver(measureBars);
        if (navigation) observer.observe(navigation);
        if (cart) observer.observe(cart);
    }

    // Keep the selected category visible without moving the page vertically.
    document.querySelectorAll('.storefront-category-nav > .container').forEach(container => {
        const active = container.querySelector('[aria-current="page"]');
        if (!active) return;
        const parentBounds = container.getBoundingClientRect();
        const activeBounds = active.getBoundingClientRect();
        container.scrollLeft += activeBounds.left - parentBounds.left - (parentBounds.width - activeBounds.width) / 2;
    });

    function updateKeyboard() {
        const focused = document.activeElement;
        const editable = focused?.matches('textarea, input:not([type="radio"]):not([type="checkbox"]):not([type="button"]):not([type="submit"])');
        const keyboardOpen = mobile.matches && editable && window.visualViewport && window.innerHeight - window.visualViewport.height > 150;
        body.classList.toggle('storefront-keyboard-open', !!keyboardOpen);
    }
    window.visualViewport?.addEventListener('resize', updateKeyboard);
    document.addEventListener('focusin', updateKeyboard);
    document.addEventListener('focusout', () => window.requestAnimationFrame(updateKeyboard));

    function pauseMotion() {
        if (!reducedMotion.matches) return;
        document.querySelectorAll('.carousel').forEach(element => window.bootstrap?.Carousel.getInstance(element)?.pause());
        if (window.jQuery) window.jQuery('.owl-carousel').trigger('stop.owl.autoplay');
    }
    reducedMotion.addEventListener('change', pauseMotion);
    window.addEventListener('load', pauseMotion);
    measureBars();
    pauseMotion();
})();
