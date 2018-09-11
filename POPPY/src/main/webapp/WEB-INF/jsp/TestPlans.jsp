<%@ include file="../layout/head.jsp"%>
<%@ include file="../layout/header.jsp"%>
<div class="app-content">
	<div class="row pageheading">
		<div class="col-md-10">
			<span>Test Plan</span>
		</div>
		<div class="col-md-2 magicHider underliner" id="backtoDetails">
			<span><i class="fa fa-arrow-left"></i> Back to Details</span>
		</div>
	</div>
	<div class="card card-default" id="hideTestCaseTable">
		<div class="card-body ">
			<div class="row headerStyle">
				<div class="col-md-8 col-sm-offset-12">
					<span>Available Test Plans</span>
				</div>
				<div class="col-md-4 col-sm-12 text-right ">
					<button class="btn btn-primary text-center" data-toggle="modal"
						data-target="#createFolder" id="addTestCases">
						<i class="fa fa-plus"> </i>
					</button>
					<button class="btn btn-primary text-center" id="reloadwebsvc"
						name="TestCaseReloader">
						<i class="fa fa-refresh"> </i>
					</button>
				</div>
			</div>
			<div class="row spaceBetweenLines">
				<div class="col-md-3">
					<div class="row spaceBetweenLines folderStyle">
						<div class="col-md-offset-4 col-md-offset-4">
							<b>Selected Folder :&nbsp;</b><label id="selectedFolderName"></label>
						</div>
					</div>
					<div class="row spaceBetweenLines">
						<div class="col-md-12 ">
							<div id="mainJstree">
								<ul id="rootNode">
									<li>Rootnode1</li>
									<li>Rootnode2</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-9 col-sm-6 spaceBetweenLines">
					<table id="testPlanTable"
						class="table table-responsive w-100 d-block d-md-table table-striped">
						<thead>
							<tr>
								<th>Name</th>
								<th>Interaction Type</th>
								<th>Description</th>
								<th>Plan Type</th>
								<th>Created Date</th>
								<th>Actions</th>
							</tr>
						</thead>
					</table>
				</div>
			</div>
		</div>
	</div>
	<div class="magicHider" id="formViewer">
		<div class="card card-default">
			<div class="card-body ">
				<form action="">
					<div class="row headerStyle">
						<div class="col-md-8 col-sm-offset-12">
							<span>Create New</span>
						</div>
						<div class="col-md-4 col-sm-12 text-right ">
							<button class="btn btn-primary text-center" data-toggle="tooltip"
								title="Import Test Case(.csv)">
								<i class="fa fa-upload"> </i>
							</button>
							<button class="btn btn-primary text-center" data-toggle="tooltip"
								title="Save">
								<i class="fa fa-save"> </i>
							</button>
						</div>
					</div>
					<div class="row spaceBetweenLines">
						<div class="col-md-6">
							<div class="form-group">
								<div class="row">
									<div class="col-md-12">
										<label for="folderName">Test Plan Name <span
											class="asterik"> *</span></label> <input type="text"
											class="form-control" name="folderName" id="folderName">
									</div>
								</div>
							</div>
							<div class="form-group">
								<div class="row">
									<div class="col-md-12 ">
										<label for="description">Description</label>
										<textarea class="form-control" name="description"
											id="description"></textarea>
									</div>
								</div>
							</div>
							<div class="form-group">
								<div class="row">
									<div class="col-md-12">
										<label for="description">Interaction Type<span
											class="asterik"> *</span></label> <select class="form-control"
											name="selectionType" id="selectionType">
											<option>Voice</option>
											<option>WEB Mail</option>
											<option>SMTP Mail</option>
											<option>Chat</option>
										</select>
									</div>
								</div>
							</div>

							<div class="form-group">
								<div class="row">
									<div class="col-md-6">
										<label for="description">Plan Type<span
											class="asterik"> *</span></label> <select class="form-control"
											name="selectionType" id="selectionType">
											<option>Functional Testing</option>
											<option>Load Testing</option>
											<option>Health Monitoring</option>
										</select>
									</div>
									<div class="col-md-6">
										<label for="description">Environment<span
											class="asterik"> *</span></label> <select class="form-control"
											name="selectionType" id="selectionType">
											<option>---None---</option>
										</select>
									</div>
								</div>
							</div>

							<div class="form-group">
								<div class="row">
									<div class="col-md-12">
										<label for="description">Notification Plan <span
											class="asterik"> *</span></label> <select class="form-control"
											name="selectionType" id="selectionType">
											<option>---None---</option>
										</select>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="row spaceBetweenLines folderStyle">
								<div class="col-md-offset-4 col-md-offset-4">
									<b>Selected Folder :&nbsp;</b><label
										id="testPlanJstreeFolderName"></label>
								</div>
							</div>
							<div class="row spaceBetweenLines">
								<div class="col-md-12 ">
									<div id="testPlanJstree">
										<ul id="rootNode">
											<li>Rootnode1</li>
											<li>Rootnode2</li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="row">
							<div class="col-md-6">
								<label for="description">Start After <span
									class="asterik"> *</span></label> <input type="text"
									class="form-control" name="folderName" id="folderName">
							</div>
							<div class="col-md-6">
								<label for="description">Concurrent Count <span
									class="asterik"> *</span></label> <input type="text"
									class="form-control" name="folderName" id="folderName"
									value="1">
							</div>
						</div>
					</div>
					<div class="row spaceBetweenLines radioHeader">
						<div class="col-md-2">
							<span>Schedule Type</span>
						</div>
						<div class="col-md-10 col-sm-10 loader">
							<div class="custom-control custom-radio custom-control-inline">
								<input type="radio" id="Radio1" name="Radio" value="runfor"
									class="custom-control-input"> <label
									class="custom-control-label" for="Radio1">Run For</label>
							</div>
							<div class="custom-control custom-radio custom-control-inline">
								<input type="radio" id="Radio2" name="Radio" value="custom"
									class="custom-control-input"> <label
									class="custom-control-label" for="Radio2"> Custom</label>
							</div>
							<div class="custom-control custom-radio custom-control-inline">
								<input type="radio" id="Radio3" name="Radio" value="weekly"
									class="custom-control-input"> <label
									class="custom-control-label" for="Radio3"> Weekly</label>
							</div>
						</div>
					</div>

					<div id="runfor" class="magicHider spaceBetweenLines">
						<div class="form-group">
							<div class="row">
								<div class="col-md-4">
									<label for="duration">Duration <span class="asterik">
											*</span></label> <br /> <input type="text" class="form-control"
										name="duration" id="duration" value="1">
								</div>
								<div class="col-md-4">
									<label for="unitType">Unit <span class="asterik">
											*</span></label> <select class="form-control" name="unitType" id="unitType">
										<option>Hours</option>
										<option>Minutes</option>
										<option>Seconds</option>
									</select>
								</div>
								<div class="col-md-4">
									<label for="interval">Interval(Seconds) <span
										class="asterik"> *</span></label> <input type="text"
										class="form-control" name="interval" id="interval" value="1">
								</div>
							</div>
						</div>
					</div>


					<div id="custom" class="magicHider spaceBetweenLines">
						<div class="form-group">
							<div class="row">
								<div class="col-md-4">
									<label for="duration">Start Date &#38; Time <span
										class="asterik"> *</span></label>
									<div class="input-group-prepend">
										<span class="input-group-text" id="basic-addon1"><i
											class="fa fa-calendar"></i></span> <input type="text"
											class="form-control" id="startDateTime" name="startDateTime"
											aria-describedby="basic-addon1">
									</div>
								</div>
								<div class="col-md-4">
									<label for="unitType">End Date &#38; Time <span
										class="asterik"> *</span></label>
									<div class="input-group-prepend">
										<span class="input-group-text" id="basic-addon2"><i
											class="fa fa-calendar"></i></span> <input type="text"
											class="form-control" name="endDateTime" id="endDateTime"
											aria-describedby="basic-addon2">
									</div>
								</div>
								<div class="col-md-4">
									<label for="interval">Interval(Seconds) <span
										class="asterik"> *</span></label> <input type="text"
										class="form-control" name="interval" id="customInterval"
										value="1">
								</div>
							</div>
						</div>
					</div>

					<div id="weekly" class="magicHider spaceBetweenLines">
						<div class="form-group">
							<div class="row">
								<div class="col-md-4 col-sm-4">
									<div class="row">
										<div class="col-md-6">
											<label>All Days</label>
										</div>

										<div class="col-md-6">
											<label class="switch"><input type="checkbox">
												<span class="slider round"></span> </label>
										</div>
									</div>
								</div>

								<div class="col-md-4 col-sm-4">
									<div class="row">
										<div class="col-md-6">
											<label> Week Days</label>
										</div>

										<div class="col-md-6">
											<label class="switch"><input type="checkbox">
												<span class="slider round"></span> </label>
										</div>
									</div>
								</div>

								<div class="col-md-4">
									<div class="row">
										<div class="col-md-6">
											<label> Weekend</label>
										</div>

										<div class="col-md-6">
											<label class="switch"><input type="checkbox">
												<span class="slider round"></span> </label>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="form-group spaceBetweenLines">
							<div class="row">
								<div class="col-md-5 col-sm-5">
									<div class="row">
										<div class="col-md-4 col-sm-4">
											<div class="animated-checkbox">
												<label> <input type="checkbox" name="enableCookies"
													id="enableCookies"><span class="label-text black">Sunday
												</span>
												</label>
											</div>
										</div>

										<div class="col-md-4 col-sm-4">
											<div class="animated-checkbox">
												<label> <input type="checkbox" name="enableCookies"
													id="enableCookies"><span class="label-text black">Monday
												</span>
												</label>
											</div>
										</div>

										<div class="col-md-4 col-sm-4">
											<div class="animated-checkbox">
												<label> <input type="checkbox" name="enableCookies"
													id="enableCookies"><span class="label-text black">
														Tuesday </span>
												</label>
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-5 col-sm-5">
									<div class="row">
										<div class="col-md-4 col-sm-4">
											<div class="animated-checkbox">
												<label> <input type="checkbox" name="enableCookies"
													id="enableCookies"><span class="label-text black">
														Wednesday </span>
												</label>
											</div>
										</div>

										<div class="col-md-4 col-sm-4">
											<div class="animated-checkbox">
												<label> <input type="checkbox" name="enableCookies"
													id="enableCookies"><span class="label-text black">
														Thursday </span>
												</label>
											</div>
										</div>

										<div class="col-md-4 col-sm-4">
											<div class="animated-checkbox">
												<label> <input type="checkbox" name="enableCookies"
													id="enableCookies"><span class="label-text black">
														Friday </span>
												</label>
											</div>
										</div>
									</div>
								</div>

								<div class="col-md-2 col-sm-2">
									<div class="animated-checkbox">
										<label> <input type="checkbox" name="enableCookies"
											id="enableCookies"><span class="label-text black">
												Saturday </span>
										</label>
									</div>
								</div>

							</div>
						</div>

						<div class="form-group spaceBetweenLines">
							<div class="row">
								<div class="col-md-4">
									<label for="duration">Start Date &#38; Time <span
										class="asterik"> *</span></label>
									<div class="input-group-prepend">
										<span class="input-group-text" id="basic-addon1"><i
											class="fa fa-calendar"></i></span> <input type="text"
											class="form-control" name="weeklyStartDateTime"
											id="weeklyStartDateTime" aria-describedby="basic-addon1">
									</div>

								</div>
								<div class="col-md-4">
									<label for="unitType">End Date &#38; Time <span
										class="asterik"> *</span></label>
									<div class="input-group-prepend">
										<span class="input-group-text"><i
											class="fa fa-calendar"></i></span> <input type="text"
											class="form-control" name="weeklyEndDateTime"
											id="weeklyEndDateTime">
									</div>
								</div>
								<div class="col-md-4">
									<label for="interval">Interval(Seconds) <span
										class="asterik"> *</span></label> <input type="text"
										class="form-control" name="interval" id="weeklyInterval"
										value="1">
								</div>
							</div>
						</div>
					</div>

					<div class="row headerStyle spaceBetweenLines">
						<div class="col-md-8 col-sm-offset-12">
							<span>Associated Test Cases</span>
						</div>
						<div class="col-md-4 col-sm-12 text-right ">
							<button class="btn btn-primary text-center" data-toggle="tooltip"
								title="Map Test Case">
								<i class="fa fa-plus"> </i>
							</button>
						</div>
					</div>
					<div class="row spaceBetweenLines">
						<div class="col-md-12">
							<table id="AssociatedTable"
								class="table table-responsive w-100 d-block d-md-table table-striped">
								<thead>
									<tr>
										<th>Name</th>
										<th>Interaction Type</th>
										<th>Description</th>
										<th>Created Date</th>
										<th>Actions</th>
									</tr>
								</thead>
							</table>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<%@ include file="../layout/footer.jsp"%>
<%@ include file="../layout/foot.jsp"%>

<script>
	$("#duration").spinner({
		min : 1,
	});

	$("#interval").spinner({
		min : 1,
	});

	$("#customInterval").spinner({
		min : 1,
	});

	/*DATE MUST BE START FROM CURRENT DATE   */
	$("#startDateTime").datetimepicker({
		minDate : new Date()
	});

	$("#endDateTime").datetimepicker({
		useCurrent : false
	});

	$("#weeklyStartDateTime").datetimepicker({
		minDate : new Date()
	});

	$("#weeklyEndDateTime").datetimepicker({
		useCurrent : false
	});

	$("#weeklyInterval").spinner({
		min : 1,
	});

	/* DATE MUST BE GREATER THAN START DATE & TIME */
	$("#startDateTime").on("dp.change", function(e) {
		$('#endDateTime').data("DateTimePicker").minDate(e.date);
	});
	$("#endDateTime").on("dp.change", function(e) {
		$('#startDateTime').data("DateTimePicker").maxDate(e.date);
	});
</script>
<script src="js/PlanCustomJs/testplan.js"></script>