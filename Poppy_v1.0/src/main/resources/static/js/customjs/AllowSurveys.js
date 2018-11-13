var action = "<div class='text-center'>"
		+ "<i class='fa fa-edit btn btn-success btn-sm' id='edit'></i>&nbsp"
		+ " <i class='fa fa-trash btn btn-danger btn-sm' id='delete' ></i> </div>";
var AllowSurveys;

$('#editModal').on('hidden.bs.modal', function () {
	$(this).find("input").val("");
	$("#editForm").validate().resetForm();
	$(this).find("select").val("");
})

$("#editForm").validate({
	errorClass : "ErrorClass",
	rules : {
		filter : {
			required : true,
		},sample : {
			required : true,
		},version : {
			required : true,
		},
	},
	submitHandler : function(form) {
		var formData = $("#editForm").serialize();
		editAllowSurveyInfo(formData);
	}
});





$("#refreshTable").click(function() {
	AllowSurveys.clear().draw();
	getAllAllowSurveys();
});


AllowSurveys = $("#AllowSurveys").DataTable({
	
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
			data : "filter"
		},{
			data :"expirationDate"
		},{
			data : "sample"
		},{
			data : "version"
		},{
			data : "action"
		}],
		
		
	});

getAllAllowSurveys();
	
	
	
	
	
	//EDIT AllowSurvey INFO	
	$("#AllowSurveys").on("click","#edit",function(){
		  var currentRow = AllowSurveys.row($(this).parents("tr"));
		  var currentRowData=  AllowSurveys.row( currentRow ).data();
		  console.log(currentRowData);
		  $('#editModal').on('show.bs.modal', function (event) {
			  $('#editForm #id').val(currentRowData.id);
			  $('#editForm #filter').val(currentRowData.filter);
			  $('#editForm #sample').val(currentRowData.sample);
			  $('#editForm #version').val(currentRowData.version);
			  
			 
			});
	});


	$("#AllowSurveys").on("click","#delete",function(){
		var allowSurveysId=AllowSurveys.row($(this).parents("tr")).id();
		console.log(allowSurveysId)
		  alertify.reset().confirm("Do you want delete AllowSurvey?", function() {
			  deleteAllowSurveyInfo(allowSurveysId);
				}, function() {
					log("AllowSurvey deletion cancelled!");
				});
	});


	function deleteAllowSurveyInfo(allowSurveysId){
	$.ajax({
		url : "DeleteAllowSurveyInfo",
		type : "Post",
		data: "AllowSurveysId="+allowSurveysId,
		success : function(response) {
			if(response) {
				logSuccess("AllowSurvey has been deleted successfully!");
				getAllAllowSurveys(); 
			} else {
				logError("Unexpected error");
			}
		}
	});
	}

	
	



function getAllAllowSurveys() {
	$.ajax({
		url : "GetAllAllowSurveys",
		type : "Post",
		success : function(response) {
			tableMaker(response);
		}

	});
}


function tableMaker(data) {
	AllowSurveys.clear().draw();
	if(data.length >0) {
	for (var i = 0; i < data.length; i++) {
		data[i].sNo =i+1; 
		data[i].action = 
			"<div class='text-center'>"
			+ "<i class='fa fa-edit btn btn-success btn-sm' data-toggle='modal' data-target='#editModal' id='edit'></i>&nbsp" 
			+ " <i class='fa fa-trash btn btn-danger btn-sm' id='delete' ></i> </div>";
		AllowSurveys.row.add(data[i]).draw();
	}
	} else {
		AllowSurveys.clear().draw();
	}	

}


function editAllowSurveyInfo(formData) {
	$.ajax({
		url : "UpdateAllowSurveyInfo",
		type : "Post",
		data : formData,
		success : function(response) {
			if(response) {
				logSuccess("AllowSurvey Info has been Updated successfully!");
				getAllAllowSurveys();
				$('#editModal').modal('hide');
			}
		}
		});
}