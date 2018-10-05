<%@ include file="../layout/head.jsp"%>
<%@ include file="../layout/header.jsp"%>
<div class="app-content">
	<div class="row">
		<div class="col-md-12 col-sm-12 col-12">
			<div class="card">
				<div class="card-body">

					<div class="row headerStyle">
						<div class="col-md-9 col-sm-10 col-8">
							<span>Surveys</span>
						</div>

						<div class="offset-md-0 col-md-2col-sm-2 col-4 text-right">
							<a href="AddSurveyInfo">
								<button
									class="mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab"
									data-toggle="modal" data-target="#createFolder" id="addwebsvc">
									<i class="material-icons">add </i>
								</button>
							</a>
							<div class="offset-md-0 col-md-2 col-sm-2 col-4 text-right">
							<a href="AddSurveyInfo">
								<button
									class="mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab"
									data-toggle="modal" data-target="#UpdateFolder" id="Updatewebsvc">
									<i class="material-icons">Update </i>
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
									<label for="version">Version </label> <input type="text"
										class="form-control" id="Survey" name="Version">
								</div>
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
				<div class="row spaceBetweenLines">
					<div class="col-md-12 col-sm-12">
						<table id="Surveys"
							class="table table-responsive w-100 d-block d-md-table d-sm-table  table-striped table-bordered table-hover">
							<thead>
								<tr>
									<th>S.No</th>
									<th>Version</th>
									<th>Creation DateTime</th>
									<th>DownloadPath</th>



								</tr>
							</thead>
						</table>
					</div>
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
</div>

<%@ include file="../layout/footer.jsp"%>
<%@ include file="../layout/foot.jsp"%>
<script src="js/customjs/Survey.js"></script>

<script>
	$("#startTime").datetimepicker();
	$("#endTime").datetimepicker();
</script>