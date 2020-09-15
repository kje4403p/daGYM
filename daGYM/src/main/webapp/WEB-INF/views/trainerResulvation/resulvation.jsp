<%@page import="com.kh.dagym.trainer.model.vo.TrainerSchedule"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%List<TrainerSchedule> schedule = (List<TrainerSchedule>)request.getAttribute("schedule");%>
<!DOCTYPE html>
<html>
<head>
<title>트레이너 예약</title>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application" />
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link href='${contextPath}/resources/fullcalendar/packages/daygrid/main.css' rel='stylesheet' />
<link href='${contextPath}/resources/fullcalendar/packages/core/main.css' rel='stylesheet' />
<script src='${contextPath}/resources/fullcalendar/packages/core/main.js'></script>
<script src='${contextPath}/resources/fullcalendar/packages/interaction/main.js'></script>
<script src='${contextPath}/resources/fullcalendar/packages/daygrid/main.js'></script>
<script class="cssdesk" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.0/moment.min.js" type="text/javascript"></script>
 <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
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
		plugins: [ 'interaction', 'dayGrid', 'timeGrid' ],
		 events: [
			 <%
			 for(int i=0; i<schedule.size(); i++){
				 TrainerSchedule sd = (TrainerSchedule)schedule.get(i);
			 %>
			
			 {	 
				
				 start:"<%=sd.getScheduleTime()%>"
					
			 },
			 
			 <%}%>
			 ],
			 eventColor: "orange",
			 eventClick: function(info,start) {
				var eventFullDate = info.event.start;			  		
				var scheduleTime =moment(eventFullDate).format('YY/MM/DD HH:mm:00.000000000');
				var scheduleTime2 =moment(eventFullDate).format('YYYY/MM/DD HH:mm');
			console.log(scheduleTime);
				if(confirm(scheduleTime2+" 예약 하시겠습니까?")){
					if ("${classStatus.classCnt}">0){
					$.ajax({
						url:"${contextPath}/trainer/resulvation/${trainerNo}",
						data: {"scheduleTime":scheduleTime},
						success:function(result2){
							 location.reload();
							if(result2>0){
								alert("예약성공");
							}else{
								alert("이미 예약되어있는 시간입니다.");
							}
	
						},error:function(){
							console.log("통신 실패");
						}
					});
					}else{
						 swal("FAIL","PT이용권을 구매해야 합니다.");
					}
			
				}
			
			},
				

		defaultView: 'dayGridMonth',
		defaultDate: new Date(),
		header: { left: 'prev,next today', center: 'title', right: 'dayGridMonth,dayGridWeek,dayGridDay' },
	
	}); 

	calendar.render(); 
	
	});

</script>

</head>
<body>
<c:if test="${!empty msg }">
		<script>
			swal({icon : "${status}",title : "${msg}", text : "${text}"});
			
		</script>
		<c:remove var="msg"/>
		<c:remove var="status"/>
		<c:remove var="text"/>
	</c:if>

<div id='calendar'></div>

</body>
<script>

</script>
</html>
