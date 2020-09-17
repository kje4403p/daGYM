<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
	<link href= "${contextPath}/resources/css/info.css" rel="stylesheet"  type="text/css"/>

</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	<div class="container board-list">

        <div>
            <table class="table" id="list-table">
                <thead>
                    <tr>
                        <th>글번호 </th>
                        <th>제목</th>
                        <th>작성자</th>
                        <th>조회수</th>
                        <th>작성일</th>
                    </tr>
                </thead>
                <tbody>
                	<!-- BEST -->
                	
               		<c:forEach var="board" items="${bestInfoList}">
                			<!-- boardList에 있는 요소를 반복 접근하여
                				 board라는 변수에 저장하여 내부에서 사용 -->
	                		<tr class="best">
	                			<td><span class="best-icon">best</span></td>
	                			<td>
	                				${board.boardTitle }
	                			</td>
	                			<td>${board.boardWriter}</td>
	                			<td>${board.views}</td>
	                			<td>
               						<jsp:useBean id="now" class="java.util.Date"/>
               						<fmt:formatDate var="today" value="${now}" pattern="yyyy-MM-dd"/>
               						<fmt:formatDate var="createDate" value="${board.boardEnrollDate}" pattern="yyyy-MM-dd"/>
               						<fmt:formatDate var="createTime" value="${board.boardEnrollDate}" pattern="hh:mm:ss"/>
	                				<c:choose>
	                					<c:when test="${today == createDate }">
	                						${createTime }
	                					</c:when>
	                					<c:otherwise>		
	                						${createDate }
	                					</c:otherwise>
	                				</c:choose>
	                			</td>
	                		</tr>
                		</c:forEach>
                	<c:choose>
                		<c:when test="${empty infoList}">
                			<tr><td colspan="6">존재하는 게시글이 없습니다.</td></tr>
                		</c:when>
	                	<c:otherwise>
	                		<c:forEach var="board" items="${infoList}">
	                			<!-- boardList에 있는 요소를 반복 접근하여
	                				 board라는 변수에 저장하여 내부에서 사용 -->
		                		<tr>
		                			<td>${board.boardNo }</td>
		                			<td>
		                				${board.boardTitle }
		                			</td>
		                			<td>${board.boardWriter}</td>
		                			<td>${board.views}</td>
		                			<td>
<%-- 		                			    <jsp:useBean id="now" class="java.util.Date"/>
                						<fmt:formatDate var="today" value="${now}" pattern="yyyy-MM-dd"/> --%>
                						<fmt:formatDate var="createDate" value="${board.boardEnrollDate}" pattern="yyyy-MM-dd"/>
                						<fmt:formatDate var="createTime" value="${board.boardEnrollDate}" pattern="hh:mm:ss"/> 
		                				<c:choose>
		                					<c:when test="${today == createDate }">
		                						${createTime }
		                					</c:when>
		                					<c:otherwise>		
		                						${createDate }
		                					</c:otherwise>
		                				</c:choose>
		                			</td>
		                		</tr>
	                		</c:forEach>
	                	</c:otherwise>
    	            </c:choose>
                	
                </tbody>
            </table>
        </div>

        <hr>
        
        <%-- 로그인이 되어있는 경우에만 글쓰기 버튼 보이게 하기 --%>
        <c:if test="${!empty loginMember }">
			<a class="btn btn-primary float-right" href="insert?boardType=2">글쓰기</a>
		</c:if>
      	<!--------------------------------- 페이징바  ---------------------------------->
      	
      	<%-- 검색 파라미터가 포함된 url 생성 --%>
      	<c:url var="searchParameter" value="list">
      		
      		<c:if test="${! empty param.sVal }">
      			<c:param name="sKey" value="${param.sKey }"/>
      			<c:param name="sVal" value="${param.sVal }"/>
      		</c:if>
      	</c:url>
      	
      	<c:choose>
      		<%--검색 조건 존재하는 경우(파라미터 cp가 쿼리스트링 제일 마지막에 추가될 수 있도록 '&'기호 추가 --%>
      		<c:when test="${! empty param.sVal }">
      			<c:set var="url" value="${searchParameter}&cp="/>
 			    <c:set var="listUrl" value="../search/${url}${pInfo.currentPage }" scope="session"/>
      			
      		</c:when>
      		
      		<%-- 검색 조건이 존재하지 않는 경우(파라미터 cp가 쿼리스트링 제일 마지막에 추가될 수 있도록 '?'기호 추가 --%>
      		<c:otherwise>
      			<c:set var="url" value="${contextPath}/info/list?cp="/>
      			<c:set var="listUrl" value="../list/${url}${pInfo.currentPage }" scope="session"/>
      		</c:otherwise>
      	</c:choose>
      	
	      
		<div class="my-4">
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
	                	<c:set var="prev" value="${operand1 * 10 }"></c:set>
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
	                	<fmt:parseNumber var="operand2" value="${(pInfo.currentPage + pInfo.pagingBarSize - 1)/pInfo.pagingBarSize}" integerOnly="true"/>
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

        <div>
           <div  class="text-center" id="searchForm" style="margin-bottom:100px;">
                <br>
                <select name="sKey" class="form-control" style="width:100px; display: inline-block;">
                    <option value="tit">글제목</option>
                    <option value="con">내용</option>
                    <option value="tit-con">제목+내용</option>
				</select>
                <input type="text" name="sVal" class="form-control" style="width:25%; display: inline-block;">
                <button class="form-control btn btn-primary" id="searchBtn" type="button" style="width:100px; display: inline-block;">검색</button>
            </div>
        </div>
   	
	</div>
	<jsp:include page="../common/footer.jsp"/>
	
	<script>
	// 게시글 상세 보기 기능 구현
	$(function(){
		$("#list-table td").on("click", function(){
			// 글번호
			var boardNo = $(this).parent().children().eq(0).text();
			
			var boardUrl = boardNo + "?cp=${pInfo.currentPage}";
			
			
			// @pathValue 방식 : 구분되어야 하는 리소스를 호출하는 url로 사용
			
			location.href = boardUrl;
		});
	});
		
	
	// --------------------------------- 검색 버튼 동작 -----------------------------------
	
	$("#searchBtn").on("click", function(){
		// 검색 값에 따라 url을 조합하여 저장할 변수
		var searchUrl = "${contextPath}/info/list?";
		
		var $sKey = $("select[name='sKey']");
		var $sVal = $("input[name='sVal']");
		
		
		// 1) 검색에 필요한 카테고리 또는 검색어가 입력 되었는지 확인
		// - 입력이 되지 않은 경우 -> 해당 게시판 첫 페이지로 돌아가는 url
		// - 하나라도 입력된 경우 -> 검색 url 생성(쿼리스트링 조합 작업 필요) 
		
		// 선택된 카테고리의 개수가 0이고, 입력된 검색어의 길이가 0인경우
		// == 카테고리 체크 x, 검색어 입력 x 상태로 검색버튼을 클릭한 경우
		// -> 해당 게시판의 첫 페이지로 이동
/* 		if ($sVal.val().trim().length == 0) {
			location.reload();
		}  */
		
		if ($sVal.val().trim().length <= 1) {
			alert("두 글자 이상 입력해주세요");
		} 

		
		// 카테고리가 체크 되었거나, 검색어가 입력돈 경우 또는 둘다
		else {
			
			// 검색어가 입력된 경우
			if ($sVal.val().trim().length != 0) {
				searchUrl += "sKey=" + $sKey.val() + "&sVal=" + $sVal.val();
			}	
			
		location.href = searchUrl;
		} // else end
		
		
		// 2) location.href를 통해 검색 요청 전달
		
	});
      		
    // ------------------ 검색 값 유지 -----------------------------------
    
    $(function(){
    	var sKey = "${param.sKey}";
    	var sVal = "${param.sVal}";
    	// EL 구문에서 값이 없을 경우 ""(빈문자열)이 반환됨
    	
    	if (sKey != "" && sVal != "") {
    		// 검색어 세팅
    		$("input[name='sVal']").val(sVal);
    		console.log(sVal);
    		
    		// 검색 조건 세팅
    		$("select[name='sKey'] > option").each(function(index, item){
    			if ($(item).val() == sKey) {
    				$(item).prop("selected", true);
    			}
    		});
    	}
    	
    	// HTML, JS, jQuery, Scriptlet(Java), EL / JSTL
    	// 서버 동작 시 JSP 파일 코드 해석 순서
    	// 1) Java, 2) EL/JSTL, 3) HTML, 4) JS/jQuery
    	
    });
    
    // ----------------- 검색창 엔터 이벤트 -----------------------
    $("input[name='sVal']").on("keyup", function(event){
    	console.log(event.keyCode); // 키업 이벤트가 발생할 경우 입력한 키코드 출력됨
    	if (event.keyCode == 13) { // 엔터키가 눌러진 경우
    		$("#searchBtn").click();
    	}
    });
	</script>
	
	
	
</body>
</html>