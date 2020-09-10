<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트 목록</title>
<style type="text/css">
	#list-table > *{
		color: white;}
	#list-table > thead, tfoot {
		background-color: black;}
  	#list-table > tbody {
  		background-color: #33394a;}
    .pagination {
	    justify-content: center;}
	    
    #list-table td {
       	cursor: pointer;}
</style>
</head>
<body>
	<div class="container-scroller">
		<jsp:include page="../admin/sidebar.jsp"/>
		
		<div class="container-fluid page-body-wrapper">
			<jsp:include page="../admin/navbar.jsp"/>
			
			<div class="main-panel">
				<div class="content-wrapper">
					<div class="card mb-4">
                            <div class="card-header">
								이벤트 목록
                            </div>
                            <div class="card-body">
	                            <table class="table table-bordered" id="list-table" width="100%">
	                                <thead style="color: white;">
	                                    <tr>
	                                        <th>이벤트 번호</th>
	                                        <th>제목</th>
	                                        <th>이벤트 기간</th>
	                                    </tr>
	                                </thead>
	                                <tbody>
	                                    <c:choose>
                                           	<c:when test="${empty eList}">
                                           		<tr><td colspan="3">이벤트 없음</td></tr>
                                           	</c:when>
                                           	
                                           	<c:otherwise>
                                           		<c:forEach var="board" items="${eList}">
                                           			<tr>
                                           				<td>${board.boardNo}</td>
                                           				<td>${board.boardTitle}</td>
                                           				<td>${board.startDate} ~ ${board.endDate}</td>
                                           			</tr>
                                           		</c:forEach>
                                           	</c:otherwise>
                                    	</c:choose>
	                                </tbody>
	                            </table>
                            </div>
                            
							<!-- 페이징바 -->
							<div class="my-4">
					            <ul class="pagination">
					            	
					            	<c:if test="${pInfo.currentPage > pInfo.pagingBarSize}">
						                <li>
						                	<!-- 맨 처음으로(<<) -->
						                    <a class="page-link text-primary" href="eventList?cp=1">&lt;&lt;</a>
						                </li>
						                
						                <li>
						                	<!-- 이전으로(<) -->
						                	<!-- prev 생성 식 : (현재페이지 - 1) / 페이징바 사이즈(10) * 10 -->
						                	<!-- fmt 태그를 이용한 소수점 제거 -->
						                	<fmt:parseNumber var="operand1" value="${(pInfo.currentPage-1)/pInfo.pagingBarSize}" integerOnly="true"/>
						                	
						                	<c:set var="prev" value="${operand1 * pInfo.pagingBarSize}"/>
						                	
					                   		<a class="page-link text-primary" href="eventList?cp=${prev}">&lt;</a>
						                </li>
					                </c:if>
					                
					                <!-- 10개의 페이지 목록 -->
					                <c:forEach var="p" begin="${pInfo.startPage}" end="${pInfo.endPage}">
					                	<c:choose>
					                		<c:when test="${p == pInfo.currentPage}">
					                			<li><a class="page-link">${p}</a></li>
					                		</c:when>
					                		
					                		<c:otherwise>
						                		<li>
						                			<a class="page-link text-primary" href="eventList?cp=${p}">${p}</a>
							                	</li>
							                </c:otherwise>
					                	</c:choose>
					                </c:forEach>
					                
					                <!-- 다음 페이지로(>) -->
					                <!-- next 생성 식 : (현재 페이지 + 9) / 10 * 10 + 1 -->
					                <c:if test="${pInfo.maxPage > pInfo.endPage}">
					                
					                	<!-- 다음 페이지(>) -->
						                <li>
						                	<fmt:parseNumber var="operand2" value="${(pInfo.currentPage + pInfo.pagingBarSize - 1) / pInfo.pagingBarSize}" integerOnly="true"/>
						                	<c:set var="next" value="${operand2 * pInfo.pagingBarSize + 1}"/>
											<a class="page-link text-primary" href="eventList?cp=${next}">&gt;</a>
						                </li>
						                
						                <!-- 맨 끝으로(>>) -->
						                <li>
						                    <a class="page-link text-primary" href="eventList?cp=${pInfo.maxPage}">&gt;&gt;</a>
						                </li>
					                </c:if>
					            </ul>
					        </div>                            
                	</div>
				</div>
				
				<jsp:include page="../admin/footer.jsp"/>
			</div>
		</div>
	</div>
        
        
	<script>		
		$(function() {
			$("#list-table td").on("click", function() {
				var boardNo = $(this).parent().children().eq(0).text();
				
				location.href = "${contextPath}/event/" + boardNo;
			});
		});
	</script>
</body>
</html>