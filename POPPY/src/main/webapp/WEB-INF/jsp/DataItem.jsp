<%@ include file="../layout/head.jsp"%>
<%@ include file="../layout/header.jsp"%>
<div class="app-content">
	<div class="card card-default">
		<div class="card-body ">
			<div class="row headerStyle">
				<div class="col-md-8 col-sm-offset-12">
					<h6 style="font-size: 20px;">Available DataItem</h6>
				</div>
				<div class="col-md-4 col-sm-12 text-right ">
					<button class="btn btn-primary text-center" data-toggle="modal"
						data-target="#createFolder" id="directoryMaker">
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
					<table id="dataItem"
						class="table table-responsive w-100 d-block d-md-table">
						<thead>
							<tr>
								<th>Name</th>
								<th>Key</th>
								<th>Source</th>
								<th>Created Date</th>
								<th>Actions</th>
							</tr>
						</thead>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>


<div class="modal fade" id="createFolder" tabindex="-5" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<form id="addFolderForm">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">
						<i class="fa fa-folder"></i> Create Folder
					</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body modalStyle">
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<div class="row">
									<div class="col-md-1"></div>
									<div class="col-md-4 text-left">
										<label for="folderName">FolderName <span
											class="asterik">*</span></label>
									</div>
									<div class="col-md-6">
										<input type="text" class="form-control" name="folderName"
											id="folderName">
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
<script src="js/DataCustomJs/dataitem.js"></script>