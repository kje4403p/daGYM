<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.kh.dagym.admin.model.vo.PT"%>
<%@page import="java.util.List"%>
<%List<PT> sList = (List<PT>)request.getAttribute("sList");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스케줄 조회</title>
<link href='${contextPath}/resources/fullcalendar/packages/core/main.css' rel='stylesheet' />
<link href='${contextPath}/resources/fullcalendar/packages/daygrid/main.css' rel='stylesheet' />
<script src='${contextPath}/resources/fullcalendar/packages/core/main.js'></script>
<script src='${contextPath}/resources/fullcalendar/packages/interaction/main.js'></script>
<script src='${contextPath}/resources/fullcalendar/packages/daygrid/main.js'></script>
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
	
	#parent {
	background-color: white;
	color: black;}
	
	.fc-button-primary:not(:disabled):active, .fc-button-primary:not(:disabled).fc-button-active {
	color: black;}
</style>
</head>
<body>
	<div class="container-scroller">
		<jsp:include page="../admin/sidebar.jsp"/>
		
		<div class="container-fluid page-body-wrapper">
			<jsp:include page="../admin/navbar.jsp"/>
			
			<div class="main-panel">
				
				<!-- 필터 부분 -->
				<div class="content-wrapper">
		            <div class="panel-body">
		                <div class="col-lg-6">
		                	<span>
		                		<h3>트레이너 선택</h3>
		                    	<c:forEach var="trainer" items="${tList}">
			                        <input type="checkbox" name="trainerName" id="${trainer.trainerNo}" value="${trainer.trainerNo}" checked><label for="${trainer.trainerNo}">${trainer.trainerName}</label>
		                    		&nbsp;&nbsp;
		                    	</c:forEach>
		                    </span>
		                </div>
		
		            </div>
		        </div><!-- 필터 끝 부분 -->
		        
		        <div class="content-wrapper" id="parent">
					<div id='calendar'></div>
				</div>
				
				<jsp:include page="../admin/footer.jsp"/>
			</div>
		</div>
	</div>
	
	<script>
	// 트레이너 필터
	$("input[name='trainerName']").on("change", function() {
		var searchUrl = "scheduleFilter?";
		var $trainerNo = $("input[name='trainerName']:checked");
		
		$trainerNo.each(function(index, item) {
			if(index != 0) searchUrl += "&";
			searchUrl += "tno=" + $(item).val();
		});
		
		trainerFilter(searchUrl);
	});
	
	
	
	//  달력 정보를 저장하는 객체.
	var calObj = { 
			initialView: 'resourceTimeGridDay',
			plugins: [ 'interaction', 'dayGrid', 'timeGrid',  'moment'],
			events: [
				<c:forEach var="sList" items="${sList}">
				 {	 
					title: "T:${sList.trainerName}/M:${sList.memberName}",
					start: "${sList.scheduleTime}"
				 },
				 </c:forEach>
				 ],
			eventTimeFormat: { hour:'numeric' },
			eventColor: "orange",
			defaultView: 'dayGridMonth',
			/* 상단 버튼 및 타이틀 구현 */
			header: { left: 'prev,next today', 
					  center: 'title', 
					  right: 'dayGridMonth,dayGridWeek,dayGridDay' 
					}
	};
	
	var calendar;
	// 달력을 생성하는 함수
	function createCalendar(){
		var calendarEl = document.getElementById('calendar');
		calendar = new FullCalendar.Calendar(calendarEl, calObj);
	}
	
	// 페이지 로딩 완료 시 달력을 생성
	document.addEventListener('DOMContentLoaded', createCalendar()); 
	calendar.render(); // 달력 화면 출력
	
	
	// 필터된 정보로 list 불러오는 ajax
	function trainerFilter(searchUrl) {
		$.ajax({
			url : searchUrl,
			dataType : "JSON",
			success : function(list) {
				console.log(list);
				
				var calendarEl = document.getElementById('calendar');
				calendarEl.innerHTML = "";
				
				var arr =[];
				for(var i=0; i<list.length ; i++){
					var obj = {title : "T:" + list[i].trainerName + "/M:" + list[i].memberName,
								start : list[i].scheduleTime}	
					arr.push(obj);
				}
				calObj.events = arr;
				
				
				calendar = new FullCalendar.Calendar(calendarEl, calObj);
				calendar.render();
				
			}, error : function() {
				console.log("통신 실패");
			}
		});
	}
	</script>
</body>
</html>