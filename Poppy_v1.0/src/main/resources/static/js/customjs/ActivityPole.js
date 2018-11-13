var action = "<div class='text-center'>"
		+ "<i class='fa fa-edit btn btn-success btn-sm' id='edit'></i>&nbsp"
		+ " <i class='fa fa-trash btn btn-danger btn-sm' id='delete' ></i> </div>";
var ActivityPole;

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
		address: {
			required : true,
		},
		phone : {
			required : true,
		},
		nBLicence: {
			required : true,
			digits : true
		},
		 responsibleName : {
			required : true,
		},
		responsibleEmail : {
			required : true,
		
		},societyLabel : {
			required : true,
		
		},filter : {
			required : true,
		
		},featureLabel : {
			required : true,
		},
		
		
	},
	submitHandler : function(form) {
		var formData = $("#editForm").serialize();
		editActivityPoleInfo(formData);
	}
});
	
	

$("#refreshTable").click(function() {
	ActivityPole.clear().draw();
	getAllActivityPole();
});
	
	

	

	ActivityPole = $("#ActivityPole").DataTable({
	
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
			data : "address"
		}, {
			data : "phone"
		}, {
			data : "nBLicence"
		},{
			data : "responsibleName"
		},{
			data : "responsibleEmail"
		},{
			data : "licExpirationDate"
		},{
			data : "societyLabel"
		},{
			data : "filter"
		},{
			data : "featureLabel"
		},{
			data : "action"
		}],
		
		
	});
	
	getAllActivityPole();
	
	
	//EDIT ActivityPole INFO	
	$("#ActivityPole").on("click","#edit",function(){
		  var currentRow = ActivityPole.row($(this).parents("tr"));
		  var currentRowData=   ActivityPole.row( currentRow ).data();
		  console.log(currentRowData);
		  $('#editModal').on('show.bs.modal', function (event) {
			  $('#editForm #id').val(currentRowData.id);
			  $('#editForm #label').val(currentRowData.label);
			  $('#editForm #address').val(currentRowData.address);
			  $('#editForm #phone').val(currentRowData.phone);
			  $('#editForm #nBLicence').val(currentRowData.nBLicence);
			  $('#editForm #responsibleName').val(currentRowData.responsibleName);
			  $('#editForm #responsibleEmail').val(currentRowData.responsibleEmail);
			  $('#editForm #licExpirationDate').val(currentRowData.licExpirationDate);
			  $('#editForm #societyLabel').val(currentRowData.societyLabel);
			  $('#editForm #filter').val(currentRowData.filter);
			  $('#editForm #featureLabel').val(currentRowData.featureLabel);
			});
	});
	
	
	$("#ActivityPole").on("click","#delete",function(){
		var ActivityPoleID=ActivityPole.row($(this).parents("tr")).id();
		console.log(ActivityPoleID)
		  alertify.reset().confirm("Do you want delete ActivityPole?", function() {
			  deleteActivityPoleInfo(ActivityPoleID);
				}, function() {
					log("ActivityPole deletion cancelled!");
				});
	});
	

function deleteActivityPoleInfo(userID){
	$.ajax({
		url : "DeleteActivityPoleInfo",
		type : "Post",
		data: "UserId="+userID,
		success : function(response) {
			if(response) {
				logSuccess("ActivityPole has been deleted successfully!");
				getAllActivityPole(); 
			} else {
				logError("Unexpected error");
			}
		}
	});
}

	
function getAllActivityPole() {
	$.ajax({
		url : "GetAllActivityPole",
		type : "Post",
		success : function(response) {
			tableMaker(response);
		}

	});
}


function tableMaker(data) {
	ActivityPole.clear().draw();
	if(data.length >0) {
	for (var i = 0; i < data.length; i++) {
		data[i].sNo =i+1; 
		data[i].action = 
			"<div class='text-center'>"
			+ "<i class='fa fa-edit btn btn-success btn-sm' data-toggle='modal' data-target='#editModal' id='edit'></i>&nbsp" 
			+ " <i class='fa fa-trash btn btn-danger btn-sm' id='delete' ></i> </div>";
		ActivityPole.row.add(data[i]).draw();
	}
	} else {
		ActivityPole.clear().draw();
	}	

}

function editActivityPoleInfo(formData) {
	$.ajax({
		url : "UpdateActivityPoleInfo",
		type : "Post",
		data : formData,
		success : function(response) {
			if(response) {
				logSuccess("ActivityPole Info has been Updated successfully!");
				getAllActivityPole();
				$('#editModal').modal('hide');
			}
		}
		});
}

