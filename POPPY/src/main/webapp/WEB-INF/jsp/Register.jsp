<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Main CSS-->
<link rel="stylesheet" type="text/css" href="css/main.css">
<!-- Font-icon css-->
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Login-Employee</title>
</head>
<body>
	<section class="material-half-bg">
		<div class="cover"></div>
	</section>
	<section class="login-content">
		<div class="form-group">
			<h1 class="black">REGISTER</h1>
		</div>
		<div class="login-box">
			<form class="login-form" action="VaildateUser" method="Post"
				id="loginForm">
				<div class="form-group">
					<label class=" black">USERNAME</label> <input
						class="form-control" type="text" name="userName" id="userName"
						placeholder="UserName" autofocus>
				</div>
				<div class="form-group">
					<label class=" black">EMAIL</label> <input
						class="form-control" type="text" name="email" id="email"
						placeholder="Email" autofocus>
				</div>

				<div class="form-group">
					<label class="black">PASSWORD</label> <input
						class="form-control" type="password" name="watchWord"
						id="watchWord" placeholder="Password">
				</div>
				<div class="form-group">
					<label class=" black">CONFIRM PASSWORD</label> <input
						class="form-control" type="password" name="confirmWatchWord"
						id="confirmWatchWord" placeholder="Confirm Password">
				</div>
				<div class="form-group btn-container">
					<button class="btn btn-primary btn-block" data-toggle="flip"
						type="submit">
						<i class="fa fa-pencil-square-o"></i>REGISTER
					</button>
				</div>
			</form>
			<form class="forget-form" >
				<h3 class="login-head">
					<i class="fa fa-lg fa-fw fa-lock"></i>Forgot Password ?
				</h3>
				<div class="form-group">
					<label class="">OTP</label> <input
						class="form-control" type="text" placeholder="OTP">
				</div>
				<div class="form-group btn-container">
					<button class="btn btn-primary btn-block">
						<i class="fa fa-unlock fa-lg fa-fw"></i>SUBMIT
					</button>
				</div>
			</form>

		</div>
	</section>
	<!-- Essential javascripts for application to work-->
	<script src="js/jquery-3.2.1.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/main.js"></script>
	<!-- The javascript plugin to display page loading on top-->
	<script
		src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.1/jquery.validate.min.js"></script>
	<script src="js/plugins/pace.min.js"></script>
	<script src="js/customjs/register.js"></script>
</body>
</html>