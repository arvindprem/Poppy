<%@ include file="../layout/head.jsp"%>
<%@ include file="../layout/header.jsp"%>
<div class="app-content">
	<div class="row">
		<div class="col-md-12 col-sm-12 col-12">
			<div class="card">
				<div class="card-body">

					<div class="row headerStyle">
						<div class="col-md-9 col-sm-10 col-8">
							<span>AllowSurvey</span>
						</div>

						<div class="offset-md-1 col-md-2 col-sm-2 col-4 text-right">
							<a href="AddAllowSurveyInfo">
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
				</div>
			</div>
			<div class="row spaceBetweenLines">
				<div class="col-md-12 col-sm-12">
					<table id="AllowSurveys"
						class="table table-responsive w-100 d-block d-md-table d-sm-table  table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th>S.No</th>
								<th>Filter</th>
								<th>Exp_Date</th>
								<th>Sample</th>
								<th>Version</th>
								<th>Action</th>




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
					<form id="editForm">
						<div class="row modalheader">
							<div class="col-md-8 col-md-6 col-6">
								<span><i class="fa fa-edit"></i> Edit AllowSurvey Info</span>
							</div>
							<div class="col-md-4 col-sm-6 col-6 text-right">
								<button
									class="mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab"
									data-toggle="tooltip" title="Save AllowSurveys">
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
									<label for="filter">Filter <span class="asterik">*</span>
									</label> <input type="text" class="form-control" name="filter"
										id="filter"> <input type="hidden" name="id" id="id">
								</div>
							</div>
							<div class="form-group">
								<label for="sample">Sample <span class="asterik">*</span>
								</label> <input type="text" class="form-control" name="sample"
									id="sample">
							</div>
							
							<div class="col-md-6 col-sm-12 col-12">
								<div class="form-group">
									<label for="version">Survey Version <span class="asterik">*</span>
									</label> <input type="number" class="form-control" name="version"
										id="version"> 
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
<script src="js/customjs/AllowSurveys.js"></script>

