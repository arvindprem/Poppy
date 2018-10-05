var action = "<div class='text-center'>"
		+ "<i class='fa fa-edit btn btn-success btn-sm' id='edit'></i>&nbsp" 
		+ " <i class='fa fa-trash btn btn-danger btn-sm' id='delete' ></i> </div>";
var userManagement;
$(document).ready(function() {
	userManagement = $("#userManagement").DataTable({
		"processing" : true,
		"ordering" : true,
		"paging" : true,
		"searching" : true,
		"lengthChange" : false,
		rowId : "id",
		columns : [ {
			data : "sNo"
		},{
			data : "userName"
		}, {
			data : "firstName"
		}, {
			data : "level"
		}, {
			data : "country"
		},{
			data : "creationDateTime"
		},{
			data : "action"
		}],
		 "columnDefs": [ {
	            "searchable": false,
	            "orderable": false,
	            "targets": 0
	        } ],
	        "order": [[ 1, 'asc' ]]
	});
	
	//LOAD USERS LIST ON WINDOW OPEN 
	getUsers(userManagement);

	//LOAD USERS LIST ON REFRESH BUTTON CLICK 
	$("#refreshTable").click(function() {
		userManagement.row().clear();
		getUsers(userManagement);
	});
	
	
	userManagement.on( 'order.dt search.dt', function () {
		userManagement.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
            cell.innerHTML = i+1;
        } );
    } ).draw();
	
	
	//EDIT USER INFO	
	$("#userManagement").on("click","#edit",function(){
		  var currentRow = userManagement.row($(this).parents("tr"));
		  var currentRowData=  userManagement.row( currentRow ).data();
		  console.log(currentRowData);
		  $('#editModal').on('show.bs.modal', function (event) {
			  $('#editUserForm #id').val(currentRowData.id);
			  $('#editUserForm #userName').val(currentRowData.userName);
			  $('#editUserForm #firstName').val(currentRowData.firstName);
			  $('#editUserForm #watchWord').val(currentRowData.watchWord);
			  $('#editUserForm #confWatchWord').val(currentRowData.watchWord);
			  $('#editUserForm #country').val(currentRowData.country).change();
			  $('#editUserForm #level').val(currentRowData.level).change();
			});
	});
	  
	
	$("#userManagement").on("click","#delete",function(){
		var userID=userManagement.row($(this).parents("tr")).id();
		  alertify.reset().confirm("Do you want delete user?", function() {
			  deleteUserInfo(userID);
				}, function() {
					log("User deletion cancelled!");
				});
	});
	
	
	$("#filterToggle").click(function() {
		 userManagement.row().clear();
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
		var userName=$("#userName").val();
		if(country == "" && level == "" && userName == "") {
			log("Please Enter the values");
		} else {
			var formData = "userName="+userName+"&level="+level+"&country="+country;
			console.log(formData);
			filterSearch(formData);
		}
	});

	
	$("#resetFilter").click(function() {
		$("#userName").val('');
		timeOut(userManagement);
	});
		
	
	$("#editUserForm").validate({
			errorClass : "ErrorClass",
			rules : {
				userName : {
					required : true,
				},
				watchWord : {
					required : true,
				},
				confWatchWord : {
					required : true,
				},
				firstName : {
					required : true,
				},
				level : {
					required : true,
				},
				country : {
					required : true,
				},
			},
			submitHandler : function(form) {
				var formData = $("#editUserForm").serialize();
				editUserInfo(formData);
			}
		});
		
		});
	//TO LOAD COUNTRY
	$.getJSON("Json/countriesbycontinent.json", function(data) {
		$.each(data, function(key, val) {
			var output = '';
			output = '<option value=' + val.country + '>' + val.country
					+ '</option>';
			$("#editUserForm #country").append(output);
			$("#country").append(output);
			
		});
	});
		


function getUsers(userManagement) {
		$.ajax({
				url : "GetUsers",
				type : "Post",
				success : function(response) {
					tableMaker(response.data);

				}
			});
}



function tableMaker(data) {
	for (var i = 0; i < data.length; i++) {
		data[i].sNo =''; 
		data[i].action = 
			"<div class='text-center'>"
			+ "<i class='fa fa-edit btn btn-success btn-sm' data-toggle='modal' data-target='#editModal' id='edit'></i>&nbsp" 
			+ " <i class='fa fa-trash btn btn-danger btn-sm' id='delete' ></i> </div>";
			userManagement.row.add(data[i]).draw();
	}
}

function editUserInfo(formData){
	$.ajax({
		url : "EditUserInfo",
		type : "Post",
		data:formData,
		success : function(response) {
			if(response) {
				logSuccess("User Info has been updated successfully!");
				timeOut(userManagement);
				$("#editModal").modal('hide');
			} else {
				logError("UserName already exist!")
			}
		}
	});
}

function deleteUserInfo(userID){
	$.ajax({
		url : "DeleteUserInfo",
		type : "Post",
		data:"UserId="+userID,
		success : function(response) {
			if(response) {
				logSuccess("User Info has been deleted successfully!");
				timeOut(userManagement);
			} else {
				logError("Unexpected error");
			}
		}
	});
}


function timeOut(userManagement) {
		   userManagement.row().clear();
			getUsers(userManagement);
}

function filterSearch(formData) {
	
	$.ajax({
		url  : "FilterSearch",
		type : "Post",
		data : formData,
		success : function(response) {
			  userManagement.row().clear();
			 tableMaker(response.data); 
		}
		});
}
