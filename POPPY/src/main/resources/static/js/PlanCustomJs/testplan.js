$(document).ready(function() {

	
	
	// TABLE HIDE AND SHOW 	
	$("#addTestCases").click(function() {
		$("#hideTestCaseTable").hide();
		$("#formViewer,#backtoDetails").removeClass("magicHider");
		$('html, body').animate({
			scrollTop : $("#formViewer").offset().top
		}, 500);

	});

	// GO BACK TO TABLE  	
	$("#backtoDetails").click(function() {
		$('html, body').animate({
			scrollTop : $("#hideTestCaseTable").offset().top
		}, 500);
		$("#formViewer,#backtoDetails").addClass("magicHider");
		$("#hideTestCaseTable").show();
	});
	


	
	
	/*#TEST CASE TABLE*/ 
var testPlanTable=$("#testPlanTable").DataTable({
		"lengthChange" : false,
		"columnDefs" : [ {
			"orderable" : false,
			"targets" :5
		} ]
	});
	

	// Agent Associated Table  For  Voice Interaction
var AssociatedTable=$("#AssociatedTable").DataTable({
		"lengthChange" : false,
		"columnDefs" : [ {
			"orderable" : false,
			"targets" :4
		} ]
	});
	

// modalJsTreeModalFolder Structure
var mainJsTree=$("#mainJstree").jstree({
		 "core" : {
	            check_callback : true
	        },
	 });

// Select Event Triggered Here
 $("#mainJstree").on('changed.jstree', function(e, data) {
		 var i, j, r = [];
		 for (i = 0, j = data.selected.length; i < j; i++) {
	            r.push(data.instance.get_node(data.selected[i]).text);
	     }
		 var nodeName=r.join(', ');
	     $("#selectedFolderName").html("<span>"+nodeName+" <i class='fa fa-close' style='color:red;' id='mainUnselector'></i></span>");
	});

	 
// DeSelect Event Triggered Here
	$('body').on('click','#mainUnselector',function() {
		mainJsTree.jstree("deselect_all");
		   $("#selectedFolderName").html(null);
	});
	 

	
	// First Page Folder Structure
	var testPlanJstree=$("#testPlanJstree").jstree({
			 "core" : {
		            check_callback : true
		        },
		 });
	
	// Select Event Triggered Here
	 $("#testPlanJstree").on('changed.jstree', function(e, data) {
			 var i, j, r = [];
			 for (i = 0, j = data.selected.length; i < j; i++) {
		            r.push(data.instance.get_node(data.selected[i]).text);
		     }
			 var nodeName=r.join(', ');
		     $("#testPlanJstreeFolderName").html("<span>"+nodeName+" <i class='fa fa-close' style='color:red;' id='subUnselector'></i></span>");
		});
	
		 
	// DeSelect Event Triggered Here
		$('body').on('click','#subUnselector',function() {
			testPlanJstree.jstree("deselect_all");
			   $("#testPlanJstreeFolderName").html(null);
		});
		 

	$("#Radio3").prop("checked", true);
	$("#weekly").removeClass("magicHider");
	$('.loader input:radio').change(function() {
		var checked =$(this).val();
		console.log(checked)
		if(checked=="weekly") {
			$("#weekly").removeClass("magicHider");
			$("#custom,#runfor").addClass("magicHider");
		} else 	if(checked=="runfor") {
			$("#runfor").removeClass("magicHider");
			$("#custom,#weekly").addClass("magicHider");
		}else 	if(checked=="custom") {
			$("#custom").removeClass("magicHider");
			$("#weekly,#runfor").addClass("magicHider");
		}
	});
	
	
	
	
});
