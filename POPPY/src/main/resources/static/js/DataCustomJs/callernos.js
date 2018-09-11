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
	
	
	$("#callNos").DataTable({
		"lengthChange" : false,
		"columnDefs" : [ {
			"orderable" : false,
			"targets" : 5
		} ]
	});
	
	$("#addCaller").click(function() {
		$("#hideCallerTable").hide();
		$("#formViewer").removeClass("magicHider");
		$('html, body').animate({
			scrollTop : $("#formViewer").offset().top
		}, 500);

	});

	
	$("#closeForm").click(function() {
		$('html, body').animate({
			scrollTop : $("#hideCallerTable").offset().top
		}, 500);
		$("#formViewer").addClass("magicHider");
		$("#hideCallerTable").show();
	});
	
	
	
	
	
	
	
});
