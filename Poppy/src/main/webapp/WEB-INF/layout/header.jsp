<body class="app sidebar-mini rtl">
	<!-- HEADER  NAVBAR-->
	<header class="app-header">
		<div>
			<img width="50" height="50" src="img/Poppy.ico" class="logo_color">
			<span class="app-header__logo">&nbsp;&nbsp;POPPY </span>
		</div>
		<!-- Sidebar toggle button-->
		<a class="app-sidebar__toggle" href="#" data-toggle="sidebar"
			aria-label="Hide Sidebar"></a>
		<!-- Navbar Right Menu-->


		<ul class="app-nav">
			<li><a class="app-nav__item dropdown-toggle"
				data-toggle="dropdown"> <i class="fa fa-cog fa-lg"></i>
			</a>

				<div class="dropdown-menu">
					<a class="dropdown-item" data-toggle="modal"
						data-target="#changepassword">Change Password</a> <span
						class="dropdown-item" data-toggle="modal"
						data-target="#aboutModal">About</span>
				</div></li>
			<!-- User Menu-->
			<li class="dropdown"><a class="app-nav__item" href="Logout"><i
					class="fa fa-sign-out fa-lg"></i></a></li>
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
			<li><a class="app-menu__item" href="/Home"><i
					class="app-menu__icon fa fa-home"></i><span class="app-menu__label">Home</span></a></li>
			<li class="treeview"><a class="app-menu__item" href="#"
				data-toggle="treeview"><i class="app-menu__icon fa fa-database"></i><span
					class="app-menu__label">Data</span><i
					class="treeview-indicator fa fa-angle-right"></i></a>

				<ul class="treeview-menu">

					<li><a class="treeview-item" href="/Group"> Group</a></li>
					<li><a class="treeview-item" href="/Society"> Society</a></li>
					<li><a class="treeview-item" href="DatabaseImport">
							ActivityPole</a></li>
					<li><a class="treeview-item" href="/PoppyUser"> PoppyUser</a></li>
					<li><a class="treeview-item" href="/PoppyFeature">
							PoppyFeature</a></li>
					<li><a class="treeview-item" href="/Surveys"> Survey</a></li>
					<li><a class="treeview-item" href="DatabaseImport">
							AllowsSurvey</a></li>
					<li><a class="treeview-item" href="/Poppy"> Poppy</a></li>
					<li><a class="treeview-item" href="DatabaseImport">
							Continent</a></li>
					<li><a class="treeview-item" href="DatabaseImport">
							Country</a></li>
							<li><a class="treeview-item" href="/add-document">
							manageDocuments</a></li>
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
					<span class="text-left"> @IPSOS. 2018</span>
				</div>
				<div class="col-md-4">
					<span class="text-right"> v0.0.0.1</span>
				</div>
			</div>
		</div>
	</aside>


	<div class="modal fade" id="aboutModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-body">
					<div class="card">
						<div class="card-body">
							<div class="row">
								<div class="col-md-10 col-sm-10 col-10">
									<b><i class="fa fa-info-circle"></i> About</b>
								</div>
								<div class="col-md-2 col-sm-2 col-2 text-right">
									<b><i class="fa fa-window-close" data-dismiss="modal"
										style="color: red"></i></b>
								</div>
							</div>
							<div class="aboutbox">
								<div class="row spaceBetweenLines">
									<div class="col-md-6 col-sm-12 col-12 text-center">
										<div>
											<img width="100" height="100" src="img/Poppy.ico">
										</div>
									</div>
									<p>
										Poppy 0.1<br>Build: b20180925<br>Ipsos Solutions<br>2018<br>
										<a target="_blank" style="text-decoration: none"
											href="http://www.Ipsos.com">www.ipsos.com</a>
									</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>



	<div class="modal fade" id="changepassword" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-body">
					<form id="changePasswordForm">
						<div class="modalbox">
							<div class="row modalheader">
								<div class="col-md-8 col-md-6 col-6">
									<span><i class="fa fa-edit"></i> Edit User Info</span>
								</div>
								<div class="col-md-4 col-sm-6 col-6 text-right">
									<button
										class="mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab"
										data-toggle="tooltip" title="Save User">
										<i class="material-icons">save</i>
									</button>

									<button
										class="mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab"
										type="reset" data-toggle="tooltip" title="Reset">
										<i class="material-icons">undo </i>
									</button>

									<button
										class="mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab"
										type="reset" data-toggle="tooltip" title="Close"
										data-dismiss="modal">
										<i class="material-icons"> close </i>
									</button>
								</div>
							</div>

							<div class="row spaceBetweenLines">
								<div class="col-md-12 col-sm-12 col-12">
									<div class="form-group">
										<label for="currentWatchWord">Current Password <span
											class="asterik">*</span>
										</label> <input type="password" class="form-control"
											name="currentWatchWord" id="currentWatchWord">
									</div>
								</div>
							</div>
							<div class="row ">
								<div class="col-md-12 col-sm-12 col-12">
									<div class="form-group">
										<label for="currentWatchWord">New Password <span
											class="asterik">*</span>
										</label> <input type="password" class="form-control"
											name="newWatchWord" id="newWatchWord">
									</div>
								</div>
							</div>
							<div class="row ">
								<div class="col-md-12 col-sm-12 col-12">
									<div class="form-group">
										<label for="currentWatchWord">Confirm Password <span
											class="asterik">*</span>
										</label> <input type="password" class="form-control"
											name="confirmWatchWord" id="confirmWatchWord">
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>