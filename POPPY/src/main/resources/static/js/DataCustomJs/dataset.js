$(document).ready(function() {
	var jsTree = $("#jstree").jstree({
			 "core" : {
		            check_callback : true
		        },
	})


	jsTree.on('changed.jstree', function(e, data) {
		$("#selectedFolderName").html("<span>"+data.node.text+"</span>");
	});
	
	
	$("#dataSet").DataTable({
		"lengthChange" : false,
		"columnDefs" : [ {
			"orderable" : false,
			"targets" :	[3,4]
		} ]
	});
	
	
	
	$("#dataSetCreator").click(function() {
		$("#hideDataSet").hide();
		$("#formViewer").removeClass("magicHider");
		$('html, body').animate({
			scrollTop : $("#formViewer").offset().top
		}, 500);

	});

	
	
	$("#closeForm").click(function() {
		$('html, body').animate({
			scrollTop : $("#hideDataSet").offset().top
		}, 500);
		$("#formViewer").addClass("magicHider");
		$("#hideDataSet").show();
	});
	
	
	
$("#jstreemodal").jstree({
		 "core" : {
	            check_callback : true
	        },
});
	

$("#parameterTable").DataTable({
	"lengthChange" : false,

});
	
	
});
