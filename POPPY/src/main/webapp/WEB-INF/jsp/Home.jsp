<%@ include file="../layout/head.jsp"%>
<%@ include file="../layout/header.jsp"%>
<div class="app-content">

	<div class="row pageheading">
		<div class="col-md-12 col-sm-12 col-12">
			<span>Home</span>
		</div>
	</div>
<center><big><strong>Welcome to POPPY</big></strong></center>
</div>
<%@ include file="../layout/footer.jsp"%>
<%@ include file="../layout/foot.jsp"%>
<script src="js/customjs/fullcalender.js"></script>
<script src="js/customjs/home.js"></script>

<script>
	$("#startTime").datetimepicker();
	$("#endTime").datetimepicker();
</script>