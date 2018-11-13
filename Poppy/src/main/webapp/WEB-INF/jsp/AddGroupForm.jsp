<%@ include file="../layout/head.jsp"%>
<%@ include file="../layout/header.jsp"%>
<div class="app-content">
	<div class="card">
		<div class="card-body ">
			<form id="addGroupForm">
				<div class="card-title">
					<div class="row  headerStyle">
						<div class="col-md-8 col-md-6 col-6">
							<span><i class="fa fa-user"></i> Add Group</span>
						</div>
						<div class="col-md-4 col-sm-6 col-6 text-right">
							<button
								class="mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab"
								type="submit" data-toggle="tooltip" title="Save Group">
								<i class="material-icons">save</i>
							</button>

							<button
								class="mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab"
								type="reset" data-toggle="tooltip" title="Reset">
								<i class="material-icons">undo </i>
							</button>

							<a href="Group"
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
								<label for="label" class="font-weight-bold">Label <span
									class="asterik">*</span>
								</label> <input type="text" class="form-control" name="label" id="label">
							</div>
						</div>
						<div class="col-md-5 col-sm-12 col-12">
							<div class="form-group">
								<label for="NbLicence" class="font-weight-bold">Number Of Licence <span class="asterik">*</span>
								</label> <input type="number" class="form-control" name="NbLicence"
									id="NbLicence">
							</div>
						</div>
		

					<div class="col-md-6 col-sm-12 col-12">
						<div class="form-group">
							<label for="Label" class="font-weight-bold">Country <span
								class="asterik">*</span></label><select class="form-control"
								name="country" id="country">
								<option value="India">IND</option>
								<option value="America">US</option>
						</select>
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
<script src="js/customjs/addgroup.js"></script>
