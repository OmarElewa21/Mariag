    <!--Header-Area Start-->
    <div class="header-area">
        <div class="container">
            <div class="row">
                <div class="col-xl-3 col-lg-3 col-12">
                    <div class="header-social">
                        <ul>
                            <li>
                                <div class="social-bar">
                                    <ul>
                                        @if ($socials)
                                            @foreach ($socials as $social)
                                                <li><a href="{{ @$social->data->social_link }}"><i
                                                            class="{{ @$social->data->social_icon }}"></i></a>
                                                </li>
                                            @endforeach
                                        @endif
                                    </ul>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-xl-9 col-lg-9 col-12">
                    <div class="header-info">
                        <ul>
                            <li>
                                <i class="far fa-envelope"></i>
                                <span>{{ @$general->email_from }}</span>
                            </li>
                            @if ($contact)
                                <li>
                                    <i class="fas fa-phone"></i>
                                    <span>{{ $contact->data->phone }}</span>
                                </li>
                            @endif
                            @auth
                                {{-- <li>
                                    <i class="fas fa-lock"></i>
                                    <a href="{{ route('user.dashboard') }}">@changeLang('Dashboard')</a>
                                </li> --}}
                                @if (auth()->user()->user_type == 2)
                                <li><a href="{{ route('user.dashboard') }}">@changeLang('Dashboard')</a></li>
                                
                                @else
                                <li class="dropdown"><a href="#" data-toggle="dropdown"
                                    class="nav-link dropdown-toggle nav-link-lg nav-link-user">
                                    {{-- <img alt="image" src="@if (auth()->user()->image) {{ getFile('user', auth()->user()->image) }} @else {{ getFile('logo', $general->default_image) }} @endif" class="rounded-circle mr-1"> --}}
                                    <div class="d-inline-block">{{ auth()->user()->fname . ' ' .auth()->user()->lname}}</div>
                                    </a>
                                        <div class="dropdown-menu dropdown-menu-right">
                                            <a href="{{ route('user.profile') }}" class="dropdown-item has-icon text-dark">
                                                <i class="fas fa-user text-dark"></i> @changeLang('Profile')
                                            </a>
                                            <a href="{{ route('user.change.password') }}" class="dropdown-item has-icon text-dark">
                                                <i class="fas fa-key text-dark"></i> @changeLang('Change Password')
                                            </a>
                                            <div class="dropdown-divider"></div>
                                            <a href="{{ route('user.logout') }}" class="dropdown-item has-icon text-danger">
                                                <i class="fas fa-sign-out-alt text-danger"></i> @changeLang('Logout')
                                            </a>
                                        </div>
                                </li>
                                @endif
                                
                            @else
                                <li>
                                    <i class="fas fa-lock"></i>
                                    <a href="{{ route('user.login') }}">@changeLang('Login')</a> / <a
                                        href="{{ route('user.register') }}">@changeLang('Register')</a>
                                </li>
                            @endauth
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--Header-Area End-->

    <!--Menu Start-->
    <div id="strickymenu" class="menu-area">
        <div class="container">
            <div class="row">
                <div class="col-md-3 col-6 div1">
                    <div class="logo flex">
                        <a href="{{ route('home') }}"><img src="{{ getFile('logo', @$general->logo) }}"
                                alt="Logo"></a>
                    </div>
                </div>
                <div class="col-md-9 col-6">
                    <div class="main-menu">
                        <ul class="nav-menu">
                            @foreach ($pages as $page)
                                @if ($page->name == 'home')
                                    <li><a href="{{ route('home') }}"> @changeLang('Home')</a>
                                    </li>
                                    @continue
                                @endif

                                <li><a href="{{ route('pages', $page->slug) }}">{{ ucwords($page->name) }}</a>
                                </li>

                            @endforeach
                           
                            @if ($dropdown->isNotEmpty())

                                <li class="menu-item-has-children"><a href="javascript:void(0)">@changeLang('Pages')</a>
                                    <ul class="sub-menu">
                                        @foreach ($dropdown as $drop)

                                            <li><a href="{{ route('pages', $drop->slug) }}">{{ ucwords($drop->name) }}</a>
                                            </li>
                                        @endforeach

                                    </ul>
                                </li>


                            @endif

                        </ul>
                    </div>

                    <!--Mobile Menu Icon Start-->
                    <div class="mobile-menuicon div2">
                        <span class="menu-bar" onclick="openNav()"><i class="fa fa-bars"
                                aria-hidden="true"></i></span>
                    </div>
                    <!--Mobile Menu Icon End-->
                </div>
            </div>
        </div>
    </div>

    <!--Mobile Menu Start-->
    <div class="mobile-menu">
        <div id="mySidenav" class="sidenav">
            <a href="{{ route('home') }}"><img src="{{ getFile('logo', @$general->logo) }}" alt=""></a>
            <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>

            <ul>
                @foreach ($pages as $page)
                    @if ($page->name == 'home')
                        <li><a href="{{ route('home') }}">@changeLang('Home')</a>
                        </li>
                        @continue
                    @endif

                    <li><a href="{{ route('pages', $page->slug) }}">{{ ucwords($page->name) }}</a>
                    </li>

                @endforeach

              
                @if ($dropdown->isNotEmpty())

                    <li class="menu-item-has-children"><a href="javascript:void(0)">@changeLang('Pages')</a>
                        <ul class="sub-menu">
                            @foreach ($dropdown as $drop)

                                <li><a href="{{ route('pages', $drop->slug) }}">{{ ucwords($drop->name) }}</a>
                                </li>
                            @endforeach

                        </ul>
                    </li>


                @endif
                @auth
                    <li><a href="{{ route('user.dashboard') }}">@changeLang('Dashboard')</a></li>
                @else
                    <li><a href="{{ route('user.login') }}">@changeLang('Login')</a></li>
                    <li><a href="{{ route('user.register') }}">@changeLang('Register')</a></li>
                @endauth
            </ul>

            
        </div>
    </div>
    <!--Mobile Menu End-->

    <!--Menu End-->

<style>
    .has-icon:active {
        background-color: aliceblue;
    }
    @media screen and (max-width: 600px) {
        .header-info {
            float: right !important;
        }
    }
</style>