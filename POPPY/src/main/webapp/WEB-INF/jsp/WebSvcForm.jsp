<%@ include file="../layout/head.jsp"%>
<%@ include file="../layout/header.jsp"%>
<div class="app-content">
	<div class="row pageheading">
		<div class="col-md-10 col-sm-10 col-6">
			<span>Web Svc Import</span>
		</div>
		<div class="col-md-2 col-sm-2 col-6 text-right">
			<a href="WebSvcImport"> <span class="underliner"><i
					class="material-icons"
					style="vertical-align: middle; font-weight: bold;"> arrow_back
				</i>Back to Details</span>
			</a>
		</div>
	</div>
	<div id="formViewer">
		<div class="demo-card-square mdl-card mdl-shadow--2dp">
			<div class="card-body ">
				<div class="row headerStyle">
					<div class="col-md-8 col-md-6 col-6">
						<span>Create New</span>
					</div>
					<div class="col-md-4 col-sm-6 col-6 text-right">
						<button
							class="mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab"
							data-toggle="tooltip" title="Save Web Svc Import">
							<i class="material-icons">save</i>
						</button>
						<button
							class="mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab"
							data-toggle="tooltip" title="refresh">
							<i class="material-icons">directions_run</i>
						</button>

						<button
							class="mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab"
							data-toggle="tooltip" title="reset">
							<i class="material-icons">refresh </i>
						</button>
					</div>
				</div>

				<div class="spaceBetweenLines">
					<div class="row">
						<div class="col-md-6 col-sm-12 col-12">
							<div
								class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
								<input class="mdl-textfield__input" type="text" name="name"
									id="name"> <label for="name"
									class="mdl-textfield__label">Name</label>
							</div>
						</div>
						<div class="col-md-6 col-sm-12 col-12">
							<div
								class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
								<input class="mdl-textfield__input" type="text"
									name="description" id="description"> <label
									class="mdl-textfield__label" for="description">Description</label>
							</div>
						</div>
					</div>
				</div>

				<div class="form-group">
					<div class="row">
						<div class="col-md-3 col-sm-4 col-4">
							<div
								class="mdl-textfield mdl-js-textfield getmdl-select mdl-textfield--floating-label">
								<input type="text" class="mdl-textfield__input" value=""
									id="requestType" readonly><input value="" type="hidden"
									name="requestType" /> <label for="requestType"
									class="mdl-textfield__label">Request Type</label>
								<ul for="requestType"
									class="mdl-menu mdl-menu--bottom-left mdl-js-menu">
									<li class="mdl-menu__item " data-val="GET">GET</li>
									<li class="mdl-menu__item " data-val="POST">POST</li>
									<li class="mdl-menu__item " data-val="DELETE">DELETE</li>
								</ul>
							</div>
						</div>

						<div class="col-md-9 col-sm-8 col-8">
							<div
								class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
								<input class="mdl-textfield__input" type="text"
									name="requestedUrl" id="requestedUrl"> <label
									class="mdl-textfield__label" for="description">Enter
									Request URL</label>
							</div>

						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="row">
						<div class="col-md-12">
							<div
								class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
								<input class="mdl-textfield__input" type="text" name="keys"
									id="keys" disabled> <label class="mdl-textfield__label"
									for="description">Keys</label>
							</div>
						</div>
					</div>

				</div>


				<div class="mdl-tabs mdl-js-tabs mdl-js-ripple-effect">
					<div class="row">
						<div class="col-md-6 col-sm-12 col-12">
							<div class="mdl-tabs__tab-bar">
								<a href="#parameters" class="mdl-tabs__tab is-active">PARAMETERS(0)</a>
								<a href="#header" class="mdl-tabs__tab ">HEADER(0)</a> <a
									href="#body" class="mdl-tabs__tab ">BODY</a>
							</div>
						</div>
					</div>

					<div class="mdl-tabs__panel is-active" id="parameters">
						<div class="row text-center">
							<div class="col-md-12 col-sm-12 col-12">
								<table id="parameterTable"
									class="table table-responsive w-100 d-block d-md-table d-sm-table d-table">
									<thead>
										<tr>
											<th>Name</th>
											<th>Value</th>
											<th>Actions
												<button id="addkvp"
													class="mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab kvpstyle"
													data-toggle="tooltip" title="add parameters">
													<i class="material-icons">add </i>
												</button>
											</th>
										</tr>
									</thead>
								</table>
							</div>
						</div>
					</div>
					<div class="mdl-tabs__panel " id="header">
						<div class="row text-center">
							<div class="col-md-12 col-sm-12 col-12">
								<table id="headerTable"
									class="table table-responsive w-100 d-block d-md-table d-table">
									<thead>
										<tr>
											<th>Name</th>
											<th>Value</th>
											<th>Actions
												<button id="addkvp"
													class="mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab kvpstyle"
													data-toggle="tooltip" title="add parameters">
													<i class="material-icons">add </i>
												</button>
											</th>
										</tr>
									</thead>
								</table>
							</div>
						</div>
					</div>
					<div class="mdl-tabs__panel " id="body">
						<div class="row">
							<div class="col-md-12 col-sm-12 col-12">
								<textarea class="description" rows="10"></textarea>
							</div>
						</div>
					</div>
				</div>

				<div class="form-group spaceBetweenLines">
					<div class="row">
						<div class="col-md-2">
							<b>Response</b>
						</div>
						<div class="col-md-8 col-sm-8 loader">
							<label class="mdl-radio mdl-js-radio" for="Radio1"> <input
								type="radio" id="Radio1" name="Radio" value="content"
								class="mdl-radio__button" checked><span
								class="mdl-radio__label">Content</span>
							</label> <label class="mdl-radio mdl-js-radio" for="Radio2"> <input
								type="radio" id="Radio2" name="Radio" value="grid"
								class="mdl-radio__button"><span class="mdl-radio__label">Grid</span>
							</label> <label class="mdl-radio mdl-js-radio" for="Radio3"> <input
								type="radio" id="Radio3" name="Radio" value="raw"
								class="mdl-radio__button"><span class="mdl-radio__label">Raw</span>
							</label>


						</div>
					</div>
				</div>
				<div class="magicHider" id="contentLoader">
					<div class="spaceBetweenLines">
						<div class="row">
							<div class="col-md-12 col-sm-12 col-12 ">
								<textarea rows="10" class=" description" id="responseTextArea">
							</textarea>
							</div>
						</div>
					</div>
				</div>
				<div class="magicHider" id="gridLoader">
					<div class="spaceBetweenLines">
						<div class="row ">
							<div class="col-md-6 col-sm-6 col-6">
								<textarea rows="10" class=" description text-area-line">
							</textarea>
							</div>
							<div class="col-md-6 col-sm-6 col-6">
								<textarea rows="10" class=" description text-area-line">
							</textarea>
							</div>
						</div>
					</div>
				</div>
				<div class="magicHider" id="rawLoader">
					<div class="row">
						<div class="col-md-6 col-sm-6 col-6">
							<textarea rows="10" class=" description">
							</textarea>
						</div>
						<div class="col-md-6 col-sm-6 col-6">
							<textarea rows="10" class=" description">
							</textarea>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<%@ include file="../layout/footer.jsp"%>
<%@ include file="../layout/foot.jsp"%>
<script src="js/DataCustomJs/websvcimport.js"></script>