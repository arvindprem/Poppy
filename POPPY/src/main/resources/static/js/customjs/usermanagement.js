$(document).ready(function() {

	var formData1 = $("#addUserForm").serialize();
	console.log(formData1);

	$("#addUserForm").validate({
		errorClass : "ErrorClass",
		rules : {
			userName : {
				required : true,
			},
			watchWord : {
				required : true,
			},
			confirmWatchWord : {
				required : true,
			},
			firstName : {
				required : true,
			},
			lastName : {
				required : true,
			},
			mobileNumber : {

			},
			emailId : {

			},
			description : {

			}

		},
		messages : {
			userName : {
				required : "Required this Field",
			},

			watchWord : {
				required : "Required this Field",
			},
			confirmWatchWord : {
				required : "Required this Field",
			},

			firstName : {
				required : "Required this Field",
			},
			lastName : {
				required : "Required this Field",
			},
		},
		submitHandler : function(form) {
			var formData = $("#addUserForm").serialize();
			console.log(formData);
		}
	});

	$("#userManagement").DataTable({
		"lengthChange" : false,
		"columnDefs" : [ {
			"orderable" : false,
			"targets" : 4
		} ]
	});

	$("#createUserss").click(function() {
		$("#tableClass").hide();
		$("#formViewer").removeClass("magicHider");
		$('html, body').animate({
			scrollTop : $("#formViewer").offset().top
		}, 500);

	});

	
	
	$("#closeForm").click(function() {
		$('html, body').animate({
			scrollTop : $("#tableClass").offset().top
		}, 500);
		$("#formViewer").addClass("magicHider");
		$("#tableClass").show();
	});
	
	
	
	
});
function register(form) {
	$.ajax({
		url : "Register",
		type : "Post",
		data : form,
		success : function(response) {
			if (response == "success") {
				$('.login-box').toggleClass('flipped');
			}
			console.log(response);
		}
	});
}