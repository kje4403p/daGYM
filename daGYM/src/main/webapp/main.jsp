<%@page import="com.kh.dagym.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% Member loginMember = (Member)request.getAttribute("loginMember"); %>
<!DOCTYPE html>
<html lang="zxx">

<head>
   
    <c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application" />
    <!-- context Pathë¥¼ í  ë¡ ì  í ¸ ì  ì²´ì  ì   ê° ë ¨í   ì ¬ì ©í   ì   ì  ë  ë¡  ë³ ì   ì  ì ¸ -->
   
   
    <!-- Google Font -->
   <style>
   	.event-area img{
   	 height : 240px;
   	 width : 360px;
   	}
 
 	.w{
 	text-align: center;
 	margin: 0 auto;
 	}
 	 #trainer{
 padding-bottom: 100px;
 }
 h4{
 text-align: center;
 }
 body > section.trainer-section.spad{
 padding-bottom: 100px;
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
                        <h2>DAGYM이 필요한 이유</h2>
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
                                    <h4 style="margin-top: 10px;">몸 상태 체크하기</h4>
                                    <p style="font-size: 14px">본격적인 운동을 시작하기 전 내 몸의 상태부터 확인하자. 이는 단순히 몸무게,인바디 수치 확인하는 것만이 아니다. 관절 상태나 운동 피로도등을 사전에 확인하여 내 몸에 맞는 운동의 종류와 강도를 파악하는 것이 중요하다.</p>
                                </div>
                                <div class="services-item bg-gray pd-b">
                                    <img src="resources/img/services/service-icon-3.png" alt="">
                                    <h4 style="margin-top: 10px;">여러 사람과 함께 하기</h4>
                                    <p style="font-size: 14px">다른 사람과 함께 운동하는 것은 동기 부여도 쉽고 혼자 운동할 때 보다 흥미를 느낄 수 있어 흔히 추천하는 방법이다. 단, 가까운 친구나 가족처럼 너무 편한 사람과 함께 운동하면 포기가 더 쉬워지니 오히려 역효과가 날 수 있다.</p>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="services-item">
                                    <img src="resources/img/services/service-icon-2.png" alt="">
                                    <h4 style="margin-top: 10px;">운동 계획은 장기에서 단기로</h4>
                                    <p style="font-size: 14px">목표를 가지고 운동하면 동기 부여도 될 뿐 아니라 운동의 세부적인 계획을 짜는 데도 도움이 된다. 먼저 1년 정도의 장기적인 계획을 세우자. 체중 감량, 운동 관련 자격증 등 꾸준히 시간을 들여야 하는 목표를 정하는 것이 중요하다.</p>
                                </div>
                                <div class="services-item pd-b">
                                    <img src="resources/img/services/service-icon-4.png" alt="">
                                    <h4 style="margin-top: 30px;">매일 조금씩 할 수 있는 운동 찾기</h4>
                                    <p style="font-size: 14px">운동에 시간을 투자하는 것이 부담스럽다면 매일 짧은 시간이라도 할 수 있는 운동을 시도해보자. 대표적으로는 플랭크나 스쿼트 같은 근육 강화 운동이 있다.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

   
   
    <!-- Testimonial Section Begin -->
    <section class="trainer-section spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h2>Best Trainer</h2>
                    </div>
                </div>
            </div>
            <!-- <div class="row">
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
            </div>-->
           <div class="row">
              <c:forEach var="trainer" items="${trainerList}">
            
                <div id="trainer" class="col-lg-4 col-md-6">
                  <c:if test="${loginMember==null}">
                
                    <div class="single-trainer-item">  
                        <a class="trainerList" href="${contextPath}/member/login">            
                  </c:if>
                  <c:if test="${loginMember!=null}">
                    <div class="single-trainer-item">  
                           <a class="trainerList" href="${contextPath}/trainer/trainerView/${trainer.trainerNo}">
                  </c:if>
  													
                     						<c:forEach items="${thList}" var="th">
	                							<c:if test="${th.parentTrainerNo == trainer.trainerNo}">
	                				
	                								<c:set var="src" value="${contextPath}${th.filePath}/${th.fileChangeName}" />
	                							
	                									<img width="370px" height="360px" src="${src}">
	                							</c:if>
	                						</c:forEach>
	                						
                        <div id="trainer-text" class="trainer-text">
                            <h5>${trainer.memberName}</h5>
                            <span>Trainer</span>
                            <br>
                            <p>Phone: ${trainer.memberPhone}</p>
                            <p>회원 수: ${trainer.trainerMcnt}</p>
                      	    <p>수상내역: ${trainer.trainerAward}</p>
                      	    <p>평점: 
                      	    <c:forEach var="i" begin="1" end="${trainer.trainerGrade}"> ★	</c:forEach>
                      	     </p>
                        </div>
                        </a>
                      
                    </div>
                </div>
            
          		 </c:forEach>            
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
                        <p>지금 바로 훌륭한 트레이너들을 만나보세요!</p>
                        <a href="${contextPath}/trainer/trainerList" class="primary-btn banner-btn">Contact Now</a>
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
<script>
	$(".trainerList").on("click",function(event){
		if(<%=loginMember%>==null){
		
		location.href="${contextPath}/trainer/trainerView/${trainer.trainerNo}";
		}
	});
		
	</script>
</html>