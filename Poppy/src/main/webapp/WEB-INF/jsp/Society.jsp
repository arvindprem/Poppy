<%@ include file="../layout/head.jsp"%>
<%@ include file="../layout/header.jsp"%>
<div class="app-content">
	<div class="row">
		<div class="col-md-12 col-sm-12 col-12">
			<div class="card">
				<div class="card-body">

					<div class="row headerStyle">
						<div class="col-md-9 col-sm-10 col-8">
							<span>Society</span>
						</div>

						<div class="offset-md-1 col-md-2 col-sm-2 col-4 text-right">
							<a href="AddSocietyInfo">
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
									<label for="SocietyLabel">Label </label> <input type="text"
										class="form-control" id="SocietyLabel" name="SOcietyLabel">
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
						<table id="Society"
							class="table table-responsive w-100 d-block d-md-table d-sm-table  table-striped table-bordered table-hover">
							<thead>
								<tr>
									<th>S.No</th>
									<th>Label</th>
									<th>Address</th>
									<th>Phone</th>
									<th>Number of license</th>
									<th>Responsible Name</th>
									<th>Responsible Email</th>
									<th>Exp_Date</th>


								</tr>
							</thead>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>



<div class="row spaceBetweenLines">
	<div class="col-md-6 col-sm-12 col-12">
		<div class="form-group">
			<label for="GroupLabel">Label <span class="asterik">*</span>
			</label> <input type="text" class="form-control" name="GroupLabel"
				id="GroupLabel"> <input type="hidden" name="id" id="id">
		</div>
	</div>
</div>
<div class="col-md-6 col-sm-12 col-12">
	<div class="form-group">
		<label for="address">Address <span class="asterik">*</span>
		</label> <input type="text" class="form-control" name="Address" id="Address">
	</div>
</div>
<div class="col-md-6 col-sm-12 col-12">
	<div class="form-group">
		<label for="phone">Phone <span class="asterik">*</span>
		</label> <input type="text" class="form-control" name="phone" id="phone">
	</div>
</div>
<div class="col-md-6 col-sm-12 col-12">
	<div class="form-group">
		<label for="NbLicence">Number of license <span class="asterik">*</span>
		</label> <input type="number" class="form-control" name="NbLicence"
			id="NbLicence">
	</div>
	<div class="col-md-6 col-sm-12 col-12">
		<div class="form-group">
			<label for="userName">Responsible Name <span class="asterik">*</span>
			</label> <input type="text" class="form-control" name="responsibleName"
				id="responsibleName">
		</div>
	</div>
	<div class="form-group">
		<label for="firstName">Responsible Email <span class="asterik">*</span>
		</label> <input type="email" class="form-control" name="responsibleMail"
			id="responsibleMail">
	</div>
</div>







<div class="row">
	<div class="col-md-12 col-sm-12 col-12">
		<span class="asterik">*</span><small> Mandatory fields</small>
	</div>
</div>


<%@ include file="../layout/footer.jsp"%>
<%@ include file="../layout/foot.jsp"%>
<script src="js/customjs/Society.js"></script>

<script>
	$("#startTime").datetimepicker();
	$("#endTime").datetimepicker();
</script>