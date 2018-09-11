$(document).ready(function() {
	var jsTree = $("#jstree").jstree({
			 "core" : {
		            check_callback : true
		        },
		"plugins" : [ "unique", "dnd" ]
	})


	jsTree.on('changed.jstree', function(e, data) {
		$("#selectedFolderName").html("<span>"+data.node.text+"</span>");
	});
	
	
	$("#dataItem").DataTable({
		"lengthChange" : false,
		"columnDefs" : [ {
			"orderable" : false,
			"targets" : 2
		} ]
	});
	
	
	
});
