<%@ include file="../layout/head.jsp"%>
<%@ include file="../layout/header.jsp"%>
<div class="app-content">
	<div class="row">
		<div class="col-md-12 col-sm-12 col-12">
			<div class="card">
				<div class="card-body">

					<div class="row headerStyle">
						<div class="col-md-9 col-sm-10 col-8">
							<span>User Management</span>
						</div>
						<div class="offset-md-1 col-md-2 col-sm-2 col-4 text-right">
							<a href="AddUserInfo">
								<button
									class="mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab"
									data-toggle="modal" data-target="#createFolder" id="addwebsvc">
									<i class="material-icons">add </i>
								</button>
							</a>
							<button
								class="mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab "
								id="refreshTable">
								<i class="material-icons">refresh</i>
							</button>
						</div>
					</div>

					<div class="row" style="margin: 10px 0px 0px 10px;">
						<div class="col-md-12 col-sm-12 col-12 text-right">
							<i class="fa fa-filter fa-2x" style="color: teal"
								aria-hidden="true" id="filterToggle" data-toggle="tooltip"
								title="Advanced search"></i>
						</div>
					</div>
					<div class="box" style="display: none">
						<div class="row">
							<div class=" offset-md-1 col-md-4 col-sm-12 col-12">
								<div class="form-group">
									<label for="userName">User Name </label> <input type="text"
										class="form-control" id="filteruserName" name="userName">
								</div>
							</div>
							<div class="offset-md-2 col-md-4 col-sm-12 col-12">
								<div class="form-group">
									<label for="filterLevel">Level </label>
									<div class="form-group">
										<select class="form-control" id="level" name="level">
											<option class="font-weight-bold" value="">select
												level...</option>
											<option class="font-weight-bold" value="SuperUser">SuperUser</option>
											<option class="font-weight-bold" value="NormalUser">
												Normal User</option>
											<option class="font-weight-bold" value="Reader">Reader</option>
										</select>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="offset-md-1 col-md-4 col-sm-12 col-12">
								<div class="form-group">
									<label for="userName">Country <span class="asterik">*</span>
									</label> <select class="form-control" id="country" name="country">
										<option class="font-weight-bold" value="">select
											country...</option>
									</select>
								</div>
							</div>
							<div class="offset-md-2 col-md-2 col-sm-12 col-12 text-right">
								<div class="form-group">
									<label for="fliter"> </label>
									<button class="btn btn-filter btn-block" type="button"
										id="fliter">Filter</button>
								</div>
							</div>
							<div class="col-md-2 col-sm-12 col-12">
								<div class="form-group">
									<label for="resetFilter"> </label>
									<button class="btn btn-rest btn-block" type="reset"
										id=resetFilter>Reset</button>
								</div>
							</div>
						</div>
					</div>
					<div class="row spaceBetweenLines">
						<div class="col-md-12 col-sm-12">
							<table id="userManagement"
								class="table table-responsive w-100 d-block d-md-table d-sm-table  table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th>S.No</th>
										<th>User Name</th>
										<th>First Name</th>
										<th>level</th>
										<th>Country</th>
										<th>Created DateTime</th>
										<th>Actions</th>
									</tr>
								</thead>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="editModal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-body">
				<div class="modalbox">
					<form id="editUserForm">
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
							<div class="col-md-6 col-sm-12 col-12">
								<div class="form-group">
									<label for="userName">User Name <span class="asterik">*</span>
									</label> <input type="text" class="form-control" name="userName"
										id="userName"> <input type="hidden" name="id" id="id">
								</div>
							</div>
							<div class="col-md-6 col-sm-12 col-12">
								<div class="form-group">
									<label for="firstName">First Name <span class="asterik">*</span>
									</label> <input type="text" class="form-control" name="firstName"
										id="firstName">
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-md-6 col-sm-12 col-12">
								<div class="form-group">
									<label for="userName">Password <span class="asterik">*</span>
									</label> <input type="text" class="form-control" id="watchWord"
										name="watchWord">
								</div>
							</div>
							<div class="col-md-6 col-sm-12 col-12">
								<div class="form-group">
									<label for="firstName">Confirm Password <span
										class="asterik">*</span>*
									</label> <input type="text" class="form-control" name="confWatchWord"
										id="confWatchWord">
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6 col-sm-12 col-12">
								<div class="form-group">
									<label for="userName">Access Level <span
										class="asterik">*</span>
									</label><select class="form-control" name="level" id="level">
										<option value="SuperUser">SuperUser</option>
										<option value="NormalUser">Normal User</option>
										<option value="Reader">Reader</option>
									</select>
								</div>
							</div>
							<div class="col-md-6 col-sm-12 col-12">
								<div class="form-group">
									<label for="userName">Country <span class="asterik">*</span>
									</label><select class="form-control" name="country" id="country">
										<option value="India">India</option>
										<option value="China">China</option>
										<option value="Sri Lanka">Sri Lanka</option>
									</select>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12 col-sm-12 col-12">
								<span class="asterik">*</span><small> Mandatory fields</small>
							</div>
						</div>
					</form>
				</div>

			</div>
		</div>
	</div>
</div>
<%@ include file="../layout/footer.jsp"%>
<%@ include file="../layout/foot.jsp"%>
<script src="js/customjs/usermanagement.js"></script>

<script>
	$("#startTime").datetimepicker();
	$("#endTime").datetimepicker();
</script>