<!-- For Large Devices -->
<nav class="sidebar sidebar-lg" aria-label="{{ trans('admin_ui.navigation') }}">
    <div class="d-flex justify-content-center align-items-center mb-3 border-bottom border-white">
        <div class="navbar-header-logo pb-2">
            <a href="{{ URL::to('admin/home') }}" class="text-white fs-4">
                @if (Auth::user()->type == 1)
                    {{ trans('admin_ui.workspace') }}
                @elseif(Auth::user()->type == 4)
                    {{ trans('labels.employee') }}
                @endif
            </a>
        </div>
    </div>
    @include('admin.partials.sidebar-search', ['sidebarPrefix' => 'desktop'])
    @include('admin.theme.sidebarcontent', ['sidebarPrefix' => 'desktop'])
</nav>
<!-- For Small Devices -->
<nav class="collapse collapse-horizontal sidebar sidebar-md" id="sidebarcollapse" aria-label="{{ trans('admin_ui.navigation') }}">
    <div class="d-flex justify-content-between align-items-center mb-4 border-bottom border-white">
        <a href="{{ URL::to('admin/home') }}" class="text-white fs-4">
            @if (Auth::user()->type == 1)
                {{ trans('admin_ui.workspace') }}
            @elseif(Auth::user()->type == 4)
                {{ trans('labels.employee') }}
            @endif
        </a>
        <button class="btn text-white" type="button" data-bs-toggle="collapse" data-bs-target="#sidebarcollapse"
            aria-expanded="false" aria-controls="sidebarcollapse" aria-label="{{ trans('admin_ui.menu_close') }}"><i class="fa-solid fa-xmark" aria-hidden="true"></i></button>
    </div>
    @include('admin.partials.sidebar-search', ['sidebarPrefix' => 'mobile'])
    @include('admin.theme.sidebarcontent', ['sidebarPrefix' => 'mobile'])
</nav>
