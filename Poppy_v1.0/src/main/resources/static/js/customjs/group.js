var action = "<div class='text-center'>"
		+ "<i class='fa fa-edit btn btn-success btn-sm' id='edit'></i>&nbsp"
		+ " <i class='fa fa-trash btn btn-danger btn-sm' id='delete' ></i> </div>";
var groupManagement;

$(document).ready(function() {
	$("#UploaContinentData").click(function() {
		$.getJSON("Json/countriesbycontinent.json", function(data) {
			var output = [];
			for (var i = 0; i < data.length; i++) {
				output.push({
					label : data[i].country,
					continentLabel : data[i].continent
				});
			}
			uploadcontinent(output);
		});
	});
	
	
	$('#editModal').on('hidden.bs.modal', function () {
		$(this).find("input").val("");
		$("#editForm").validate().resetForm();
		$(this).find("select").val("");
	})
	
	$("#editForm").validate({
		errorClass : "ErrorClass",
		rules : {
			label : {
				required : true,
			},
			nblicence : {
				required : true,
				digits : true
			},
			countryLabel : {
				required : true,
			},
		},
		submitHandler : function(form) {
			var formData = $("#editForm").serialize();
			editGroupInfo(formData);
		}
	});
	
	
	
	$.getJSON("Json/countriesbycontinent.json", function(data) {
		$.each(data, function(key, val) {
			var output = '';
			output = "<option value='" + val.country + "'> "+ val.country
					+ '</option>';
			$("#countryLabel").append(output);
		});
	});
	
	
	

	$("#refreshTable").click(function() {
		groupManagement.clear().draw();
		getAllGroups();
	});

	groupManagement = $("#groupManagement").DataTable({
		"ordering" : false,
		"paging" : true,
		"searching" : true,
		"lengthChange" : false,
		"language": {
		      "emptyTable": "No data available in table"
		    },
		 rowId : "id",   
		    
		columns : [ {
			data : "sNo"
		},{
			data : "label"
		}, {
			data : "nblicence"
		}, {
			data : "countryLabel"
		},{
			data : "licexpirationdate"
		},{
			data : "action"
		}],
	});
	getAllGroups();
	
	
	
	//EDIT USER INFO	
	$("#groupManagement").on("click","#edit",function(){
		  var currentRow = groupManagement.row($(this).parents("tr"));
		  var currentRowData=  groupManagement.row( currentRow ).data();
		  console.log(currentRowData);
		  $('#editModal').on('show.bs.modal', function (event) {
			  $('#editForm #id').val(currentRowData.id);
			  $('#editForm #label').val(currentRowData.label);
			  $('#editForm #nblicence').val(currentRowData.nblicence);
			  $('#editForm #countryLabel').val(currentRowData.countryLabel).change();
			});
	});
	
	
	$("#groupManagement").on("click","#delete",function(){
		var groupID=groupManagement.row($(this).parents("tr")).id();
		console.log(groupID)
		  alertify.reset().confirm("Do you want delete Group?", function() {
			  deleteGroupInfo(groupID);
				}, function() {
					log("User deletion cancelled!");
				});
	});
	
	
});

function uploadcontinent(jsonData) {

	$.ajax({
		url : "uploadContinent",
		type : "Post",
		data : "country="+JSON.stringify(jsonData),
		success : function(response) {
		}

	});
}
function deleteGroupInfo(userID){
	$.ajax({
		url : "DeleteGroupInfo",
		type : "Post",
		data: "UserId="+userID,
		success : function(response) {
			if(response) {
				logSuccess("Group has been deleted successfully!");
				getAllGroups(); 
			} else {
				logError("Unexpected error");
			}
		}
	});
}

function getAllGroups() {
	$.ajax({
		url : "GetAllGroups",
		type : "Post",
		success : function(response) {
			tableMaker(response);
		}

	});
}


function tableMaker(data) {
	groupManagement.clear().draw();
	if(data.length >0) {
	for (var i = 0; i < data.length; i++) {
		data[i].sNo =i+1; 
		data[i].action = 
			"<div class='text-center'>"
			+ "<i class='fa fa-edit btn btn-success btn-sm' data-toggle='modal' data-target='#editModal' id='edit'></i>&nbsp" 
			+ " <i class='fa fa-trash btn btn-danger btn-sm' id='delete' ></i> </div>";
		groupManagement.row.add(data[i]).draw();
	}
	} else {
		groupManagement.clear().draw();
	}	

}

function editGroupInfo(formData) {
	$.ajax({
		url : "UpdateGroupInfo",
		type : "Post",
		data : formData,
		success : function(response) {
			if(response) {
				logSuccess("Group Info has been Updated successfully!");
				getAllGroups(); 
				$('#editModal').modal('hide');
			}
		}
		});
}