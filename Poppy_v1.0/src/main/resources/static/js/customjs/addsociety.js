$(document).ready(
		function() {
			$("#addSocietyForm").validate({
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
					groupLabel : {
						required : true,
					},
				},
				submitHandler : function(form) {
					var formData = $("#addSocietyForm").serialize();
					console.log(formData);
					addNewSociety(formData);
				}
			});

//			$.getJSON("Json/countriesbycontinent.json", function(data) {
//				$.each(data, function(key, val) {
//					var output = '';
//					output = "<option value='" + val.country + "'> "+ val.country
//					+ '</option>';
//					$("#country").append(output);
//				});
//			});

		});

function addNewSociety(formData){

	$.ajax({
		url:"AddNewSociety",
		type:"Post",
		data : formData,
		success:function(response) {
				if(response) {
					logSuccess("New Society has been Added successfully!");
					 $('#addSocietyForm')[0].reset();
				} else {
					logError("Server Internal Error!");
			}
		}
	})
}