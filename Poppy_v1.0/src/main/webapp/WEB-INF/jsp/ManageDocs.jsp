<%@ include file="../layout/head.jsp"%>
<%@ include file="../layout/header.jsp"%>
<div class="app-content">
	<div class="row">
		<div class="col-md-12 col-sm-12 col-12">
			<div class="card">
				<div class="card-body">
					<div class="row headerStyle">
						<div class="col-md-9 col-sm-10 col-8">
							<span>Doc Management</span>
						</div>
						<div class="offset-md-1 col-md-2 col-sm-2 col-4 text-right">
							<a href="AddDoc">
								<button
									class="mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab">
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



					<div class="box" style="display: none; margin-top: 20px;">
						<div class="row">
							<div class=" offset-md-1 col-md-4 col-sm-12 col-12">
								<div class="form-group">
									<label for="userName">User Name </label> <input type="text"
										class="form-control" id="filteruserName" name="userName">
								</div>
							</div>
							
						</div>
						<div class="row">
							<div class="offset-md-1 col-md-4 col-sm-12 col-12">
								<div class="form-group">
									<label for="userName">Country <span class="asterik">*</span>
									</label> <select class="form-control" id="country" name="country">
										<option class="font-weight-bold" value="">select
											country...</option>
									</select>
								</div>
							</div>
							<div class="offset-md-2 col-md-2 col-sm-12 col-12 text-right">
								<div class="form-group">
									<label for="fliter"> </label>
									<button class="btn btn-filter btn-block" type="button"
										id="fliter">Filter</button>
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
							<table id="userManagement"
								class="table table-responsive w-100 d-block d-md-table d-sm-table  table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th>S.No</th>
										<th>File Name</th>
										<th>Description</th>
										<th>Actions</th>
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
<%@ include file="../layout/footer.jsp"%>
<%@ include file="../layout/foot.jsp"%>
<script src="js/customjs/documentmanagement.js"></script>

