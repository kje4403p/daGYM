<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>

<html>
<head>
	<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application" />

	<title>Rage Freebie HTML5 Landing page</title>
	<meta name="description" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<!--Google Font link-->
	<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Raleway:400,600,700" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">


	<link rel="stylesheet" href="${contextPath}/resources/css/trainerView/slick.css">
	<link rel="stylesheet" href="${contextPath}/resources/css/trainerView/slick-theme.css">
	<link rel="stylesheet" href="${contextPath}/resources/css/trainerView/animate.css">
	<link rel="stylesheet" href="${contextPath}/resources/css/trainerView/fonticons.css">
	<link rel="stylesheet" href="${contextPath}/resources/css/trainerView/font-awesome.min.css">
	<link rel="stylesheet" href="${contextPath}/resources/css/trainerView/bootstrap.css">
	<link rel="stylesheet" href="${contextPath}/resources/css/trainerView/magnific-popup.css">
	<link rel="stylesheet" href="${contextPath}/resources/css/trainerView/bootsnav.css">


	<!--For Plugins external css-->
	<!--<link rel="stylesheet" href="assets/css/plugins.css" />-->

	<!--Theme custom css -->
	<link rel="stylesheet" href="${contextPath}/resources/css/trainerView/style.css">
	<!--<link rel="stylesheet" href="assets/css/colors/maron.css">-->

	<!--Theme Responsive css-->
	<link rel="stylesheet" href="${contextPath}/resources/css/trainerView/responsive.css" />

	<script src="${contextPath}/resources/js/trainerView/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
	<style>
	.trainerImg{
	float: left;
	margin-top: 50px;
	}
	.trainerInfo{
	text-align: center;
	padding-top: 150px;
	}
	#about{
	clear: both;
	}
	hr{
	color:black;
	}
	</style>
</head>

<body data-spy="scroll" data-target=".navbar-collapse">
<jsp:include page="../common/header.jsp"/>

	<div class="culmn">

	
		<section id="hello" class="home bg-mega">
			<div class="trainerImg">
				 <img src="${contextPath}/resources/img/trainer/trainer-1.jpg" alt="" width="400px" height="400px">
			</div>			
			<div class="trainerName">
				<div class="trainerInfo"> 
				<hr>
				<h4>이름:  ${trainer.trainerName}</h4>
				<hr>
				<h4>번호:  ${trainer.trainerPhone}</h4>
				<hr>
				<h4>입사일:  ${trainer.trainerEnrollDate}</h4>
				</div>
			</div>
		</section>

		<!--End off Home Sections-->


		<!--About Sections-->
		<section id="about" class="about roomy-100">
			<div class="container">
				<div class="row">
					<div class="main_about">
						<div class="col-md-6">
							<div class="about_content">
								<h2>트레이너 한마디!</h2>
								<div class="separator_left"></div>

								<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. </p>

							
							</div>
						</div>
						<div class="col-md-6">
							<div class="about_accordion wow fadeIn">
								<div id="faq_main_content" class="faq_main_content">
									<h6><i class="fa fa-angle-right"></i>자격 및 경력사항 </h6>
									<div>
										<div class="content">
											<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, </p>

										</div>
									</div>
									<!-- End off accordion item-1 -->

									<h6 class="open"><i class="fa fa-angle-right"></i>수상내역</h6>
									<div class="open">
										<div class="content">
											<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, </p>
										</div>
									</div>
									<!-- End off accordion item-2 -->

									<h6> <i class="fa fa-angle-right"></i>PT 가격</h6>
									<div>
										<div class="content">
											<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, </p>
										</div>
									</div>
									<!-- End off accordion item-3 -->

									<h6><i class="fa fa-angle-right"></i>트레이너 SNS</h6>
									<div>
										<div class="content">
											<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, </p>
										</div>
									</div>
									<!-- End off accordion item-4 -->
								</div>
							</div>
						</div>
					</div>
				</div>
				<!--End off row-->
			</div>
			<!--End off container -->
		</section>

		<!--Skill Sections-->
		<section id="skill" class="skill roomy-100">
		
			<div class="container">
				<div class="row">
					<div class="main_skill">
						<div class="col-md-6">
							<div class="skill_content wow fadeIn">
								<h2>Our skill</h2>
								<div class="separator_left"></div>

								<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. </p>

							</div>
						</div>
						<div class="col-md-6">
							<div class="skill_bar sm-m-top-50">
								<div class="teamskillbar clearfix m-top-20" data-percent="80%">
									<h6>GRAPHIC DESIGN</h6>
									<div class="teamskillbar-bar"></div>
								</div>
								<!-- End Skill Bar -->

								<div class="teamskillbar clearfix m-top-50" data-percent="75%">
									<h6>TYPOGRAPHY</h6>
									<div class="teamskillbar-bar"></div>
								</div>
								<!-- End Skill Bar -->

								<div class="teamskillbar clearfix m-top-50" data-percent="90%">
									<h6>HTML / CSS</h6>
									<div class="teamskillbar-bar"></div>
								</div>
								<!-- End Skill Bar -->
							</div>
						</div>
					</div>
				</div>
				<!--End off row-->
			</div>
			<!--End off container -->
	<br>
	<br>
	<br>
	<br>
	<br>
			<div class="container">
				<div class="row">
					<div class="skill_bottom_content text-center">
						<div class="col-md-3">
							<div class="skill_bottom_item">
								<h2 class="statistic-counter">3468</h2>
								<div class="separator_small"></div>
								<h5><em>Projects Finished</em></h5>
							</div>
						</div>
						<div class="col-md-3">
							<div class="skill_bottom_item">
								<h2 class="statistic-counter">4638</h2>
								<div class="separator_small"></div>
								<h5><em>Happy Clients</em></h5>
							</div>
						</div>
						<div class="col-md-3">
							<div class="skill_bottom_item">
								<h2 class="statistic-counter">3468</h2>
								<div class="separator_small"></div>
								<h5><em>Hours of work</em></h5>
							</div>
						</div>
						<div class="col-md-3">
							<div class="skill_bottom_item">
								<h2 class="statistic-counter">3468</h2>
								<div class="separator_small"></div>
								<h5><em>Cup of coffee</em></h5>
							</div>
						</div>
					</div>
				</div>
				<!--End off row-->
			</div>
			<!--End off container -->
		</section>
		<!--End off Skill section -->



		<!--Testimonial Section-->
		<section id="testimonial" class="testimonial fix">
			<div class="overlay"></div>
			<div class="container">
				<div class="row">


					<div class="main_testimonial col-sm-8 ml-sm-auto mr-sm-auto">
						<div class="head_title text-center roomy-100">
							<h2 class="text-white">OUR TESTIMONIALS</h2>
						</div>
					</div>


					<div class="testimonial_slid text-center">
						<div class="testimonial_item">
							<div class="col-sm-10 mr-sm-auto ml-sm-auto">
								<p class="text-white">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. </p>

								<div class="test_authour m-top-30">
									<h6 class="text-white m-bottom-20">JOHN DOE - THEMEFOREST USER</h6>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
								</div>
							</div>
						</div>
						<div class="testimonial_item">
							<div class="col-sm-10 mr-sm-auto ml-sm-auto">
								<p class="text-white">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. </p>

								<div class="test_authour m-top-30">
									<h6 class="text-white m-bottom-20">JOHN DOE - THEMEFOREST USER</h6>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
								</div>
							</div>
						</div>
						<div class="testimonial_item">
							<div class="col-sm-10 mr-sm-auto ml-sm-auto">
								<p class="text-white">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. </p>

								<div class="test_authour m-top-30">
									<h6 class="text-white m-bottom-20">JOHN DOE - THEMEFOREST USER</h6>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
								</div>
							</div>
						</div>
						<div class="testimonial_item">
							<div class="col-sm-10 mr-sm-auto ml-sm-auto">
								<p class="text-white">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. </p>

								<div class="test_authour m-top-30">
									<h6 class="text-white m-bottom-20">JOHN DOE - THEMEFOREST USER</h6>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
								</div>
							</div>
						</div>
					</div>

				</div>
				<!--End off row-->
			</div>
			<!--End off container -->
		</section>
		<!--End off Testimonial section -->


		<!--Pricing Section-->
		<section id="pricing" class="pricing lightbg">
			<div class="container">
				<div class="row">
					<div class="main_pricing">
						<div class="col-md-8 ml-md-auto mr-md-auto">
							<div class="head_title text-center">
								<h2>OUR PRICING</h2>
								<div class="separator_auto"></div>
								<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. </p>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-4 col-sm-12">
						<div class="pricing_item">
							<div class="pricing_head p-top-30 p-bottom-100 text-center">
								<h3 class="text-uppercase">STARTER</h3>
							</div>
							<div class="pricing_price_border text-center">
								<div class="pricing_price">
									<h3 class="text-white">$19</h3>
									<p class="text-white">per month</p>
								</div>
							</div>

							<div class="pricing_body bg-white p-top-110 p-bottom-60">
								<ul>
									<li><i class="fa fa-check-circle text-primary"></i> <span>10</span> user</li>
									<li class="disabled"><i class="fa fa-times-circle"></i> Unlimited Bandwidth</li>
									<li class="disabled"><i class="fa fa-times-circle"></i> Full Statistics</li>

								</ul>
								<div class="pricing_btn text-center m-top-40">
									<a href="" class="btn btn-primary">CHOOSE PLAN</a>
								</div>
							</div>
						</div>
					</div>
					<!-- End off col-md-4 -->

					<div class="col-md-4 col-sm-12">
						<div class="pricing_item sm-m-top-30">
							<div class="pricing_top_border"></div>
							<div class="pricing_head p-top-30 p-bottom-100 text-center">
								<h3 class="text-uppercase">PREMIUM</h3>
							</div>
							<div class="pricing_price_border text-center">
								<div class="pricing_price">
									<h3 class="text-white">$39</h3>
									<p class="text-white">per month</p>
								</div>
							</div>

							<div class="pricing_body bg-white p-top-110 p-bottom-60">
								<ul>
									<li><i class="fa fa-check-circle text-primary"></i> <span>50</span> user</li>
									<li><i class="fa fa-check-circle text-primary"></i> Unlimited Bandwidth</li>
									<li class="disabled"><i class="fa fa-times-circle"></i> Full Statistics</li>
								</ul>
								<div class="pricing_btn text-center m-top-40">
									<a href="" class="btn btn-primary">CHOOSE PLAN</a>
								</div>
							</div>
						</div>
					</div>
					<!-- End off col-md-4 -->

					<div class="col-md-4 col-sm-12">
						<div class="pricing_item sm-m-top-30">
							<div class="pricing_head p-top-30 p-bottom-100 text-center">
								<h3 class="text-uppercase">bUSINESS</h3>
							</div>
							<div class="pricing_price_border text-center">
								<div class="pricing_price">
									<h3 class="text-white">$99</h3>
									<p class="text-white">per month</p>
								</div>
							</div>

							<div class="pricing_body bg-white p-top-110 p-bottom-60">
								<ul>
									<li><i class="fa fa-check-circle text-primary"></i> Unlimited Users</li>
									<li><i class="fa fa-check-circle text-primary"></i> Unlimited Bandwidth</li>
									<li><i class="fa fa-check-circle text-primary"></i> Full Statistics</li>
								</ul>
								<div class="pricing_btn text-center m-top-40">
									<a href="" class="btn btn-primary">CHOOSE PLAN</a>
								</div>
							</div>
						</div>
					</div>
					<!-- End off col-md-4 -->
				</div>
				<!--End off row-->
			</div>
			<!--End off container -->
		</section>
		<!--End off Pricing section -->




		<!--Maps Section-->
		<div class="main_maps text-center fix">
			<div class="overlay"></div>
			<div class="maps_text">
				<h3 class="text-white" onclick="showmap()">FIND US ON THE MAP <i class="fa fa-angle-down"></i></h3>
				<div id="map_canvas" class="mapheight"></div>
			</div>
		</div>
		<!-- End off Maps Section-->



		<!--Contact Us Section-->
		<section id="contact" class="contact bg-mega fix">
			<div class="container">
				<div class="row">
					<div class="main_contact roomy-100 text-white">
						<div class="col-md-4">
							<div class="rage_widget">
								<div class="widget_head">
									<h3 class="text-white">RAGE</h3>
									<div class="separator_small"></div>
								</div>
								<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. </p>

								<div class="widget_socail m-top-30">
									<ul class="list-inline-item">
										<li><a href=""><i class="fa fa-facebook"></i></a></li>
										<li><a href=""><i class="fa fa-twitter"></i></a></li>
										<li><a href=""><i class="fa fa-linkedin"></i></a></li>
										<li><a href=""><i class="fa fa-vimeo"></i></a></li>
										<li><a href=""><i class="fa fa-instagram"></i></a></li>
									</ul>
								</div>
							</div>
						</div>
						<div class="col-md-8 sm-m-top-30">
							<form class="" action="subcribe.php">
								<div class="row">
									<div class="col-sm-6">
										<div class="form-group">
											<input id="first_name" name="first_name" type="text" placeholder="Name" class="form-control" required="">
										</div>
									</div>

									<div class="col-sm-6">
										<div class="form-group">
											<input id="phone" name="phone" type="text" placeholder="Phone" class="form-control">
										</div>
									</div>

									<div class="col-sm-12">
										<div class="form-group">
											<textarea class="form-control" rows="6" placeholder="Message"></textarea>
										</div>
										<div class="form-group text-center">
											<a href="" class="btn btn-primary">SEND MESSAGE</a>
										</div>
									</div>

								</div>

							</form>
						</div>
					</div>
				</div>
				<!--End off row -->
			</div>
			<!--End off container -->
		</section>
		<!--End off Contact Section-->
<jsp:include page="../common/footer.jsp"/>

		<!-- scroll up-->
		<div class="scrollup">
			<a href="#"><i class="fa fa-chevron-up"></i></a>
		</div>
		<!-- End off scroll up -->



	</div>

	<!-- JS includes -->

	<script src="${contextPath}/resources/js/trainerView/vendor/jquery-1.11.2.min.js"></script>
	<script src="${contextPath}/resources/js/trainerView/vendor/popper.min.js"></script>
	<script src="${contextPath}/resources/js/trainerView/vendor/bootstrap.min.js"></script>

	<script src="${contextPath}/resources/js/trainerView/jquery.magnific-popup.js"></script>
	<script src="${contextPath}/resources/js/trainerView/slick.min.js"></script>
	<script src="${contextPath}/resources/js/trainerView/jquery.collapse.js"></script>
	<script src="${contextPath}/resources/js/trainerView/bootsnav.js"></script>


	<!-- paradise slider js -->


	<script src="http://maps.google.com/maps/api/js?key=AIzaSyD_tAQD36pKp9v4at5AnpGbvBUsLCOSJx8"></script>
	<script src="${contextPath}/resources/js/trainerView/gmaps.min.js"></script>

	<script>
		function showmap() {
			var mapOptions = {
				zoom: 8,
				scrollwheel: false,
				center: new google.maps.LatLng(-34.397, 150.644),
				mapTypeId: google.maps.MapTypeId.ROADMAP
			};
			var map = new google.maps.Map(document.getElementById('map_canvas'), mapOptions);
			$('.mapheight').css('height', '350');
			$('.maps_text h3').hide();
		}

	</script>


	<script src="${contextPath}/resources/js/trainerView/plugins.js"></script>
	<script src="${contextPath}/resources/js/trainerView/main.js"></script>
	
</body>

</html>
