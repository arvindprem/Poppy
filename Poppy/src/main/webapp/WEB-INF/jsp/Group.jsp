<%@ include file="../layout/head.jsp"%>
<%@ include file="../layout/header.jsp"%>
<div class="app-content">
	<div class="row">
		<div class="col-md-12 col-sm-12 col-12">
			<div class="card">
				<div class="card-body">

					<div class="row headerStyle">
						<div class="col-md-9 col-sm-10 col-8">
							<span>Group</span>
						</div>

						<div class="offset-md-1 col-md-2 col-sm-2 col-4 text-right">
							<a href="AddGroupInfo">
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
							<div class="box" style="display: none">
								<div class="row">
									<div class=" offset-md-1 col-md-4 col-sm-12 col-12">
										<div class="form-group">
											<label for="label">Label </label> <input type="text"
												class="form-control" id="filterLabel" name="Label">
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
						</div>
					</div>
				

				<div class="row spaceBetweenLines">
					<div class="col-md-12 col-sm-12">
						<table id="Group"
							class="table table-responsive w-100 d-block d-md-table d-sm-table  table-striped table-bordered table-hover">
							<thead>
								<tr>
									<th>S.No</th>
									<th>Label</th>
									<th>Number of license</th>

									<th>Country</th>
									<th>Exp_Date</th>
									<th>Actions</th>


								</tr>
							</thead>
						</table>
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
						<form id="editGroupForm">
							<div class="row modalheader">
								<div class="col-md-8 col-md-6 col-6">
									<span><i class="fa fa-edit"></i> Edit Group Info</span>
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
										<label for="GroupLabel">Label <span class="asterik">*</span>
										</label> <input type="text" class="form-control" name="GroupLabel"
											id="GroupLabel"> <input type="hidden" name="id"
											id="id">
									</div>
								</div>
								<div class="col-md-6 col-sm-12 col-12">
									<div class="form-group">
										<label for="NbLicence">Number of license <span
											class="asterik">*</span>
										</label> <input type="number" class="form-control" name="NbLicence"
											id="NbLicence">
									</div>
								</div>
							</div>
							<div class="col-md-6 col-sm-12 col-12">
								<div class="form-group">
									<label for="Label">Country <span class="asterik">*</span>
									</label><select class="form-control" name="country" id="country">
										<option value="India">India</option>
										<option value="China">China</option>
										<option value="Sri Lanka">Sri Lanka</option>
									</select>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>










<div class="row">
	<div class="col-md-12 col-sm-12 col-12">
		<span class="asterik">*</span><small> Mandatory fields</small>
	</div>
</div>




<%@ include file="../layout/footer.jsp"%>
<%@ include file="../layout/foot.jsp"%>
<script src="js/customjs/Group.js"></script>

<script>
	$("#startTime").datetimepicker();
	$("#endTime").datetimepicker();
</script>