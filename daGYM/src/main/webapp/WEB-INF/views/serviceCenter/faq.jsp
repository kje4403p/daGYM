<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	overflow: auto;
}

tr>th:nth-child(2) {
	width: 400px;
}

tr>th:not(:nth-child(2)) {
	width: 120px;
}

tr>th, tr>td {
	text-align: center;
}

tr>td:nth-child(2) /* tr>th:nth-child(2) */ {
	text-align: left;
}

tbody>tr>td:last-child {
	padding-bottom: 10px;
}

/* 검색창 */
#searchInput, #searchBtn {
	float: left;
	margin-left: 60%;
}

/* 사이드바 css */
</style>
</head>
<body id="body1">

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
											<td><jsp:useBean id="now" class="java.util.Date" /> <fmt:formatDate
													var="today" value="${now}" pattern="yyyy-MM-dd" /> <fmt:formatDate
													var="createDate" value="${board.boardEnrollDate}"
													pattern="yyyy-MM-dd" /> <fmt:formatDate var="createTime"
													value="${board.boardEnrollDate}" pattern="hh:mm:ss" /> <c:choose>
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

				<!-- 페이징바 -->
				<c:url var="searchParmeter" value="${pInfo.boardType}">
					<c:if test="${!empty param.sVal}">
						<c:param name="sVal" value="${param.sVal}" />
						
					</c:if>
				</c:url>


				<c:choose>

					<c:when test="${!empty param.sVal}">
						<c:set var="url" value="${searchParameter}&cp=" />
					</c:when>
					<c:otherwise>
						<c:set var="url" value="${searchParmeter}?cp=" />
					</c:otherwise>

				</c:choose>

				<div>
					<ul>
						<c:if test="${pInfo.currentPage > pInfo.pagingBarSize}">
							<li><a href="${url}4">&lt;&lt;</a></li>

							<li><fmt:parseNumber var="operand1"
									value="${(pInfo.currentPage-1)/pInfo.pagingBarSize}"
									integerOnly="true" /> <c:set var="prev" value="${operand1 *5}" />
								<a href="${url}${prev}">&lt;</a></li>
						</c:if>

						<c:forEach var="p" begin="${pInfo.startPage}"
							end="${pInfo.endPage}">
							<c:choose>
								<c:when test="${p==pInfo.currentPage}">
									<li><a>${p}</a></li>
								</c:when>
								<c:otherwise>
									<li><a href="${url}${p}">${p}</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>

						<c:if test="${pInfo.maxPage > pInfo.endPage}">
							<li><fmt:parseNumber var="operand2"
									value="${(pInfo.currentPage +pInfo.pagingBarSize-1)/pInfo.pagingBarSize }"
									integerOnly="true" /> <c:set var="next"
									value="${operand2*5 + 1}" /> <a href="${url}${next}">&gt;</a></li>

							<li><a href="${url}${pInfo.maxPage}">&gt;&gt;</a></li>
						</c:if>
					</ul>

				</div>

				<select name="sKey" style="width:100px; display:inline-block;">
					<option value="tit">글제목</option>
					<option value="con">내용</option>
					<option value="tit-con">제목+내용</option>
				</select>


				<!-- 검색창 -->
				<input type="text" id="searchInput" name="sVal"
					style="width: 25% display: inline-block;">
				<button id="searchBtn" type="button"
					style="width: 100px; display: inline-block;">검색</button>

			</div>

		</div>
	</div>





	<jsp:include page="../common/footer.jsp" />
	<%-- <%@include file="../common/footer.jsp" %> --%>

	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

	<script>
		$("#table2 td").on(
				"click",
				function(e) {

					var boardNo = $(this).parent().children().eq(0).text();
					var this1 = $(this);
					var boardUrl = "${contextPath}/service/${pInfo.boardType}/"
							+ boardNo + "?cp=${pInfo.currentPage}";
					/* location.href=boardUrl; */
					var ttr;
					$.ajax({
						url : boardUrl,
						type : "POST",
						data : {
							"boardNo" : boardNo
						},
						dataType : "json",
						success : function(board) {

							$ttr = $tr = $("<tr>").attr("id", "tr1");
							$td = $("<td>").attr({
								colspan : "5",
								height : "auto",
								id : "td1"
							});
							$divout = $("<div>").attr({
								id : "tddiv",
								height : "auto%",
								width : "100%"
							});
							$divin = $("<div>").html(board.boardContent);
							$divout.append($divin);

							$td.append($divout);
							$tr.append($td);
							$(this1).parent().after($tr);

							$("#table2 td").on("click", function() {
								$divin.html("");
								$tr.remove();
							});

						},
						error : function() {
							console.log("ajax통신실패");
						}

					}); //
					$('html').click(function(e) {
						if (!$(e.target).hasClass("#table2 td")) {
							 $ttr.remove();
						}
					});
				});

		//--------사이드바
		
		//--------검색동작
		$("#searchBtn").on("click",function(){
			var searchUrl="";
			var $sVal=$("input[name='sVal']");
			var $sKey=$("select[name='sKey']");
			
			if($sVal.val().trim().length == 0){
				searchUrl="${pInfo.boardType}";
			}else{
				searchUrl="../search/${pInfo.boardType}?";
				searchUrl="sKey="+$sKey.val()+"&sVal="+$sVal.val();
			}
			
			location.href=searchUrl;
		});
	</script>
</body>
</html>