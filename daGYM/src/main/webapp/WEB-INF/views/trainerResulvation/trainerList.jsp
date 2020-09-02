<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application" />
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	<!-- Trainer Section Begin -->
    <section class="trainer-section spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h2>EXPERT TRAINERS</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4 col-md-6">
                    <div class="single-trainer-item">
                    <c:forEach var="trainer" items="${trainerList}">
                    <a href="${contextPath}/trainer/trainerView/${trainer.trainerNo}">
                        <img src="${contextPath}/resources/img/trainer/trainer-1.jpg" alt="">
                        <div class="trainer-text">
                            <h5>${trainer.trainerName}</h5>
                            <span>Leader</span>
                            <p>non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat
                                voluptatem.</p>
                       
                        </div>
                        </a>
                       </c:forEach>
                    </div>
                </div>
          
              
            </div>
        </div>
    </section>
    <!-- Trainer Section End -->
	<jsp:include page="../common/footer.jsp"/>
</body>
<script>
	$(function(){
			$(".single-trainer-item a").on("click", function(){
				// 글번호
				var boardNo = $(this).parent().children().eq(0).text();
				
				// 게시글 상세조회 요청 주소
				var boardUrl = "${contextPath}/board/${pInfo.boardType}/"+ boardNo + "?cp=${pInfo.currentPage}";
				
				// @PathVariable 방식 : 구분되어야 하는 리소스를 호출하는 url로 사용
				// spring/board/1/500?cp=3
				
				// 파라미터(쿼리스트링) : 정렬, 필터링
				// spring/board?type=1&boardNo=500&cp=3
				
			// 게시글 상세 조회 요청
			location.href = boardUrl;
			});
		});
</script>
</html>