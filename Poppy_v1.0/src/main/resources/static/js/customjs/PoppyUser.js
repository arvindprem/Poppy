var action = "<div class='text-center'>"
		+ "<i class='fa fa-edit btn btn-success btn-sm' id='edit'></i>&nbsp"
		+ " <i class='fa fa-trash btn btn-danger btn-sm' id='delete' ></i> </div>";
var PoppyUser;
$('#editModal').on('hidden.bs.modal', function () {
	$(this).find("input").val("");
	$("#editForm").validate().resetForm();
	$(this).find("select").val("");
})

$("#editForm").validate({
	errorClass : "ErrorClass",
	rules : {
		name : {
			required : true,
		},
		firstName : {
			required : true,
			
		},activityPoleLabel : {
			required : true,
			
		},version : {
			required : true,
			
		},version1 : {
			required : true,
			
		},
		
	},
	submitHandler : function(form) {
		var formData = $("#editForm").serialize();
		editPoppyUserInfo(formData);
	}
});


$("#refreshTable").click(function() {
	PoppyUser.clear().draw();
	getAllPoppyUsers();
});

PoppyUser = $("#PoppyUser").DataTable({
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
		data : "name"
	},  {
		data : "firstName"
	},{
		data : "licexpirationDate"
	},{
		data : "activityPoleLabel"
	},{
		data : "version"
	},{
		data : "version1"
	},{
		data : "action"
	}],
	
	
});

getAllPoppyUsers();


//EDIT USER INFO	
$("#PoppyUser").on("click","#edit",function(){
	  var currentRow = PoppyUser.row($(this).parents("tr"));
	  var currentRowData=  PoppyUser.row( currentRow ).data();
	  console.log(currentRowData);
	  $('#editModal').on('show.bs.modal', function (event) {
		  $('#editForm #id').val(currentRowData.id);
		  $('#editForm #name').val(currentRowData.name);
		  $('#editForm #firstName').val(currentRowData.firstName);
		  $('#editForm #activityPoleLabel').val(currentRowData.activityPoleLabel);
		  $('#editForm #version').val(currentRowData.version);
		  $('#editForm #version1').val(currentRowData.version1);
		 
		});
});


$("#PoppyUser").on("click","#delete",function(){
	var poppyuserID=PoppyUser.row($(this).parents("tr")).id();
	console.log(poppyuserID)
	  alertify.reset().confirm("Do you want delete Poppyuser?", function() {
		  deletePoppyUserInfo(PoppyuserID);
			}, function() {
				log("PoppyUser deletion cancelled!");
			});
});




function deletePoppyUserInfo(userID){
	$.ajax({
		url : "DeletePoppyUserInfo",
		type : "Post",
		data: "UserId="+userID,
		success : function(response) {
			if(response) {
				logSuccess("PoppyUser has been deleted successfully!");
				getAllPoppyUsers(); 
			} else {
				logError("Unexpected error");
			}
		}
	});
}


function getAllPoppyUsers() {
	$.ajax({
		url : "GetAllPoppyUsers",
		type : "Post",
		success : function(response) {
			tableMaker(response);
		}

	});
}


function tableMaker(data) {
	PoppyUser.clear().draw();
	if(data.length >0) {
	for (var i = 0; i < data.length; i++) {
		data[i].sNo =i+1; 
		data[i].action = 
			"<div class='text-center'>"
			+ "<i class='fa fa-edit btn btn-success btn-sm' data-toggle='modal' data-target='#editModal' id='edit'></i>&nbsp" 
			+ " <i class='fa fa-trash btn btn-danger btn-sm' id='delete' ></i> </div>";
		Surveys.row.add(data[i]).draw();
	}
	} else {
		PoppyUser.clear().draw();
	}	

}

function editPoppyUserInfo(formData) {
	$.ajax({
		url : "UpdatePoppyUserInfo",
		type : "Post",
		data : formData,
		success : function(response) {
			if(response) {
				logSuccess("Poppyuser Info has been Updated successfully!");
				getAllPoppyUsers(); 
				$('#editModal').modal('hide');
			}
		}
		});
}

