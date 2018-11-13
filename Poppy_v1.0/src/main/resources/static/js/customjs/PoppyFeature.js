var action = "<div class='text-center'>"
		+ "<i class='fa fa-edit btn btn-success btn-sm' id='edit'></i>&nbsp"
		+ " <i class='fa fa-trash btn btn-danger btn-sm' id='delete' ></i> </div>";
var PoppyFeature;


$('#editModal').on('hidden.bs.modal', function () {
	$(this).find("input").val("");
	$("#editForm").validate().resetForm();
	$(this).find("select").val("");
})

$("#editForm").validate({
	errorClass : "ErrorClass",
	rules : {
		label : {
			required : true,
		},
	},
	submitHandler : function(form) {
		var formData = $("#editForm").serialize();
		editFeatureInfo(formData);
	}
});





$("#refreshTable").click(function() {
	PoppyFeature.clear().draw();
	getAllFeatures();
});

PoppyFeature = $("#PoppyFeature").DataTable({
	"ordering" : false,
	"paging" : true,
	"searching" : true,
	"lengthChange" : false,
	"language": {
	      "emptyTable": "No data available in table"
	    },
	 rowId : "id",   
	    
	columns : [ {
		data : "sNo"
	},{
		data : "label"
	}, {
		data : "action"
	}],
	
	
});

getAllFeatures();



//EDIT Feature INFO	
$("#PoppyFeature").on("click","#edit",function(){
	  var currentRow = PoppyFeature.row($(this).parents("tr"));
	  var currentRowData=  PoppyFeature.row( currentRow ).data();
	  console.log(currentRowData);
	  $('#editModal').on('show.bs.modal', function (event) {
		  $('#editForm #id').val(currentRowData.id);
		  $('#editForm #label').val(currentRowData.label);
		 
		});
});


$("#PoppyFeature").on("click","#delete",function(){
	var featuresId=PoppyFeature.row($(this).parents("tr")).id();
	console.log(featuresId)
	  alertify.reset().confirm("Do you want delete PoppyFeature?", function() {
		  deleteFeatureInfo(featuresId);
			}, function() {
				log("PoppyFeature deletion cancelled!");
			});
});


function deleteFeatureInfo(featureId){
$.ajax({
	url : "DeleteFeatureInfo",
	type : "Post",
	data: "FeatureId="+featureId,
	success : function(response) {
		if(response) {
			logSuccess("PoppyFeature has been deleted successfully!");
			getAllFeatures(); 
		} else {
			logError("Unexpected error");
		}
	}
});
}

function getAllFeatures() {
	$.ajax({
		url : "GetAllFeatures",
		type : "Post",
		success : function(response) {
			tableMaker(response);
		}

	});
}


function tableMaker(data) {
	PoppyFeature.clear().draw();
	if(data.length >0) {
	for (var i = 0; i < data.length; i++) {
		data[i].sNo =i+1; 
		data[i].action = 
			"<div class='text-center'>"
			+ "<i class='fa fa-edit btn btn-success btn-sm' data-toggle='modal' data-target='#editModal' id='edit'></i>&nbsp" 
			+ " <i class='fa fa-trash btn btn-danger btn-sm' id='delete' ></i> </div>";
		PoppyFeature.row.add(data[i]).draw();
	}
	} else {
		PoppyFeature.clear().draw();
	}
	
}
	function editFeatureInfo(formData) {
		$.ajax({
			url : "UpdateFeatureInfo",
			type : "Post",
			data : formData,
			success : function(response) {
				if(response) {
					logSuccess("Feature Info has been Updated successfully!");
					getAllFeatures();
					$('#editModal').modal('hide');
				}
			}
			});
	}



