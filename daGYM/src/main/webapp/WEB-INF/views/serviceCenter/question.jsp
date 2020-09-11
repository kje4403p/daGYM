<%@page import="com.kh.dagym.member.model.vo.Member"%>
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
#body1{
	height:1300px;
}

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
	cursor: pointer;
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


#table2{
	max-width: 1200px;
}
/* 검색창 */
#searchInput, #searchBtn {
	float: left;
	margin-left: 60%;
}

 input[type=text]{
	border:5px solid #aaa;
	border-radius:4px;
	margin:8px 0;
	outline:none;
	padding:8px;
	box-sizing:border-box;
	transition:.3s;
	
}
input[type=text]:focus{
	border-color:dodgerBlue;
	box-sizing: 0 0 50px 0 dodgerBlue;
}



/* 페이징바 */
#pagingbar{
 position: absolute;
	left:42% ;
	margin-top: 10px;
}

#searcharea{
position: absolute;
	left:42% ;
	margin-top: 10px;
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
							
							<th>질문유형</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>조회수</th>
						</tr>
					</thead>

					<tbody>
						<c:choose>
							<c:when test="${empty bList}">
								<tr><td colspan="5">존재하는 게시글이 없습니다.</td></tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="board" items="${bList}"  varStatus="status">
									<div>
										<tr>
										
											<td>${board.qnaCode}
												<input type="hidden" value="${board.boardNo}">
											</td>
											<td>${board.boardTitle}</td>
											<td id="writer"><c:out value="${loginMember.memberId}"></c:out></td>
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
				<!-- 관리자 로그인된 경우 글쓰기 버튼 -->
				<c:if test="${!empty loginMember}" >
					<a href="../${pInfo.boardType}/insert">글쓰기</a>
				</c:if>
				<!-- 페이징바 -->
				<input type="hidden" id="cp" value="${pInfo.currentPage}">
				<input type="hidden" id="bType" value="${pInfo.boardType}">
				
				<c:url var="searchParameter" value="${pInfo.boardType}">
					<c:if test="${!empty param.sVal}">
						<c:param name="sKey" value="${param.sKey}"/>
						<c:param name="sVal" value="${param.sVal}" />
						
					</c:if>
				</c:url>


				<c:choose>

					<c:when test="${!empty param.sVal}">
						<c:set var="url" value="${searchParameter}&cp=" />
						
					</c:when>
					<c:otherwise>
						<c:set var="url" value="${searchParameter}?cp=" />
						<c:set var="listUrl" value="../${url}${pInfo.currentPage}" scope="session"/>
					</c:otherwise>

				</c:choose>

				<div id="pagingbar">
					<nav aria-label="Page navigation example">
					<ul class="pagination">
						<c:if test="${pInfo.currentPage > pInfo.pagingBarSize}">
							<li class="page-item">
							<a class="page-link" href="${url}1" aria-label="Previous"> <span aria-hidden="true">&lt;&lt;</span>
							</a>
							</li>

							<li class="page-item"><fmt:parseNumber var="operand1"
									value="${(pInfo.currentPage-1)/pInfo.pagingBarSize}"
									integerOnly="true" /> <c:set var="prev" value="${operand1 *5}" />
								<a class="page-link" href="${url}${prev}"><span aria-hidden="true">&lt;</span></a>
							</li>
						</c:if>

						<c:forEach var="p" begin="${pInfo.startPage}"
							end="${pInfo.endPage}">
							<c:choose>
								<c:when test="${p==pInfo.currentPage}">
									<li class="page-item"><a class="page-link">${p}</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link" href="${url}${p}">${p}</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>

						<c:if test="${pInfo.maxPage > pInfo.endPage}">
							<li class="page-item"><fmt:parseNumber var="operand2"
									value="${(pInfo.currentPage +pInfo.pagingBarSize-1)/pInfo.pagingBarSize }"
									integerOnly="true" /> <c:set var="next"
									value="${operand2*5 + 1}" /> <a class="page-link" href="${url}${next}" aria-label="Next"><span aria-hidden="true">&gt;</span></a></li>

							<li><a class="page-item" href="${url}${pInfo.maxPage}" aria-label="Next"><span aria-hidden="true">&gt;&gt;</span></a></li>
						</c:if>
					</ul>
					</nav>
				</div>
				
				
				<!-- 검색창 -->
				
				<select name="sKey" style="width:100px; display:inline-block;">
					<option value="tit">글제목</option>
					<option value="con">내용</option>
					<option value="tit-con">제목+내용</option>
				</select>
				
				
				<input type="text" id="searchInput" name="sVal"
					style="width: 25% display: inline-block;">
				<!-- <button id="searchBtn" type="button"
					style="width: 100px; display: inline-block;">검색</button> -->
				<input class="btn btn-primary" id="searchBtn" type="submit" value="검색">
				
				
				
			</div>

		</div>
	</div>

	



	<jsp:include page="../common/footer.jsp" />
	<%-- <%@include file="../common/footer.jsp" %> --%>

	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

	<script>
		
	 <%
	 	Member tempMember = (Member)session.getAttribute("loginMember");
	 %>
	 var loginMember;
	 <% if(tempMember != null){ %>
	 	loginMember = "<%= tempMember.getMemberId() %>"
	 <%}%>
	
		$("#table2 td").on("click",function(e) {
			
			var boardNo = $(this).parent().children().eq(0).children().val();
			
			var boardUrl="${contextPath}/service/question/${pInfo.boardType}/"+boardNo+"?cp=${pInfo.currentPage}";
			
			location.href=boardUrl;
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
				
				searchUrl+="../search/${pInfo.boardType}?";
				searchUrl+="sKey="+$sKey.val()+"&sVal="+$sVal.val();
			}
			
			location.href=searchUrl;
		});
	</script>
</body>
</html>