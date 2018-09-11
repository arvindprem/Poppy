<%@ include file="../layout/head.jsp"%>
<%@ include file="../layout/header.jsp"%>
<div class="app-content">

	<div class="row pageheading">
		<div class="col-md-12 col-sm-12 col-12">
			<span>Home</span>
		</div>
	</div>
	<div class="fullCalendar">
		<div class="row">
			<div class="col-md-12 col-sm-12">
				<div class="demo-card-square mdl-card mdl-shadow--2dp">
					<div class="mdl-card__actions">
						<div class="row headerStyle ">
							<div class="col-md-12 col-sm-12 col-12">
								<span> <i class="fa fa-list "></i> Available Test Plans
								</span>
							</div>
						</div>
						<div class="row spaceBetweenLines">
							<div class="col-md-12 col-sm-12 col-12">
								<table id="testPlans"
									class="table table-responsive w-100 d-block d-md-table">
									<thead>
										<tr>
											<th>Plan Name</th>
											<th>Plan Type</th>
											<th>Media Type</th>
											<th>Created Date</th>
											<th>Actions</th>
										</tr>
									</thead>
								</table>
							</div>
						</div>
						<div class="row spaceBetweenLines headerStyle">
							<div class=" col-md-11 col-sm-10 col-10">
								<span> <i class="fa fa-calendar"></i> Calendar
								</span>
							</div>
							<div class="col-md-1 col-sm-2 col-2">
								<button
									class="mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab">
									<i class="material-icons">refresh</i>
								</button>

							</div>
						</div>
						<div class="row spaceBetweenLines">
							<div class="col-md-12 col-sm-12 col-12">
								<div id="calendar"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file="../layout/footer.jsp"%>
<%@ include file="../layout/foot.jsp"%>
<script src="js/customjs/fullcalender.js"></script>
<script src="js/customjs/home.js"></script>

<script>
	$("#startTime").datetimepicker();
	$("#endTime").datetimepicker();
</script>