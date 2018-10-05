$(document).ready(
		function() {
			$("#addUserForm").validate({
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
						equalTo: "#watchWord"
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
					messages: {
						confWatchWord : {
							equalTo: "Please re-enter the Password!"
						},
				},
				submitHandler : function(form) {
					var formData = $("#addUserForm").serialize();
					addUsers(formData);
				}
			});

			$.getJSON("Json/countriesbycontinent.json", function(data) {
				$.each(data, function(key, val) {
					var output = '';
					output = '<option value=' + val.country + '>' + val.country
							+ '</option>';
					$("#country").append(output);
				});
			});

		});

function addUsers(formData) {

	$.ajax({
		url:"AddNewUser",
		type:"Post",
		data:formData,
		success:function(response) {
				if(response) {
					logSuccess("User Info has been Added successfully!");
					 $('#addUserForm')[0].reset();
				} else {
					logError("UserName already exist!")
			}
		}
	})
}