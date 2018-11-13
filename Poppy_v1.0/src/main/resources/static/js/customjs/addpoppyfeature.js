$(document).ready(
		function() {
			$("#addPoppyFeatureForm").validate({
				errorClass : "ErrorClass",
				rules : {
					label : {
						required : true,
					},
					
				},
				submitHandler : function(form) {
					var formData = $("#addPoppyFeatureForm").serialize();
					console.log(formData);
					addNewFeature(formData);
				}
			});

			

		});

function addNewFeature(formData){

	$.ajax({
		url:"AddNewFeature",
		type:"Post",
		data : formData,
		success:function(response) {
				if(response) {
					logSuccess("New Feature has been Added successfully!");
					 $('#addPoppyFeatureForm')[0].reset();
				} else {
					logError("Server Internal Error!");
			}
		}
	})
}