$(document).ready(function() {

	
	var actions=" <i class='fa fa-edit text-center' data-toggle='tooltip' title='add parameters' id='edit'> </i> &nbsp;"
		 +"<i class='fa fa-trash text-center' data-toggle='tooltip' title='delete' id='delete'>";

	
	
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
	

	

	
$("#addAgentkvp,#subMapDataSetKvp,#subAgentDataKvp").on('click', function () {
		$("#agentDataHeader").html("Add Parameters");
		$('#addkvpFrom').find("input[type=text]").val("");
		$("#kvpform").slideDown();
});		

$("#resetkvp").on( 'click', function () {
		$('#addkvpFrom').find("input[type=text]").val("");
		$("#kvpform").slideUp();
});	
	
	
	/*#TEST CASE TABLE*/ 
var testCaseTable=$("#testCaseTable").DataTable({
		"lengthChange" : false,
		"columnDefs" : [ {
			"orderable" : false,
			"targets" :5
		} ]
	});
	

	// Agent Associated Table  For  Voice Interaction
var agentAssociatedTable=$("#agentAssociatedTable").DataTable({
		"lengthChange" : false,
		"columnDefs" : [ {
			"orderable" : false,
			"targets" :7
		} ]
	});
	

// Agent Associated Table  For  Voice Interaction
var chatAgentAssociatedTable=$("#chatAgentAssociatedTable").DataTable({
		"lengthChange" : false,
		"columnDefs" : [ {
			"orderable" : false,
			"targets" :7
		} ]
	});


var agentDataTable=$("#agentDataTable").DataTable({
	"lengthChange": false,
	"columnDefs" : [ {
		"orderable" : false,
		"targets" :2
	} ]
	
});



var subMapDataSetTable=$("#subMapDataSetTable").DataTable({
	"lengthChange": false,
	"columnDefs" : [ {
		"orderable" : false,
		"targets" :2
	} ]
	
});


var subAgentDataTable=$("#subAgentDataTable").DataTable({
	"lengthChange": false,
	"columnDefs" : [ {
		"orderable" : false,
		"targets" :2
	} ]
	
});




var modalAgentDataTable=$("#modalAgentDataTable").DataTable({
	"lengthChange": false,
	"columnDefs" : [ {
		"orderable" : false,
		"targets" :2
	} ]
	
});


var modalMapDataSetTable=$("#modalMapDataSetTable").DataTable({
	"lengthChange": false,
	"columnDefs" : [ {
		"orderable" : false,
		"targets" :1
	} ]
	
});


var mailMapDataSetTable=$("#mailMapDataSetTable").DataTable({
	"lengthChange": false,
	"columnDefs" : [ {
		"orderable" : false,
		"targets" :1
	} ]
	
});

	
var mailMapDataSetTable=$("#mailAgentDataTable").DataTable({
	"lengthChange": false,
	"columnDefs" : [ {
		"orderable" : false,
		"targets" :1
	} ]
	
});


var chatMapDataSetTable=$("#chatMapDataSetTable").DataTable({
	"lengthChange": false,
	"columnDefs" : [ {
		"orderable" : false,
		"targets" :1
	} ]
	
});


var chatAgentDataTable=$("#chatAgentDataTable").DataTable({
	"lengthChange": false,
	"columnDefs" : [ {
		"orderable" : false,
		"targets" :2
	} ]
	
});

// modalJsTreeModalFolder Structure
var modalJsTreeModal=$("#modalJsTreeModal").jstree({
		 "core" : {
	            check_callback : true
	        },
	 });

// Select Event Triggered Here
 $("#modalJsTreeModal").on('changed.jstree', function(e, data) {
		 var i, j, r = [];
		 for (i = 0, j = data.selected.length; i < j; i++) {
	            r.push(data.instance.get_node(data.selected[i]).text);
	     }
		 var nodeName=r.join(', ');
	     $("#mapDataModalFolderName").html("<span>"+nodeName+" <i class='fa fa-close' style='color:red;' id='mainUnselector'></i></span>");
	});

	 
// DeSelect Event Triggered Here
	$('body').on('click','#mainUnselector',function() {
		modalJsTreeModal.jstree("deselect_all");
		   $("#mapDataModalFolderName").html(null);
	});
	 
	 
	$('body').on('click','#mainUnselector',function() {
		$("#testCaseTree").jstree("deselect_all");
		   $("#selectedFolderName").html(null);
	});

	
	// First Page Folder Structure
var mainJsTree=$("#jsTree").jstree({
			 "core" : {
		            check_callback : true
		        },
		 });
	
	// Select Event Triggered Here
	 $("#jsTree").on('changed.jstree', function(e, data) {
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
		 
		 
		$('body').on('click','#mainUnselector',function() {
			$("#testCaseTree").jstree("deselect_all");
			   $("#selectedFolderName").html(null);
		});
		 
		 //Test Case Folder 
var testCaseJsTree=$("#testCaseTree").jstree({	
			 "core" : {
		            check_callback : true
		        },
		});
		 
		 
		 
		 $("#testCaseTree").on('changed.jstree', function(e, data) {
			 var i, j, r = [];
			 for (i = 0, j = data.selected.length; i < j; i++) {
		            r.push(data.instance.get_node(data.selected[i]).text);
		     }
			 var nodeName=r.join(', ');
		     $("#testCaseFolderName").html("<span>"+nodeName+" <i class='fa fa-close' style='color:red;' id='mainUnselector'></i></span>");
		}); 
	
		 $('body').on('click','#mainUnselector',function() {
			 testCaseJsTree.jstree("deselect_all");
				   $("#testCaseFolderName").html(null);
			});
			 
	
	
		 
		 
 //mapDataSetModalTree
	 var mapDataSetModalTree=$("#mapDataSetModalTree").jstree({	
		 "core" : {
	            check_callback : true
	        },
	});
		 
	 
	$("#mapDataSetModalTree").on('changed.jstree', function(e, data) {
		 var i, j, r = [];
		 for (i = 0, j = data.selected.length; i < j; i++) {
	            r.push(data.instance.get_node(data.selected[i]).text);
	     }
		 var nodeName=r.join(', ');
	     $("#selectedModalFolderName").html("<span>"+nodeName+" <i class='fa fa-close' style='color:red;' id='modelUnselector'></i></span>");
	}); 
	
	 $('body').on('click','#modelUnselector',function() {
			 mapDataSetModalTree.jstree("deselect_all");
    		 $("#selectedModalFolderName").html(null);
		});
	 
	 




$("#voiceInteraction").removeClass("magicHider");
$("#selectionType").change(function(){
	var intearctionType =$("#selectionType :selected").val();
	 if("WEB" == intearctionType.toUpperCase() ||  "SMTP" == intearctionType.toUpperCase()) {
		$("#emailInteraction").removeClass("magicHider");
		$("#chatInteraction,#voiceInteraction").addClass("magicHider");
	}else if("CHAT" == intearctionType.toUpperCase()) {
		$("#emailInteraction,#voiceInteraction").addClass("magicHider");
		$("#chatInteraction").removeClass("magicHider");
	} else if("VOICE" == intearctionType.toUpperCase()) {
		$("#emailInteraction,#chatInteraction").addClass("magicHider");
		$("#voiceInteraction").removeClass("magicHider");
	}
});








$('#agentDataTable').on( 'click', '#delete', function () { 
		var rowdata=agentDataTable.row($(this).parents("tr")).data();
		console.log(rowdata);
		agentDataTable.row($(this).parents("tr")).remove().draw(false);
} );

$('#agentDataTable').on( 'click', '#edit', function () { 
		$("#agentDataHeader").html("Edit Parameters");
		var rowdata = agentDataTable.row($(this).parents("tr")).data();
		//agentDataTable.row($(this).parents("tr")).remove().draw(false);
		$("#kvpform").slideDown();
		$("#kvpKey").val(rowdata[0]);
		$("#kvpValue").val(rowdata[1]);
} );


$('#addKVP').on( 'click', function () {
		var rowData={};
		rowData[0]= $("#kvpKey").val();
		rowData[1]=$("#kvpValue").val();
		rowData[2]=actions;
		var indexNumber = agentDataTable.row($(this).parents("tr")).index();
		var mode=$("#agentDataHeader").text();
		if(mode == "Add Parameters") {
			agentDataTable.row.add(rowData).draw();
		} else {
			agentDataTable.row(indexNumber).data(rowData).draw();
		}
		$("#kvpform").slideUp();
});
	
	
	
	
	$("#mapDataSet").removeClass("magicHider");
	$("#mapDataSetTab").addClass("active")
	
	$("#mapDataSetTab").click(function(){
		$("#mapDataSet,#subMapDataSet").removeClass("magicHider");
		$("#mapDataSetTab").addClass("active");
		$("#agentDataTab").removeClass("active");
		$("#agentData,#kvpform").addClass("magicHider");
	});
	
	$("#agentDataTab").click(function(){
		$("#agentData").removeClass("magicHider");
		$("#agentDataTab").addClass("active");
		$("#mapDataSet,#subAgentData,#subMapDataSet").addClass("magicHider");
		$("#mapDataSetTab").removeClass("active");
	});
	
	
	
	
	
	$("#subMapDataSet").removeClass("magicHider");
	$("#subMapDataSetTab").addClass("active")
	
	$("#subMapDataSetTab").click(function(){
		$("#subMapDataSet").removeClass("magicHider");
		$("#subMapDataSetTab").addClass("active");
		$("#subAgentDataTab").removeClass("active");
		$("#subAgentData,#kvpform").addClass("magicHider");
	});
	
	$("#subAgentDataTab").click(function(){
		$("#subAgentData").removeClass("magicHider");
		$("#subAgentDataTab").addClass("active");
		$("#subMapDataSet,#kvpform").addClass("magicHider");
		$("#subMapDataSetTab").removeClass("active");
	});
	
	

	$("#modalMapDataSet").removeClass("magicHider");
	$("#modalMapDataSetTab").addClass("active")
	
	$("#modalMapDataSetTab").click(function(){
		$("#modalMapDataSet").removeClass("magicHider");
		$("#modalMapDataSetTab").addClass("active");
		$("#modalAgentDataTab").removeClass("active");
		$("#modalAgentData").addClass("magicHider");
		$("#modalKvpform").slideUp();
	});
	
	$("#modalAgentDataTab").click(function(){
		$("#modalAgentData").removeClass("magicHider");
		$("#modalAgentDataTab").addClass("active");
		$("#modalMapDataSet").addClass("magicHider");
		$("#modalMapDataSetTab").removeClass("active");
		$("#dataSetPicker").addClass("magicHider");	
	});
	

	$("#modalAddAgentkvp").on('click', function () {
		$("#modalAgentDataHeader").html("Add Parameters");
		$('#modalKvpform').find("input[type=text]").val("");
		$("#modalKvpform").slideDown();
	});		

	$("#modalResetkvp").on( 'click', function () {
		$('#modalKvpform').find("input[type=text]").val("");
		$("#modalKvpform").slideUp();
	});		
	
	
	
	$("#addModalDataset").on( 'click', function () {
		$("#modalMapDataSet").addClass("magicHider");
		$("#dataSetPicker").removeClass("magicHider");	
	});
	
	
	$("#pickDataset").on( 'click', function () {
		$("#modalMapDataSet").removeClass("magicHider");
		$("#dataSetPicker").addClass("magicHider");	
	});
	
	
	/*Email Interaction Tab*/
	
	
	$("#mailMapDataSet").removeClass("magicHider");
	$("#mailMapDataSetTab").addClass("active")
	
	$("#mailMapDataSetTab").click(function(){
		$("#mailMapDataSet").removeClass("magicHider");
		$("#mailMapDataSetTab").addClass("active");
		$("#mailAgentDataTab").removeClass("active");
		$("#mailAgentData").addClass("magicHider");
		$("#mailKvpform").slideUp();
	});
	
	$("#mailAgentDataTab").click(function(){
		$("#mailAgentData").removeClass("magicHider");
		$("#mailAgentDataTab").addClass("active");
		$("#mailMapDataSet").addClass("magicHider");
		$("#mailMapDataSetTab").removeClass("active");
	});
	
	
	$("#mailAddAgentkvp").on('click', function () {
		$("#emailAgentDataHeader").html("Add Parameters");
		$('#mailKvpform').find("input[type=text]").val("");
		$("#mailKvpform").slideDown();
	});		

	$("#mailResetkvp").on( 'click', function () {
		$('#mailKvpform').find("input[type=text]").val("");
		$("#mailKvpform").slideUp();
	});		
	
	
	
	
	$("#chatMapDataSet").removeClass("magicHider");
	$("#chatMapDataSetTab").addClass("active")
	
	$("#chatMapDataSetTab").click(function(){
		$("#chatMapDataSet").removeClass("magicHider");
		$("#chatMapDataSetTab").addClass("active");
		$("#chatAgentDataTab").removeClass("active");
		$("#chatAgentData").addClass("magicHider");
		$("#chatKvpform").slideUp();
	});
	
	$("#chatAgentDataTab").click(function(){
		$("#chatAgentData").removeClass("magicHider");
		$("#chatAgentDataTab").addClass("active");
		$("#chatMapDataSet").addClass("magicHider");
		$("#chatMapDataSetTab").removeClass("active");
	});
	
	
	$("#chatAddAgentkvp").on('click', function () {
		$("#chatAgentDataHeader").html("Add Parameters");
		$('#chatKvpform').find("input[type=text]").val("");
		$("#chatKvpform").slideDown();
	});		

	$("#chatResetkvp").on( 'click', function () {
		$('#chatKvpform').find("input[type=text]").val("");
		$("#chatKvpform").slideUp();
	});		
	
	
	
});
