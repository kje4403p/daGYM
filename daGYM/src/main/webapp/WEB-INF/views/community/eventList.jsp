<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <link href="${contextPath }/resources/css/event.css" rel="stylesheet" />
</head>
<body>
<%@ include file="../common/header.jsp" %>
<div class="container event">
	<ul class="tabType1">
		<li class="on"><a href="eventList.do?type=1">진행중 이벤트</a></li>
		<li><a href="pastList.do?type=2">종료된 이벤트</a></li>
	</ul>
	<ul class="eventList mx-auto">
		<c:choose>
			<c:when test="${empty eventList }">
				<tr><td colspan="6">존재하는 게시글이 없습니다.</td></tr>
			</c:when>
			<c:otherwise>
				<c:forEach var="event" items="${eventList }">
					<li>
						<a id="view" > 
							<p class="thumb"></p>
							<p class="ing" id="${event.boardNo }">진행중</p>
							<p class="tit">${event.boardTitle }</p>
							<fmt:formatDate var='startDate' value="${event.startDate}" pattern="yy-MM-dd" />
							<fmt:formatDate var='endDate' value="${event.endDate}" pattern="yy-MM-dd" />
							<p class="date">${startDate } ~ ${endDate }</p>
						</a>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</ul>
	
	

   <jsp:include page="sideMenu.jsp"/>
</div>
<%@ include file="../common/footer.jsp" %>
</body>
</html>