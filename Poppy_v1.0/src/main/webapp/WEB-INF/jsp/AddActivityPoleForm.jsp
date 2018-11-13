
<%@ include file="../layout/head.jsp"%>
<%@ include file="../layout/header.jsp"%>
<div class="app-content">
	<div class="card">
		<div class="card-body ">
			<form id="addActivityPoleForm">
				<div class="card-title">
					<div class="row  headerStyle">
						<div class="col-md-8 col-md-6 col-6">
							<span><i class="fa fa-user"></i> Add ActivityPole</span>
						</div>
						<div class="col-md-4 col-sm-6 col-6 text-right">
							<button
								class="mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab"
								type="submit" data-toggle="tooltip" title="Save ActivityPole">
								<i class="material-icons">save</i>
							</button>

							<button
								class="mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab"
								type="reset" data-toggle="tooltip" title="Reset">
								<i class="material-icons">undo </i>
							</button>

							<a href="ActivityPole"
								class="mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab">
								<span class="underliner"><i class="material-icons">
										arrow_back </i></span>
							</a>
						</div>
					</div>
				</div>
				<div class="box">
					<div class="row">
						<div class=" col-md-5 col-sm-12 col-12">
							<div class="form-group">
								<label for="label" class="font-weight-bold">Label <span
									class="asterik">*</span>
								</label> <input type="text" class="form-control" name="label" id="label">
							</div>
							</div>
							

							<div class="col-md-15 col-sm-12 col-12">
								<div class="form-group">
									<label for="address" class="font-weight-bold">Address <span
										class="asterik">*</span>
									</label> <input type="text" class="form-control" name="address"
										id="address">
								</div>
								</div>
								</div>
								
								<div class="row">
								<div class="col-md-4 col-sm-12 col-12">
									<div class="form-group">
										<label for="phone" class="font-weight-bold">Phone</label> <input
											type="tel" id="phone" name="phone" placeholder="123-456-7890"> <span
											class="validity"></span>
									</div>
								</div>
							
							<div class="col-md-5 col-sm-12 col-12">
								<div class="form-group">
									<label for="NbLicence" class="font-weight-bold">Number
										Of Licence <span class="asterik">*</span>
									</label> <input type="number" class="form-control" name="nBLicence"
										id="nBLicence">
								</div>
								</div>
								</div>


								<div class="row">
								<div class="col-md-15 col-sm-12 col-10">
									<div class="form-group">
										<label for="userName" class="font-weight-bold">Responsible
											Name <span class="asterik">*</span>
										</label> <input type="text" class="form-control" id="responsibleName"
											name="responsibleName">
									</div>
								</div>
								<div class="col-md-15 col-sm-12 col-12">
									<div class="form-group">
										<label for="firstName" class="font-weight-bold">Responsible
											Email <span class="asterik">*</span>
										</label> <input type="email" class="form-control" id="responsibleEmail"
											name="responsibleEmail" placeholder="firstname@example.com">
									</div>
								</div>
								<div class="col-md-15 col-sm-12 col-10">
									<div class="form-group">
										<label for="societyLabel" class="font-weight-bold">Society <span class="asterik">*</span>
										</label> <input type="text" class="form-control" id="societyLabel"
											name="societyLabel">
									</div>
								</div>
								<div class="col-md-15 col-sm-12 col-10">
									<div class="form-group">
										<label for="filter" class="font-weight-bold">Filter <span class="asterik">*</span>
										</label> <input type="text" class="form-control" id="filter"
											name="filter">
									</div>
								</div>
								<div class="col-md-15 col-sm-12 col-10">
									<div class="form-group">
										<label for="featureLabel" class="font-weight-bold">PoppyFeature <span class="asterik">*</span>
										</label> <input type="text" class="form-control" id="featureLabel"
											name="featureLabel">
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
<script src="js/customjs/addActivityPole.js"></script>

