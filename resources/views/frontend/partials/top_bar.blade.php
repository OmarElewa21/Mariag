<nav class="navbar navbar-expand-lg main-navbar">

    <ul class="navbar-nav mr-auto icon-menu">
        <li><a href="#" data-toggle="sidebar" class="nav-link nav-link-lg"><i class="fas fa-bars"></i></a></li>
    </ul>

    <ul class="navbar-nav navbar-right">
    
        <li>
            <a target="_blank" href="{{ route('home') }}" class="nav-link nav-link-lg"><i class="fas fa-home mr-1"></i><span>@changeLang('Home')</span></a>
        </li>

        <li class="dropdown">
            <a href="#" data-toggle="dropdown" class="nav-link dropdown-toggle nav-link-lg nav-link-user">
                <div class="d-inline-block">{{ auth()->user()->email }}</div>
            </a>
            <div class="dropdown-menu dropdown-menu-right">
                <a href="{{ route('user.profile') }}" class="dropdown-item has-icon">
                    <i class="fas fa-user"></i> @changeLang('Profile')
                </a>
                <a href="{{ route('user.change.password') }}" class="dropdown-item has-icon">
                    <i class="fas fa-key"></i> @changeLang('Change Password')
                </a>
                <div class="dropdown-divider"></div>
                <a href="{{ route('user.logout') }}" class="dropdown-item has-icon text-danger">
                    <i class="fas fa-sign-out-alt"></i> @changeLang('Logout')
                </a>
            </div>
        </li>
    </ul>
</nav>
