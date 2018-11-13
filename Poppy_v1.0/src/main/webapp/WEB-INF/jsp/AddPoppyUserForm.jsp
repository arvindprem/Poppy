<%@ include file="../layout/head.jsp"%>
<%@ include file="../layout/header.jsp"%>
<div class="app-content">
	<div class="card">
		<div class="card-body ">
			<form id="addPoppyUserForm">
				<div class="card-title">
					<div class="row  headerStyle">
						<div class="col-md-8 col-md-6 col-6">
							<span><i class="fa fa-user"></i> Add PoppyUser</span>
						</div>
						<div class="col-md-4 col-sm-6 col-6 text-right">
							<button
								class="mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab"
								type="submit" data-toggle="tooltip" title="Save PoppyUser">
								<i class="material-icons">save</i>
							</button>

							<button
								class="mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab"
								type="reset" data-toggle="tooltip" title="Reset">
								<i class="material-icons">undo </i>
							</button>

							<a href="PoppyUser"
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
								<label for="Name" class="font-weight-bold"> Name <span
									class="asterik">*</span>
								</label> <input type="text" class="form-control" name="name" id="name">
							</div>
						</div>
						<div class="offset-md-1 col-md-5 col-sm-12 col-12">
							<div class="form-group">
								<label for="firstname" class="font-weight-bold">First Name <span
									class="asterik">*</span>
								</label> <input type="text" class="form-control" name="firstName" id="firstName">
							</div>
						</div>
					</div>
					<div class="row">
						<div class="offset-md-1 col-md-5 col-sm-12 col-12">
							<div class="form-group">
								<label for="Label" class="font-weight-bold">  ActivityPole<span
									class="asterik">*</span>
								</label> <input type="text" class="form-control" name="activityPoleLabel" id="activityPoleLabel">
							</div>
						</div>
						<div class="offset-md-1 col-md-5 col-sm-12 col-12">
							<div class="form-group">
								<label for="version" class="font-weight-bold">SurveyVersion <span
									class="asterik">*</span>
								</label> <input type="number" class="form-control" name="version" id="version">
							</div>
						</div>
					</div>
					<div class="row">
						<div class="offset-md-1 col-md-5 col-sm-12 col-12">
							<div class="form-group">
								<label for="version" class="font-weight-bold"> Poppyversion <span
									class="asterik">*</span>
								</label> <input type="number" class="form-control" name="version1" id="version1">
							</div>
						</div>
						
					</div>
					</div>
					
					<div class="row">
						<div class="offset-md-0 col-md-4 col-sm-12 col-12">
							<small class="font-weight-bold"><span class="asterik">*</span>
								Mandatory fields</small>
						
					</div>
				</div>
			</form>
		</div>
	</div>

</div>


<%@ include file="../layout/footer.jsp"%>
<%@ include file="../layout/foot.jsp"%>
<script src="js/customjs/addPoppyUser.js"></script>
