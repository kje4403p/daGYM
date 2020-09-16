<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="../common/header.jsp"%>
    <div class="row my-5">
        <%@ include file="sideMenu.jsp"%>
        <div class="col-sm-5">
                    <h1>이용권 및 결제정보</h1>
                    <div class="row mb-3 form-row">
                	<table class="table table-hover" id="table">
                		<tr>
                			<td style ="text-align: center">결제 번호</td>
                			<td style ="text-align: center">상품명</td>
                			<td style ="text-align: center">결제 금액</td>
                			<td style ="text-align: center">결제 날짜</td>
                			<td style ="text-align: center">트레이너 이름</td>
                			<td style ="text-align: center">이용권</td>
                			<td style ="text-align: center"></td>
                		</tr>
                		<c:choose>
                        
                        <c:when test="${empty myPassList}">
		                     <tr>
		                        <td colspan="6">결제내역이 없습니다.</td>
		                     </tr>
                 		 </c:when>
                 		 <c:otherwise>
                     	 <c:forEach var="pass" items="${myPassList}">
                        <tr>
                        	<td style ="text-align: center">${pass.merchantUid}</td>
                        	<td style ="text-align: center">${pass.classNm} 회권</td>
                        	<td style ="text-align: center">${pass.amount}</td>
                        	<td style ="text-align: center">${pass.raymentDate}</td>
                        	<td style ="text-align: center">${pass.trainerName}</td>
                        	<td style ="text-align: center">${pass.classCnt}</td>
                        	<td style ="text-align: center">
                        		
                        	
                        	
                        	</td>
                        </tr>
                        </c:forEach>
                        </c:otherwise>
                        </c:choose>
                	</table>
                </div>
                <div class="my-4">
		<c:set var="url" value="${contextPath}/member/myPassList/${pInfo.boardType}?cp="></c:set>
        	<ul class="pagination">
            	<c:if test="${pInfo.currentPage > pInfo.pagingBarSize }">	
	                <li>
	                	<!-- 맨 처음으로(<<) -->
	                    <a class="page-link text-primary" href="${url}1">&lt;&lt;</a>
	                </li>
	                
	                <li>
                      <!-- 이전으로(<) -->
                      <!-- prev 생성 식 : (현재페이지-1) / 페이징바 사이즈(10) * 10 -->
                      <!-- fmt 태그를 이용한 소수점 제거 -->
                      <fmt:parseNumber var="operand1" value="${(pInfo.currentPage-1)/pInfo.pagingBarSize}" integerOnly="true"/>
                      <c:set var="prev" value="${operand1 * 5}"/>
                      
                         <%-- <a class="page-link text-primary" href="${pInfo.boardType}?cp=${prev}">&lt;</a> --%>
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
<script>
	$("#review").on("click",function(){
	//	window.screen.width
	//	window.screen.height
		
	//	var popupWidth = 500;
	//	var popupHeight = 300;
		
	//	var popupX = (window.screen.width/2)-(popupWidth/2);
	//	var popupY=(window.screen.height/2)-(popupHeight/2);
		var memberNo = ${loginMember.memberNo}
			var url = "${contextPath }/member/${trainerNo}/review";
			var options = "width=500, height=300, resizable=no, scrollbars=no";
			
			window.open(url, "리뷰작성", options);
		
	})
	// 리뷰 작성 여부 확인하기
	$(function(){
		var $td = $("#table tr").eq(1).children().eq(6)
		var $btn =$("<button>"); 
		$.ajax({
			url : "${contextPath}/member/checkReview",
			success : function(result){
				console.log(result)
				if(result==0){
					$td.append($btn);
				}
			}, error : function(){
				console.log("실패")
			}	
		})
		
	})
</script>
    <%@ include file="../common/footer.jsp"%><br>
</body>
</html>