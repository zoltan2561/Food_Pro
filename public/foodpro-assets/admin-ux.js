(function () {
    'use strict';

    const normalize = value => value.normalize('NFD').replace(/[\u0300-\u036f]/g, '').toLocaleLowerCase().trim();
    const settingsLinks = [...document.querySelectorAll('.list-options a[href^="#"]')];
    const selectSettingsSection = hash => {
        settingsLinks.forEach(link => {
            const current = link.getAttribute('href') === hash;
            link.classList.toggle('active', current);
            if (current) link.setAttribute('aria-current', 'location');
            else link.removeAttribute('aria-current');
        });
    };
    if (settingsLinks.length) {
        selectSettingsSection(settingsLinks.some(link => link.getAttribute('href') === window.location.hash)
            ? window.location.hash : settingsLinks[0].getAttribute('href'));
        settingsLinks.forEach(link => link.addEventListener('click', () => selectSettingsSection(link.getAttribute('href'))));
        window.addEventListener('hashchange', () => selectSettingsSection(window.location.hash));
    }
    document.querySelectorAll('.sidebar').forEach(sidebar => {
        const input = sidebar.querySelector('[data-admin-menu-search]');
        const empty = sidebar.querySelector('[data-admin-menu-empty]');
        const menu = sidebar.querySelector('.navbar-nav');
        if (!input || !menu) return;

        sidebar.querySelectorAll('.nav-link').forEach(link => {
            if (link.classList.contains('active')) link.setAttribute('aria-current', 'page');
            else link.removeAttribute('aria-current');
        });
        sidebar.querySelectorAll('.collapse .nav-link.active').forEach(link => {
            const panel = link.closest('.collapse');
            if (panel && panel !== sidebar) window.bootstrap?.Collapse.getOrCreateInstance(panel, { toggle: false }).show();
        });
        let savedPanels = null;
        const items = [...menu.children];

        input.addEventListener('input', () => {
            const query = normalize(input.value);
            if (query && !savedPanels) savedPanels = new Map([...menu.querySelectorAll('.collapse')].map(panel => [panel, panel.classList.contains('show')]));
            let matches = 0;
            items.forEach(item => {
                if (item.querySelector('h6')) return;
                // Visibility set by the existing module permissions is retained.
                if (item.classList.contains('d-none')) return;
                const link = item.querySelector(':scope > .nav-link');
                const parentMatch = !query || normalize(link?.textContent || '').includes(query);
                const panel = item.querySelector('.collapse');
                let childMatch = false;
                panel?.querySelectorAll('li').forEach(child => {
                    child.hidden = !!query && !parentMatch && !normalize(child.textContent).includes(query);
                    childMatch ||= !child.hidden;
                });
                item.hidden = !parentMatch && !childMatch;
                if (!item.hidden) matches++;
                if (query && panel && !item.hidden) window.bootstrap?.Collapse.getOrCreateInstance(panel, { toggle: false }).show();
            });
            items.forEach((item, index) => {
                if (!item.querySelector('h6')) return;
                let visible = false;
                for (let next = index + 1; next < items.length && !items[next].querySelector('h6'); next++) {
                    if (!items[next].hidden && !items[next].classList.contains('d-none')) visible = true;
                }
                item.hidden = !!query && !visible;
            });
            if (!query && savedPanels) {
                savedPanels.forEach((open, panel) => {
                    const collapse = window.bootstrap?.Collapse.getOrCreateInstance(panel, { toggle: false });
                    if (open) collapse?.show(); else collapse?.hide();
                });
                savedPanels = null;
            }
            if (empty) empty.hidden = !!query && matches === 0 ? false : true;
        });
    });
})();
