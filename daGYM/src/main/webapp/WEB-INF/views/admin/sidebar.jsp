<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>관리자 페이지</title>

	<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application" />
	
	<link rel="stylesheet" href="${contextPath}/resources/css/bootstrap.min.css" type="text/css">

    <link rel="stylesheet" href="${contextPath}/resources/css/admin/style.css">
    <!-- plugins:css -->
    <link rel="stylesheet" href="${contextPath}/resources/css/admin/materialdesignicons.min.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/admin/vendor.bundle.base.css">
    <!-- endinject -->
    <!-- Plugin css for this page -->
    <link rel="stylesheet" href="${contextPath}/resources/css/admin/jquery-jvectormap.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/admin/flag-icon.min.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/admin/owl.carousel.min.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/admin/owl.theme.default.min.css">
</head>
<body>
<nav class="sidebar sidebar-offcanvas" id="sidebar">
  <div class="sidebar-brand-wrapper d-none d-lg-flex align-items-center justify-content-center fixed-top">
    <a class="sidebar-brand brand-logo" href="${contextPath}"><img src="${contextPath}/resources/img/logo3.png"></a>
    <a class="sidebar-brand brand-logo-mini" href="${contextPath}"><img src="${contextPath}/resources/img/logo3_mini.png"></a>
  </div>
  <ul class="nav">
    <li class="nav-item nav-category">
      <span class="nav-link">Navigation</span>
    </li>
    <li class="nav-item menu-items">
      <a class="nav-link" href="#">
        <span class="menu-title">전체 스케줄 조회</span>
      </a>
    </li>
    <li class="nav-item menu-items">
      <a class="nav-link" data-toggle="collapse" href="#ui-basic" aria-expanded="false" aria-controls="ui-basic">
        <span class="menu-title">회원&트레이너 조회 ▽</span>
      </a>
      <div class="collapse" id="ui-basic">
        <ul class="nav flex-column sub-menu">
          <li class="nav-item"> <a class="nav-link" href="trainerList">트레이너 조회</a></li>
          <li class="nav-item"> <a class="nav-link" href="memberList">회원 조회</a></li>
        </ul>
      </div>
    </li>
    <li class="nav-item menu-items">
      <a class="nav-link" data-toggle="collapse" href="#auth" aria-expanded="false" aria-controls="auth">
        <span class="menu-title">매출 조회 ▽</span>
      </a>
      <div class="collapse" id="auth">
        <ul class="nav flex-column sub-menu">
          <li class="nav-item"> <a class="nav-link" href="pages/samples/blank-page.html">트레이너별 매출</a></li>
          <li class="nav-item"> <a class="nav-link" href="pages/samples/error-404.html">월별 매출</a></li>
        </ul>
      </div>
    </li>
    <li class="nav-item menu-items">
      <a class="nav-link" href="documentation">
        <span class="menu-title">1:1 문의 조회</span>
      </a>
    </li>
    <li class="nav-item menu-items">
      <a class="nav-link" href="documentation">
        <span class="menu-title">이벤트 조회</span>
      </a>
    </li>
  </ul>
</nav>
	<!-- plugins:js -->
    <script src="${contextPath}/resources/js/admin/vendor.bundle.base.js"></script>
    <!-- endinject -->
    <!-- Plugin js for this page -->
    <script src="${contextPath}/resources/js/admin/Chart.min.js"></script>
    <script src="${contextPath}/resources/js/admin/progressbar.min.js"></script>
    <script src="${contextPath}/resources/js/admin/jquery-jvectormap.min.js"></script>
    <script src="${contextPath}/resources/js/admin/jquery-jvectormap-world-mill-en.js"></script>
    <script src="${contextPath}/resources/js/admin/owl.carousel.min.js"></script>
    <!-- End plugin js for this page -->
    <!-- inject:js -->
    <script src="${contextPath}/resources/js/admin/off-canvas.js"></script>
    <script src="${contextPath}/resources/js/admin/hoverable-collapse.js"></script>
    <script src="${contextPath}/resources/js/admin/misc.js"></script>
    <script src="${contextPath}/resources/js/admin/settings.js"></script>
    <script src="${contextPath}/resources/js/admin/todolist.js"></script>
    <!-- endinject -->
    <!-- Custom js for this page -->
    <script src="${contextPath}/resources/js/admin/dashboard.js"></script>
    <!-- End custom js for this page -->
</body>
</html>