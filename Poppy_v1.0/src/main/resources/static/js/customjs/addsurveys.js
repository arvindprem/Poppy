$(document).ready(
		function() {
			$("#addSurveyForm").validate({
				errorClass : "ErrorClass",
				rules : {
					version : {
						required : true,
					},label : {
						required : true,
					},
					type : {
						required : true,
					},
					content : {
						required : true,
					},fileUpload : {
						required : true,
					
					},
					
				},
				submitHandler : function(form) {
					var formData = new FormData(form);
					
					addNewSurveys(formData);
				}
			});

			

		});

function addNewSurveys(formData){

	$.ajax({
		url:"AddNewSurvey",
		type:"Post",
		data : formData,
		processData : false,
		enctype: 'multipart/form-data',
		contentType : false,
		 cache: false,
		success:function(response) {
			$("#loader").addClass("hider");
				if(response) {
					logSuccess("New survey has been Added successfully!");
					 $('#addSurveyForm')[0].reset();
					 $("#fileUpload").val('');
				} else {
					
					logError("Server Internal Error!");
			}
		}
	})
}