var action = "<div class='text-center'>"
		+ "<i class='fa fa-edit btn btn-success btn-sm' veriosnId='edit'></i>&nbsp"
		+ " <i class='fa fa-trash btn btn-danger btn-sm' id='delete' ></i> </div>";
var Poppy;

$('#editModal').on('hidden.bs.modal', function () {
	$(this).find("input").val("");
	$("#editForm").validate().resetForm();
	$(this).find("select").val("");
})

$("#editForm").validate({
	errorClass : "ErrorClass",
	rules : {
		version : {
			required : true,
		},
		
		
		
	},
	submitHandler : function(form) {
		var formData = $("#editForm").serialize();
		editPoppyVersionInfo(formData);
	}
});





$("#refreshTable").click(function() {
	Poppy.clear().draw();
	getAllPoppyVersions();
});


Poppy = $("#Poppy").DataTable({
	"ordering" : false,
	"paging" : true,
	"searching" : true,
	"lengthChange" : false,
	"language": {
	      "emptyTable": "No data available in table"
	    },
	 rowId : "versionId",   
	    
	columns : [ {
		data : "sNo"
	},{
		data : "version"
	},  {
		data : "creationDateTime"
	},{
		data : "filename"
	},{
		data : "Description"
	},{
		data : "action"
	}],
	
	
});

getAllPoppyVersions();


//EDIT PoppyVersion INFO	
$("#Poppy").on("click","#edit",function(){
	  var currentRow = Poppy.row($(this).parents("tr"));
	  var currentRowData=  Poppy.row( currentRow ).data();
	  console.log(currentRowData);
	  $('#editModal').on('show.bs.modal', function (event) {
		  $('#editForm #versionId').val(currentRowData.versionId);
		  $('#editForm #version').val(currentRowData.version);
		 
		});
});


$("#Poppy").on("click","#delete",function(){
	var versionID=Poppy.row($(this).parents("tr")).id();
	console.log(versionID)
	  alertify.reset().confirm("Do you want delete PoppyVersion?", function() {
		  deletePoppyVersionInfo(versionID);
			}, function() {
				log("PoppyVersion deletion cancelled!");
			});
});


function deletePoppyVersionInfo(userID){
$.ajax({
	url : "DeletePoppyVersionInfo",
	type : "Post",
	data: "UserId="+userID,
	success : function(response) {
		if(response) {
			logSuccess("PoppyVersion has been deleted successfully!");
			getAllPoppyVersions(); 
		} else {
			logError("Unexpected error");
		}
	}
});
}








function getAllPoppyVersions() {
	$.ajax({
		url : "GetAllPoppyVersions",
		type : "Post",
		success : function(response) {
			tableMaker(response);
		}

	});
}


function tableMaker(data) {
	Poppy.clear().draw();
	if(data.length >0) {
	for (var i = 0; i < data.length; i++) {
		data[i].sNo =i+1; 
		data[i].action = 
			"<div class='text-center'>"
			+ "<i class='fa fa-edit btn btn-success btn-sm' data-toggle='modal' data-target='#editModal' id='edit'></i>&nbsp" 
			+ " <i class='fa fa-trash btn btn-danger btn-sm' id='delete' ></i> </div>";
		Poppy.row.add(data[i]).draw();
	}
	} else {
		Poppy.clear().draw();
	}	

}

function editPoppyVersionInfo(formData) {
	$.ajax({
		url : "UpdatePoppyVersionInfo",
		type : "Post",
		data : formData,
		success : function(response) {
			if(response) {
				logSuccess("PoppyVersion Info has been Updated successfully!");
				getAllPoppyVersions(); 
				$('#editModal').modal('hide');
			}
		}
		});
}

