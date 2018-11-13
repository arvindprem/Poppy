$(document).ready(function() {
			$("#addPoppyUserForm").validate({
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
					var formData = $("#addPoppyUserForm").serialize();
					console.log(formData);
					addNewPoppyUser(formData);
				}
			});


});

function addNewPoppyUsers(formData) {
	$.ajax({
		url:"AddNewPoppyUser",
		type:"Post",
		data:formData,
		success:function(response) {
				if(response) {
					logSuccess("New PoppyUser has been Added successfully!");
					 $('#addPoppyUserorm')[0].reset();
				} 
			}
	});
}