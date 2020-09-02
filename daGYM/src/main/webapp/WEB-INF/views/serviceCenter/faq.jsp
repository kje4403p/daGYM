<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
#d1 {
	height: 80%;
	width: 100%;
	/* border: 1px solid black; */
	background: linear-gradient(45deg, #49a09d, #5f2c82);
	box-sizing: border-box;
}

#left {
	width: 15%;
	height: 100%;
	float: left;
	box-sizing: border-box;
}

#right {
	width: 85%;
	height: 100%;
	float: left;
}

#b1 {
	margin: 0;
	background: linear-gradient(45deg, #49a09d, #5f2c82);
	font-family: sans-serif;
	font-weight: 100;
}

/* #dd1{
	position: relative;
} */
.container1 {
	position: absolute;
	top: 100%;
	left: 50%;
	transform: translate(-50%, -50%);
}

table {
	width: 80%;
	border-collapse: collapse;
	overflow: hidden;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
	margin-top: 7%;
	/* margin-left: */
	
}

th, td {
	padding: 15px;
	background-color: rgba(255, 255, 255, 0.2);
	color: #fff;
}

th {
	text-align: left;
	padding-top: 70px;
	padding-bottom: 20px;
}

thead {th { background-color:#55608f;
	
}

}
tbody {tr { &:hover {
			background-color : rgba(255, 255, 255, 0.3);
	
}

}
td {
	position: relative; &: hover { & : before { 
				 content : "";
	position: absolute;
	left: 0;
	right: 0;
	top: -9999px;
	bottom: -9999px;
	background-color: rgba(255, 255, 255, 0.2);
	z-index: -1;
}

}
}
}
#dd1 {
	width: 1000px;
	height: 1000px;
}

#table1 {
	width: 100%;
	height: 100%;
	float: left;
}

tr>th:nth-child(2) {
	width: 400px;
}
tr>th:not(:nth-child(2)){
	width:120px;
}

tr>th, tr>td {
	text-align: center;
}

 tr>td:nth-child(2) /* tr>th:nth-child(2) */ {
	text-align: left;
} 

tbody>tr>td:last-child{
	padding-bottom: 10px;
}

/* 검색창 */
#searchInput,#searchBtn{
	float: left;
	margin-left: 60%;
	
	
}
	
</style>
</head>
<body>

	<jsp:include page="../common/header.jsp" />
	<%-- <%@include file="../common/header.jsp" %> --%>
	
	<div id="d1">

		<div id="left">

			<%-- <%@ include file="sideMenu.jsp"%> --%>
			

		</div>
		<div id="right">

			<div id="table1">
				<table id="table2">
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>조회수</th>
						</tr>
					</thead>
					
					<tbody>
						<c:choose>
							<c:when test="${empty bList}">
								<tr>
									<td>존재하는 게시글이 없습니다.</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="board" items="${bList}">
									<div>
									<tr>
										<td>${board.boardNo}</td>
										<td>${board.boardTitle}</td>
										<td>${board.memberNo}</td>
										<td><jsp:useBean id="now" class="java.util.Date" /> 
										<fmt:formatDate var="today" value="${now}" pattern="yyyy-MM-dd" /> 
										<fmt:formatDate var="createDate" value="${board.boardEnrollDate}" pattern="yyyy-MM-dd" /> 
										<fmt:formatDate var="createTime" value="${board.boardEnrollDate}" pattern="hh:mm:ss" /> 
										<c:choose>
											<c:when test="${today == createDate}">
                							${createTime}
                						</c:when>
											<c:otherwise>
                							${createDate}
                						</c:otherwise>
											</c:choose></td>
										<td>${board.views}</td>
									</tr>
									</div>
								</c:forEach>

							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
				<c:url var="searchParmeter" value="${pInfo.boardType}">
					<c:if test="${!empty param.sVal}">
						<c:param name="sVal" value="${param.sVal}"/>
					</c:if>
				</c:url>
			
			
				<c:choose>
				
					<c:when test="${!empty param.sVal}">
						<c:set var ="url" value="${searchParameter}&cp="/>
					</c:when>
				
				</c:choose>
			
			
			
			<!-- 검색창 -->
			<input type="text" id="searchInput" sname="sVal" style="width:25% display : inline-block;">
			<button id="searchBtn" type="button" style="width:100px; display: inline-block;">검색</button>
				
			</div>
			
		</div>
	</div>
	
	
	
	

	<jsp:include page="../common/footer.jsp" />
	<%-- <%@include file="../common/footer.jsp" %> --%>
	
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	
	<script>
		
			$("#table2 td").on("click",function(){
				console.log("ffffffffff");
				var boardNo=$(this).parent().children().eq(0).text();
				var this1=$(this);
				var boardUrl=
					"${contextPath}/service/${pInfo.boardType}/"+boardNo+"?cp=${pInfo.currentPage}";
				/* location.href=boardUrl; */
				
				$.ajax({
					url:boardUrl,
					type:"POST",
					data:{"boardNo":boardNo},
					dataType:"json",
					success:function(board){
						$tr= $("<tr>");
						$td =$("<td>").attr({colspan:"5",
											height:"500"});
						$div = $("<div>").attr("id","tddiv");
						$td.append($div);
						
						
						$tr.append($td);
						$(this1).parent().after($tr);
						
					},error:function(){
						console.log("ajax통신실패");
					}
					
				});
			});
	
	</script>
</body>
</html>