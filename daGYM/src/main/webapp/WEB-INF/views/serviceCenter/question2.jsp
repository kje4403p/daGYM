<%@page import="com.kh.dagym.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML>
<html>
	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>unapp Template</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="" />
	<meta name="keywords" content="" />
	<meta name="author" content="" />

  <!-- Facebook and Twitter integration -->
	<meta property="og:title" content=""/>
	<meta property="og:image" content=""/>
	<meta property="og:url" content=""/>
	<meta property="og:site_name" content=""/>
	<meta property="og:description" content=""/>
	<meta name="twitter:title" content="" />
	<meta name="twitter:image" content="" />
	<meta name="twitter:url" content="" />
	<meta name="twitter:card" content="" />
<style>
}
#body1{
	height:1300px;
}

#d1 {
	height: 80%;
	width: 100%;
	/* border: 1px solid black; */
	background: linear-gradient(45deg, #49a09d, #5f2c82);
	box-sizing: border-box;
}

#left {
	width: 15%;
	height: 100%;
	float: left;
	box-sizing: border-box;
}

#right {
	width: 85%;
	height: 100%;
	float: left;
}

@import url('https://fonts.googleapis.com/css?family=Poppins:400,500,600,700&display=swap');
*{
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: 'Poppins', sans-serif;
}
.wrapper{
  height: 100%;
  width: 300px;
  position: relative;
}
.wrapper .menu-btn{
  position: absolute;
  left: 20px;
  top: 10px;
  background: #4a4a4a;
  color: #fff;
  height: 45px;
  width: 45px;
  z-index: 9999;
  border: 1px solid #333;
  border-radius: 5px;
  cursor: pointer;
  display: flex;
  align-items: center;
  justify-content: center;
  transition: all 0.3s ease;
}
#btn:checked ~ .menu-btn{
  left: 247px;
}
.wrapper .menu-btn i{
  position: absolute;
  transform: ;
  font-size: 23px;
  transition: all 0.3s ease;
}
.wrapper .menu-btn i.fa-times{
  opacity: 0;
}
#btn:checked ~ .menu-btn i.fa-times{
  opacity: 1;
  transform: rotate(-180deg);
}
#btn:checked ~ .menu-btn i.fa-bars{
  opacity: 0;
  transform: rotate(180deg);
}
#sidebar{
  position: relative;
  background: #404040;
  height: 100%;
  width: 270px;
  overflow: hidden;
  left: -270px;
  transition: all 0.3s ease;
}
#btn:checked ~ #sidebar{
  left: 0;
}
#sidebar .title{
  line-height: 65px;
  text-align: center;
  background: #333;
  font-size: 25px;
  font-weight: 600;
  color: #f2f2f2;
  border-bottom: 1px solid #222;
}
#sidebar .list-items{
  position: relative;
  background: #404040;
  width: 100%;
  height: 100%;
  list-style: none;
}
#sidebar .list-items li{
  padding-left: 40px;
  line-height: 50px;
  border-top: 1px solid rgba(255,255,255,0.1);
  border-bottom: 1px solid #333;
  transition: all 0.3s ease;
}
#sidebar .list-items li:hover{
  border-top: 1px solid transparent;
  border-bottom: 1px solid transparent;
  box-shadow: 0 0px 10px 3px #222;
}
#sidebar .list-items li:first-child{
  border-top: none;
}
#sidebar .list-items li a{
  color: #f2f2f2;
  text-decoration: none;
  font-size: 18px;
  font-weight: 500;
  height: 100%;
  width: 100%;
  display: block;
}
#sidebar .list-items li a i{
  margin-right: 20px;
}
#sidebar .list-items .icons{
  width: 100%;
  height: 40px;
  text-align: center;
  position: absolute;
  bottom: 100px;
  line-height: 40px;
  display: flex;
  align-items: center;
  justify-content: center;
}
#sidebar .list-items .icons a{
  height: 100%;
  width: 40px;
  display: block;
  margin: 0 5px;
  font-size: 18px;
  color: #f2f2f2;
  background: #4a4a4a;
  border-radius: 5px;
  border: 1px solid #383838;
  transition: all 0.3s ease;
}
#sidebar .list-items .icons a:hover{
  background: #404040;
}
.list-items .icons a:first-child{
  margin-left: 0px;
}
.content{
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%,-50%);
  color: #202020;
  z-index: -1;
  width: 100%;
  text-align: center;
}
.content .header{
  font-size: 45px;
  font-weight: 700;
}
.content p{
  font-size: 40px;
  font-weight: 700;
}

</style>
	<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Nunito:200,300,400" rel="stylesheet">
	
	<!-- Animate.css -->
	<link rel="stylesheet" href="${contextPath}/resources/css/service/quest2/animate.css">
	<!-- Icomoon Icon Fonts-->
	<link rel="stylesheet" href="${contextPath}/resources/css/service/quest2/icomoon.css">
	<!-- Bootstrap  -->
	<link rel="stylesheet" href="${contextPath}/resources/css/service/quest2/bootstrap.css">

	<!-- Magnific Popup -->
	<link rel="stylesheet" href="${contextPath}/resources/css/service/quest2/magnific-popup.css">

	<!-- Owl Carousel -->
	<link rel="stylesheet" href="${contextPath}/resources/css/service/quest2/owl.carousel.min.css">
	<link rel="stylesheet" href="${contextPath}/resources/css/service/quest2/owl.theme.default.min.css">

	<!-- Theme style  -->
	<link rel="stylesheet" href="${contextPath}/resources/css/service/quest2/style.css">

	<!-- Modernizr JS -->
	<script src="js/modernizr-2.6.2.min.js"></script>
	<!-- FOR IE9 below -->
	<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->

	</head>
	<body id="body1">
		<jsp:include page="../common/header.jsp" />
		
<div id="d1">

	<!-- <div id="left">
		
		
	</div> -->

<div id ="right">
	<div class="colorlib-loader"></div>

	<div id="page">
		

		<div class="colorlib-blog">
		<jsp:include page="sideMenu.jsp" />
			<div class="container">
				<div class="row">
					<div class="col-md-4 animate-box">
						<article>
							<h2><a href="#">Building the Mention Sales Application on Unapp</a></h2>
							<p class="admin"><span>May 12, 2018</span></p>
							<p>Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life</p>
							<p class="author-wrap"><a href="#" class="author-img" style="background-image: url(images/person1.jpg);"></a> <a href="#" class="author">by Dave Miller</a></p>
						</article>
					</div>
					<div class="col-md-4 animate-box">
						<article>
							<h2><a href="#">Building the Mention Sales Application on Unapp</a></h2>
							<p class="admin"><span>May 12, 2018</span></p>
							<p>Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life</p>
							<p class="author-wrap"><a href="#" class="author-img" style="background-image: url(images/person2.jpg);"></a> <a href="#" class="author">by Dave Miller</a></p>
						</article>
					</div>
					<div class="col-md-4 animate-box">
						<article>
							<h2><a href="#">Building the Mention Sales Application on Unapp</a></h2>
							<p class="admin"><span>May 12, 2018</span></p>
							<p>Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life</p>
							<p class="author-wrap"><a href="#" class="author-img" style="background-image: url(images/person3.jpg);"></a> <a href="#" class="author">by Dave Miller</a></p>
						</article>
					</div>
				</div>

				<div class="row">
					<div class="col-md-4 animate-box">
						<article>
							<h2><a href="#">Building the Mention Sales Application on Unapp</a></h2>
							<p class="admin"><span>May 12, 2018</span></p>
							<p>Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life</p>
							<p class="author-wrap"><a href="#" class="author-img" style="background-image: url(images/person1.jpg);"></a> <a href="#" class="author">by Dave Miller</a></p>
						</article>
					</div>
					<div class="col-md-4 animate-box">
						<article>
							<h2><a href="#">Building the Mention Sales Application on Unapp</a></h2>
							<p class="admin"><span>May 12, 2018</span></p>
							<p>Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life</p>
							<p class="author-wrap"><a href="#" class="author-img" style="background-image: url(images/person2.jpg);"></a> <a href="#" class="author">by Dave Miller</a></p>
						</article>
					</div>
					<div class="col-md-4 animate-box">
						<article>
							<h2><a href="#">Building the Mention Sales Application on Unapp</a></h2>
							<p class="admin"><span>May 12, 2018</span></p>
							<p>Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life</p>
							<p class="author-wrap"><a href="#" class="author-img" style="background-image: url(images/person3.jpg);"></a> <a href="#" class="author">by Dave Miller</a></p>
						</article>
					</div>
				</div>

				<div class="row">
					<div class="col-md-4 animate-box">
						<article>
							<h2><a href="#">Building the Mention Sales Application on Unapp</a></h2>
							<p class="admin"><span>May 12, 2018</span></p>
							<p>Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life</p>
							<p class="author-wrap"><a href="#" class="author-img" style="background-image: url(images/person1.jpg);"></a> <a href="#" class="author">by Dave Miller</a></p>
						</article>
					</div>
					<div class="col-md-4 animate-box">
						<article>
							<h2><a href="#">Building the Mention Sales Application on Unapp</a></h2>
							<p class="admin"><span>May 12, 2018</span></p>
							<p>Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life</p>
							<p class="author-wrap"><a href="#" class="author-img" style="background-image: url(images/person2.jpg);"></a> <a href="#" class="author">by Dave Miller</a></p>
						</article>
					</div>
					<div class="col-md-4 animate-box">
						<article>
							<h2><a href="#">Building the Mention Sales Application on Unapp</a></h2>
							<p class="admin"><span>May 12, 2018</span></p>
							<p>Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life</p>
							<p class="author-wrap"><a href="#" class="author-img" style="background-image: url(images/person3.jpg);"></a> <a href="#" class="author">by Dave Miller</a></p>
						</article>
					</div>
				</div>

				<div class="row">
					<div class="col-md-12 text-center">
						<ul class="pagination">
							<li class="disabled"><a href="#">&laquo;</a></li>
							<li class="active"><a href="#">1</a></li>
							<li><a href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li><a href="#">4</a></li>
							<li><a href="#">&raquo;</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>

			<jsp:include page="../common/footer.jsp" />
		
	</div>

	<div class="gototop js-top">
		<a href="#" class="js-gotop"><i class="icon-arrow-up2"></i></a>
	</div>
</div><!-- rigth종료 -->

</div><!-- d1종료 -->
	<!-- jQuery -->
	<script src="${contextPath}/resources/js/service/quest2/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script src="${contextPath}/resources/js/service/quest2/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="${contextPath}/resources/js/service/quest2/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script src="${contextPath}/resources/js/service/quest2/jquery.waypoints.min.js"></script>
	<!-- Stellar Parallax -->
	<script src="${contextPath}/resources/js/service/quest2/jquery.stellar.min.js"></script>
	<!-- YTPlayer -->
	<script src="${contextPath}/resources/js/service/quest2/jquery.mb.YTPlayer.min.js"></script>
	<!-- Owl carousel -->
	<script src="${contextPath}/resources/js/service/quest2/owl.carousel.min.js"></script>
	<!-- Magnific Popup -->
	<script src="${contextPath}/resources/js/service/quest2/jquery.magnific-popup.min.js"></script>
	<script src="${contextPath}/resources/js/service/quest2/magnific-popup-options.js"></script>
	<!-- Counters -->
	<script src="${contextPath}/resources/js/service/quest2/jquery.countTo.js"></script>
	<!-- Main -->
	<script src="${contextPath}/resources/js/service/quest2/main.js"></script>

	</body>
</html>

