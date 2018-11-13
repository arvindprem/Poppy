<%@ include file="../layout/head.jsp"%>
<%@ include file="../layout/header.jsp"%>
<div class="app-content">
	<div class="card">
		<div class="card-body ">
			<form id="addAllowSurveyForm">
				<div class="card-title">
					<div class="row  headerStyle">
						<div class="col-md-8 col-md-6 col-6">
							<span><i class="fa fa-user"></i> AddAllowSurvey</span>
						</div>
						<div class="col-md-4 col-sm-6 col-6 text-right">
							<button
								class="mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab"
								type="submit" data-toggle="tooltip" title="Save ALlowSurvey">
								<i class="material-icons">save</i>
							</button>

							<button
								class="mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab"
								type="reset" data-toggle="tooltip" title="Reset">
								<i class="material-icons">undo </i>
							</button>

							<a href="AllowSurvey"
								class="mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab">
								<span class="underliner"><i class="material-icons">
										arrow_back </i></span>
							</a>
						</div>
					</div>
				</div>
				<div class="box">
					<div class="row">
						<div class="col-md-6 col-sm-11 col-12">
							<div class="form-group">
								<label for="Filter" class="font-weight-bold">Filter <span
									class="asterik">*</span>
								</label> <input type="text" class="form-control" name="filter" id="filter">
							</div>
						</div>
						<div class="col-md-5 col-sm-12 col-12">
							<div class="form-group">
								<label for="Sample" class="font-weight-bold">Sample <span class="asterik">*</span>
								</label> <input type="text" class="form-control" name="sample"
									id="sample">
							</div>
						</div>
						<div class="col-md-5 col-sm-12 col-12">
							<div class="form-group">
								<label for="version" class="font-weight-bold">Survey Version <span class="asterik">*</span>
								</label> <input type="number" class="form-control" name="version"
									id="version">
							</div>
						</div>
		

					</div>
				</div>


				<div class="row">
					<div class="offset-md-0 col-md-4 col-sm-12 col-12">
						<small class="font-weight-bold"><span class="asterik">*</span>
							Mandatory fields</small>
					</div>
				</div>
			</form>
		</div>

	</div>
</div>


<%@ include file="../layout/footer.jsp"%>
<%@ include file="../layout/foot.jsp"%>
<script src="js/customjs/addAllowSurvey.js"></script>
