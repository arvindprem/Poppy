<%@ include file="../layout/head.jsp"%>
<%@ include file="../layout/header.jsp"%>
<div class="app-content">
	<div class="row">
		<div class="col-md-10 col-sm-10">
			<span class="pageheading">Database Import</span>
		</div>
		<div class="col-md-2 col-sm-2 magicHider underliner"
			id="backtoDetails">
			<i class="fa fa-arrow-left fa-sm"></i> <span class="underliner">
				Back to Details</span>
		</div>
	</div>
	<div class="card card-default" id="hidewebsvcTable">
		<div class="card-body ">
			<div class="row headerStyle">
				<div class="col-md-8 col-sm-offset-12">
					<span>Available Database Import</span>
				</div>
				<div class="col-md-4 col-sm-12 text-right ">
					<button class="btn btn-primary text-center" data-toggle="modal"
						data-target="#createFolder" id="addDatabse">
						<i class="fa fa-plus"> </i>
					</button>
					<button class="btn btn-primary text-center" id="reloadDatabase"
						name="eventReloader">
						<i class="fa fa-refresh"> </i>
					</button>
				</div>
			</div>

			<div class="row spaceBetweenLines">
				<div class="col-md-12 col-sm-12 spaceBetweenLines">
					<table id="databaseTable"
						class="table table-responsive w-100 d-block d-md-table">
						<thead>
							<tr>
								<th>Name</th>
								<th>Database</th>
								<th>Server</th>
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
						<button class="btn btn-primary text-center" data-toggle="tooltip"
							title="Save DB Import">
							<i class="fa fa-save"> </i>
						</button>
					</div>
				</div>

				<div class="form-group spaceBetweenLines">
					<div class="row">
						<div class="col-md-6">
							<label for="description">Name <span class="asterik">*</span></label>
							<input type="text" class="form-control" name="name" id="name">
						</div>
						<div class="col-md-6">
							<label for="description">Description <span
								class="asterik"> *</span></label>
							<textarea class="form-control description" name="description"
								rows="1" id="description"></textarea>
						</div>
					</div>
				</div>

				<div class="form-group">
					<div class="row">
						<div class="col-md-6 col-sm-6 ">
							<label>Server<span class="asterik"> *</span></label> <input
								type="text" class="form-control" name="server" id="server">
						</div>
						<div class="col-md-6 col-sm-6">
							<label>Database Name<span class="asterik"> *</span></label> <input
								type="text" class="form-control" name="databaseName"
								id="databaseName">
						</div>
					</div>
				</div>

				<div class="form-group">
					<div class="row">
						<div class="col-md-6 col-sm-6 ">
							<label>Database Type<span class="asterik"> *</span></label><select
								class="form-control" id="databaseType">
								<option value="sqlserver">Sql Server</option>
							</select>
						</div>
						<div class="col-md-6 col-sm-6">
							<label>Authentication<span class="asterik"> *</span></label><select
								class="form-control" id="databaseType">
								<option value="sqlserver">Sql Server</option>
								<option value="windows">Windows</option>
							</select>
						</div>
					</div>
				</div>

				<div class="form-group">
					<div class="row">
						<div class="col-md-6">
							<label>Login <span class="asterik"> *</span></label> <input
								type="text" class="form-control" name="name" id="name">
						</div>
						<div class="col-md-6">
							<label>Password <span class="asterik"> *</span></label> <input
								type="text" class="form-control" name="name" id="name">
						</div>
					</div>
				</div>

				<div class="form-group">
					<div class="row">
						<div class="col-md-12">
							<label>Connection String</label> <input type="text"
								class="form-control" name="name" id="name">
						</div>
					</div>
				</div>
				<div id="queryTableView">
					<div class="row headerStyle">
						<div class="col-md-11 col-sm-offset-11">
							<span>Queries</span>
						</div>

						<div class="col-md-1 col-sm-offset-1">
							<button class="btn btn-primary" id="queryParameter"
								data-toggle="tooltip" title="Add Query" name="queryParameter">
								<i class="fa fa-plus"></i>
							</button>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12 col-sm-12 spaceBetweenLines">
							<table id="queriesTable"
								class="table table-responsive w-100 d-block d-md-table">
								<thead>
									<tr>
										<th>Query Name</th>
										<th>Key</th>
										<th>Description</th>
										<th>Actions</th>
									</tr>
								</thead>
							</table>
						</div>
					</div>
				</div>
				<div class="magicHider" id="queryFormViewer">
					<div class="form-group spaceBetweenLines">
						<div class="row headerStyle">
							<div class="col-lg-10 col-md-10 col-sm-10 col-xs-10">
								<span>Queries</span>
							</div>
							<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
								<button class="btn btn-primary text-center" id="runQuery"
									data-toggle="tooltip" title="Run Query" disabled>
									<i class="fa fa-play-circle"> </i>
								</button>
								<button class="btn btn-primary text-center" id="saveQuery"
									data-toggle="tooltip" title="Save Query" disabled
									name="eventReloader">
									<i class="fa fa-save"> </i>
								</button>

								<button class="btn btn-primary text-center" id="closeQueryParam"
									data-toggle="tooltip" title="Close Query" name="eventReloader">
									<i class="fa fa-close"> </i>
								</button>
							</div>
						</div>
					</div>
					<div class="form-group spaceBetweenLines">
						<div class="row">
							<div class="col-md-6">
								<label for="description">Name <span class="asterik">*</span></label>
								<input type="text" class="form-control" name="queryDescription"
									id="queryDescription">
							</div>
							<div class="col-md-6">
								<label for="description">Description <span
									class="asterik"> *</span></label>
								<textarea class="form-control description"
									name="queryDescription" rows="1" id="queryDescription"></textarea>
							</div>
						</div>
					</div>

					<div class="form-group">
						<div class="row">
							<div class="col-md-6 col-sm-6 ">
								<label>Query Type<span class="asterik"> *</span></label><select
									class="form-control" id="queryType">
									<option value="query">Query</option>
									<option value="query">Stored Procedure</option>
								</select>
							</div>
							<div class="col-md-6 col-sm-6">
								<label>Query / Stored Procedure<span class="asterik">
										*</span></label> <input type="text" class="form-control" name="query"
									id="query">
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="row">
							<div class="col-md-12 col-sm-12 ">
								<label>key</label> <input type="text" class="form-control"
									name="key" id="key">
							</div>
						</div>
					</div>

					<div class="row headerStyle spaceBetweenLines">
						<div class="col-md-12 col-sm-offset-12">
							<span>Parameters</span>
						</div>
					</div>
					<div class="row text-center spaceBetweenLines">
						<div class="col-md-12">
							<table id="parametersTable"
								class="table table-responsive w-100 d-block d-md-table table-striped">
								<thead>
									<tr>
										<th>Name</th>
										<th>Value</th>
										<th>Actions
											<button class="btn btn-primary btn-xs kvpstyle"
												data-toggle="tooltip" title="Add Parameter" id="addkvp">
												<i class="fa fa-plus fa-xs text-center"> </i>
											</button>
										</th>
									</tr>
								</thead>
							</table>
						</div>
					</div>

					<div class="magicHider" id="kvpform">
						<div class="row headerStyle spaceBetweenLines">
							<div class="col-md-12 col-sm-offset-12">
								<span id="parameterHeader"></span>
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
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file="../layout/footer.jsp"%>
<%@ include file="../layout/foot.jsp"%>
<script src="js/DataCustomJs/databaseimport.js"></script>