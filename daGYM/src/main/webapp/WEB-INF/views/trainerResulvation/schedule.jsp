<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application" />
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link href='${contextPath}/resources/fullcalendar/packages/daygrid/main.css' rel='stylesheet' />
<link href='${contextPath}/resources/fullcalendar/packages/core/main.css' rel='stylesheet' />
<script src='${contextPath}/resources/fullcalendar/packages/core/main.js'></script>
<script src='${contextPath}/resources/fullcalendar/packages/interaction/main.js'></script>
<script src='${contextPath}/resources/fullcalendar/packages/daygrid/main.js'></script>

<style>
          /* The Modal (background) */
.searchModal {
display: none; /* Hidden by default */
position: fixed; /* Stay in place */
z-index: 10; /* Sit on top */
left: 0;
top: 0;
width: 100%; /* Full width */
height: 100%; /* Full height */
overflow: auto; /* Enable scroll if needed */
background-color: rgb(0,0,0); /* Fallback color */
background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}
/* Modal Content/Box */
.search-modal-content {
background-color: #fefefe;
margin: 15% auto; /* 15% from the top and centered */
padding: 20px;
border: 1px solid #888;
width: 70%; /* Could be more or less, depending on screen size */
}
.searchModal{
text-align: center;
}
#close{
float: right;
}
.search-modal-content{
background-color: #fcf8e3;
}
        </style>
        
<script>
document.addEventListener('DOMContentLoaded', function() { 
	var calendarEl = document.getElementById('calendar');
	var calendar = new FullCalendar.Calendar(calendarEl, { 
		plugins: [ 'interaction', 'dayGrid', 'timeGrid' ],
		defaultView: 'dayGridMonth',
		defaultDate: new Date(),
		header: { left: 'prev,next today', center: 'title', right: 'dayGridMonth,dayGridWeek,dayGridDay' },
		 dateClick: function(date) {
			 alert("왜안돼");
			 var date = date.dateStr;
			 var dateSplit = date.split('-');
		   	var yy=dateSplit[0];
			var mm=dateSplit[1];
			var dd=dateSplit[2];
			console.log(yy);
			console.log(mm);
			console.log(dd);
			
			 $('#modal').show();
		  }
		
	}); 

	calendar.render(); 
	
	});

</script>

</head>
<body>
 
<div id='calendar'></div>

 <div id="modal" class="searchModal">
 	
 	<div class="search-modal-content">
 	<button id="close" onclick="closeModal();">
			X
			</button>
		<div class="page-header">
			<h1>SCHEDULE</h1>
			
		</div>
			<div class="row">
				<div class="col-sm-12">
					<div class="row">
						<div class="col-sm-12">
							<select name="trainerSchedule" class="form-control" style="width:400px; height:50px; display: inline-block;">
							 <option value="12:00">12:00</option>
							 <option value="13:00">13:00</option>
							 <option value="14:00">14:00</option>
							 <option value="15:00">15:00</option>
							 <option value="16:00">16:00</option>
							 <option value="17:00">17:00</option>
							 <option value="18:00">18:00</option>
							 <option value="19:00">19:00</option>						 
							 <option value="20:00">20:00</option>
                  			 <option value="21:00">21:00</option>
                   			 <option value="22:00">22:00</option>
							</select>
						</div>
					</div>
				</div>
			</div>
<hr>
			<div class="select" style="cursor:pointer;background-color:#DDDDDD;text-align: center;padding-bottom: 10px;padding-top: 10px;" onclick="closeModal();">
			선택
			</div>
	
		</div>
	</div>

</body>
<script>
function closeModal(){
	$('#modal').hide();
};

</script>
</html>
