$(document).ready(function() {
	//CALENDAR CREATED BY USING FULL CALENDAR PLUGIN 
		var calendar = $('#calendar').fullCalendar({
			//HEADER METHOD ALLOW WHAT ARE ALL THE FIELDS MUST BE IN HEADER
		header : {
			left : 'prev,next today',
			center : 'title',
			right : 'month,agendaWeek,agendaDay'
		},
					
		//EDITABLE OPTION ALLOW TO MAKE CHANGES USING DRAG AND DROP
		editable : true,
		//THIS OPTION SHOW EVENT WITH TIME WHEN IT IS TRUE
		displayEventTime : false,
		// this allows things to be dropped onto the calendar
		droppable : true, 
		// EVNTS OPTION USED TO BRING ALL EVENTS FROM SERVER SIDE USING AJAX
		events : function(start, end, timezone,callback) {
			$.ajax({
				url : "GetEvents",
				type : "Post",
				dataType : 'json',
				success : function(data) {
					console.log(data);
					var events = [];
					
					// PARSING JSON TO PUT INTO ARRAY  
					$.each(data,function(index) {
							events.push({
									"start" : data[index].start,
									"title" : data[index].title,
									// CUSTOM VARIABLES BELOW ARE ALL 
									"endTime" : data[index].end,
									"description" : data[index].description,
									"id" : data[index].id
									});
							});
									callback(events);
							},
						error : function() {
							console.log("Ajax Invocation Failed");
							},
						});
					},

    //Event Click Option Which tell us the Info while clicking on  Event
	eventClick : function(event, jsEvent,view) {
			console.log(event.endTime);
				$('#fullCalModal').modal('show');
				$('#modalTitle').html(event.title);
				$('#start').html(moment(event.start._i).format('YYYY-MM-DD h:mm:ss a'));
				$('#end').html(moment(event.endTime).format('YYYY-MM-DD h:mm:ss a'));
				$('#des').html(event.description);
				$('#id').html(event.id);
				},
    // Event Render Which help use to to additional info with events				
	eventRender : function(event, element) {
		
			//	ADDING ['X'] WITH EVENT WHICH ALLOW US TO DELETE EVENT HERE USING  ID["#close"]
				element.append("<span id='close' style='color:black'> <i class='fa fa-close'></i></span>");
			// dELETE FUNCTION INVOKED WHEN CLICK ON X MARK
				element.find("#close").click(function() {
					
			//dELETE EVENT BY USING FULL CALENDAR PLUGIN
				deletEvents(event.id);
			// EVENT DATA REFETCHED FROM SERVER SIDE 
				calendar.fullCalendar('refetchEvents');
				});
			},

	});

		$("#eventReloader").click(function() {
			calendar.fullCalendar('refetchEvents');
		});

		$("#eventcreator").click(function() {
			$.ajax({
				url : "EventCreator",
				type : "Post",
				data : $("#eventFrom").serialize(),
				success : function(data) {
					console.log(data);
					$("#eventMaker").modal("hide");

				}
			});
			
			setTimeout(function(){
				calendar.fullCalendar('refetchEvents');
			},1000);
		
		});

	});

function deletEvents(id) {
	console.log(id);
	$.ajax({
		url : "DeleteEvent",
		type : "Post",
		data : "id=" + id,
		dataType : 'json',
		success : function(data) {
			console.log(data);
		}
	});
}
