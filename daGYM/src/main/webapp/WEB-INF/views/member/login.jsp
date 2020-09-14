<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">


<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<head>
	<title>Login</title>
	<style>
		#findId{
			margin: 40px;
		}
		#btn-area{
			padding-top: 10px;
		}
	</style>
	<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application" />
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
	<link rel="icon" type="image/png" href="${contextPath}/resources/css/images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/vendor/animate/animate.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/util.css">
	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/main.css">
<!--===============================================================================================-->
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-b-30">
				<form action="loginAction" method="POST" class="login100-form validate-form">
					<span class="login100-form-title p-b-40">
						Login
					</span>

					<div class="wrap-input100 validate-input m-b-16" data-validate="Please enter email: ex@abc.xyz">
						<input class="input100" type="text" name="memberId" placeholder="Id">
						<span class="focus-input100"></span>
					</div>

					<div class="wrap-input100 validate-input m-b-20" data-validate = "Please enter password">
						<span class="btn-show-pass">
							<i class="fa fa fa-eye"></i>
						</span>
						<input class="input100" type="password" name="memberPwd" placeholder="Password">
						<span class="focus-input100"></span>
						
					</div>
						<a href="findIdView" id="findId" class="txt2 bo2 hov1">
							아이디찾기
						</a>
						<a href="findPwView" id="findPw" class="txt2 bo2 hov1">
							비밀번호찾기
						</a>

					<div class="container-login100-form-btn" id="btn-area">
						<button class="login100-form-btn">
							Login
						</button>
					</div>

					<div class="flex-col-c ">
						<span class="txt2 p-t-10 p-b-10">
							Don’t have an account?
						</span>

						<a href="signUp" class="txt3 bo1 hov1">
							Sign up now
						</a>
					</div>

				</form>
			</div>
		</div>
	</div>


<!--===============================================================================================-->
	<script src="${contextPath}/resources/css/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="${contextPath}/resources/css/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="${contextPath}/resources/css/vendor/bootstrap/js/popper.js"></script>
	<script src="${contextPath}/resources/css/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="${contextPath}/resources/css/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="${contextPath}/resources/css/vendor/daterangepicker/moment.min.js"></script>
	<script src="${contextPath}/resources/css/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="${contextPath}/resources/css/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="${contextPath}/resources/css/js/mainlogin.js"></script>
	<!-- Global site tag (gtag.js) - Google Analytics -->
	<script async src="https://www.googletagmanager.com/gtag/js?id=UA-23581568-13"></script>
	<script>
	  window.dataLayer = window.dataLayer || [];
	  function gtag(){dataLayer.push(arguments);}
	  gtag('js', new Date());

	  gtag('config', 'UA-23581568-13');
	</script>
	<jsp:include page="../common/footer.jsp"/>
</body>

</html>
