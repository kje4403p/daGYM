<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<nav class="navbar p-0 fixed-top d-flex flex-row">
  <div class="navbar-brand-wrapper d-flex d-lg-none align-items-center justify-content-center">
    <a class="navbar-brand brand-logo-mini" href="${contextPath}/admin/adminView"><img src="${contextPath}/resources/img/logo3_mini.png" style="width: 45px; height: 37px;"></a>
  </div>
  <div class="navbar-menu-wrapper flex-grow d-flex align-items-stretch">
    <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-toggle="minimize">
      <span class="mdi"><img src="${contextPath}/resources/img/list2.png" style="width: 25px;"></span>
    </button>
	
    <ul class="navbar-nav navbar-nav-right">
      <li class="nav-item">
        <!-- <a class="nav-link btn btn-success create-new-button" aria-expanded="false" href="insertTrainer2">+ 트레이너 추가하기(ver1)</a> -->
        <a class="nav-link btn btn-success create-new-button" aria-expanded="false" href="${contextPath}/admin/insertTrainer">+ 트레이너 추가하기</a>
      </li> 
      <li class="nav-item dropdown d-none d-lg-block">
        <a class="nav-link btn btn-success create-new-button" id="createbuttonDropdown" data-toggle="dropdown" aria-expanded="false" href="#">+ 새 글 작성하기</a>
        <div class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list" aria-labelledby="createbuttonDropdown">
          <a class="dropdown-item preview-item" href="${contextPath}/info/insert?boardType=2">
            <div class="preview-item-content">
              <p class="preview-subject ellipsis mb-1">정보 게시판</p>
            </div>
          </a>
          <a class="dropdown-item preview-item" href="${contextPath}/admin/insertEventView">
            <div class="preview-item-content">
              <p class="preview-subject ellipsis mb-1">이벤트 게시판</p>
            </div>
          </a>
          <a class="dropdown-item preview-item" href="${contextPath}/service/4/insert">
            <div class="preview-item-content">
              <p class="preview-subject ellipsis mb-1">자주 묻는 질문</p>
            </div>
          </a>
        </div>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link" id="profileDropdown" href="#" data-toggle="dropdown">
          <div class="navbar-profile">
            <p class="mb-0 d-none d-sm-block navbar-profile-name">관리자 ▽</p>
          </div>
        </a>
        <div class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list" aria-labelledby="profileDropdown">
          <a class="dropdown-item preview-item" href="${contextPath}">
            <div class="preview-item-content">
              <p class="preview-subject mb-1">홈페이지로 돌아가기</p>
            </div>
          </a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item preview-item" href="logout">
            <div class="preview-item-content">
              <p class="preview-subject mb-1">Logout</p>
            </div>
          </a>
        </div>
      </li>
    </ul>
    <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
      <span><img src="${contextPath}/resources/img/list2.png" style="width: 25px;"></span>
    </button>
  </div>
</nav>
</body>
</html>