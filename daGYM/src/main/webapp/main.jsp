<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
   
    
    <!-- context Pathë¥¼ í  ë¡ ì  í ¸ ì  ì²´ì  ì   ê° ë ¨í   ì ¬ì ©í   ì   ì  ë  ë¡  ë³ ì   ì  ì ¸ -->
   
   
    <!-- Google Font -->
   <style>
   	.event-area img{
   	 height : 240px;
   	 width : 360px;
   	}
 
 	.services-item{
 	text-align: center;
 
 	}
 	
   </style>
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
                        <img src="resources/img/about-pic2.jpg" style="height:400px;"alt="">
                        <a href="https://www.youtube.com/watch?v=FsTkLYaUh_o" class="play-btn video-popup">
                            <img src="resources/img/play.png" alt="">
                        </a>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="about-text">
                        <h2>운동 효율 증가</h2>
                        <p class="first-para">If you don’t make time for exercise, you’ll probably have to make time for illness. <br> -Robin Sharma-</p>
                        <p class="first-para">운동을 위해 시간 내지 않으면,병 때문에 시간을 내야하게 될지도 모른다. <br>로빈 샤모</p>
                        <p class="first-para">It is a shame for a man to grow old without seeing the beauty and strength of which his body is capable. <br> -Socrates-</p>
                        <p class="first-para">사람이 자신의 몸이 가질 수 있는 아름다움과 강함을 알지 못하고 늙어 버리는 것은 안타까운 일이다.<br>소크라테스</p>
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
                                    <br><br><h4>Strategies</h4>
                                 
                                </div>
                                <div class="services-item bg-gray pd-b">
                                    <img src="resources/img/services/service-icon-3.png"  alt="">
                                    <h4>Workout</h4>
                                  
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="services-item">
                                    <img src="resources/img/services/service-icon-2.png"  alt="">
                                    <h4>Yoga</h4>
                                    
                                </div>
                                <div class="services-item pd-b">
                                    <img src="resources/img/services/service-icon-4.png" alt="">
                                    <h4>Weight Loss</h4>
                        
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
                    <div class="single-blog-item event-area">
                        <img id="event0"  alt="">
                        <h4><a href="#" id="title0">10 States At Risk of Rural Hospital Closures</a></h4>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="single-blog-item event-area" >
                        <img id="event1"  alt="">
                        <h4><a href="#" id="title1">Diver who helped save Thai soccer team</a></h4>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="single-blog-item event-area">
                        <img id="event2"  alt="">
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
    					var boardNo = item.parentBoardNo;
    					console.log("넘버"+boardNo)
    					$("#event"+index).attr("src",src)
    					
    					$("#event"+index).on("click",function(){
    						location.href= "${contextPath}/event/"+boardNo 
    					})
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
					console.log("리리"+list)
				$.each(list,function(index, item){
					var boardNo = item.boardNo;
				
					$("#title"+index).html(item.boardTitle)
					$("#title"+index).on("click",function(){
    						location.href= "${contextPath}/event/"+boardNo 
    					})
				})
			}, error : function(){
				console.log("통신실패")
			}
		})
		
	}
    
    </script>
       
</body>

</html>