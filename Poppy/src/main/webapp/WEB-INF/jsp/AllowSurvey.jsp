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
						<table id="ActivityPole"
							class="table table-responsive w-100 d-block d-md-table d-sm-table  table-striped table-bordered table-hover">
							<thead>
								<tr>
									<th>S.No</th>
									<th>Filter</th>
									<th>Exp_Date</th>
									<th>Sample</th>
									
									


								</tr>
							</thead>
						</table>
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


<%@ include file="../layout/footer.jsp"%>
<%@ include file="../layout/foot.jsp"%>
<script src="js/customjs/AllowSurvey.js"></script>

<script>
	$("#startTime").datetimepicker();
	$("#endTime").datetimepicker();
</script>