$(document).ready(function() {
			$("#addDocForm").validate({
				errorClass : "ErrorClass",
				rules : {
				label : {
					required : true,
				},
				type : {
					required : true,
				},
				content : {
					required : true,
				},
				fileUpload : {
					required : true,
				},
				},
				submitHandler : function(form) {
					var formData = new FormData(form);
					addGroup(formData);
				}
			});

});

function addGroup(formData) {
	$.ajax({
		url: "AddNewDoc",
		type : "Post",
		data : formData,
		processData : false,
		enctype: 'multipart/form-data',
		contentType : false,
		 cache: false,
		success : function(response) {
			$("#loader").addClass("hider");
			if(response) {
				logSuccess("Document has been uploaded successfully!");
				 $('#addDocForm')[0].reset();
				$("#fileUpload").val('');
			} else {
				$("#fileUpload").val('');
			}
			
			
		}
	});
}