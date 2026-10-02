@php
    $workspaceModules = explode(',', helper::get_roles());
    $workspaceLinks = [
        ['module' => '1', 'path' => 'orders', 'key' => 'orders', 'icon' => 'receipt'],
        ['module' => '10', 'path' => 'item', 'key' => 'items', 'icon' => 'utensils'],
        ['module' => '12', 'path' => 'time', 'key' => 'hours', 'icon' => 'clock'],
        ['module' => '2', 'path' => 'report', 'key' => 'report', 'icon' => 'chart-column'],
    ];
    $workspaceLinks = array_filter($workspaceLinks, fn ($link) => Auth::user()->type == 1 || in_array($link['module'], $workspaceModules, true));
@endphp
@if (count($workspaceLinks))
    <section class="mb-4" aria-labelledby="admin-daily-tasks">
        <h2 class="h5" id="admin-daily-tasks">{{ trans('admin_ui.daily_tasks') }}</h2>
        <p class="admin-help-text">{{ trans('admin_ui.daily_tasks_help') }}</p>
        <div class="admin-workspace-links">
            @foreach ($workspaceLinks as $link)
                <a href="{{ url('admin/' . $link['path']) }}">
                    <i class="fa-solid fa-{{ $link['icon'] }}" aria-hidden="true"></i>
                    <span><strong>{{ trans('admin_ui.shortcut_' . $link['key']) }}</strong>
                        <small>{{ trans('admin_ui.shortcut_' . $link['key'] . '_help') }}</small></span>
                    <i class="fa-solid fa-arrow-right" aria-hidden="true"></i>
                </a>
            @endforeach
        </div>
    </section>
@endif
