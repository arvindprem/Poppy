<%@ include file="../layout/head.jsp"%>
<%@ include file="../layout/header.jsp"%>
<div class="app-content">
	<div class="row pageheading">
		<div class="col-md-10">
			<span>Test Case</span>
		</div>
		<div class="col-md-2 magicHider underliner" id="backtoDetails">
			<span><i class="fa fa-arrow-left"></i> Back to Details</span>
		</div>
	</div>
	<div class="card card-default" id="hideTestCaseTable">
		<div class="card-body ">
			<div class="row headerStyle">
				<div class="col-md-8 col-sm-offset-12">
					<span>Available Test Cases</span>
				</div>
				<div class="col-md-4 col-sm-12 text-right ">
					<button class="btn btn-primary text-center" data-toggle="modal"
						data-target="#createFolder" id="addTestCases">
						<i class="fa fa-plus"> </i>
					</button>
					<button class="btn btn-primary text-center" id="reloadwebsvc"
						name="TestCaseReloader">
						<i class="fa fa-refresh"> </i>
					</button>
				</div>
			</div>
			<div class="row spaceBetweenLines">
				<div class="col-md-3">
					<div class="row spaceBetweenLines folderStyle">
						<div class="col-md-offset-4 col-md-offset-4">
							<b>Selected Folder :&nbsp;</b><label id="selectedFolderName"></label>
						</div>
					</div>
					<div class="row spaceBetweenLines">
						<div class="col-md-12 ">
							<div id="jsTree">
								<ul id="rootNode">
									<li>Rootnode1</li>
									<li>Rootnode2</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-9 col-sm-6 spaceBetweenLines">
					<table id="testCaseTable"
						class="table table-responsive w-100 d-block d-md-table table-striped">
						<thead>
							<tr>
								<th>Name</th>
								<th>Interaction Type</th>
								<th>Description</th>
								<th>Scenario Count</th>
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
		<div class="card card-default">
			<div class="card-body ">
				<div class="row headerStyle">
					<div class="col-md-8 col-sm-offset-12">
						<span>Create New</span>
					</div>
					<div class="col-md-4 col-sm-12 text-right ">
						<button class="btn btn-primary text-center" id="upload" data-toggle="tooltip"
							title="Import Test Case(.csv)">
							<i class="fa fa-upload"> </i>
						</button>
						<button class="btn btn-primary text-center" data-toggle="tooltip"
							title="Save">
							<i class="fa fa-save"> </i>
						</button>
					</div>
				</div>
				<div class="row spaceBetweenLines">
					<div class="col-md-6">
						<div class="form-group">
							<div class="row">
								<div class="col-md-12">
									<label for="folderName">Test Case Name <span
										class="asterik"> *</span></label> <input type="text"
										class="form-control" name="folderName" id="folderName">
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="row">
								<div class="col-md-12 ">
									<label for="description">Description</label>
									<textarea class="form-control" name="description"
										id="description"></textarea>
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="row">
								<div class="col-md-12">
									<label for="description">Interaction Type<span
										class="asterik"> *</span></label> <select class="form-control"
										name="selectionType" id="selectionType">
										<option value="voice">Voice</option>
										<option value="web">WEB Mail</option>
										<option value="smtp">SMTP Mail</option>
										<option value="chat">Chat</option>
									</select>
								</div>
							</div>
						</div>
					</div>

					<div class="col-md-6">
						<div class="row spaceBetweenLines folderStyle">
							<div class="col-md-offset-4 col-md-offset-4">
								<b>Selected Folder :&nbsp;</b><label id="testCaseFolderName"></label>
							</div>
						</div>
						<div class="row spaceBetweenLines">
							<div class="col-md-12 ">
								<div id="testCaseTree">
									<ul id="rootNode">
										<li>Rootnode1</li>
										<li>Rootnode2</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!--VOICE INTEARCTION  -->
				<div id="voiceInteraction" class="magicHider">
					<div class="form-group">
						<div class="row">
							<div class="col-md-3">
								<label for="">Direction<span class="asterik"> *</span></label> <select
									class="form-control" name="selectionType" id="selectionType">
									<option>Inbound</option>
									<option>Outbound</option>
								</select>
							</div>

							<div class="col-md-2">
								<label for="">Calling Number</label> <input type="text"
									class="form-control" name="folderName" id="folderName">
							</div>

							<div class="col-md-2">
								<label for="">Tel.Number</label> <input type="text"
									class="form-control" name="folderName" id="folderName">
							</div>
							<div class="col-md-3">
								<label for="">Language <span class="asterik"> *</span></label> <select
									class="form-control" name="selectionType" id="selectionType">
									<option>English</option>
								</select>
							</div>

							<div class="col-md-2">
								<label for="">Release Seconds <span class="asterik">
										*</span></label> <input type="text" class="form-control" name="folderName"
									id="folderName">
							</div>
						</div>
					</div>
					<div class="row headerStyle spaceBetweenLines">
						<div class="col-md-12 col-sm-offset-12">
							<span>Scenario - Test Data</span>
						</div>
					</div>

					<div class="row spaceBetweenLines">
						<div class="col-md-12 text-left">
							<ul class="nav nav-tabs">
								<li class="nav-item"><a class="nav-link" id="mapDataSetTab">Scenario</a></li>
								<li class="nav-item"><a class="nav-link" id="agentDataTab">Agent
										Data</a></li>
							</ul>
						</div>
					</div>

					<div id="mapDataSet" class="magicHider spaceBetweenLines">
						<div class="row text-center">
							<div class="col-md-4">Available Scenarios</div>
							<div class="col-md-1">
								<span class="fa fa-plus" data-toggle="modal"
									data-target="#voiceScenario"></span>
							</div>
							<div class="col-md-7">
								<ul class="nav nav-tabs">
									<li class="nav-item"><a class="nav-link"
										id="subMapDataSetTab">Scenario</a></li>
									<li class="nav-item"><a class="nav-link"
										id="subAgentDataTab">Agent Data</a></li>
								</ul>
							</div>
						</div>
					</div>
					<div id="agentData" class="magicHider spaceBetweenLines">
						<div class="row text-center">
							<div class="col-md-12">
								<table id="agentDataTable"
									class="table table-responsive w-100 d-block d-md-table">
									<thead>
										<tr>
											<th>Name</th>
											<th>Value</th>
											<th>Actions
												<button class="btn btn-primary kvpstyle"
													data-toggle="tooltip" title="add parameters"
													id="addAgentkvp">
													<i class="fa fa-plus text-center"> </i>
												</button>
											</th>
										</tr>
									</thead>
								</table>
							</div>
						</div>
					</div>
					<div id="subMapDataSet" class="magicHider spaceBetweenLines">
						<div class="row text-center">
							<div class="col-md-5"></div>
							<div class="col-md-7">
								<table id="subMapDataSetTable"
									class="table table-responsive w-100 d-block d-md-table">
									<thead>
										<tr>
											<th>Name</th>
											<th>Value</th>
											<th>Actions
												<button class="btn btn-primary kvpstyle"
													data-toggle="tooltip" title="add parameters"
													id="subMapDataSetKvp">
													<i class="fa fa-plus text-center"> </i>
												</button>
											</th>
										</tr>
									</thead>
								</table>
							</div>
						</div>
					</div>
					<div id="subAgentData" class="magicHider spaceBetweenLines">
						<div class="row text-center">
							<div class="col-md-5"></div>
							<div class="col-md-7">
								<table id="subAgentDataTable"
									class="table table-responsive w-100 d-block d-md-table">
									<thead>
										<tr>
											<th>Name</th>
											<th>Value</th>
											<th>Actions
												<button class="btn btn-primary kvpstyle"
													data-toggle="tooltip" title="add parameters"
													id="subAgentDataKvp">
													<i class="fa fa-plus text-center"> </i>
												</button>
											</th>
										</tr>
									</thead>
								</table>
							</div>
						</div>
					</div>
					<div class="magicHider" id="kvpform">
						<div class="row headerStyle spaceBetweenLines">
							<div class="col-md-12 col-sm-offset-12">
								<span id="agentDataHeader"></span>
							</div>
						</div>

						<div class="form-group spaceBetweenLines">
							<form id="addkvpFrom">
								<div class="row">
									<div class="col-lg-5 col-md-5 col-sm-5 col-xs-5">
										<input type="text" class="form-control" name="kvpKey"
											id="kvpKey" placeholder="key">
									</div>

									<div class="col-lg-5 col-md-5 col-sm-5 col-xs-5">
										<input type="text" class="form-control" name="kvpValue"
											id="kvpValue" placeholder="value">
									</div>

									<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
										<button class="btn btn-primary kvpstyle" data-toggle="tooltip"
											type="button" title="add parameters" id="addKVP">
											<i class="fa fa-plus text-center"> </i>
										</button>
										<button type="button" class="btn btn-primary kvpstyle"
											data-toggle="tooltip" title="close" id="resetkvp">
											<i class="fa fa-close text-center"> </i>
										</button>
									</div>
								</div>
							</form>
						</div>
					</div>
					<div class="row headerStyle spaceBetweenLines">
						<div class="col-md-11 col-sm-offset-11">
							<span>Associated Steps</span>
						</div>
						<div class="col-md-1 col-sm-offset-1">
							<button class="btn btn-primary kvpstyle" data-toggle="modal"
								data-target="#addSteps">
								<i class="fa fa-plus text-center"> </i>
							</button>
						</div>
					</div>

					<div class="row spaceBetweenLines">
						<div class="col-md-12 col-sm-offset-12">
							<table id="agentAssociatedTable"
								class="table table-responsive w-100 d-block d-md-table">
								<thead>
									<tr>
										<th>Step No</th>
										<th>Expected To Hear</th>
										<th>Reply With</th>
										<th>Min/Max Pause Time</th>
										<th>Minor/Major Threshold</th>
										<th>Min Confidence</th>
										<th>PIT</th>
										<th>Actions</th>
									</tr>
								</thead>
							</table>
						</div>
					</div>
				</div>

				<!-- EMAIL And WEB MAIL INFO -->
				<div id="emailInteraction" class="magicHider">
					<div class="row headerStyle spaceBetweenLines">
						<div class="col-md-12 col-sm-offset-12">
							<span>Scenario - Test Data</span>
						</div>
					</div>
					<div class="form-group spaceBetweenLines">
						<div class="row ">
							<div class="col-md-6 col-sm-6">
								<label>From Address <span class="asterik"> *</span></label> <input
									type="text" class="form-control" name="fromAddress"
									id="fromAddress">
							</div>
							<div class="col-md-6 col-sm-6">
								<label>To Address <span class="asterik"> *</span></label> <input
									type="text" class="form-control" name="toAddress"
									id="toAddress">
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="row">
							<div class="col-md-12 col-sm-offset-12">
								<label>Subject <span class="asterik"> *</span></label> <input
									type="text" class="form-control" name="subject" id="subject">
							</div>
						</div>
					</div>
					<div class="row spaceBetweenLines">
						<div class="col-md-12 col-sm-12">
							<label>Email Content</label>
							<textarea id="summernote"></textarea>
						</div>
					</div>

					<div class="row headerStyle spaceBetweenLines">
						<div class="col-md-12 col-sm-offset-12">
							<span>Validations</span>
						</div>
					</div>

					<div class="form-group spaceBetweenLines">
						<div class="row">
							<div class="col-md-4 col-sm-offset-6">
								<label>Validate Acknowledgement </label>
							</div>
							<div class="col-md-2 col-sm-offset-2">
								<label class="switch"> <input type="checkbox"
									class="form-control"> <span class="slider round"></span>
								</label>
							</div>
							<div class="col-md-4 col-sm-offset-6">
								<label>Validate Response </label>
							</div>

							<div class="col-md-2 col-sm-offset-2">
								<label class="switch"> <input type="checkbox"
									class="form-control"> <span class="slider round"></span>
								</label>
							</div>
						</div>
					</div>

					<div class="form-group">
						<div class="row ">
							<div class="col-md-6 col-sm-6">
								<label>Acknowledgement Content </label> <input type="text"
									class="form-control" name="fromAddress" id="fromAddress">
							</div>
							<div class="col-md-6 col-sm-6">
								<label>Response Content </label> <input type="text"
									class="form-control" name="toAddress" id="toAddress">
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="row">
							<div class="col-md-12 text-left">
								<ul class="nav nav-tabs">
									<li class="nav-item"><a class="nav-link"
										id="mailMapDataSetTab">Map Data Set</a></li>
									<li class="nav-item"><a class="nav-link"
										id="mailAgentDataTab">Agent Data</a></li>
								</ul>
							</div>
						</div>
					</div>

					<div id="mailMapDataSet" class="magicHider">
						<div class="row text-center">
							<div class="col-md-12">
								<table id="mailMapDataSetTable"
									class="table table-responsive w-100 d-block d-md-table">
									<thead>
										<tr>
											<th>Name</th>
											<th>Actions
												<button class="btn btn-primary btn-xs" data-toggle="modal"
													data-target="#mapDataSetModal" id="addkvp">
													<i class="fa fa-plus text-center"> </i>
												</button>
											</th>
										</tr>
									</thead>
								</table>
							</div>
						</div>
					</div>
					<div id="mailAgentData" class="magicHider">
						<div class="row text-center">
							<div class="col-md-12">
								<table id="mailAgentDataTable"
									class="table table-responsive w-100 d-block d-md-table">
									<thead>
										<tr>
											<th>Name</th>
											<th>Value</th>
											<th>Actions
												<button class="btn btn-primary kvpstyle"
													data-toggle="tooltip" title="add parameters"
													id="mailAddAgentkvp">
													<i class="fa fa-plus text-center"> </i>
												</button>
											</th>
										</tr>
									</thead>
								</table>
							</div>
						</div>
					</div>

					<div class="magicHider" id="mailKvpform">
						<div class="row headerStyle spaceBetweenLines">
							<div class="col-md-12 col-sm-offset-12">
								<span id="emailAgentDataHeader"></span>
							</div>
						</div>

						<div class="form-group spaceBetweenLines">
							<form id="addkvpFrom">
								<div class="row">
									<div class="col-lg-5 col-md-5 col-sm-5 col-xs-5">
										<input type="text" class="form-control" name="kvpKey"
											id="kvpKey" placeholder="key">
									</div>

									<div class="col-lg-5 col-md-5 col-sm-5 col-xs-5">
										<input type="text" class="form-control" name="kvpValue"
											id="kvpValue" placeholder="value">
									</div>

									<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
										<button class="btn btn-primary kvpstyle" data-toggle="tooltip"
											type="button" title="add parameters" id="mailAddKVP">
											<i class="fa fa-plus text-center"> </i>
										</button>
										<button type="button" class="btn btn-primary kvpstyle"
											data-toggle="tooltip" title="close" id="mailResetkvp">
											<i class="fa fa-close text-center"> </i>
										</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
				<!-- Chat Interaction -->

				<div class="magicHider" id="chatInteraction">
					<div class="row headerStyle spaceBetweenLines">
						<div class="col-md-12 col-sm-offset-12">
							<span>Chat Info</span>
						</div>
					</div>
					<div class="form-group spaceBetweenLines">
						<div class="row">
							<div class="col-md-3">
								<label for="">First Name<span class="asterik"> *</span></label>
								<input type="text" class="form-control" name="folderName"
									id="folderName">
							</div>

							<div class="col-md-3">
								<label for="">Last Name<span class="asterik"> *</span></label> <input
									type="text" class="form-control" name="folderName"
									id="folderName">
							</div>

							<div class="col-md-3">
								<label for="">Number</label> <input type="text"
									class="form-control" name="folderName" id="folderName"
									placeholder="+xx-xxx-xxx-xxxx, xx-xxx-xxx-xxxx">
							</div>
							<div class="col-md-3">
								<label for="">EmailID <span class="asterik"> *</span></label> <input
									type="text" class="form-control" name="folderName"
									id="folderName">
							</div>
						</div>
					</div>

					<div class="row headerStyle spaceBetweenLines">
						<div class="col-md-11 col-sm-offset-11">
							<span>Associated Steps</span>
						</div>
						<div class="col-md-1 col-sm-offset-1">
							<button class="btn btn-primary kvpstyle" data-toggle="modal"
								data-target="#addSteps">
								<i class="fa fa-plus text-center"> </i>
							</button>
						</div>
					</div>

					<div class="row spaceBetweenLines">
						<div class="col-md-12 col-sm-offset-12">
							<table id="chatAgentAssociatedTable"
								class="table table-responsive w-100 d-block d-md-table">
								<thead>
									<tr>
										<th>Step No</th>
										<th>Expected To Hear</th>
										<th>Reply With</th>
										<th>Min/Max Pause Time</th>
										<th>Minor/Major Threshold</th>
										<th>Min Confidence</th>
										<th>PIT</th>
										<th>Actions</th>
									</tr>
								</thead>
							</table>
						</div>
					</div>

					<div class="form-group spaceBetweenLines">
						<div class="row">
							<div class="col-md-12 text-left">
								<ul class="nav nav-tabs">
									<li class="nav-item"><a class="nav-link"
										id="chatMapDataSetTab">Map Data Set</a></li>
									<li class="nav-item"><a class="nav-link"
										id="chatAgentDataTab">Agent Data</a></li>
								</ul>
							</div>
						</div>
					</div>

					<div id="chatMapDataSet" class="magicHider">
						<div class="row text-center">
							<div class="col-md-12">
								<table id="chatMapDataSetTable"
									class="table table-responsive w-100 d-block d-md-table">
									<thead>
										<tr>
											<th>Name</th>
											<th>Actions
												<button class="btn btn-primary btn-xs" data-toggle="modal"
													data-target="#mapDataSetModal" id="addkvsp">
													<i class="fa fa-plus text-center"> </i>
												</button>
											</th>
										</tr>
									</thead>
								</table>
							</div>
						</div>
					</div>
					<div id="chatAgentData" class="magicHider">
						<div class="row text-center">
							<div class="col-md-12">
								<table id="chatAgentDataTable"
									class="table table-responsive w-100 d-block d-md-table">
									<thead>
										<tr>
											<th>Name</th>
											<th>Value</th>
											<th>Actions
												<button class="btn btn-primary kvpstyle"
													data-toggle="tooltip" title="add parameters"
													id="chatAddAgentkvp">
													<i class="fa fa-plus text-center"> </i>
												</button>
											</th>
										</tr>
									</thead>
								</table>
							</div>
						</div>
					</div>
					<div class="magicHider" id="chatKvpform">
						<div class="row headerStyle spaceBetweenLines">
							<div class="col-md-12 col-sm-offset-12">
								<span id="chatAgentDataHeader"></span>
							</div>
						</div>

						<div class="form-group spaceBetweenLines">
							<form id="addkvpFrom">
								<div class="row">
									<div class="col-lg-5 col-md-5 col-sm-5 col-xs-5">
										<input type="text" class="form-control" name="kvpKey"
											id="kvpKey" placeholder="key">
									</div>

									<div class="col-lg-5 col-md-5 col-sm-5 col-xs-5">
										<input type="text" class="form-control" name="kvpValue"
											id="kvpValue" placeholder="value">
									</div>

									<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
										<button class="btn btn-primary kvpstyle" data-toggle="tooltip"
											type="button" title="add parameters" id="chatAddKVP">
											<i class="fa fa-plus text-center"> </i>
										</button>
										<button type="button" class="btn btn-primary kvpstyle"
											data-toggle="tooltip" title="close" id="chatResetkvp">
											<i class="fa fa-close text-center"> </i>
										</button>
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


<div class="modal fade" id="voiceScenario" tabindex="-5" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header headerStyle">
				<h5 class="modal-title" id="exampleModalLabel">
					<i class="fa fa-folder"></i> New Scenario
				</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body modalStyle">
				<div class="form-group">
					<div class="row">
						<div class="col-md-12 ">
							<label for="folderName">Scenario Name <span
								class="asterik">*</span></label> <input type="text" class="form-control"
								name="stepNO" id="stepNO">
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="row">
						<div class="col-md-12 text-left">
							<ul class="nav nav-tabs">
								<li class="nav-item"><a class="nav-link"
									id="modalMapDataSetTab">Map Data Set</a></li>
								<li class="nav-item"><a class="nav-link"
									id="modalAgentDataTab">Agent Data</a></li>
							</ul>
						</div>
					</div>
				</div>

				<div class="form-group">
					<div id="modalMapDataSet" class="magicHider">
						<div class="row text-center">
							<div class="col-md-12 col-sm-12">
								<table id="modalMapDataSetTable"
									class="table table-responsive w-100 d-block d-md-table">
									<thead>
										<tr>
											<th>Name</th>
											<th>Actions
												<button class="btn btn-primary btn-xs" id="addModalDataset">
													<i class="fa fa-plus text-center"> </i>
												</button>
											</th>
										</tr>
									</thead>
								</table>
							</div>
						</div>
					</div>
				</div>
				<div id="modalAgentData" class="magicHider">
					<div class="row text-center">
						<div class="col-md-12 col-sm-12">
							<table id="modalAgentDataTable"
								class="table table-responsive w-100 d-block d-md-table">
								<thead>
									<tr>
										<th>Name</th>
										<th>Value</th>
										<th>Actions
											<button class="btn btn-primary kvpstyle"
												data-toggle="tooltip" title="add parameters"
												id="modalAddAgentkvp">
												<i class="fa fa-plus text-center"> </i>
											</button>
										</th>
									</tr>
								</thead>
							</table>
						</div>
					</div>
				</div>

				<div id="dataSetPicker" class="magicHider spaceBetweenLines">
					<div class="row">
						<div class="col-md-12 text-right" id="pickDataset">Pick
							DataSet</div>
					</div>
					<div class="row">
						<div class="col-md-1"></div>
						<div class="col-md-5">
							<div class="row spaceBetweenLines folderStyle">
								<div class="col-md-offset-4 col-md-offset-4">
									<b>Selected Folder :&nbsp;</b><label
										id="selectedModalFolderName"></label>
								</div>
							</div>
							<div class="row spaceBetweenLines">
								<div class="col-md-12 ">
									<div id="mapDataSetModalTree">
										<ul id="rootNode">
											<li>Rootnode1</li>
											<li>Rootnode2</li>
										</ul>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-5">
							<div class="row">
								<div class="col-md-12 text-left">
									<label for="folderName">Select the DataSets </label>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="magicHider" id="modalKvpform">
					<div class="row headerStyle spaceBetweenLines">
						<div class="col-md-12 col-sm-offset-12">
							<span id="modalAgentDataHeader"></span>
						</div>
					</div>

					<div class="form-group spaceBetweenLines">
						<form id="addkvpFrom">
							<div class="row">
								<div class="col-lg-5 col-md-5 col-sm-5 col-xs-5">
									<input type="text" class="form-control" name="kvpKey"
										id="kvpKey" placeholder="key">
								</div>

								<div class="col-lg-5 col-md-5 col-sm-5 col-xs-5">
									<input type="text" class="form-control" name="kvpValue"
										id="kvpValue" placeholder="value">
								</div>

								<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
									<button class="btn btn-primary kvpstyle" data-toggle="tooltip"
										type="button" title="add parameters" id="modalAddKVP">
										<i class="fa fa-plus text-center"> </i>
									</button>
									<button type="button" class="btn btn-primary kvpstyle"
										data-toggle="tooltip" title="close" id="modalResetkvp">
										<i class="fa fa-close text-center"> </i>
									</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary " data-dismiss="modal">ADD</button>
				<button type="submit" class="btn btn-primary" id="eventcreator">RESET</button>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="addSteps" tabindex="-5" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<form id="addFolderForm">
				<div class="modal-header headerStyle">
					<h5 class="modal-title" id="exampleModalLabel">
						<i class="fa fa-folder"></i> Add Steps
					</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body modalStyle">
					<div class="form-group">
						<div class="row">
							<div class="col-md-4 ">
								<label for="folderName">FolderName <span class="asterik">*</span></label>
								<input type="text" class="form-control" name="stepNO"
									id="stepNO">
							</div>
							<div class="col-md-8">
								<label for="folderName">Description <span
									class="asterik"> *</span></label> <input type="text"
									class="form-control" name="stepDescription"
									id="stepDescription">
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="row">
							<div class="col-md-6 ">
								<label for="folderName">Chat Request <span
									class="asterik"> *</span></label> <input type="text"
									class="form-control" name="stepNO" id="stepNO">
							</div>
							<div class="col-md-6">
								<label for="folderName">Chat Request Response <span
									class="asterik"> *</span></label> <input type="text"
									class="form-control" name="stepDescription"
									id="stepDescription">
							</div>
						</div>
					</div>


					<div class="form-group">
						<div class="row">
							<div class="col-md-4 ">
								<label for="folderName">Min Pause Time (Seconds)<span
									class="asterik"> *</span></label> <input type="text"
									class="form-control" name="minPauseTime" id="minPauseTime">
							</div>
							<div class="col-md-4">
								<label for="folderName">Max Pause Time (Seconds) <span
									class="asterik"> *</span></label> <input type="text"
									class="form-control" name="maxPauseTime" id="maxPauseTime">
							</div>

							<div class="col-md-4">
								<label for="folderName">Min Confidence (%) <span
									class="asterik"> *</span></label> <input type="text"
									class="form-control" name="minConfidence" id="minConfidence">
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="row">
							<div class="col-md-4 ">
								<label for="folderName">Minor Threshold(Seconds)<span
									class="asterik"> *</span></label> <input type="text"
									class="form-control" name="minorThreshold" id="minorThreshold">
							</div>
							<div class="col-md-4">
								<label for="folderName">Major Threshold(Seconds) <span
									class="asterik"> *</span></label> <input type="text"
									class="form-control" name="stepDescription"
									id="stepDescription">
							</div>

							<div class="col-md-4">
								<label for="folderName">PostInteractionTimeout (%) <span
									class="asterik">*</span></label> <input type="text"
									class="form-control" name="postInteractionTimeout"
									id="postInteractionTimeout">
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary " data-dismiss="modal">ADD</button>
					<button type="submit" class="btn btn-primary" id="eventcreator">RESET</button>
				</div>
			</form>
		</div>
	</div>
</div>

<div class="modal fade" id="mapDataSetModal" tabindex="-5" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header headerStyle">
				<h5 class="modal-title" id="exampleModalLabel">
					<i class="fa fa-folder"></i> Map Data Set
				</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body modalStyle">
				<div class="row">
					<div class="col-md-6">
						<div class="row spaceBetweenLines folderStyle">
							<div class="col-md-offset-4 col-md-offset-4">
								<b>Selected Folder :&nbsp;</b><label id="mapDataModalFolderName"></label>
							</div>
						</div>
						<div class="row spaceBetweenLines">
							<div class="col-md-12 ">
								<div id="modalJsTreeModal">
									<ul id="rootNode">
										<li>Rootnode1</li>
										<li>Rootnode2</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="row">
							<div class="col-md-12 text-left">
								<label for="folderName">Select the DataSets </label>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-close " data-dismiss="modal">CLOSE</button>
				<button type="submit" class="btn btn-add-DataSet" id="eventcreator">ADD
					DATASET</button>
			</div>
		</div>
	</div>
</div>
<%@ include file="../layout/footer.jsp"%>
<%@ include file="../layout/foot.jsp"%>
<script>
	$(document).ready(function() {
		
		
		 $('.note-group-select-from-files').remove();
		
		

		$('#summernote').summernote({
		    tabsize: 2,
		    height: 400,
		    callbacks : {
		    onImageUpload: function(files, editor, welEditable) {
		    	console.log(files[0]);
	            sendFile(files[0],editor,welEditable);
	        	}
		    }
	    });

		$('#upload').click(function(){
			console.log("swerwqer");
			var textareaValue = $("#summernote").summernote('code');
			console.log(textareaValue);
		});
		
		
	});
	
	function sendFile(file,editor,welEditable) {
	    data = new FormData();
	    data.append("file", file);
	 console.log(data);
	    $.ajax({
	        data: data,
	        type: "POST",
	        url: "ImageUpload",
	        cache: false,
	        contentType: false,
	        processData: false,
	        success: function(url) {
	        }
	    });
	}
</script>
<script src="js/PlanCustomJs/testcases.js"></script>