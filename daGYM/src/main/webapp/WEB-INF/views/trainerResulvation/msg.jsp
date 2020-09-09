

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">


<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="Bootstrap UI Kit / Components">
<meta name="keywords" content="bootstrap ui kit, bootstrap components, html5 / css3 ui kit, web ui kit" />
<meta name="author" content="KingStudio.ro">

<!-- favicon -->
<link rel="icon" href="${contextPath}/resources/images/favicon.png">
<!-- page title -->
<title>회원가입</title>

<!-- css -->
<link href="${contextPath}/resources/css/king-ui.css" rel="stylesheet">
<link href="${contextPath}/resources/css/animate.css" rel="stylesheet">
<!-- fonts -->
<link href='https://fonts.googleapis.com/css?family=Lato:300,400,400italic,700' rel='stylesheet' type='text/css'>
<link href="${contextPath}/resources/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href='${contextPath}/resources/fonts/FontAwesome.otf' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="${contextPath}/resources/css/linear-icons.css">
<script src="${contextPath}/resources/js/jquery-3.3.1.min.js"></script>



<style>

	form{
	width : 100%;
	}
	
	#register-form{
	width : 100%;}
	body > header > div > div.logo > a > img{
	width : 150px;}
	#signUp > div{
		margin : 0 auto;
	}
	#register-form{
		width : 500px;
		margin-top : 30px;
		margin-bottom : 30px;
	}
	#forms{
		 background-color: #f5f5f5;
		 height : 800px;
	 }
	#msg{
		margin-top : 300px;
		text-align: center;
	}
</style>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>

<body>
<jsp:include page="../common/header.jsp"/>
<!-- forms -->
<div id="forms" >
    <div class="container">
     
        <div class="row  ">
         <div class="col-md-3 "></div>

            <!-- register form 1 -->
          <div class="col-md-6 " id="msg">
         결제가 성공적으로 완료되었습니다.<br>
         <a href="${contextPath}/trainer/trainerView/${trainerNo}">예약페이지로 이동</a> 
          </div>
               
            </div><!-- / col-sm-6 -->
            <!-- / register form 1 -->
            <div class="col-md-3 "></div>
        </div><!-- / row -->
        <!-- / form 1 -->


    </div><!-- / container -->
</div>
<!-- / forms -->
 <jsp:include page="../common/footer.jsp"/>

	
</body>


</html>
