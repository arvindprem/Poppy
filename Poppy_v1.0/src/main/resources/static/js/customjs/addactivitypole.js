$(document).ready(
		function() {
			$("#addActivityPoleForm").validate({
				errorClass : "ErrorClass",
				rules : {
					label : {
						required : true,
					},
					phone : {
						required : true,
						digits : true
					},
					address : {
						required : true,
					},
					nBLicence  : {
						required : true,
						digits : true
					},
					responsibleName : {
						required : true,
					},
					responsibleEmail : {
						required : true,
					},
					societyLabel : {
						required : true,
					},
					filter : {
						required : true,
					},
					featureLabel : {
						required : true,
					},
				},
				submitHandler : function(form) {
					var formData = $("#addActivityPoleForm").serialize();
					console.log(formData);
					addNewActivityPole(formData);
				}
			});

			
		});

function addNewActivityPole(formData){

	$.ajax({
		url:"AddNewActivityPole",
		type:"Post",
		data : formData,
		success:function(response) {
				if(response) {
					logSuccess("New ActivityPole has been Added successfully!");
					 $('#addActivityPoleForm')[0].reset();
				} else {
					logError("Server Internal Error!");
			}
		}
	})
}