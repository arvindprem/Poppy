var action = "<div class='text-center'>"
		+ "<i class='fa fa-edit btn btn-success btn-sm' id='edit'></i>&nbsp" 
		+ " <i class='fa fa-trash btn btn-danger btn-sm' id='delete' ></i> </div>";
var userManagement;
$(document).ready(function() {
	userManagement = $("#userManagement").DataTable({
		"processing" : true,
		"ordering" : false,
		"paging" : true,
		"searching" : true,
		"lengthChange" : false,
		rowId : "id",
		"language": {
		      "emptyTable": "No data available in table"
		    },
		columns : [ {
			data : "sNo"
		},{
			data : "name"
		}, {
			data : "description"
		},{
			data : "action"
		}],
		
	});
	
	//LOAD USERS LIST ON WINDOW OPEN 

	//LOAD USERS LIST ON REFRESH BUTTON CLICK 
	$("#refreshTable").click(function() {
		userManagement.clear().draw();
		getDocInfo();
	});
	
	getDocInfo();
	
	
	
	//EDIT USER INFO	
	$("#userManagement").on("click","#edit",function(){
		  var currentRow = userManagement.row($(this).parents("tr"));
		  var currentRowData=  userManagement.row( currentRow ).data();
		  alertify.reset().confirm("Do you want download <b>"+ currentRowData.name+"</b>?", function() {
				}, function() {
					log("File download cancelled!");
		});
	});
	  
	
	$("#userManagement").on("click","#delete",function(){
		var fileId=userManagement.row($(this).parents("tr")).id();
		     alertify.reset().confirm("Do you want delete user?", function() {
		     deleteFile(fileId);
				}, function() {
					log("File deletion cancelled!");
				});
	});
	
	
	$("#filterToggle").click(function() {
		 userManagement.clear().draw();
		$(".box").toggle();
	});
	
	$('#editModal').on('hidden.bs.modal', function () {
		$(this).find("input,textarea,password").val("");
		$("#editUserForm").validate().resetForm();
		$(this).find("select").val("");
	})
	
	
	$("#fliter").click(function() {
		var country =$("#country").val();
		var level=$("#level").val();
		var userName=$("#filteruserName").val();
		if(country == "" && level == "" && userName == "") {
			log("Please Enter the values");
		} else {
			var formData = "userName="+userName+"&level="+level+"&country="+country;
			filterSearch(formData);
		}
	});

	
	$("#resetFilter").click(function() {
		$("#userName").val('');
		timeOut();
	});
});
		


function tableMaker(data) {
	if(data.length >0) {
	for (var i = 0; i < data.length; i++) {
		data[i].sNo =i+1; 
		data[i].action = 
			"<div class='text-center'>"
			+ " <a href=DownloadFile?FileId="+ data[i].id+" ><i class='fa fa-download btn btn-success btn-sm'></i></a> " 
			+ " <i class='fa fa-trash btn btn-danger btn-sm' id='delete' ></i> </div>";
			userManagement.row.add(data[i]).draw();
	}
	} else {
		userManagement.clear().draw();
	}
	
}

function deleteFile(fileId){
	$.ajax({
		url  : "DeleteFile",
		type : "Post",
		data : "FileId="+fileId,
		success : function(response) {
			if(response) {
				logSuccess("File has been deleted successfully!");
				timeOut();
			} else {
				logError("Server Internal Problem!")
			}
			
		}
	});
}

function timeOut() {
		    userManagement.row().clear();
		    getDocInfo();
}

function getDocInfo() {
	$.ajax({
		url  : "GetAllDoc",
		type : "Post",
		success : function(response) {
			tableMaker(response);
		}
		});
	
}
