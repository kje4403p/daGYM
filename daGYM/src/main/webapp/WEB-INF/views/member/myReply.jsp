<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 댓글</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<style>
.w3-btn {margin-bottom:10px;}

</style>
<body>
    <%@ include file="../common/header.jsp"%>
    <div class="row my-5">
        <%@ include file="sideMenu.jsp"%>
        <div class="col-sm-6"  style="left:150px;">
                    <button class="btn btn-info" id="myBoard">내가 쓴글</button>
                    <button class="btn btn-info" id="myReply">내 댓글</button>
                    <button class="btn btn-info" id="myReView">내 리뷰</button>
                    <br><br>
                    <span style ="text-align: center">내 댓글 리스트 총 ${pInfo.listCount}개</span>
                    <div class="row mb-3 form-row">
                    
                <table class="table table-hover">

                    	<tr>
                    		<td style ="text-align: center">게시글 제목</td>
                    		<td style ="text-align: center">댓글 내용</td>
                    		<td style ="text-align: center">작성일</td>
                        </tr>
                        <c:choose>
                        
                        <c:when test="${empty myReplyList}">
		                     <tr>
		                        <td colspan="6">작성하신 댓글이 없습니다.</td>
		                     </tr>
                 		 </c:when>
                 		 <c:otherwise>
                     	 <c:forEach var="reply" items="${myReplyList}">
                        <tr>
                        	<td style ="text-align: center">${reply.rarentBoardTitle}</td>
                        	<td style ="text-align: center">${reply.rerlyContent}</td>
                        	<td style ="text-align: center">${reply.rerlyEnrollDt}</td>
                        </tr>
                        </c:forEach>
                        </c:otherwise>
                        </c:choose>
                	</table>
                </div>
                <div class="my-4">
		<c:set var="url" value="${contextPath}/member/myReplyList/${pInfo.boardType}?cp="></c:set>
        	<ul class="pagination">
            	<c:if test="${pInfo.currentPage > pInfo.pagingBarSize }">	
	                <li>
	                	<!-- 맨 처음으로(<<) -->
	                    <a class="page-link text-primary" href="${url}1">&lt;&lt;</a>
	                </li>
	                
	                <li>
	                	<!-- 이전으로(<) -->
	                	<!-- prev 생성 식 : (현재 페이지 - 1) / 페이징바 사이즈(10) * 10 -->
	                	<!-- fmt태그를 이용한 소수점 제거 -->
	                	<fmt:parseNumber var="operand1" value="${(pInfo.currentPage -1)/pInfo.pagingBarSize}" integerOnly="true"/>
	                	<c:set var="prev" value="${operand1 * 5 }"></c:set>
                   		<a class="page-link text-primary" href="${url}${prev}">&lt;</a>
	                </li>
                </c:if>
                
                <!-- 10개의 페이지 목록 -->
                <c:forEach var="p" begin="${pInfo.startPage }" end="${pInfo.endPage }">
                	<c:choose>
                		<c:when test="${p == pInfo.currentPage}">
            				<li><a class="page-link">${p }</a></li>
                		</c:when>
                		<c:otherwise>
		               		<li>
<%-- 		               			<a class="page-link text-primary" href="${pInfo.boardType }?cp=${p}">${p}</a> --%>
		               			<a class="page-link text-primary" href="${url}${p}">${p}</a>
		                	</li>
                		</c:otherwise>
					</c:choose>               
                </c:forEach>
                <!-- 다음 페이지로(>) -->
                <!-- next 생성 식 : (현재 페이지 + 9) / 10 * 10 + 1 -->
                <c:if test="${pInfo.maxPage > pInfo.endPage}">
	                <li>
	                	<fmt:parseNumber var="operand2" value="${(pInfo.currentPage + pInfo.pagingBarSize - 1)/pInfo.pagingBarSize} " integerOnly="true"/>
	                	<c:set var="next" value="${operand2 * pInfo.pagingBarSize + 1 }"/>
						<a class="page-link text-primary" href="${url}${next}">&gt;</a>
	                </li>
	                
	                <!-- 맨 끝으로(>>) -->
	                <li>
	                    <a class="page-link text-primary" href="${url}${pInfo.maxPage}">&gt;&gt;</a>
	                </li>
                </c:if>
            </ul>
        </div>
	</div>
        </div>
    </div>
    
    <script>
	    $("#myBoard").on("click", function() {
			location.href= "${contextPath}/member/myBoardList/1";
		});
	    $("#myReply").on("click", function() {
			location.href= "${contextPath}/member/myReplyList/1";
		});
	    $("#myReView").on("click", function() {
			location.href= "${contextPath}/member/myReviewList/1";
		});
    </script>
    <%@ include file="../common/footer.jsp"%><br>
</body>
</html>