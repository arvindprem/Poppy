<%@ include file="../layout/head.jsp"%>
<%@ include file="../layout/header.jsp"%>
<div class="app-content">
	<div class="card card-default" id="hideCallerTable">
		<div class="card-body ">
			<div class="row headerStyle">
				<div class="col-md-8 col-sm-8 col-12">
					<span>Available Caller.No(s)</span>
				</div>
				<div class="col-md-4 col-sm-4 col-12">
					<button
						class="mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab">
						<i class="fa fa-download"> </i>
					</button>
					<button
						class="mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab"
						name="eventReloader">
						<i class="fa fa-upload"> </i>
					</button>
					<button
						class="mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab">
						<i class="material-icons">add</i>
					</button>


					<button
						class="mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab"
						id="reloadDirectory" name="eventReloader">
						<i class="material-icons">refresh</i>
					</button>

				</div>
			</div>

			<div class="row spaceBetweenLines">
				<div class="col-md-3 col-sm-12 col-12">
					<div class="row spaceBetweenLines folderStyle">
						<div class="col-md-12 col-sm-12 col-12">
							<b>Selected Folder :&nbsp;</b><label id="selectedFolderName"></label>
						</div>
					</div>

					<div class="row spaceBetweenLines">
						<div class="col-md-12 col-sm-12 col-12">
							<div id="jstree">
								<ul id="rootNode">
									<li>Rootnode1</li>
									<li>Rootnode2</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-9 col-sm-12 col-12 spaceBetweenLines ">
					<table id="callNos"
						class="table w-100 d-block d-md-table">
						<thead>
							<tr>
								<th>Name</th>
								<th>Number</th>
								<th>Folder</th>
								<th>Environment</th>
								<th>Created Date</th>
								<th>Actions</th>
							</tr>
						</thead>
					</table>
				</div>
			</div>
		</div>
	</div>

	<div class="magicHider" id="formViewer">
		<div class="row">
			<div class="col-md-12 col-sm-12 col-12">
				<div class="card">
					<div class="card-header headerStyle">
						<div class="row text-center">
							<div class="col-md-11 col-sm-11 ">
								<span>Create Caller. No</span>
							</div>
							<div class="col-md-1 col-sm-1">
								<button class="btn btn-danger btn-xs" id="closeForm">
									<i class="fa fa-close"></i>
								</button>
							</div>
						</div>
					</div>
					<div class="card-body">
						<form id="addUserForm">
							<div class="row">
								<div class="col-md-7">
									<div class="form-group">
										<div class="row">
											<div class="col-md-1"></div>
											<div class="col-md-4 text-left">
												<label for="callerName">Name <span class="asterik">*</span></label>
											</div>
											<div class="col-md-6">
												<input type="text" class="form-control" name="callerName"
													id="callerName">
											</div>
										</div>
									</div>
									<div class="form-group">
										<div class="row">
											<div class="col-md-1"></div>
											<div class="col-md-4 text-left">
												<label for="callerDescription">Description</label>
											</div>
											<div class="col-md-6">
												<textarea class="form-control" name="callerDescription"
													id="callerDescription"></textarea>
											</div>
										</div>
									</div>
									<div class="form-group">
										<div class="row">
											<div class="col-md-1"></div>
											<div class="col-md-4 text-left">
												<label for="callerName">Number <span class="asterik">*</span></label>
											</div>
											<div class="col-md-6">
												<input type="text" class="form-control" name="callerName"
													id="callerName">
											</div>
										</div>
									</div>

									<div class="form-group">
										<div class="row">
											<div class="col-md-1"></div>
											<div class="col-md-4 text-left">
												<label for="callerName"> Choose Environment <span
													class="asterik">*</span></label>
											</div>
											<div class="col-md-6">
												<select class="form-control" name="callerName"
													id="callerName">
													<option>- - - - None - - - -</option>
												</select>
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-5">
									<div class="row spaceBetweenLines">
										<div class="col-md-6 col-sm-6">
											<div class="row spaceBetweenLines folderStyle">
												<div class="col-md-offset-4 col-md-offset-4">
													<b>Selected Folder :&nbsp;</b><label
														id="selectedFolderName"></label>
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
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
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
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file="../layout/footer.jsp"%>
<%@ include file="../layout/foot.jsp"%>
<script src="js/DataCustomJs/callernos.js"></script>