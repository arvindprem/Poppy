<%@ include file="../layout/head.jsp"%>
<%@ include file="../layout/header.jsp"%>
<div class="app-content">
	<div class="card">
		<div class="card-body ">
			<form id="addUserForm">
				<div class="card-title">
					<div class="row  headerStyle">
						<div class="col-md-8 col-md-6 col-6">
							<span><i class="fa fa-user"></i> Add User</span>
						</div>
						<div class="col-md-4 col-sm-6 col-6 text-right">
							<button
								class="mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab"
								type="submit" data-toggle="tooltip" title="Save User">
								<i class="material-icons">save</i>
							</button>

							<button
								class="mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab"
								type="reset" data-toggle="tooltip" title="Reset">
								<i class="material-icons">undo </i>
							</button>

							<a href="UserManagement"
								class="mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab">
								<span class="underliner"><i class="material-icons">
										arrow_back </i></span>
							</a>
						</div>
					</div>
				</div>
				<div class="box">
					<div class="row">
						<div class="offset-md-1 col-md-5 col-sm-12 col-12">
							<div class="form-group">
								<label for="userName" class="font-weight-bold">User Name
									<span class="asterik">*</span>
								</label> <input type="text" class="form-control" name="userName"
									id="userName">
							</div>
						</div>
						<div class="col-md-5 col-sm-12 col-12">
							<div class="form-group">
								<label for="firstName" class="font-weight-bold">First
									Name <span class="asterik">*</span>
								</label> <input type="text" class="form-control" name="firstName"
									id="firstName">
							</div>
						</div>
					</div>
					<div class="row">
						<div class="offset-md-1 col-md-5 col-sm-12 col-12">
							<div class="form-group">
								<label for="userName" class="font-weight-bold">Password
									<span class="asterik">*</span>
								</label> <input type="password" class="form-control" name="watchWord"
									id="watchWord">
							</div>
						</div>
						<div class="col-md-5 col-sm-12 col-12">
							<div class="form-group">
								<label for="firstName" class="font-weight-bold">Confirm
									Password <span class="asterik">*</span>
								</label> <input type="password" class="form-control"
									name="confWatchWord" id="confWatchWord">
							</div>
						</div>
					</div>
					<div class="row">
						<div class="offset-md-1 col-md-5 col-sm-12 col-12">
							<div class="form-group">
								<label for="userName" class="font-weight-bold">Access
									Level <span class="asterik">*</span>
								</label><select class="form-control" id="level" name="level">
									<option class="font-weight-bold" value="SuperUser">SuperUser</option>
									<option class="font-weight-bold" value="NormalUser">
										Normal User</option>
									<option class="font-weight-bold" value="Reader">Reader</option>
								</select>
							</div>
						</div>
						<div class=" col-md-5 col-sm-12 col-12">
							<div class="form-group">
								<label for="userName" class="font-weight-bold">Country <span
									class="asterik">*</span></label><select class="form-control"
									name="country" id="country">
								</select>
							</div>
						</div>
					</div>

					<!-- <div class="row">
						<div class="col-md-6 col-sm-12 col-12">
							<div class="form-group">
								<label for="userName" class="font-weight-bold">Responsible
									Name <span class="asterik">*</span>
								</label> <input type="text" class="form-control" id="responsibleName"
									name="responsibleName">
							</div>
						</div>
						<div class="col-md-6 col-sm-12 col-12">
							<div class="form-group">
								<label for="firstName" class="font-weight-bold">Responsible
									Email <span class="asterik">*</span>
								</label> <input type="text" class="form-control" id="responsibleMail"
									name="responsibleMail">
							</div>
						</div>
					</div>
 -->
					<div class="row">
						<div class="offset-md-1 col-md-4 col-sm-12 col-12">
							<small class="font-weight-bold"><span class="asterik">*</span>
								Mandatory fields</small>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>

<%@ include file="../layout/footer.jsp"%>
<%@ include file="../layout/foot.jsp"%>
<script src="js/customjs/adduser.js"></script>