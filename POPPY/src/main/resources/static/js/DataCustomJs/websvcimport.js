$(document).ready(function() {
	// DATA TABLE FOR DATA ITEM
	$("#dataItem").DataTable({
		"lengthChange" : false,
		"columnDefs" : [ {
			"orderable" : false,
			"targets" :5
		} ]
	});
	
	
	
	$('.loader input:radio').change(function() {
		var checked =$(this).val();
		if(checked=="content") {
			$("#contentLoader").removeClass("magicHider");
			$("#gridLoader,#rawLoader").addClass("magicHider");
		} else 	if(checked=="grid") {
			$("#gridLoader").removeClass("magicHider");
			$("#contentLoader,#rawLoader").addClass("magicHider");
		}else 	if(checked=="raw") {
			$("#rawLoader").removeClass("magicHider");
			$("#contentLoader,#gridLoader").addClass("magicHider");
		}
	});
	
});
