<div class="admin-sidebar-search">
    <label for="{{ $sidebarPrefix }}-menu-search">{{ trans('admin_ui.menu_search') }}</label>
    <input type="search" class="form-control" id="{{ $sidebarPrefix }}-menu-search" data-admin-menu-search
        autocomplete="off" placeholder="{{ trans('admin_ui.menu_search_placeholder') }}">
    <p class="admin-menu-search-empty" data-admin-menu-empty role="status" hidden>{{ trans('admin_ui.menu_search_empty') }}</p>
</div>
