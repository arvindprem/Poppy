$(document).ready(
		function() {
			$("#addAllowSurveyForm").validate({
				errorClass : "ErrorClass",
				rules : {
					filter : {
						required : true,
					},
					sample: {
						required : true,
						
					},version: {
						required : true,
						
					},
					
				},
				submitHandler : function(form) {
					var formData = $("#addAllowSurveyForm").serialize();
					console.log(formData);
					addNewAllowSurvey(formData);
				}
			});

			

		});

function addNewAllowSurvey(formData){

	$.ajax({
		url:"AddNewAllowSurvey",
		type:"Post",
		data : formData,
		success:function(response) {
				if(response) {
					logSuccess("New AllowSurvey has been Added successfully!");
					 $('#addAllowSurveyForm')[0].reset();
				} else {
					logError("Server Internal Error!");
			}
		}
	})
}