<%@ include file="../layout/head.jsp"%>
<%@ include file="../layout/header.jsp"%>
<div class="app-content">
	<div class="row" id="hideDataSet">
		<div class="col-md-12">
			<div class="card card-default">
				<div class="card-body">
					<div class="row headerStyle">
						<div class="col-md-8 col-sm-offset-12">
							<span>Available DataSet</span>
						</div>
						<div class="col-md-4 col-sm-12 text-right ">
							<button class="btn btn-primary text-center" data-toggle="modal"
								data-target="#createDataSet" id="dataSetCreator">
								<i class="fa fa-plus"> </i>
							</button>
							<button class="btn btn-primary text-center" id="reloadDirectory"
								name="eventReloader">
								<i class="fa fa-refresh"> </i>
							</button>
						</div>
					</div>
					<div class="row spaceBetweenLines">
						<div class="col-md-3 col-sm-12">
							<div class="row spaceBetweenLines folderStyle">
								<div class="col-md-offset-4 col-md-offset-4">
									<b>Selected Folder :&nbsp;</b><label id="selectedFolderName"></label>
								</div>
							</div>

							<div class="row spaceBetweenLines">
								<div class="col-md-12">
									<div id="jstree">
										<ul id="rootNode">
											<li>Rootnode1</li>
											<li>Rootnode2</li>
										</ul>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-9 col-sm-12 spaceBetweenLines">
							<table id="dataSet"
								class="table table-responsive w-100 d-block d-md-table">
								<thead>
									<tr>
										<th>Name</th>
										<th>Description</th>
										<th>Created Date</th>
										<th>Active</th>
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
		<div class="card card-default">
			<div class="card-header">
				<div class="row">
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
			<div class="card-body ">
				<form action="">
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<div class="row">
									<div class="col-md-4 text-left">
										<label for="folderName">Name <span class="asterik">*</span></label>
									</div>
									<div class="col-md-8">
										<input type="text" class="form-control" name="folderName"
											id="folderName">
									</div>
								</div>
							</div>

							<div class="form-group">
								<div class="row">
									<div class="col-md-4 text-left">
										<label for="description">Description</label>
									</div>
									<div class="col-md-8">
										<textarea class="form-control" name="description"
											id="description"></textarea>
									</div>
								</div>
							</div>

							<div class="form-group">
								<div class="row">
									<div class="col-md-4 col-sm-12 text-left">
										<label for="description">Selection Type<span
											class="asterik"> *</span></label>
									</div>
									<div class="col-md-8 col-sm-12">
										<select class="form-control" name="selectionType"
											id="selectionType">
											<option>First</option>
											<option>Last</option>
											<option>Random</option>
										</select>
									</div>
								</div>
							</div>
							<div class="form-group">
								<div class="row" style="margin-top: 20px;">
									<div class="col-md-4">
										<label for="isActive"> Is Active</label>
									</div>
									<div class="col-md-6 text-left">
										<label class="switch"> <input type="checkbox">
											<span class="slider round"></span>
										</label>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="row spaceBetweenLines folderStyle">
								<div class="col-md-offset-4 col-md-offset-4">
									<b>Selected Folder :&nbsp;</b><label id="selectedFolderName"></label>
								</div>
							</div>
							<div class="row spaceBetweenLines">
								<div class="col-md-12 ">
									<div id="jstreemodal">
										<ul id="rootNode">
											<li>Rootnode1</li>
											<li>Rootnode2</li>
										</ul>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<section id="tabs">
									<div class="container-fluid">
										<div class="row">
											<div class="col-xs-12 ">
												<nav>
													<div class="nav nav-tabs nav-fill" id="nav-tab"
														role="tablist">
														<a class="nav-item nav-link active" id="nav-home-tab"
															data-toggle="tab" href="#nav-home" role="tab"
															aria-controls="nav-home" aria-selected="true">MAP
															DATA ITEM</a> <a class="nav-item nav-link"
															id="nav-profile-tab" data-toggle="tab"
															href="#nav-profile" role="tab"
															aria-controls="nav-profile" aria-selected="false">TEST
															PARAMETERS</a> <a class="nav-item nav-link"
															id="nav-contact-tab" data-toggle="tab"
															href="#nav-contact" role="tab"
															aria-controls="nav-contact" aria-selected="false">ALIAS</a>

													</div>
												</nav>
												<div class="tab-content py-3 px-3 px-sm-0"
													id="nav-tabContent">
													<div class="tab-pane fade show active" id="nav-home"
														role="tabpanel" aria-labelledby="nav-home-tab">
														<table id="parameterTable"
															class="table table-responsive w-100 d-block d-md-table">
															<thead>
																<tr>
																	<th>Name</th>
																	<th>Key</th>
																	<th>SourceType</th>
																	<th>Actions</th>
																</tr>
															</thead>
														</table>
													</div>
													<div class="tab-pane fade" id="nav-profile" role="tabpanel"
														aria-labelledby="nav-profile-tab">
														<div class="form-group">
															<div class="row">
																<div class="col-md-5">
																	<label>Key</label>
																</div>
																<div class="col-md-5">
																	<label>Value</label>
																</div>
															</div>
															<div class="row">
																<div class="col-md-5">
																	<select class="form-control"></select>
																</div>
																<div class="col-md-5">
																	<input type="text" class="form-control" />
																</div>
																<div class="col-md-2 text-left">
																	<label class="switch"> <input type="checkbox">
																		<span class="slider round"></span>
																	</label>
																</div>
															</div>
														</div>
														<table id="parameterTable"
															class="table table-responsive w-100 d-block d-md-table">
															<thead>
																<tr>
																	<th>Name</th>
																	<th>Value</th>
																	<th>Actions</th>
																</tr>
															</thead>
														</table>
													</div>
													<div class="tab-pane fade" id="nav-contact" role="tabpanel"
														aria-labelledby="nav-contact-tab">
														<div class="form-group">
															<table id="parameterTable"
																class="table table-responsive w-100 d-block d-md-table">
																<thead>
																	<tr>
																		<th>Name</th>
																		<th>Alias</th>
																		<th>Value</th>
																		<th>Agent Data</th>
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
								</section>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-10 col-sm-12 text-right">
							<button type="button" class="btn btn-primary"
								data-dismiss="modal">Close</button>
							<button type="submit" class="btn btn-primary" id="eventcreator">Save</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<%@ include file="../layout/footer.jsp"%>
<%@ include file="../layout/foot.jsp"%>
<script>
	
</script>
<script src="js/DataCustomJs/dataset.js"></script>