<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	#main {
		height: 85px;}
	.card-body {
		font-size: 30px;}
</style>
</head>
<body>
	<div class="container-scroller">
		<jsp:include page="../admin/sidebar.jsp"/>
		
		<div class="container-fluid page-body-wrapper">
			<jsp:include page="../admin/navbar.jsp"/>
			
			<div class="main-panel">
				<div class="content-wrapper">
					<div class="row">
			              <div class="col-12 grid-margin stretch-card" id="main">
			                <div class="card corona-gradient-card">
			                  <div class="card-body py-0 px-0 px-sm-3">
			                    <div class="row align-items-center mt-3">
			                      <div class="col-4 col-sm-3 col-xl-2">
			                      </div>
			                      <div class="col-5 col-sm-7 col-xl-8 p-0">
			                        <h4 class="mb-1 mb-sm-0">현재 페이지는 관리자만 접근 가능한 페이지입니다.</h4>
			                        <p class="mb-0 font-weight-normal d-none d-sm-block" style="line-height: 30px;">좌측에 상세 메뉴를 이용하세요 !</p>
			                      </div>
			                      <div class="col-3 col-sm-2 col-xl-2 pl-0 text-center">
			                        <span>
			                          <a href="${contextPath}" target="_blank" class="btn btn-outline-light btn-rounded get-started-btn">홈페이지 새 창으로 열기</a>
			                        </span>
			                      </div>
			                    </div>
			                  </div>
			                </div>
			              </div>
		            </div>
		            
					<div class="row">
						<div class="col-sm-6 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<span>전체 회원 : </span>
									<span id="member">&nbsp;</span> 명
								</div>
							</div>
						</div>
						<div class="col-sm-6 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<span>전체 트레이너 : </span>
									<span id="trainer">&nbsp;</span> 명
								</div>
							</div>
						</div>
					</div>
				</div>
				
				<jsp:include page="../admin/footer.jsp"/>
			</div>
		</div>
	</div>
	
	<script>
		$(function() {
			$.ajax({
				url : "count",
				dataType : "JSON",
				success : function(list) {
					$("#member").text(list[0]);
					$("#trainer").text(list[1]);
				}, error : function() {
					console.log("통신 실패");
				}
			});
		});
	</script>
</body>
</html>