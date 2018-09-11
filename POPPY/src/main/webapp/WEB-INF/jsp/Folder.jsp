<%@ include file="../layout/head.jsp"%>
<%@ include file="../layout/header.jsp"%>
<div class="app-content">
	<div class="row pageheading">
		<div class="col-md-12">
			<span>Folder</span>
		</div>
	</div>
	<div class="demo-card-square mdl-card mdl-shadow--2dp">
		<div class="mdl-card__actions">
			<div class="row headerStyle">
				<div class="col-md-8 col-sm-8">
					<span>Available Folder</span>
				</div>
				<div class="col-md-4 col-sm-4 text-right ">
					<a data-toggle="tooltip" title="create folder">
						<button
							class="mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab"
							data-toggle="modal" data-target="#createFolder"
							id="directoryMaker">
							<i class="material-icons">add </i>
						</button>
					</a>
					<button
						class="mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab"
						id="reloadDirectory" data-toggle="tooltip" title="reload"
						name="eventReloader">
						<i class="material-icons">refresh </i>
					</button>

					<button
						class="mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab"
						data-toggle="modal" data-toggle="tooltip" title="rename"
						data-target="#editFolder" id="editFolder">
						<i class="material-icons">edit </i>
					</button>
					<button
						class="mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab"
						id="deleteFolder" data-toggle="tooltip" title="delete" id="delete">
						<i class="material-icons">delete </i>
					</button>
				</div>
			</div>
			<div class="row spaceBetweenLines folderStyle">
				<div class="col-md-offset-4 col-md-4">
					<b>Selected Folder :&nbsp;</b><label id="selectedFolderName"></label>
				</div>
			</div>

			<div class="row spaceBetweenLines">
				<div class="col-md-1 "></div>
				<div class="col-md-10 ">
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


<div class="modal fade" id="createFolder" tabindex="-5" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<form id="addFolderForm">
				<div class="modal-header headerStyle">
					<h5 class="modal-title" id="exampleModalLabel">
						<i class="fa fa-folder"></i> Rename Folder
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
										<input type="text" class="form-control" name="description"
											id="description">
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="row spaceBetweenLines folderStyle">
								<div class="col-md-offset-4 col-md-offset-4">
									<b>Selected Folder :&nbsp;</b><label
										id="selectedModalFolderName"></label>
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




<div class="modal fade" id="editFolder" tabindex="-5" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<form id="addFolderForm">
				<div class="modal-header headerStyle">
					<h5 class="modal-title" id="exampleModalLabel">
						<i class="fa fa-folder"></i> Rename Folder
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
										<input type="text" class="form-control"
											name="modifyFolderName" id="modifyFolderName">
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
										<input type="text" class="form-control"
											name="modifyDescription" id="modifyDescription">
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="row spaceBetweenLines folderStyle">
								<div class="col-md-offset-4 col-md-offset-4">
									<b>Selected Folder :&nbsp;</b><label id="modifyModalFolderName"></label>
								</div>
							</div>
							<div class="row spaceBetweenLines">
								<div class="col-md-12 ">
									<div id="modifyJsTree">
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
<script src="js/DataCustomJs/folder.js"></script>