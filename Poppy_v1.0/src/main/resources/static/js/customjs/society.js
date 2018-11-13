var action = "<div class='text-center'>"
		+ "<i class='fa fa-edit btn btn-success btn-sm' id='edit'></i>&nbsp"
		+ " <i class='fa fa-trash btn btn-danger btn-sm' id='delete' ></i> </div>";
var societyManagement;


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
			},
			groupLabel : {
				required : true,
			},
			
			
		},
		submitHandler : function(form) {
			var formData = $("#editForm").serialize();
			editSocietyInfo(formData);
		}
	});
	
	

	

	$("#refreshTable").click(function() {
		societyManagement.clear().draw();
		getAllSociety();
	});

	societyManagement = $("#societyManagement").DataTable({
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
			data : "groupLabel"
		},{
			data : "action"
		}],
		
		
	});
	
	getAllSociety(); 
	
	
	//EDIT Society INFO	
	$("#societyManagement").on("click","#edit",function(){
		  var currentRow = societyManagement.row($(this).parents("tr"));
		  var currentRowData=  societyManagement.row( currentRow ).data();
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
			  $('#editForm #groupLabel').val(currentRowData.groupLabel);
			});
	});
	
	
	$("#societyManagement").on("click","#delete",function(){
		var societyID=societyManagement.row($(this).parents("tr")).id();
		console.log(societyID)
		  alertify.reset().confirm("Do you want delete society?", function() {
			  deleteSocietyInfo(societyID);
				}, function() {
					log("society deletion cancelled!");
				});
	});
	

function deleteSocietyInfo(userID){
	$.ajax({
		url : "DeleteSocietyInfo",
		type : "Post",
		data: "UserId="+userID,
		success : function(response) {
			if(response) {
				logSuccess("Soicety has been deleted successfully!");
				getAllSociety(); 
			} else {
				logError("Unexpected error");
			}
		}
	});
}

function getAllSociety() {
	$.ajax({
		url : "GetAllSociety",
		type : "Post",
		success : function(response) {
			tableMaker(response);
		}

	});
}


function tableMaker(data) {
	societyManagement.clear().draw();
	if(data.length >0) {
	for (var i = 0; i < data.length; i++) {
		data[i].sNo =i+1; 
		data[i].action = 
			"<div class='text-center'>"
			+ "<i class='fa fa-edit btn btn-success btn-sm' data-toggle='modal' data-target='#editModal' id='edit'></i>&nbsp" 
			+ " <i class='fa fa-trash btn btn-danger btn-sm' id='delete' ></i> </div>";
		societyManagement.row.add(data[i]).draw();
	}
	} else {
		societyManagement.clear().draw();
	}	

}

function editSocietyInfo(formData) {
	$.ajax({
		url : "UpdateSocietyInfo",
		type : "Post",
		data : formData,
		success : function(response) {
			if(response) {
				logSuccess("Society Info has been Updated successfully!");
				getAllSociety(); 
				$('#editModal').modal('hide');
			}
		}
		});
}