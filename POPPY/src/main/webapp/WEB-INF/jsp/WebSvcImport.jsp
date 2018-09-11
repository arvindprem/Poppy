<%@ include file="../layout/head.jsp"%>
<%@ include file="../layout/header.jsp"%>
<div class="app-content">
	<div class="row pageheading">
		<div class="col-md-12 col-sm-12 col-12">
			<span>Web Svc Import</span>
		</div>
	</div>
	<div class="demo-card-square mdl-card mdl-shadow--2dp"
		id="hidewebsvcTable">
		<div class="mdl-card__actions">
			<div class="row headerStyle">
				<div class="col-md-8 col-sm-8 col-6">
					<span>Available Web Svc Imports</span>
				</div>
				<div class="col-md-4 col-sm-4 col-6 text-right ">
					<a href="WebSvcForm">
						<button
							class="mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab"
							data-toggle="modal" data-target="#createFolder" id="addwebsvc">
							<i class="material-icons">add </i>
						</button>
					</a>
					<button
						class="mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab"
						id="reloadwebsvc" name="eventReloader">
						<i class="material-icons"> refresh</i>
					</button>
				</div>
			</div>

			<div class="row spaceBetweenLines">
				<div class="col-md-12 col-sm-12 col-12 spaceBetweenLines">
					<table id="dataItem"
						class="table table-responsive w-100 d-block d-md-table d-sm-table  table-striped">
						<thead>
							<tr>
								<th>Name</th>
								<th>key</th>
								<th>Url</th>
								<th>Created Date</th>
								<th>Method</th>
								<th>Actions</th>
							</tr>
						</thead>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file="../layout/footer.jsp"%>
<%@ include file="../layout/foot.jsp"%>
<script src="js/DataCustomJs/websvcimport.js"></script>