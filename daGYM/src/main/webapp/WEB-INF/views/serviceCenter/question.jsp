<%@page import="com.kh.dagym.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>

</style>
<link rel="stylesheet" href="${contextPath}/resources/css/service/quest.css" />


  <meta charset="utf-8">
    <title>Animated Sidebar Menu | CodingLab</title>
    <link rel="stylesheet" href="style.css">
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
</head>
<body>

	<jsp:include page="../common/header.jsp" />
	<%-- <%@include file="../common/header.jsp" %> --%>

	<div id="d1">

		<div id="left">

			<%-- <%@ include file="sideMenu.jsp"%> --%>
			<jsp:include page="sideMenu.jsp" />

		</div>

		<div id="right">
		<span id="title">1:1문의 게시판 </span>
			<div id="table1">
				<table id="table2" class="table table-hover">
					<thead>
						<tr>
							<th>질문유형</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>조회수</th>
							<th>답변여부</th>
						</tr>
					</thead>

					<tbody>
						<c:choose>
							<c:when test="${empty bList}">
								<tr><td colspan="6">존재하는 게시글이 없습니다.</td></tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="board" items="${bList}"  varStatus="status">
									<div>
										<tr>
											
											<td>
												<c:choose>
													<c:when test="${board.qnaCode ==1 }">운동</c:when>
													<c:when test="${board.qnaCode ==2 }">식단</c:when>
													<c:when test="${board.qnaCode ==3 }">이용관련</c:when>
													<c:otherwise>결제/환불</c:otherwise>
												</c:choose>
												<input type="hidden" value="${board.boardNo}">
											</td>
											<td>${board.boardTitle}   
												<c:if test="${board.replyCount >0 }">[${board.replyCount}]</c:if>
												<c:set var="flag" value="false" />
												<c:forEach var="at" items="${thList}" varStatus="status">
													<c:if test="${not flag}">
														<c:if test="${board.boardNo == at.parentBoardNo}">
															<img src="${contextPath}/resources/img/serviceImg/img.png"/ id="thumbnail">
															  <c:set var="flag" value="true" />
														</c:if>
													</c:if>
												</c:forEach>
											</td>
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
											<td>
											  <c:choose>
												<c:when test="${board.answer ==1 }">
													<img src = "${contextPath}/resources/img/serviceImg/check.png"/>
												</c:when>
												<c:otherwise>
													<img src = "${contextPath}/resources/img/serviceImg/quest.png"/>
												</c:otherwise>
											</c:choose>
											</td>
										</tr>
									</div>
								</c:forEach>

							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
				<!-- 관리자 로그인된 경우 글쓰기 버튼 -->
				<c:if test="${!empty loginMember}" >
					<button class="btn btn-primary" type="submit" id="newInsert">글쓰기</button>
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

							<li><a class="page-link" aria-label="Next" href="${url}${pInfo.maxPage}"><span aria-hidden="true">&gt;&gt;</span></a></li>
						</c:if>
					</ul>
					</nav>
				</div>
			
				
				<!-- 검색창 -->
				<div id="search">
				
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
	</div>

	



	<jsp:include page="../common/footer.jsp" />
	<%-- <%@include file="../common/footer.jsp" %> --%>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/css/bootstrap-select.min.css">

<!-- Latest compiled and minified JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/js/bootstrap-select.min.js"></script>

<!-- (Optional) Latest compiled and minified JavaScript translation files -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/js/i18n/defaults-*.min.js"></script>
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
		
		$("#newInsert").on("click",function(){
			
			location.href="../${pInfo.boardType}/insert";
		});
		
		
		
	</script>
</body>
</html>