<%@ include file="../layout/head.jsp"%>
<%@ include file="../layout/header.jsp"%>
<div class="app-content">
	<div class="app-title">
		<div>
			<h1>
				<i class="fa fa-calendar"></i> Calendar
			</h1>
			<p>Full Calander page for managing events</p>
		</div>
		<ul class="app-breadcrumb breadcrumb">
			<li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
			<li class="breadcrumb-item"><a href="#">Calendar</a></li>
		</ul>
	</div>
	<div class="row">
		<div class="col-md-12">
			<div class="card card-default">
				<div class="card-body">
					<div class="row">
						<div class="col-md-12 form-group text-right">
							<button class="btn btn-primary btn-lg" data-toggle="modal"
								data-target="#eventMaker">
								<i class="fa fa-plus"> </i>
							</button>

							<button class="btn btn-primary btn-lg" id="eventReloader"
								name="eventReloader">
								<i class="fa fa-refresh"> </i>
							</button>
						</div>
					</div>
					<div class="row" style="display: flex; padding: 10px;">
						<div class="col-md-12 text-center">
							<div id="calendar"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="modal fade" id="eventMaker" tabindex="-5" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">
					<i class="fa fa-calendar"></i> Create Event
				</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form id="eventFrom">
					<div class="form-group">
						<div class="row">
							<div class="col-md-4">
								<label for="eventName">Event Name</label>
							</div>
							<div class="col-md-7">
								<input type="text" class="form-control" name="title"
									id="eventName">
							</div>
						</div>
					</div>

					<div class="form-group">
						<div class="row">
							<div class="col-md-4">
								<label for="eventName">Event Start Time</label>
							</div>
							<div class="col-md-7">
								<div class="input-group">
									<input type="text" class="form-control" id="startTime"
										name="startTime" />
									<div class="input-group-append">
										<span class="input-group-text"><i
											class="fa fa-calendar"></i></span>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="row">
							<div class="col-md-4">
								<label for="eventName">Event End Time</label>
							</div>
							<div class="col-md-7">
								<div class="input-group">
									<input type="text" class="form-control" id="endTime"
										name="endTime" />
									<div class="input-group-append">
										<span class="input-group-text"><i
											class="fa fa-calendar"></i></span>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="row">
							<div class="col-md-4">
								<label for="eventName">Event Description</label>
							</div>
							<div class="col-md-7">
								<textarea class="form-control" name="description"
									id="eventDescription"></textarea>
							</div>
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary " data-dismiss="modal">Close</button>
				&nbsp;
				<button type="button" class="btn btn-primary" id="eventcreator">Save</button>
			</div>
		</div>
	</div>
</div>
<div class="modal fade" id="fullCalModal" tabindex="-5" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">

			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">
					<label id="modalTitle" class="modal-title"></label>
				</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div id="modalBody" class="modal-body">
				<div class="row">
					<div class="col-md-5">
						<label for="start"> <b>Start Time</b>
						</label>
					</div>

					<div class="col-md-1">
						<label for="start"> :</label>
					</div>
					<div class="col-md-6">
						<label id="start"> </label>
					</div>
				</div>

				<div class="row">
					<div class="col-md-5">
						<label for="end"><b>End Time</b> </label>
					</div>
					<div class="col-md-1">
						<label for="start"> :</label>
					</div>
					<div class="col-md-6">
						<label id="end"> </label>
					</div>
				</div>

				<div class="row">
					<div class="col-md-5">
						<label for="des"> <b>Description</b></label>
					</div>

					<div class="col-md-1">
						<label for="start"> :</label>
					</div>
					<div class="col-md-6">
						<label id="des"> </label>
					</div>
				</div>

				<div class="row">
					<div class="col-md-5">
						<label for="id"> <b>ID</b></label>
					</div>

					<div class="col-md-1">
						<label for="id"> :</label>
					</div>
					<div class="col-md-6">
						<label id="id"> </label>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
				&nbsp;
				<button type="button" class="btn btn-primary" id="delete">Delete</button>
			</div>
		</div>
	</div>
</div>
<%@ include file="../layout/footer.jsp"%>
<%@ include file="../layout/foot.jsp"%>
<script src="js/customjs/fullcalender.js"></script>

<script>
	$("#startTime").datetimepicker();
	$("#endTime").datetimepicker();
</script>