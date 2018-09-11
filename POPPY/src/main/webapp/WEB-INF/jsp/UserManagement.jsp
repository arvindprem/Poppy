<%@ include file="../layout/head.jsp"%>
<%@ include file="../layout/header.jsp"%>
<div class="app-content">
	<div class="row" id="tableClass">
		<div class="col-md-12">
			<div class="card">
				<div class="card-body">
					<div class="row headerStyle spaceBetweenLines">
						<div class="col-md-9 col-sm-6">
							<h4>User Management</h4>
						</div>
						<div class="col-md-3 col-sm-6 text-right">
							<button class="btn btn-primary" data-toggle="modal"
								data-target="#createUser">
								<i class="fa fa-plus"> Modal</i>
							</button>
							<button class="btn btn-primary" id="createUserss">
								<i class="fa fa-plus"> Form</i>
							</button>
							<button class="btn btn-primary" id="tableReloader"
								name="tableReloader">
								<i class="fa fa-refresh"> </i>
							</button>
						</div>
					</div>
					<div class="row spaceBetweenLines">
						<div class="col-md-12 col-sm-12">
							<table id="userManagement"
								class="table table-responsive w-100 d-block d-md-table">
								<thead>
									<tr>
										<th>User Name</th>
										<th>First Name</th>
										<th>Last Name</th>
										<th>Description</th>
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
	<div class="magicHider" id="formViewer">
		<div class="row" id="formViewer">
			<div class="col-md-12">
				<div class="card">
					<div class="card-header">
						<div class="row text-center">
							<div class="col-md-11 col-sm-11 ">
								<h2>Create User</h2>
							</div>
							<div class="col-md-1 col-sm-1" style="color: red;">
								<button class="btn btn-danger btn-xs" id="closeForm">
									<i class="fa fa-close"></i>
								</button>
							</div>
						</div>
					</div>
					<div class="card-body">
						<div class="row">
							<div class="col-md-12">
								<form id="addUserForm">
									<div class="form-group">
										<div class="row">
											<div class="col-md-1"></div>
											<div class="col-md-4 text-left">
												<label for="userName">UserName <span class="asterik">*</span></label>
											</div>
											<div class="col-md-6">
												<input type="text" class="form-control" name="userName"
													id="userName">
											</div>
										</div>
									</div>

									<div class="form-group">
										<div class="row">
											<div class="col-md-1"></div>
											<div class="col-md-4 text-left">
												<label for="watchWord">Password <span
													class="asterik">*</span></label>
											</div>
											<div class="col-md-6">
												<input type="text" class="form-control" name="watchWord"
													id="watchWord">
											</div>
										</div>
									</div>

									<div class="form-group">
										<div class="row">
											<div class="col-md-1"></div>
											<div class="col-md-4 text-left">
												<label for="confirmWatchWord">Confirm-Password <span
													class="asterik">*</span></label>
											</div>
											<div class="col-md-6">
												<input type="text" class="form-control"
													name="confirmWatchWord" id="confirmWatchWord">
											</div>
										</div>
									</div>

									<div class="form-group">
										<div class="row">
											<div class="col-md-1"></div>
											<div class="col-md-4 text-left">
												<label for="firstName">First Name <span
													class="asterik">*</span></label>
											</div>
											<div class="col-md-6">
												<input type="text" class="form-control" name="firstName"
													id="firstName">
											</div>
										</div>
									</div>

									<div class="form-group">
										<div class="row">
											<div class="col-md-1"></div>
											<div class="col-md-4 text-left">
												<label for="lasttName">Last Name <span
													class="asterik">*</span></label>
											</div>
											<div class="col-md-6">
												<input type="text" class="form-control" name="lastName"
													id="lastName">
											</div>
										</div>
									</div>
									<div class="form-group">
										<div class="row">
											<div class="col-md-1"></div>
											<div class="col-md-4 text-left">
												<label for="mobileNumber">MobileNumber</label>
											</div>
											<div class="col-md-6">
												<input type="text" class="form-control" name="mobileNumber"
													id="mobileNumber">
											</div>
										</div>
									</div>
									<div class="form-group">
										<div class="row">
											<div class="col-md-1"></div>
											<div class="col-md-4 text-left">
												<label for="emailId">Email ID</label>
											</div>
											<div class="col-md-6">
												<input type="text" class="form-control" name="emailId"
													id="emailId">
											</div>
										</div>
									</div>


									<div class="form-group">
										<div class="row">
											<div class="col-md-1"></div>
											<div class="col-md-4 text-left">
												<label for="description">Description</label>
											</div>
											<div class="col-md-6">
												<textarea class="form-control" name="description"
													id="description"></textarea>
											</div>
										</div>
									</div>
									<div class="form-group">
										<div class="row text-right">
											<div class="col-md-9"></div>
											<div class="col-md-2">
												<button type="submit" class="btn btn-primary"
													id="eventcreator">Save</button>
												<button type="button" class="btn btn-primary ">Close</button>
											</div>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="modal fade" id="createUser" tabindex="-5" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<form id="addUserForm">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">
						<i class="fa fa-user"></i> Create User
					</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body modalStyle">

					<div class="form-group">
						<div class="row">
							<div class="col-md-1"></div>
							<div class="col-md-4 text-left">
								<label for="userName">UserName <span class="asterik">*</span></label>
							</div>
							<div class="col-md-6">
								<input type="text" class="form-control" name="userName"
									id="userName">
							</div>
						</div>
					</div>

					<div class="form-group">
						<div class="row">
							<div class="col-md-1"></div>
							<div class="col-md-4 text-left">
								<label for="watchWord">Password <span class="asterik">*</span></label>
							</div>
							<div class="col-md-6">
								<input type="text" class="form-control" name="watchWord"
									id="watchWord">
							</div>
						</div>
					</div>

					<div class="form-group">
						<div class="row">
							<div class="col-md-1"></div>
							<div class="col-md-4 text-left">
								<label for="confirmWatchWord">Confirm-Password <span
									class="asterik">*</span></label>
							</div>
							<div class="col-md-6">
								<input type="text" class="form-control" name="confirmWatchWord"
									id="confirmWatchWord">
							</div>
						</div>
					</div>

					<div class="form-group">
						<div class="row">
							<div class="col-md-1"></div>
							<div class="col-md-4 text-left">
								<label for="firstName">First Name <span class="asterik">*</span></label>
							</div>
							<div class="col-md-6">
								<input type="text" class="form-control" name="firstName"
									id="firstName">
							</div>
						</div>
					</div>

					<div class="form-group">
						<div class="row">
							<div class="col-md-1"></div>
							<div class="col-md-4 text-left">
								<label for="lasttName">Last Name <span class="asterik">*</span></label>
							</div>
							<div class="col-md-6">
								<input type="text" class="form-control" name="lastName"
									id="lastName">
							</div>
						</div>
					</div>

					<div class="form-group">
						<div class="row">
							<div class="col-md-1"></div>
							<div class="col-md-4 text-left">
								<label for="mobileNumber">MobileNumber</label>
							</div>
							<div class="col-md-6">
								<input type="text" class="form-control" name="mobileNumber"
									id="mobileNumber">
							</div>
						</div>
					</div>

					<div class="form-group">
						<div class="row">

							<div class="col-md-1"></div>
							<div class="col-md-4 text-left">
								<label for="emailId">Email ID</label>
							</div>
							<div class="col-md-6">
								<input type="text" class="form-control" name="emailId"
									id="emailId">
							</div>
						</div>
					</div>


					<div class="form-group">
						<div class="row">
							<div class="col-md-1"></div>
							<div class="col-md-4 text-left">
								<label for="description">Description</label>
							</div>
							<div class="col-md-6">
								<textarea class="form-control" name="description"
									id="description"></textarea>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary " data-dismiss="modal">Close</button>
					&nbsp;
					<button type="submit" class="btn btn-primary" id="eventcreator">Save</button>
				</div>
			</form>
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