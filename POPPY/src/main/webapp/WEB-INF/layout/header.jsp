<body class="app sidebar-mini rtl">
	<!-- HEADER  NAVBAR-->
	<header class="app-header">
		<div>
			<img width="50" height="50" src="img/Poppy.ico"
				class="logo_color"> <span class="app-header__logo">&nbsp;&nbsp;POPPY
			</span>
		</div>
		<!-- Sidebar toggle button-->
		<a class="app-sidebar__toggle" href="#" data-toggle="sidebar"
			aria-label="Hide Sidebar"></a>
		<!-- Navbar Right Menu-->


		<ul class="app-nav">
			<li class="dropdown"><a class="app-nav__item" href="#"
				data-toggle="dropdown" aria-label="Show notifications"><i
					class="fa fa-search fa-lg"></i></a></li>
			<!--Notification Menu-->
			<li class="dropdown"><a class="app-nav__item" href="#"
				data-toggle="dropdown" aria-label="Show notifications"><i
					class="fa fa-bell-o fa-lg"></i></a>
				<ul class="app-notification dropdown-menu dropdown-menu-right">
					<li class="app-notification__title">You have 4 new
						notifications.</li>
					<div class="app-notification__content">
						<li><a class="app-notification__item" href="javascript:;"><span
								class="app-notification__icon"><span
									class="fa-stack fa-lg"><i
										class="fa fa-circle fa-stack-2x text-primary"></i><i
										class="fa fa-envelope fa-stack-1x fa-inverse"></i></span></span>
								<div>
									<p class="app-notification__message">Lisa sent you a mail</p>
									<p class="app-notification__meta">2 min ago</p>
								</div></a></li>
						<li><a class="app-notification__item" href="javascript:;"><span
								class="app-notification__icon"><span
									class="fa-stack fa-lg"><i
										class="fa fa-circle fa-stack-2x text-danger"></i><i
										class="fa fa-hdd-o fa-stack-1x fa-inverse"></i></span></span>
								<div>
									<p class="app-notification__message">Mail server not
										working</p>
									<p class="app-notification__meta">5 min ago</p>
								</div></a></li>
						<li><a class="app-notification__item" href="javascript:;"><span
								class="app-notification__icon"><span
									class="fa-stack fa-lg"><i
										class="fa fa-circle fa-stack-2x text-success"></i><i
										class="fa fa-money fa-stack-1x fa-inverse"></i></span></span>
								<div>
									<p class="app-notification__message">Transaction complete</p>
									<p class="app-notification__meta">2 days ago</p>
								</div></a></li>
						<div class="app-notification__content">
							<li><a class="app-notification__item" href="javascript:;"><span
									class="app-notification__icon"><span
										class="fa-stack fa-lg"><i
											class="fa fa-circle fa-stack-2x text-primary"></i><i
											class="fa fa-envelope fa-stack-1x fa-inverse"></i></span></span>
									<div>
										<p class="app-notification__message">Lisa sent you a mail</p>
										<p class="app-notification__meta">2 min ago</p>
									</div></a></li>
							<li><a class="app-notification__item" href="javascript:;"><span
									class="app-notification__icon"><span
										class="fa-stack fa-lg"><i
											class="fa fa-circle fa-stack-2x text-danger"></i><i
											class="fa fa-hdd-o fa-stack-1x fa-inverse"></i></span></span>
									<div>
										<p class="app-notification__message">Mail server not
											working</p>
										<p class="app-notification__meta">5 min ago</p>
									</div></a></li>
							<li><a class="app-notification__item" href="javascript:;"><span
									class="app-notification__icon"><span
										class="fa-stack fa-lg"><i
											class="fa fa-circle fa-stack-2x text-success"></i><i
											class="fa fa-money fa-stack-1x fa-inverse"></i></span></span>
									<div>
										<p class="app-notification__message">Transaction complete</p>
										<p class="app-notification__meta">2 days ago</p>
									</div></a></li>
						</div>
					</div>
					<li class="app-notification__footer"><a href="#">See all
							notifications.</a></li>
				</ul></li>
			<!-- User Menu-->
			<li class="dropdown"><a class="app-nav__item" href="#"
				data-toggle="dropdown" aria-label="Open Profile Menu"><i
					class="fa fa-sign-out fa-lg"></i></a>
				<ul class="dropdown-menu settings-menu dropdown-menu-right">
					<li><a class="dropdown-item" href="/PageUser"><i
							class="fa fa-cog fa-lg"></i> Settings</a></li>
					<li><a class="dropdown-item" href="/PageUser"><i
							class="fa fa-user fa-lg"></i> Profile</a></li>
					<li><a class="dropdown-item" href="/PageLogin"><i
							class="fa fa-sign-out fa-lg"></i> Logout</a></li>
				</ul></li>
		</ul>
	</header>
	<!-- Sidebar menu-->
	<aside class="app-sidebar">
		<div class="app-sidebar__user">
			<img class="app-sidebar__user-avatar" src="img/user.png" width="48"
				height="48" alt="User Image">
			<div>
				<p class="app-sidebar__user-name">Arvind</p>
			</div>
		</div>

		<ul class="app-menu">
			<li class="treeview"><a class="app-menu__item" href="#"
				data-toggle="treeview"><i class="app-menu__icon fa fa-user"></i><span
					class="app-menu__label">Profile</span><i
					class="treeview-indicator fa fa-angle-right"></i></a>

				<ul class="treeview-menu">
					<li><a class="treeview-item" href="#"> Settings</a></li>
					<li><a class="treeview-item" href="#"> Profile</a></li>
					<li><a class="treeview-item" href="#"> Language</a></li>
				</ul></li>
			<li><a class="app-menu__item" href="/Home"><i
					class="app-menu__icon fa fa-home"></i><span class="app-menu__label">Home</span></a></li>
			<li class="treeview"><a class="app-menu__item" href="#"
				data-toggle="treeview"><i class="app-menu__icon fa fa-edit"></i><span
					class="app-menu__label">Plans</span><i
					></i></a>
				

			<li class="treeview"><a class="app-menu__item" href="#"
				data-toggle="treeview"><i class="app-menu__icon fa fa-database"></i><span
					class="app-menu__label">Data</span><i
					class="treeview-indicator fa fa-angle-right"></i></a>

				<ul class="treeview-menu">
					<li><a class="treeview-item" href="Folder"> Folders</a></li>
					<li><a class="treeview-item" href="CallerNos"> Caller Nos</a></li>
					<li><a class="treeview-item" href="TelNos"> Tel Nos</a></li>
					<li><a class="treeview-item" href="DataSet"> Data Set</a></li>
					<li><a class="treeview-item" href="DataItem"> Data Item</a></li>
					<li><a class="treeview-item" href="WebSvcImport">Web Svc
							Import</a></li>
					<li><a class="treeview-item" href="DatabaseImport">
							Database Import</a></li>
				</ul></li>

			<li class="treeview"><a class="app-menu__item" href="#"
				data-toggle="treeview"><i class="app-menu__icon fa fa-th-list"></i><span
					class="app-menu__label">Reporting</span><i
					class="treeview-indicator fa fa-angle-right"></i></a>
				<ul class="treeview-menu">
					<li><a class="treeview-item" href="#"> Real Time</a></li>
					<li><a class="treeview-item" href="#"> Historical</a></li>
				</ul></li>


			<li class="treeview"><a class="app-menu__item" href="#"
				data-toggle="treeview"><i class="app-menu__icon fa fa-user"></i><span
					class="app-menu__label">Admin</span> <i
					class="treeview-indicator fa fa-angle-right"></i></a>
				<ul class="treeview-menu">
					<li><a class="treeview-item" href="/UserManagement"> User
							Management</a></li>
					
				</ul></li>
		</ul>

		<!-- FIXED FOOTER CODE  -->
		<div class="footer">
			<div class="row">
				<div class="col-md-8">
					<span class="text-left"> @Pointel Inc. 2014</span>
				</div>
				<div class="col-md-4">
					<span class="text-right"> v0.0.0.1</span>
				</div>
			</div>

		</div>
	</aside>