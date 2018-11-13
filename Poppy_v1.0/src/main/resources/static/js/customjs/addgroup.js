$(document).ready(function() {
			$("#addGroupForm").validate({
				errorClass : "ErrorClass",
				rules : {
				country : {
					required : true,
				},
				nblicence : {
					required : true,
					digits :true,
				}
				},
				submitHandler : function(form) {
					var formData = $("#addGroupForm").serialize();
					addGroup(formData);
				}
			});

$.getJSON("Json/countriesbycontinent.json", function(data) {
				$.each(data, function(key, val) {
					var output = '';
					output = '<option value=' + val.country + '>' + val.country
							+ '</option>';
					$("#countryLabel").append(output);

				});
		});
});

function addGroup(formData) {
	$.ajax({
		url:"AddNewGroup",
		type:"Post",
		data:formData,
		success:function(response) {
				if(response) {
					logSuccess("New Group has been Added successfully!");
					 $('#addGroupForm')[0].reset();
				} 
			}
	});
}