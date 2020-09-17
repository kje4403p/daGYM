<%@page import="com.kh.dagym.trainer.model.vo.TrainerSchedule"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%List<TrainerSchedule> schedule = (List<TrainerSchedule>)request.getAttribute("schedule");%>
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
<script src='${contextPath}/resources/fullcalendar/packages/timegrid/main.js'></script>
<script src='${contextPath}/resources/fullcalendar/packages/moment/main.js'></script>
<script class="cssdesk" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.0/moment.min.js" type="text/javascript"></script>
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
		
		  initialView: 'resourceTimeGridDay',
		plugins: [ 'interaction', 'dayGrid','timeGrid',  'moment' ],
	
		
		 events: [
			 <%
			 for(int i=0; i<schedule.size(); i++){
				 TrainerSchedule sd = (TrainerSchedule)schedule.get(i);
			 %>
				
			 {	
			
					
				 start: "<%=sd.getScheduleTime()%>"
						
		
			 },
			 
			 <%}%>
			 ],
		eventTimeFormat: {
		hour:'numeric'
		  
		   },
		defaultView: 'dayGridMonth',
		defaultDate: new Date(),
		header: { left: 'prev,next today', center: 'title', right: 'dayGridMonth,dayGridWeek,dayGridDay' },
		 dateClick: function(date) {
			 var date = date.dateStr;
		
			 $('#modal').show();
			 
			 $("#select").on("click",function(){
				
					var item=$("#trainerSchedule option:selected").val();
					
					
					var scheduleTime2 = date+" "+item;
					console.log(scheduleTime2);
					var scheduleTime =moment(scheduleTime2).format('YY/MM/DD HH:mm:00.000000000');
					console.log(scheduleTime);
					$.ajax({
						url:"${contextPath}/trainer/trainerSchedule/${trainerNo}",
						data: {"scheduleTime":scheduleTime},
						success:function(result){
							
							location.reload();
							console.log(result);
							if(result==1){
								alert("스케줄 등록 성공!");
								
							}else{
								alert("이미 예약되어있는 시간입니다.");
							}
						},error:function(){					
							console.log("통신 실패");
						}
					});
				});
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
							<select id="trainerSchedule" name="trainerSchedule" class="form-control" style="width:400px; height:50px; display: inline-block;">
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
			<div id="select" class="select" style="cursor:pointer;background-color:#DDDDDD;text-align: center;padding-bottom: 10px;padding-top: 10px;" onclick="closeModal();">
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
