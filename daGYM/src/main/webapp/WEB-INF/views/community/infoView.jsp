<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>


	<link href="${contextPath }/resources/css/info.css" rel="stylesheet" />

</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	<div class="container" id="content-main">

		<div>
			<hr>
			<div id="board-area">
				
				<!-- Title -->
				<h3 class="mt-4">${board.boardTitle}</h3>
	
				<hr>

				<!-- Writer -->
				<div class="lead">
					작성자 : ${board.boardWriter}<br>
				 	<span class="float-right">조회수 : ${board.views}</span>
					<div id="date-area">
						<fmt:formatDate var='enrollDt' value="${board.boardEnrollDate}" pattern="yy-MM-dd hh:mm:ss" />
						<fmt:formatDate var='modifyDt' value="${board.boardModifyDate}" pattern="yy-MM-dd hh:mm:ss" />
						<p>작성일 : ${enrollDt}</p>
						<p>최근 수정일 : ${modifyDt}</p>
					</div>
					
				</div>

				<hr>

				
				<!-- 이미지 부분 -->
				<c:if test="${!empty files }">

                    <div class="carousel slide m-3" id="carousel-325626">

                        <div class="carousel-inner boardImgArea">


                            <c:forEach var="at" items="${files}" varStatus="vs">
                                <c:set var="src" value="${contextPath}${at.filePath}/${at.fileChangeName}"/>

                                <div class="carousel-item <c:if test="${vs.index == 0}"> active</c:if>">
                                    <img class="d-block w-100 boardImg" src="${src}" />
                                    <input type="hidden" value="${at.fileNo}">
                                </div>
                            </c:forEach>

                        </div> 


                        <a class="carousel-control-prev" href="#carousel-325626" data-slide="prev"><span class="carousel-control-prev-icon"></span> <span class="sr-only">Previous</span></a> <a class="carousel-control-next" href="#carousel-325626" data-slide="next">
                        <span class="carousel-control-next-icon"></span> 
                        <span class="sr-only">Next</span></a>
                    </div>
                </c:if>
				


				<!-- Content -->
				<div id="board-content">
					<% pageContext.setAttribute("newLine", "\n"); %>
			        <% pageContext.setAttribute("newLine", "\n"); %>
                    ${fn:replace(board.boardContent,newLine,"<br>") }
				    ${board.boardContent }
				</div>
				
				<div id="heart_div">
					<img id ="heart">
					<span id="likes"></span>
				</div>
				<hr>
				<jsp:include page="reply.jsp"/>
				
				<div>
					<div class="float-right">
						<a class="btn btn-primary" 
							href="<c:url value="list/"><c:param name="cp" value="${param.cp}"/></c:url>">목록으로</a>
							<!-- 상세 주소 예시 : /1/500?cp=500 -->
							<!-- 목록 주소 예시 : /list/1?cp=1 -->
	                	
	                	<!-- 글 작성자와 로그인한 회원이 같을 경우 -->
	                	<c:if test="${board.boardWriter == loginMember.memberId}">
	                		
	                		<c:url var="updateUrl" value="${board.boardNo}/update">
	                			<c:param name="cp" value="${param.cp}"/>
	                		</c:url>
							<a href="${updateUrl}" class="btn btn-primary ml-1 mr-1">수정</a>
							<button id="deleteBtn" class="btn btn-primary">삭제</button> 

						</c:if>
					</div>
				</div>
			</div>

		</div>
	</div>
	<jsp:include page="../common/footer.jsp"/>
	
	<script>
		$("#deleteBtn").on("click", function(){
			if(confirm("정말 삭제 하시겠습니까?")){
				location.href = "${board.boardNo}/delete"; 
			}
		});
		var loginMember = "${sessionScope.loginMember}";
		
		
	    $(document).ready(function () {
	    	console.log(loginMember == "");

	        var heartval = ${heart};

	        if(heartval>0) {
	            $("#heart").prop("src", "${contextPath}/resources/images/icons/heart.png");
	        }
	        else {
	            $("#heart").prop("src", "${contextPath}/resources/images/icons/no_heart.png");
	        }
	        $("#heart_div").attr('name',heartval) 
	        $("#likes").text("${likesCount}");

	        $("#heart").on("click", function () {
	        	
	        	if (loginMember == "") {
	        		alert("로그인 후 이용해주세요");
	        	} else {
	        		

	            var heart_div = $("#heart_div");

	            var sendData = {'boardNo' : '${board.boardNo}','heart' : heart_div.attr('name')};
	            $.ajax({
	                url :'heart',
	                type :'POST',
	                data : sendData,
	                success : function(map){
	                	heart_div.attr	('name', map.isLikes);
	                    if(map.isLikes == 1) {
	                        $('#heart').prop("src","${contextPath}/resources/images/icons/heart.png");
	                    }
	                    else{
	                        $('#heart').prop("src","${contextPath}/resources/images/icons/no_heart.png");
	                    }
	                    $("#likes").text(map.likesCount);

	                } 
	            }); // ajax
	            
	        }
	        });
	    });
	</script>
</body>
</html>
