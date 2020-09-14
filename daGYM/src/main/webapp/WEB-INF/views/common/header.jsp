
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zxx">

<head>
 	<meta charset="UTF-8">
    <meta name="description" content="Gutim Template">
    <meta name="keywords" content="Gutim, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>Gutim | Template</title>
	<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application" />
	 <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900&display=swap"
        rel="stylesheet">
	<!-- context Path를 프로젝트 전체에서 간단히 사용할 수 있도록 변수 선언 -->
	<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application" />
   <!-- Css Styles -->
    <link rel="stylesheet" href="${contextPath}/resources/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="${contextPath}/resources/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="${contextPath}/resources/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="${contextPath}/resources/css/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="${contextPath}/resources/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="${contextPath}/resources/css/style.css" type="text/css">
	<!-- swal -->
	 <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

</head>
<body>
<c:if test="${!empty msg }">
		<script>
			swal({icon : "${status}",title : "${msg}", text : "${text}"});
			
		</script>
		<c:remove var="msg"/>
		<c:remove var="status"/>
		<c:remove var="text"/>
	</c:if>
    <!-- Header Section Begin -->
    <header class="header-section">
        <div class="container">
            <div class="logo">
                <a href="${contextPath}">
                    <img src="${contextPath}/resources/img/logo3.png" alt="" width="150px">
                </a>
            </div>
            <div class="nav-menu">
                <nav class="mainmenu mobile-menu">
                    <ul>
                    	
                        <li><a href="${contextPath}/intro">소개</a></li>
                        <li><a href="${contextPath}/trainer/trainerList">트레이너 예약</a></li>
                        <li><a href="${contextPath }/event/list">커뮤니티</a></li>
                        <li><a href="${contextPath}/service/faq/4">고객센터</a></li>
                    </ul>
                </nav>
                <c:choose>
                		<c:when test="${empty loginMember }">
                			 <a href="${contextPath}/member/login" class="primary-btn signup-btn">Login</a>
                			
                		</c:when>
                		<c:otherwise>
                			<c:if test="${loginMember.memberGrade == 'G' || loginMember.memberGrade == 'T'}"> 
                				<a href="${contextPath}/member/myPage" class="primary-btn signup-btn">Mypage</a>
                		 	</c:if>
                		 	<c:if test="${loginMember.memberGrade == 'A'}">
			                	<a href="${contextPath}/admin/adminView" class="primary-btn signup-btn">관리자 페이지</a>
			                </c:if>
                		 	<a href="${contextPath}/member/logout" class="primary-btn signup-btn">Logout</a>
                		</c:otherwise>
                </c:choose>
                    	
            </div>
            <div id="mobile-menu-wrap"></div>
        </div>
    </header>
    <!-- Header End -->

    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="${contextPath}/resources/img/breadcrumb/classes-breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-text">
                      
                        <div class="breadcrumb-option">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->
    <!-- Js Plugins -->
    <script src="${contextPath}/resources/js/jquery-3.3.1.min.js"></script>
    <script src="${contextPath}/resources/js/bootstrap.min.js"></script>
    <script src="${contextPath}/resources/js/jquery.magnific-popup.min.js"></script>
    <script src="${contextPath}/resources/js/mixitup.min.js"></script>
    <script src="${contextPath}/resources/js/jquery.slicknav.js"></script>
    <script src="${contextPath}/resources/js/owl.carousel.min.js"></script>
    <script src="${contextPath}/resources/js/main.js"></script>
</body>

</html>