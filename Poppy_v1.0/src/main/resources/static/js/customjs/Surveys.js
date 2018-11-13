var action = "<div class='text-center'>"
		+ "<i class='fa fa-edit btn btn-success btn-sm' id='edit'></i>&nbsp"
		+ " <i class='fa fa-trash btn btn-danger btn-sm' id='delete' ></i> </div>";
var Surveys;


$('#editModal').on('hidden.bs.modal', function () {
	$(this).find("input").val("");
	$("#editForm").validate().resetForm();
	$(this).find("select").val("");
})

$("#editForm").validate({
	errorClass : "ErrorClass",
	rules : {
		version : {
			required : true,
		},name : {
			required : true,
		},	description : {
			required : true,
		},
		
	},
	submitHandler : function(form) {
		var formData = $("#editForm").serialize();
		editSurveyInfo(formData);
	}
});





$("#refreshTable").click(function() {
	Surveys.clear().draw();
	getAllSurveys();
});


Surveys = $("#Surveys").DataTable({
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
		data : "version"
	},  {
		data : "creationDateTime"
	},{
		data : "name"
	},{
		data : "description"
	},{
		data : "action"
	}],
	
	
});
   
getAllSurveys();



//EDIT Society INFO	

//$("#Surveys").on("click","#edit",function(){
//	  var currentRow = Surveys.row($(this).parents("tr"));
//	  var currentRowData=  Surveys.row( currentRow ).data();
//	  alertify.reset().confirm("Do you want download <b>"+ currentRowData.name+"</b>?", function() {
//			}, function() {
//				log("File download cancelled!");
//	});
//});


$("#Surveys").on("click","#edit",function(){
	  var currentRow = Surveys.row($(this).parents("tr"));
	  var currentRowData=  Surveys.row( currentRow ).data();
	  console.log(currentRowData);
	  $('#editModal').on('show.bs.modal', function (event) {
		  $('#editForm #id').val(currentRowData.id);
		  $('#editForm #version').val(currentRowData.version);
		  $('#editForm #name').val(currentRowData.name);
		  $('#editForm #description').val(currentRowData.description);
		 
		 
		});
});


$("#Surveys").on("click","#delete",function(){
	var SurveysId=Surveys.row($(this).parents("tr")).id();
	console.log(SurveysId)
	  alertify.reset().confirm("Do you want delete survey?", function() {
		  deleteSurveyInfo(SurveysId);
			}, function() {
				log("survey deletion cancelled!");
			});
});


function deleteSurveyInfo(surveyId){
$.ajax({
	url : "DeleteSurveyInfo",
	type : "Post",
	data: "SurveysId="+surveyId,
	success : function(response) {
		if(response) {
			logSuccess("Survey has been deleted successfully!");
			
		} else {
			logError("Unexpected error");
		}
	}
});
}



function getAllSurveys() {
	$.ajax({
		url : "GetAllSurveys",
		type : "Post",
		success : function(response) {
			tableMaker(response);
		}

	});
}


function tableMaker(data) {
	Surveys.clear().draw();
	if(data.length >0) {
	for (var i = 0; i < data.length; i++) {
		data[i].sNo =i+1; 
		data[i].action = 
			"<div class='text-center'>"
			+ "<i class='fa fa-edit btn btn-success btn-sm' data-toggle='modal' data-target='#editModal' id='edit'></i>&nbsp" 
			+" <a href=DownloadFile?SurveysId="+ data[i].id+" ><i class='fa fa-download btn btn-success btn-sm'></i></a> " 
			+ " <i class='fa fa-trash btn btn-danger btn-sm' id='delete' ></i> </div>";
		Surveys.row.add(data[i]).draw();
	}
	} else {
		Surveys.clear().draw();
	}	

}

function editSurveyInfo(formData) {
	$.ajax({
		url : "UpdateSurveyInfo",
		type : "Post",
		data : formData,
		success : function(response) {
			if(response) {
				logSuccess("Survey Info has been Updated successfully!");
				getAllSurveys(); 
				$('#editModal').modal('hide');
			}
		}
		});
}

