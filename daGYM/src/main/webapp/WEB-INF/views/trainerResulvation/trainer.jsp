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
                    <a href="#">
                        <img src="${contextPath}/resources/img/trainer/trainer-1.jpg" alt="">
                        <div class="trainer-text">
                            <h5>Patrick Cortez</h5>
                            <span>Leader</span>
                            <p>non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat
                                voluptatem.</p>
                       
                        </div>
                        </a>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="single-trainer-item">
                    <a href="#">
                        <img src="${contextPath}/resources/img/trainer/trainer-2.jpg" alt="">
                        <div class="trainer-text">
                            <h5>Gregory Powers</h5>
                            <span>Gym coach</span>
                            <p>non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat
                                voluptatem.</p>
                    
                        </div>
                        </a>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="single-trainer-item">
                    <a href="#">
                        <img src="${contextPath}/resources/img/trainer/trainer-3.jpg" alt="">
                        <div class="trainer-text">
                            <h5>Walter Wagner</h5>
                            <span>Dance trainer</span>
                            <p>non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat
                                voluptatem.</p>
    
                        </div>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Trainer Section End -->
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>