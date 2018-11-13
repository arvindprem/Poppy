$(document).ready(
		function() {
			$("#addPoppyVersionForm").validate({
				errorClass : "ErrorClass",
				rules : {
					version : {
						required : true,
					},
					
				},
				submitHandler : function(form) {
					var formData = $("#addPoppyVersionForm").serialize();
					console.log(formData);
					addNewPoppyVersion(formData);
				}
			});

			

		});

function addNewPoppyVersion(formData){

	$.ajax({
		url:"AddNewPoppyVersion",
		type:"Post",
		data : formData,
		success:function(response) {
				if(response) {
					logSuccess("New Version has been Added successfully!");
					 $('#addPoppyVersionForm')[0].reset();
				} else {
					logError("Server Internal Error!");
			}
		}
	})
}