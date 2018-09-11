$(document).ready(function() {

	$("#loginForm").validate({
		
		errorClass : "ErrorClass",
		rules : {
			userName : {
				required : true,
			},
			watchWord : {
				required : true,
			}
		},
		messages : {
			userName : {
				required : "Required this Field",
			},
			watchWord : {
				required : "Required this Field",
			}
		},
		submitHandler : function(form) {
			
			loginValidate(form);
		}
	});
});
function loginValidate(form) {
	var formData = $("#loginForm").serialize();
	$.ajax({
		url : "VaildateUser",
		type : "Post",
		data : formData,
		success : function(response) {
			console.log(response);
			form.submit();
		}
	});
}