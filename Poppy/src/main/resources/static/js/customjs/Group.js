var action = "<div class='text-center'>"
		+ "<i class='fa fa-edit btn btn-success btn-sm' id='edit'></i>&nbsp" 
		+ " <i class='fa fa-trash btn btn-danger btn-sm' id='delete' ></i> </div>";
var userManagement;
$(document).ready(function() {
	userManagement = $("#userManagement").DataTable({
		"processing" : true,
		"ordering" : true,
		"paging" : true,
		"searching" : true,
		"lengthChange" : false,
		rowId : "id",
		columns : [ { {
			data : "country"
		}],
		 "columnDefs": [ {
	            "searchable": false,
	            "orderable": false,
	            "targets": 0
	        } ],
	        "order": [[ 1, 'asc' ]]
	});
	



$("#fliter").click(function() {
		var country =$("#country").val();
		var level=$("#level").val();
		var userName=$("#userName").val();
		if(country == "" && level == "" && userName == "") {
			log("Please Enter the values");
		} else {
			var formData = "userName="+userName+"&level="+level+"&country="+country;
			console.log(formData);
			filterSearch(formData);
		}
	});




$.getJSON("Json/countriesbycontinent.json", function(data) {
		$.each(data, function(key, val) {
			var output = '';
			output = '<option value=' + val.country + '>' + val.country
					+ '</option>';
			$("#editGroupForm #country").append(output);
			$("#country").append(output);