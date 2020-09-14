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
	
		<!-- calendar를 위한 라이브러리들 지우면 안됨 -->

<script src='https://fullcalendar.io/releases/fullcalendar/3.9.0/lib/moment.min.js'></script>
<link href='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.min.css'rel='stylesheet'/>
<link href='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.print.css' rel='stylesheet' media='print'/>
<script src='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.min.js'></script>

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
	.hello{
	background-color: gray;
	}
	</style>
	
</head>

<body data-spy="scroll" data-target=".navbar-collapse">
<jsp:include page="../common/header.jsp"/>

	<div class="culmn">
				
					
	
		<section id="hello" class="home bg-mega">
		<div class="container calendar-container">
		
				</div>
			<div class="trainerImg">
					<c:if test="${!empty files }">

                            <c:forEach var="at" items="${files}" varStatus="vs">
                                <c:set var="src" value="${contextPath}${at.filePath}/${at.fileChangeName}"/>

                                <div class="carousel-item <c:if test="${vs.index == 0}"> active</c:if>">
                                    <img width="370px" height="360px" src="${src}" />
                                    <input type="hidden" value="${at.fileNo}">
                                </div>
                            </c:forEach>

                </c:if>
			</div>			
			<div class="trainerName">
				<div class="trainerInfo"> 
				<hr>
				<h4>이름:  ${trainer.memberName}</h4>
				<hr>
				<h4>번호:  ${trainer.memberPhone}</h4>
				<hr>
				<h4>입사일:  ${trainer.memberEnrollDate}</h4>
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

								<p>${trainer.trainerComment}</p>
							
							</div>
						</div>
						<div class="col-md-6">
							<div class="about_accordion wow fadeIn">
								<div id="faq_main_content" class="faq_main_content">
									<h6><i class="fa fa-angle-right"></i>자격 및 경력사항 </h6>
									<div>
										<div class="content">
											<p>${trainer.trainerCareer}</p>
										</div>
									</div>
									<!-- End off accordion item-1 -->

									<h6><i class="fa fa-angle-right"></i>수상내역</h6>
									<div>
										<div class="content">
											<p>${trainer.trainerAward}</p>
											</div>
									</div>
									<!-- End off accordion item-2 -->

									<h6> <i class="fa fa-angle-right"></i>PT 가격</h6>
									<div>
										<div class="content">
											<p>10회당 ${trainer.trainerPrice}원</p>
										</div>
									</div>
									<!-- End off accordion item-3 -->

									<h6><i class="fa fa-angle-right"></i>트레이너 SNS</h6>
									<div>
										<div class="content">
										<a href="${trainer.trainerSNS}">${trainer.trainerSNS}</a>
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
			<c:if test="${loginMember.memberGrade == 'T'}">
			<a href="${contextPath}/trainer/schedule/${trainer.trainerNo}">스케줄 등록</a>
			</c:if>
			<c:if test="${loginMember.memberGrade == 'G'}">
			<a href="${contextPath}/trainer/trainerResulvation/${trainer.trainerNo}">트레이너 예약</a>
			</c:if>
		</section>
  



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
								<h3 class="text-uppercase">5회권</h3>
							</div>
							<div class="pricing_price_border text-center">
								<div class="pricing_price">
									<h3 class="text-white">${(trainer.trainerPrice)*5 }</h3>
									
								</div>
							</div>

							<div class="pricing_body bg-white p-top-110 p-bottom-60">
								<ul>
									<li><i class="fa fa-check-circle text-primary"></i> <span>10</span> user</li>
									<li class="disabled"><i class="fa fa-times-circle"></i> Unlimited Bandwidth</li>
									<li class="disabled"><i class="fa fa-times-circle"></i> Full Statistics</li>

								</ul>
								<div class="pricing_btn text-center m-top-40">
								
								<c:set var="trainerNo" value="${trainer.trainerNo}"/>
								<c:choose>
									<c:when test="${classStatus.trainerNo == trainer.trainerNo || classStatus==null}">
											<c:url var="url" value="../paymentView/${trainer.trainerNo }">
											<c:param name="classNm" value="5"/>
										</c:url>
										<a href="${url }"class="btn btn-primary" id="order">결제하기</a>
			                    	</c:when>
			                    	<c:otherwise>
			                    	다른 트레이너 이용권을 모두 사용해야 결제하실 수  있습니다.
			                    	</c:otherwise>
			                    	</c:choose>
					
								</div>
							</div>
						</div>
					</div>
					<!-- End off col-md-4 -->

					<div class="col-md-4 col-sm-12">
						<div class="pricing_item sm-m-top-30">
							<div class="pricing_top_border"></div>
							<div class="pricing_head p-top-30 p-bottom-100 text-center">
								<h3 class="text-uppercase">10회권</h3>
							</div>
							<div class="pricing_price_border text-center">
								<div class="pricing_price">
									<h3 class="text-white">${(trainer.trainerPrice)*10 }</h3>
								</div>
							</div>

							<div class="pricing_body bg-white p-top-110 p-bottom-60">
								<ul>
									<li><i class="fa fa-check-circle text-primary"></i> <span>50</span> user</li>
									<li><i class="fa fa-check-circle text-primary"></i> Unlimited Bandwidth</li>
									<li class="disabled"><i class="fa fa-times-circle"></i> Full Statistics</li>
								</ul>
								<div class="pricing_btn text-center m-top-40">
									<c:set var="trainerNo" value="${trainer.trainerNo}"/>
								<c:choose>
									<c:when test="${classStatus.trainerNo == trainer.trainerNo || classStatus==null}">
											<c:url var="url" value="../paymentView/${trainer.trainerNo }">
											<c:param name="classNm" value="10"/>
										</c:url>
										<a href="${url }"class="btn btn-primary" id="order">결제하기</a>
			                    	</c:when>
			                    	<c:otherwise>
			                    	다른 트레이너 이용권을 모두 사용해야 결제하실 수  있습니다.
			                    	</c:otherwise>
			                    	</c:choose>
								</div>
							</div>
						</div>
					</div>
					<!-- End off col-md-4 -->

					<div class="col-md-4 col-sm-12">
						<div class="pricing_item sm-m-top-30">
							<div class="pricing_head p-top-30 p-bottom-100 text-center">
								<h3 class="text-uppercase">20회권</h3>
							</div>
							<div class="pricing_price_border text-center">
								<div class="pricing_price">
									<h3 class="text-white">${(trainer.trainerPrice)*20 }</h3>
								</div>
							</div>

							<div class="pricing_body bg-white p-top-110 p-bottom-60">
								<ul>
									<li><i class="fa fa-check-circle text-primary"></i> Unlimited Users</li>
									<li><i class="fa fa-check-circle text-primary"></i> Unlimited Bandwidth</li>
									<li><i class="fa fa-check-circle text-primary"></i> Full Statistics</li>
								</ul>
								<div class="pricing_btn text-center m-top-40">
									<c:set var="trainerNo" value="${trainer.trainerNo}"/>
								<c:choose>
									<c:when test="${classStatus.trainerNo == trainer.trainerNo || classStatus==null}">
											<c:url var="url" value="../paymentView/${trainer.trainerNo }">
											<c:param name="classNm" value="20"/>
										</c:url>
										<a href="${url }"class="btn btn-primary" id="order">결제하기</a>
			                    	</c:when>
			                    	<c:otherwise>
			                    	다른 트레이너 이용권을 모두 사용해야 결제하실 수  있습니다.
			                    	</c:otherwise>
			                    	</c:choose>
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



	<script src="${contextPath}/resources/js/trainerView/plugins.js"></script>
	<script src="${contextPath}/resources/js/trainerView/main.js"></script>
	
</body>

</html>
