 $(document).ready(function() {
	
	$("#changePasswordForm").validate({
		errorClass : "ErrorClass",
		rules : {
			currentWatchWord : {
				required:true,
			},
			newWatchWord : {
				required:true,
			},
			confirmWatchWord : {
				required: true,
				equalTo : "#newWatchWord",
			}
		},
		messages : {
			confirmWatchWord : {
				equalTo : "Please re-enter the password!"
			}
		},
		submitHandler:function(form) {
			var formData=$(form).serialize();
			console.log(formData);
			changePassword(formData);
		}
	});
	
});


function changePassword(formData) {
	
	$.ajax ({
		url : "ChangePassword",
		type : "Post",
		data : formData,
		success:function(response) {
			console.log(response);
			if(response) {
				logSuccess("Password has been updated Successfully!")
				$("#changepassword").modal('hide');
			} else {
				logError("Current password is incorrect!")
			}
		}
	})
}


function doAlert(message) {
	alertify.reset().alert(message);
}

function log(message) {
	alertify.reset();
	alertify.logPosition("bottom right");
	alertify.maxLogItems(1).log(message);
}

function logSuccess(message) {
	alertify.reset();
	alertify.logPosition("bottom right");
	alertify.maxLogItems(1).success(message);
}

function logError(message) {
	alertify.reset();
	alertify.logPosition("bottom right");
	alertify.maxLogItems(1).error(message);
}

function logDelay(message) {
	alertify.reset();
	alertify.logPosition("bottom right");
	alertify.delay(10000).maxLogItems(1).error(message);
}

// REMOVED LOGIC
function sessionTimeOut(message) {
	alertify.reset();
	alertify.alert(message, function(){window.location = "Login"});
}