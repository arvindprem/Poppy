var action = "<div class='text-center'>"
		+ "<i class='fa fa-edit btn btn-success btn-sm' id='edit'></i>&nbsp" 
		+ " <i class='fa fa-trash btn btn-danger btn-sm' id='delete' ></i> </div>";
var group;
$(document).ready(function() {
	group= $("#group").DataTable({
		"processing" : true,
		"ordering" : true,
		"paging" : true,
		"searching" : true,
		"lengthChange" : false,
		rowId : "id",
		columns : [ {
			data : "sNo"
		},{
			data : "label"
		}, {
			data : "nblicence"
		},  {
			data : "country"
		},{
			data : "expirationDateTime"
		},{
			data : "action"
		}],
		 "columnDefs": [ {
	            "searchable": false,
	            "orderable": false,
	            "targets": 0
	        } ],
	        "order": [[ 1, 'asc' ]]
	});
	
	//LOAD USERS LIST ON WINDOW OPEN 
	getGroups(group);

	//LOAD USERS LIST ON REFRESH BUTTON CLICK 
	$("#refreshTable").click(function() {
		group.row().clear();
		getLabels(group);
	});
	
	
	group.on( 'order.dt search.dt', function () {
		group.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
            cell.innerHTML = i+1;
        } );
    } ).draw();
	
	
	//EDIT USER INFO	
	$("#group").on("click","#edit",function(){
		  var currentRow = group.row($(this).parents("tr"));
		  var currentRowData=  group.row( currentRow ).data();
		  console.log(currentRowData);
		  $('#editModal').on('show.bs.modal', function (event) {
			  $('#editGrupForm #id').val(currentRowData.id);
			  $('#editGrupForm #label').val(currentRowData.label);
			  $('#editGrupForm #nblicense').val(currentRowData.nblicence);
			  $('#editGroupForm #country').val(currentRowData.country).change();
			 
			});
	});
	  
	
	$("#group").on("click","#delete",function(){
		var groupID=group.row($(this).parents("tr")).id();
		  alertify.reset().confirm("Do you want delete group?", function() {
			  deleteGroupInfo(groupID);
				}, function() {
					log("Group deletion cancelled!");
				});
	});
	
	
	$("#filterToggle").click(function() {
		 group.row().clear();
		$(".box").toggle();
	});
	
	$('#editModal').on('hidden.bs.modal', function () {
		$(this).find("input,textarea,password").val("");
		$("#editGroupForm").validate().resetForm();
		$(this).find("select").val("");
	})
	
	
	$("#fliter").click(function() {
		var country =$("#country").val();
		var nblicence=$('#nblicence').val();
		
		var label=$("#label").val();
		if(country == "" && label == ""&&nblicence=="") {
			log("Please Enter the values");
		} else {
			var formData ="country="+country+"&label="+label+"&nblicence="+nblicence;
			console.log(formData);
			filterSearch(formData);
		}
	});

	
	$("#resetFilter").click(function() {
		$("#label").val('');
		timeOut(group);
	});
		
	
	$("#editGroupForm").validate({
			errorClass : "ErrorClass",
			rules : {
				label : {
					required : true,
				},
				nblicence : {
					required : true,
				},
				confWatchWord : {
					required : true,
				},
				
				country : {
					required : true,
				},
			},
			submitHandler : function(form) {
				var formData = $("#editGroupForm").serialize();
				editGroupInfo(formData);
			}
		});
		
		});
	//TO LOAD COUNTRY
	$.getJSON("Json/countriesbycontinent.json", function(data) {
		$.each(data, function(key, val) {
			var output = '';
			output = '<option value=' + val.country + '>' + val.country
					+ '</option>';
			$("#editGroupForm #country").append(output);
			$("#country").append(output);
			
		});
	});
		


function getGroups(group) {
		$.ajax({
				url : "GetGroups",
				type : "Post",
				success : function(response) {
					tableMaker(response.data);

				}
			});
}



function tableMaker(data) {
	for (var i = 0; i < data.length; i++) {
		data[i].sNo =''; 
		data[i].action = 
			"<div class='text-center'>"
			+ "<i class='fa fa-edit btn btn-success btn-sm' data-toggle='modal' data-target='#editModal' id='edit'></i>&nbsp" 
			+ " <i class='fa fa-trash btn btn-danger btn-sm' id='delete' ></i> </div>";
			group.row.add(data[i]).draw();
	}
}

function editGroupInfo(formData){
	$.ajax({
		url : "EditGroupInfo",
		type : "Post",
		data:formData,
		success : function(response) {
			if(response) {
				logSuccess("User Info has been updated successfully!");
				timeOut(group);
				$("#editModal").modal('hide');
			} else {
				logError("Label already exist!")
			}
		}
	});
}

function deleteGroupInfo(groupID){
	$.ajax({
		url : "DeleteGroupInfo",
		type : "Post",
		data:"GroupId="+groupID,
		success : function(response) {
			if(response) {
				logSuccess("User Info has been deleted successfully!");
				timeOut(group);
			} else {
				logError("Unexpected error");
			}
		}
	});
}


function timeOut(group) {
		   group.row().clear();
			getgroups(group);
}

function filterSearch(formData) {
	
	$.ajax({
		url  : "FilterSearch",
		type : "Post",
		data : formData,
		success : function(response) {
			  group.row().clear();
			 tableMaker(response.data); 
		}
		});
}
