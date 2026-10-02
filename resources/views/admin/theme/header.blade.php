<header class="page-topbar">




    <div class="navbar-header">
        <div class="">
            <button class="navbar-toggler d-lg-none d-md-block px-md-4 px-3" type="button" data-bs-toggle="collapse"
                data-bs-target="#sidebarcollapse" aria-expanded="false" aria-controls="sidebarcollapse" aria-label="{{ trans('admin_ui.menu_open') }}">
                <i class="fa-regular fa-bars fs-4"></i>
            </button>
        </div>
        <div class="px-md-3 px-0 admin-header-tools">

            @if (Auth::user()->type == 1)
                @php $activeSkin = helper::appdata()->admin_skin ?? 'spring'; @endphp
                <div class="dropdown me-2">
                    <button class="btn btn-sm btn-outline-primary dropdown-toggle" type="button" id="adminSkinMenu"
                        data-bs-toggle="dropdown" aria-expanded="false" aria-label="Admin megjelenés">
                        Megjelenés
                    </button>
                    <ul class="dropdown-menu skin-menu" aria-labelledby="adminSkinMenu">
                        @foreach (['winter' => 'Tél', 'spring' => 'Tavasz', 'summer' => 'Nyár', 'autumn' => 'Ősz'] as $skin => $label)
                            <li>
                                <form action="{{ URL::to('admin/settings/update') }}" method="post">
                                    @csrf
                                    <input type="hidden" name="admin_skin_update" value="1">
                                    <input type="hidden" name="admin_skin" value="{{ $skin }}">
                                    <button class="dropdown-item d-flex align-items-center gap-2 {{ $activeSkin === $skin ? 'active' : '' }}"
                                        type="submit" aria-pressed="{{ $activeSkin === $skin ? 'true' : 'false' }}">
                                        <span class="skin-dot skin-dot-{{ $skin }}"></span>{{ $label }}
                                    </button>
                                </form>
                            </li>
                        @endforeach
                    </ul>
                </div>
            @endif

            @if (Auth::user()->type == 1 || Auth::user()->type == 4)
                @php $onlineOrders = (int) \App\Models\User::whereIn('type', [1, 4])->value('is_online') === 1; @endphp
                <div class="admin-service-control">
                    <div class="form-check form-switch">
                        <input id="open-close-switch" type="checkbox" class="form-check-input" name="open-close"
                            value="{{ $onlineOrders ? '1' : '' }}" @checked($onlineOrders)
                            aria-describedby="admin-ordering-help"
                            @if (env('Environment') == 'sendbox') onclick="myFunction()" disabled
                            @else onclick="changeStatus({{ $onlineOrders ? 2 : 1 }},'{{ URL::to('admin/change-status') }}')" @endif>
                        <label for="open-close-switch" class="form-check-label admin-service-copy">
                            <span><strong>{{ trans('admin_ui.online_orders') }}</strong>
                                <span class="admin-service-state" data-active="{{ $onlineOrders ? 'true' : 'false' }}">{{ trans($onlineOrders ? 'admin_ui.online_enabled' : 'admin_ui.online_paused') }}</span>
                                <small class="d-block" id="admin-ordering-help">{{ trans('admin_ui.online_help') }}</small>
                            </span>
                        </label>
                    </div>
                </div>

                {{-- ÚJ: Kiszállítás BE/KI kapcsoló --}}
                <form method="POST" action="{{ route('admin.toggleDelivery') }}" class="admin-service-control">
                    @csrf
                    @php $deliveryOn = (int)\App\Helpers\helper::app_setting('delivery_enabled', 1) === 1; @endphp
                    <span class="admin-service-copy"><strong>{{ trans('labels.delivery') }}</strong>
                        <span class="admin-service-state" data-active="{{ $deliveryOn ? 'true' : 'false' }}">{{ trans($deliveryOn ? 'admin_ui.delivery_enabled' : 'admin_ui.delivery_paused') }}</span>
                    </span>
                    <button type="submit" class="btn btn-sm {{ $deliveryOn ? 'btn-outline-secondary' : 'btn-outline-primary' }}"
                        aria-label="{{ trans('labels.delivery') }}: {{ trans($deliveryOn ? 'admin_ui.pause' : 'admin_ui.enable') }}">
                        {{ trans($deliveryOn ? 'admin_ui.pause' : 'admin_ui.enable') }}
                    </button>
                </form>
            @endif

            @if (@helper::checkaddons('language'))
                <div class="position-relative mx-1">
                    <div class="dropdown d-lg-block d-none">
                        <a class="btn btn-sm border-primary dropdown-toggle" href="javascript:void(0)" role="button"
                            data-bs-toggle="dropdown" aria-expanded="false">
                            <img src="{{ helper::image_path(session()->get('flag')) }}" alt=""
                                class="mx-1 rounded-5 language-width">
                            <span
                                class="{{ Session::get('theme') == 'dark' ? 'text-white' : '' }}">{{ session()->get('language') }}
                            </span>
                        </a>
                        <ul
                            class="dropdown-menu drop-menu {{ session()->get('direction') == 2 ? 'drop-menu-rtl' : 'drop-menu' }}">
                            @foreach (helper::language() as $lang)
                                <li>
                                    <a class="dropdown-item d-flex text-start d-flex"
                                        href="{{ URL::to('/language-' . $lang->code) }}">
                                        <img src="{{ helper::image_path($lang->image) }}" alt=""
                                            class="img-fluid mx-1 rounded-5 language-width">
                                        {{ $lang->name }}
                                    </a>
                                </li>
                            @endforeach
                        </ul>
                    </div>
                    <!-- language-btn -->
                    <div class="dropdown d-block d-lg-none">
                        <a class="btn text-dark border dropdown-toggle px-3 py-1 fs-6" type="button"
                            id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false" aria-label="{{ trans('labels.language') }}">
                            <i class="fa-solid fa-globe fs-5"></i></a>
                        <ul class="dropdown-menu {{ session()->get('direction') == '2' ? 'min-dropdown-rtl' : 'min-dropdown' }}"
                            aria-labelledby="dropdownMenuButton1">
                            @foreach (helper::language() as $lang)
                                <li>
                                    <a class="dropdown-item text-dark d-flex"
                                        href="{{ URL::to('/language-' . $lang->code) }}">
                                        <img src="{{ helper::image_path($lang->image) }}"
                                            class="img-fluid lag-img mx-1 rounded-5 language-width"
                                            alt="">{{ $lang->name }}
                                    </a>
                                </li>
                            @endforeach
                        </ul>
                    </div>
                    <!-- language-btn -->
                </div>
            @endif
            <div class="dropwdown d-inline-block">
                <button class="btn header-item" data-bs-toggle="dropdown" aria-expanded="false">
                    <img src="{{ helper::image_path(Auth::user()->profile_image) }}" alt="{{ Auth::user()->name }}">
                    <span class="d-none d-xxl-inline-block d-xl-inline-block ms-1">{{ Auth::user()->name }}</span>
                    <i class="fa-regular fa-angle-down d-none d-xxl-inline-block d-xl-inline-block"></i>
                </button>
                <div class="dropdown-menu box-shadow">
                    @if (Auth::user()->type != 1)
                        @if (in_array('22', explode(',', helper::get_roles())))
                            <a class="dropdown-item d-flex align-items-center"
                                href="{{ URL::to('admin/settings#edit_profile') }}">
                                <i class="fa-regular fa-user mx-2"></i>{{ trans('labels.edit_profile') }} </a>
                            <a class="dropdown-item d-flex align-items-center"
                                href="{{ URL::to('admin/settings#change_password') }}">
                                <i class="fa-regular fa-key mx-2"></i>{{ trans('labels.change_password') }} </a>
                        @endif
                    @else
                        <a class="dropdown-item d-flex align-items-center"
                            href="{{ URL::to('admin/settings#edit_profile') }}">
                            <i class="fa-regular fa-user mx-2"></i>{{ trans('labels.edit_profile') }} </a>
                        <a class="dropdown-item d-flex align-items-center"
                            href="{{ URL::to('admin/settings#change_password') }}">
                            <i class="fa-regular fa-key mx-2"></i>{{ trans('labels.change_password') }} </a>
                    @endif
                    <a class="dropdown-item d-flex align-items-center cursor-pointer"
                        onclick="logout('{{ URL::to('/admin/logout') }}')">
                        <i class="fa-regular fa-arrow-right-from-bracket mx-2"></i>{{ trans('labels.logout') }} </a>
                </div>
            </div>
        </div>
    </div>
</header>
