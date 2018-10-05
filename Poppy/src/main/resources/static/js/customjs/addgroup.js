//$(document).ready(
//		function() {
//			$("#addUserForm").validate({
//				errorClass : "ErrorClass",
//				rules : {
//			
//				country : {
//					required : true,
//				},
//				submitHandler : function(form) {
//					var formData = $("#addgroupForm").serialize();
//					addGroups(formData);
//				}
//			});
//
//
//$.getJSON("Json/countriesbycontinent.json", function(data) {
//				$.each(data, function(key, val) {
//					var output = '';
//					output = '<option value=' + val.country + '>' + val.country
//							+ '</option>';
//					$("#country").append(output);

request.getParameter('country');