<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
   
    
    <!-- context Pathë¥¼ í  ë¡ ì  í ¸ ì  ì²´ì  ì   ê° ë ¨í   ì ¬ì ©í   ì   ì  ë  ë¡  ë³ ì   ì  ì ¸ -->
   
   
    <!-- Google Font -->
   
</head>

<body>
<jsp:include page="WEB-INF/views/common/header.jsp"/>
    <!--  Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div> 

    <!-- About Section Begin -->
    <section class="about-section spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <div class="about-pic">
                        <img src="resources/img/about-pic.jpg" alt="">
                        <a href="https://www.youtube.com/watch?v=SlPhMPnQ58k" class="play-btn video-popup">
                            <img src="resources/img/play.png" alt="">
                        </a>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="about-text">
                        <h2>Story About Us</h2>
                        <p class="first-para">Lorem ipsum proin gravida nibh vel velit auctor aliquet. Aenean pretium
                            sollicitudin, nascetur auci elit consequat ipsutissem niuis sed odio sit amet nibh vulputate
                            cursus a amet.</p>
                        <p class="second-para">Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, gravida
                            quam semper libero sit amet. Etiam rhoncus. Maecenas tempus, tellus eget condimentum
                            rhoncus, gravida quam semper libero sit amet.</p>
                        <a href="#" class="primary-btn">Read More</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- About Section End -->

    <!-- Services Section Begin -->
    <section class="services-section">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-6">
                    <div class="services-pic">
                        <img src="resources/img/services/service-pic.jpg" alt="">
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="service-items">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="services-item bg-gray">
                                    <img src="resources/img/services/service-icon-1.png" alt="">
                                    <h4>Strategies</h4>
                                    <p>Aenean massa. Cum sociis Theme et natoque penatibus et magnis dis part urient
                                        montes.</p>
                                </div>
                                <div class="services-item bg-gray pd-b">
                                    <img src="resources/img/services/service-icon-3.png" alt="">
                                    <h4>Workout</h4>
                                    <p>Aenean massa. Cum sociis Theme et natoque penatibus et magnis dis part urient
                                        montes.</p>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="services-item">
                                    <img src="resources/img/services/service-icon-2.png" alt="">
                                    <h4>Yoga</h4>
                                    <p>Aenean massa. Cum sociis Theme et natoque penatibus et magnis dis part urient
                                        montes.</p>
                                </div>
                                <div class="services-item pd-b">
                                    <img src="resources/img/services/service-icon-4.png" alt="">
                                    <h4>Weight Loss</h4>
                                    <p>Aenean massa. Cum sociis Theme et natoque penatibus et magnis dis part urient
                                        montes.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Services Section End -->

    <!-- Classes Section Begin -->
    <section class="classes-section spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h2>UNLIMITED CLASSES</h2>
                    </div>
                </div>
            </div>
            <div class="row classes-slider owl-carousel">
                <div class="col-lg-4">
                    <div class="single-class-item set-bg" data-setbg="resources/img/classes/classes-1.jpg">
                        <div class="si-text">
                            <h4>Yoga</h4>
                            <span><i class="fa fa-user"></i> Ryan Knight</span>
                        </div>
                    </div>
                    <div class="single-class-item set-bg" data-setbg="resources/img/classes/classes-4.jpg">
                        <div class="si-text">
                            <h4>Karate</h4>
                            <span><i class="fa fa-user"></i> Kevin McCormick</span>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="single-class-item set-bg" data-setbg="resources/img/classes/classes-2.jpg">
                        <div class="si-text">
                            <h4>Running</h4>
                            <span><i class="fa fa-user"></i> Randy Rivera</span>
                        </div>
                    </div>
                    <div class="single-class-item set-bg" data-setbg="resources/img/classes/classes-5.jpg">
                        <div class="si-text">
                            <h4>Dance</h4>
                            <span><i class="fa fa-user"></i> Russell Lane</span>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="single-class-item set-bg" data-setbg="resources/img/classes/classes-3.jpg">
                        <div class="si-text">
                            <h4>Personal Training</h4>
                            <span><i class="fa fa-user"></i> Cole Robertson</span>
                        </div>
                    </div>
                    <div class="single-class-item set-bg" data-setbg="resources/img/classes/classes-6.jpg">
                        <div class="si-text">
                            <h4>Weight Loss</h4>
                            <span><i class="fa fa-user"></i> Ryan Scott</span>
                        </div>
                    </div>
                </div>
               
            </div>
        </div>
    </section>
    <!-- Classes Section End -->

   
    <!-- Testimonial Section Begin -->
    <section class="testimonial-section spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h2>success stories</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-10 offset-lg-1">
                    <div class="testimonial-slider owl-carousel">
                        <div class="testimonial-item">
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor
                                incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
                                exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. </p>
                            <div class="ti-pic">
                                <img src="resources/img/testimonial/testimonial-1.jpg" alt="">
                                <div class="quote">
                                    <img src="resources/img/testimonial/quote-left.png" alt="">
                                </div>
                            </div>
                            <div class="ti-author">
                                <h4>Patrick Cortez</h4>
                                <span>Leader</span>
                            </div>
                        </div>
                        <div class="testimonial-item">
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor
                                incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
                                exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. </p>
                            <div class="ti-pic">
                                <img src="resources/img/testimonial/testimonial-1.jpg" alt="">
                                <div class="quote">
                                    <img src="resources/img/testimonial/quote-left.png" alt="">
                                </div>
                            </div>
                            <div class="ti-author">
                                <h4>Patrick Cortez</h4>
                                <span>Leader</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Testimonial Section End -->

    <!-- Banner Section Begin -->
    <section class="banner-section set-bg" data-setbg="resources/img/banner-bg.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <div class="banner-text">
                        <h2>Get training today</h2>
                        <p>Gimply dummy text of the printing and typesetting industry. Lorem Ipsum has been the
                            industryÃ¢Â Â s standard.</p>
                        <a href="#" class="primary-btn banner-btn">Contact Now</a>
                    </div>
                </div>
                <div class="col-lg-5">
                    <img src="resources/img/banner-person.png" alt="">
                </div>
            </div>
        </div>
    </section>
    <!-- Banner Section End -->

  

    <!-- Latest Blog Section Begin -->
    <section class="latest-blog-section spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h2>EVENT</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4 col-md-6">
                    <div class="single-blog-item">
                        <img id="event0"  alt="">
                        <div class="blog-widget">
                            <div class="bw-date">February 17, 2019</div>
                        </div>
                        <h4><a href="#" id="title0">10 States At Risk of Rural Hospital Closures</a></h4>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="single-blog-item">
                        <img id="event1"  alt="">
                        <div class="blog-widget">
                            <div class="bw-date">February 17, 2019</div>
                        </div>
                        <h4><a href="#" id="title1">Diver who helped save Thai soccer team</a></h4>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="single-blog-item">
                        <img id="event2"  alt="">
                        <div class="blog-widget">
                            <div class="bw-date">February 17, 2019</div>
                        </div>
                        <h4><a href="#" id="title2">Man gets life in prison for stabbing</a></h4>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Latest Blog Section End -->



    

    <!-- Js Plugins -->
    <script src="resources/js/jquery-3.3.1.min.js"></script>
    <script src="resources/js/bootstrap.min.js"></script>
    <script src="resources/js/jquery.magnific-popup.min.js"></script>
    <script src="resources/js/mixitup.min.js"></script>
    <script src="resources/js/jquery.slicknav.js"></script>
    <script src="resources/js/owl.carousel.min.js"></script>
    <script src="resources/js/main.js"></script>
       <jsp:include page="WEB-INF/views/common/footer.jsp"/>
    <script>
    $(function(){
    	eventViews();
    	titleViews();
    })
    	function eventViews(){
    		$.ajax({
    			url : "${contextPath}/eventViews",
    			dataType : "JSON",
    			success : function(list){
    				$.each(list,function(index, item){
    					console.log(list)
    					src="<%=request.getContextPath()%>/resources/uploadImages/"+item.fileChangeName; 
    					
    					$("#event"+index).attr("src",src)
    				})
    			}, error : function(){
    				console.log("통신실패")
    			}
    		})
    		
    	}
    function titleViews(){
		$.ajax({
			url : "${contextPath}/eventTitle",
			dataType : "JSON",
			success : function(list){
				$.each(list,function(index, item){
				
					
				
					$("#title"+index).html(item.boardTitle)
				})
			}, error : function(){
				console.log("통신실패")
			}
		})
		
	}
    
    </script>
       
</body>

</html>