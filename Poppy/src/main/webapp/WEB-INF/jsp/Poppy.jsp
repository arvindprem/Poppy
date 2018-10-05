<%@ include file="../layout/head.jsp"%>
<%@ include file="../layout/header.jsp"%>
<div class="app-content">
	<div class="row">
		<div class="col-md-12 col-sm-12 col-12">
			<div class="card">
				<div class="card-body">

					<div class="row headerStyle">
						<div class="col-md-9 col-sm-10 col-8">
							<span>Poppy</span>
						</div>

						<div class="offset-md-1 col-md-2 col-sm-2 col-4 text-right">
							<a href="addPoppyInfo">
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
					<div class="box" style="display: none">
						<div class="row">
							<div class=" offset-md-1 col-md-4 col-sm-12 col-12">
								<div class="form-group">
									<label for="PoppyVersion">Version </label> <input type="text"
										class="form-control" id="PoppyVersion" name="FeatureLabel">
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
							<table id="Poppy"
								class="table table-responsive w-100 d-block d-md-table d-sm-table  table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th>Version</th>
										<th>Creation DateTime</th>
										<th>download Path</th>
										
									</tr>
								</thead>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<div class="row spaceBetweenLines">
	<div class="col-md-6 col-sm-12 col-12">
		<div class="form-group">
			<label for="PoppyVersion">Label <span class="asterik">*</span>
			</label> <input type="text" class="form-control" name="PoppyVersion"
				id="PoppyVersion"> <input type="hidden" name="id" id="id">
		</div>
	</div>
	</div>
	<div class="row spaceBetweenLines">
	<div class="col-md-6 col-sm-12 col-12">
		<div class="form-group">
			<label for="Download Path">Download Path <span class="asterik">*</span>
			</label> <input type="text" class="form-control" name="Download Path"
				id="Download Path"> <input type="hidden" name="id" id="id">
		</div>
	</div>
	</div>






<div class="row">
	<div class="col-md-12 col-sm-12 col-12">
		<span class="asterik">*</span><small> Mandatory fields</small>
	</div>
</div>


<%@ include file="../layout/footer.jsp"%>
<%@ include file="../layout/foot.jsp"%>
<script src="js/customjs/PoppyVersion.js"></script>

