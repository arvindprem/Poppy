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
<link rel="stylesheet" type="text/css" href="js/plugins/alertify.css">
<title>Poppy LOGIN</title>
</head>
<body style="background-image: url('img/pointel-poppy-background.jpg');">
	<section class="material-half-bg">
		<div class="cover"></div>
	</section>
	<section class="login-content">
		<div class="login-box">
			<form class="login-form" action="VaildateUser" method="Post"
				id="loginForm">
				<h1 class="text-center">
					<img width="90" src="img/Poppy.ico">
				</h1>
				<h4 class="login-head">Sign in to Poppy</h4>
				<div class="form-group">
					<label>UserName</label> <input class="form-control" type="text"
						name="userName" id="userName" placeholder="Email" autofocus
						required />
				</div>
				<div class="form-group">
					<label class="control-label">Password</label> <input
						class="form-control" type="password" name="watchWord"
						id="watchWord" placeholder="Password" required />
				</div>
				<div class="form-group">
					<div class="utility">
						<div class="animated-checkbox">
							<label> <input type="checkbox" name="enableCookies"
								id="enableCookies"><span class="label-text black">Remember
									me</span>
							</label>
						</div>
					</div>
				</div>
				<div class="form-group btn-container">
					<button class="btn btn-primary mb-2 btn-block" type="submit">
						<i class="fa fa-sign-in fa-lg fa-fw"> </i>LOGIN
					</button>
				</div>
			</form>
		</div>
	</section>
	<!-- Essential javascripts for application to work-->
	<script src="js/jquery-3.2.1.min.js"></script>
	<script
		src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.1/jquery.validate.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/main.js"></script>
	<!-- The javascript plugin to display page loading on top-->
	<script src="js/plugins/pace.min.js"></script>
	<script src="js/plugins/alertify.js"></script>
	<script src="js/customjs/common.js"></script>
	<script src="js/customjs/login.js"></script>
	<script type="text/javascript">
		
	</script>
</body>
</html>