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
              <c:forEach var="trainer" items="${trainerList}">
            
                <div class="col-lg-4 col-md-6">
                    <div class="single-trainer-item">     
                    <a href="${contextPath}/trainer/trainerView/${trainer.trainerNo}">
                        <img src="${contextPath}/resources/img/trainer/trainer-1.jpg" alt="">
                        <div class="trainer-text">
                            <h5>${trainer.trainerName}</h5>
                            <span>Leader</span>
                            <p>Phone: ${trainer.trainerPhone}</p>
                            <p>회원 수: ${trainer.trainerMcnt}</p>
                      	    <p>경력: ${trainer.trainerCareer}년</p>
                      	    <p>PT(기본 10회)가격: ${trainer.trainerPrice}원</p>
                        </div>
                        </a>
                      
                    </div>
                </div>
            
          		 </c:forEach>            
            </div>
        </div>
    </section>
    <!-- Trainer Section End -->
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>