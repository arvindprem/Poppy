$(document).ready(function() {
	
	var actions=" <i class='fa fa-edit text-center' data-toggle='tooltip' title='add parameters' id='edit'> </i> &nbsp;"
				 +"<i class='fa fa-trash text-center' data-toggle='tooltip' title='delete' id='delete'>";

				 
	$("#addkvp").on('click', function () {
		$("#parameterHeader").html("Add Parameters");
		$('#addkvpFrom').find("input[type=text]").val("");
		$("#kvpform").slideDown();
	});		
	
	$("#resetkvp").on( 'click', function () {
		$('#addkvpFrom').find("input[type=text]").val("");
		$("#kvpform").slideUp();
	});	
	
	
	
	$('#parametersTable').on( 'click', '#delete', function () { 
		var rowdata=parametersTable.row($(this).parents("tr")).data();
		console.log(rowdata);
		parametersTable.row($(this).parents("tr")).remove().draw(false);
	} );
	
	$('#parametersTable').on( 'click', '#edit', function () { 
		$("#parameterHeader").html("Edit Parameters");
		var rowdata = parametersTable.row($(this).parents("tr")).data();
		parametersTable.row($(this).parents("tr")).remove();
		$("#kvpform").slideDown();
		$("#kvpKey").val(rowdata[0]);
		$("#kvpValue").val(rowdata[1]);
	} );

	
	 $('#addKVP').on( 'click', function () {
		 $("#kvpform").slideUp();
		 var rowData={};
		 rowData[0]= $("#kvpKey").val();
		 rowData[1]=$("#kvpValue").val();
		 rowData[2]=actions;
		 var indexNumber = parametersTable.row($(this).parents("tr")).index();
			var mode=$("#agentDataHeader").text();
			if(mode == "Add Parameters") {
				parametersTable.row.add(rowData).draw();
			} else {
				parametersTable.row(indexNumber).data(rowData).draw();
			}
	   });
	
$("#databaseTable").DataTable({
		"lengthChange" : false,
		"serverSide" : false,
		"columnDefs" : [ {
			"orderable" : false,
			"targets" : 2
		} ]
	});
	

$("#queriesTable").DataTable({
	"lengthChange" : false,
	"serverSide" : false,
	"columnDefs" : [ {
		"orderable" : false,
		"targets" : 3
	} ]
}); 

var parametersTable=$("#parametersTable").DataTable({
		"lengthChange" : false,
		"columnDefs" : [ {
			"orderable" : false,
			"targets" : 2
		} ]
	});
	
	
	$("#addDatabse").click(function() {
		$("#hidewebsvcTable").hide();
		$("#formViewer,#backtoDetails").removeClass("magicHider");
		$('html, body').animate({
			scrollTop : $("#formViewer").offset().top
		}, 500);
	});

	
	$("#backtoDetails").click(function() {
		$('html, body').animate({
			scrollTop : $("#hidewebsvcTable").offset().top
		}, 500);
		$("#formViewer,#backtoDetails").addClass("magicHider");
		$("#hidewebsvcTable").show();
	});
	
	
	$("#queryParameter").click(function() {
		$("#queryTableView").addClass("magicHider");
		$("#queryFormViewer").removeClass("magicHider");
	});
		
	$("#closeQueryParam").click(function() {
		$("#queryTableView").removeClass("magicHider");
		$("#queryFormViewer").addClass("magicHider");
	});
		
	
	
});
