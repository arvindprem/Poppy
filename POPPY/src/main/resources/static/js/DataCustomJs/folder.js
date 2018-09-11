$(document).ready(function() {
	 $("#editFolder,#deleteFolder").prop("disabled",true);
	/*MAIN JS TREE*/
	var jsTree = $("#jstree").jstree({
			 "core" : {
		            check_callback : true
		        },
		"plugins" : [ "unique" ]
	})
	
	/*CREATE JS TREE*/
	
	var jsTreeModal=$("#jstreemodal").jstree({
	 "core" : {
	    check_callback : true
	},
	"plugins" : [ "unique" ] 
	 });

	
	/*RENAME JS TREE*/
	 $("#modifyJsTree").jstree({
	 "core" : {
	        check_callback : true
	    },
	 "plugins" : [ "unique" ] 
	 });

	 
	 $("#modifyJsTree").on('changed.jstree', function(e, data) {
		 var i, j, r = [];
		 for (i = 0, j = data.selected.length; i < j; i++) {
	        r.push(data.instance.get_node(data.selected[i]).text);
		 }
		 var nodeName=r.join(', ');
		 $("#modifyModalFolderName").html("<span>"+nodeName+" <i class='fa fa-close' style='color:red;' id='modifyUnselector'></i></span>");
	});
	 
	 $('.fade').on('click','#modifyUnselector',function() {
			jsTreeModal.jstree("deselect_all");
			   $("#modifyModalFolderName").html(null);
	});
	
	
	
	 $("#jstreemodal").on('changed.jstree', function(e, data) {
		 var i, j, r = [];
		 for (i = 0, j = data.selected.length; i < j; i++) {
	            r.push(data.instance.get_node(data.selected[i]).text);
	     }
		 var nodeName=r.join(', ');
	     $("#selectedModalFolderName").html("<span>"+nodeName+" <i class='fa fa-close' style='color:red;' id='Modelunselector'></i></span>");
	});
	

	jsTree.on('changed.jstree', function(e, data) {
		 var i, j, r = [];
		 for (i = 0, j = data.selected.length; i < j; i++) {
	            r.push(data.instance.get_node(data.selected[i]).text);
	     }
		 var nodeName=r.join(', ');
	     $("#selectedFolderName").html("<span>"+nodeName+" <i class='fa fa-close' style='color:red;' id='unselector'></i></span>");
	     $("#editFolder,#deleteFolder").prop("disabled",false);
	});
	
	$('body').on('click','#unselector',function() {
		jsTree.jstree("deselect_all");
		   $("#selectedFolderName").html(null);
		   $("#editFolder,#deleteFolder").prop("disabled",true);
	});
	
	$('.fade').on('click','#Modelunselector',function() {
		jsTreeModal.jstree("deselect_all");
		   $("#selectedModalFolderName").html(null);
	});
	
	
	
	
	$("#deleteFolder").click(function(){
		
		
		alertify.confirm("This is a confirm dialog", function (e) {
            if (e) {
               success("You've clicked OK");
               jsTreeModal.jstree("deselect_all");
            } else {
               error("You've clicked Cancel");
            }
         });
		
	});
	
	
	
});

function error(message) {
	alertify.reset();
	alertify.logPosition("bottom right");
	alertify.delay(10000).maxLogItems(1).error(message);
}

function success(message) {
	alertify.reset();
	alertify.logPosition("bottom right");
	alertify.delay(10000).maxLogItems(1).error(message);
}

