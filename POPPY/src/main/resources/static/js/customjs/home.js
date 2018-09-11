$(document).ready(function() {

	$("#testPlans").DataTable({
		"searching" : false,
		"lengthChange" : false,
		"columnDefs" : [ {
			"orderable" : false,
			"targets" : 4
		} ]
	});
});
