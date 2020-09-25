<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


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
   @import url(https://fonts.googleapis.com/css?family=BenchNine:700);
.snip1535 {
  background-color: #FD9F28;
  border: none;
  color: #ffffff;
  cursor: pointer;
  display: inline-block;
  font-family: 'BenchNine', Arial, sans-serif;
  font-size: 1em;
  font-size: 15px;
  line-height: 1em;
  margin: 15px 40px;
  outline: none;
  padding: 12px 20px 10px;
  position: relative;
  text-transform: uppercase;
  font-weight: 700;
}
.snip1535:before,
.snip1535:after {
  border-color: transparent;
  -webkit-transition: all 0.25s;
  transition: all 0.25s;
  border-style: solid;
  border-width: 0;
  content: "";
  height: 24px;
  position: absolute;
  width: 24px;
}
.snip1535:before {
  border-color: #FD9F28;
  border-right-width: 2px;
  border-top-width: 2px;
  right: -5px;
  top: -5px;
}
.snip1535:after {
  border-bottom-width: 2px;
  border-color: #FD9F28;
  border-left-width: 2px;
  bottom: -5px;
  left: -5px;
}
.snip1535:hover,
.snip1535.hover {
  background-color: #FD9F28;
}
.snip1535:hover:before,
.snip1535.hover:before,
.snip1535:hover:after,
.snip1535.hover:after {
  height: 100%;
  width: 100%;
}

#hello > div > div > div:nth-child(3) > div.trainerName > div.row > div:nth-child(1){
	text-align:center;
}
   @font-face { 
	font-family: 'GmarketSansBold';
   	 src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansBold.woff') format('woff');
     font-weight: normal; 
     font-style: normal;
    }
    body{
    	font-family: GmarketSansBold;
    }
    #about > div.container > div > div > div:nth-child(1) > div > h2{
    	font-weight: 900; 
    }
   #star a{ 
   text-decoration: none; color: gray;
    } 
    #star a.on{
     color: red;
      }
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
   background-color:white;
   }
   .hello{
   background-color: gray;
   }
   #hello{
   margin: 0 auto;
   width: 1200px;
   }
   #price{
   font-size: 30px;
   font-weight: bold;
   padding-top : 20px;
   }
   .pricing_price{
   padding-top: 30%;
   }
   #about > a{
   color:white;
   }
   .primary-btn{
      border : none;
   }
   #order{
      background-color: white;
   }
   .trainerName{
      padding-top: 30px;
   }
   #about > div.row > div:nth-child(2) > div{
   width: 160px;
  height: 46px;
 
   }
   #about > div.row > div:nth-child(2) > div > button{
   height: 50px;
   }
   
   .culmn *{
   font-family: 'GmarketSansBold';
   }
       
   </style>
   
</head>

<body data-spy="scroll" data-target=".navbar-collapse">
<jsp:include page="../common/header.jsp"/>

   <div class="culmn">
            
               
   
      <section id="hello" class="home bg-mega">
      <div class="container-fluid">
         <div class="row">
            <div class="col-md-1">
            </div>
            <div class="col-md-5">
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
            </div>
            <div class="col-md-5">
	            <div class="trainerName" >
	                          
		             <div class="row" style="padding-bottom: 10px;">
		             <div class="col-md-6 mb-5" style="top: 15px;">
		            
		            	 <img  src="${contextPath}/resources/images/dagym/트레이너.png" /><h3 style="display : inline; padding-left: 10px; font-family: 'GmarketSansBold'">${trainer.memberName}</h3>
		            </div>
		            <div class="col-md-6">
		                <c:if test="${loginMember.memberGrade == 'T' && loginMember.memberNo==trainer.trainerNo}">
		            	
		                  		<button  class="snip1535 hover"  onclick="window.open('${contextPath}/trainer/schedule/${trainer.trainerNo}','스케줄 등록','width=1300,height=850,left=200,top=100')">스케줄 등록</button>
		              		
		               </c:if>
		               <c:if test="${loginMember.memberGrade == 'G' && trainer.trainerNo==classStatus.trainerNo}">
		                 
		                 	 <button   class="snip1535 hover"  onclick="window.open('${contextPath}/trainer/trainerResulvation/${trainer.trainerNo}','트레이너 예약','width=1300,height=850,left=200,top=100')">트레이너 예약</button>
		              	
		               </c:if>
		             
		            </div>
		            </div>
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
	                                    <p>5회당 ${trainer.trainerPrice*5}원</p>
	                                    <p>10회당 ${trainer.trainerPrice*10}원</p>
	                                    <p>20회당 ${trainer.trainerPrice*20}원</p>
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
	                <div class="col-md-1">
	             
	           		 </div>
            </div>
            
        
         </div>
      </div>   
      
      </section>

      <!--End off Home Sections-->

<br><br>



      <!--Testimonial Section-->
      <section id="testimonial" class="testimonial fix">
         <div class="overlay"></div>
         <div class="container">
            <div class="row">
               <div class="main_testimonial col-sm-8 ml-sm-auto mr-sm-auto">
                  <div class="head_title text-center roomy-100">
                     <h2 class="text-white">트레이너 한마디!</h2>
                  </div>
               </div>


               <div class="testimonial_slid text-center">
                 
                  <div class="testimonial_item">
                     <div class="col-sm-10 mr-sm-auto ml-sm-auto">
                         <p>${trainer.trainerComment}</p>
                     </div>
                  </div>
                
                
               </div>

            </div>
            <!--End off row-->
         </div>
         <!--End off container -->
      </section>
      <!--End off Testimonial section -->

         
    <section class="membership-section spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h2>MEMBERSHIP PLANS</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4">
                    <div class="membership-item">
                        <div class="mi-title">
                            <h4>5회권</h4>
                            <div class="triangle"></div>
                        </div>
                            <h2 class="mi-price"> <fmt:formatNumber value="${(trainer.trainerPrice)*5 }" pattern="#,###원" /></h2>
                   
                           <c:set var="trainerNo" value="${trainer.trainerNo}"/>
                        <c:choose>
                           <c:when test="${classStatus.trainerNo == trainer.trainerNo || classStatus.classCnt==0 || classStatus.classCnt==null}">
                                 <c:url var="url" value="../paymentView/${trainer.trainerNo }">
                                 <c:param name="classNm" value="5"/>
                              </c:url>
                              <c:if test="${loginMember.memberGrade == 'G'}">
                                      <button onclick="location.href='${url}' " class="primary-btn membership-btn" id="order">결제하기</button>
                               </c:if>
                                </c:when>
                                <c:otherwise>
                               <p> 다른 트레이너 이용권을 모두 사용해야<br> 결제하실 수  있습니다.</p>
                                </c:otherwise>
                                </c:choose>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="membership-item">
                        <div class="mi-title">
                            <h4>10회권</h4>
                            <div class="triangle"></div>
                        </div>
                            <h2 class="mi-price"> <fmt:formatNumber value="${(trainer.trainerPrice)*10 }" pattern="#,###원" /></h2>
                       
                       
                           <c:set var="trainerNo" value="${trainer.trainerNo}"/>
                        <c:choose>
                           <c:when test="${classStatus.trainerNo == trainer.trainerNo || classStatus.classCnt==0 || classStatus.classCnt==null }">
                                 <c:url var="url" value="../paymentView/${trainer.trainerNo }">
                                 <c:param name="classNm" value="5"/>
                              </c:url>
                                    <c:if test="${loginMember.memberGrade == 'G'}">
                                      <button onclick="location.href='${url}' " class="primary-btn membership-btn" id="order">결제하기</button>
                               </c:if>
                                </c:when>
                                <c:otherwise>
                               <p> 다른 트레이너 이용권을 모두 사용해야 <br>결제하실 수  있습니다.</p>
                                </c:otherwise>
                                </c:choose>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="membership-item">
                        <div class="mi-title">
                            <h4>20회권</h4>
                            <div class="triangle"></div>
                        </div>
                       

                        <h2 class="mi-price"> <fmt:formatNumber value="${(trainer.trainerPrice)*20 }" pattern="#,###원" /></h2>
                        
                        
                           <c:set var="trainerNo" value="${trainer.trainerNo}"/>
                        <c:choose>
                           <c:when test="${classStatus.trainerNo == trainer.trainerNo || classStatus.classCnt==0 || classStatus.classCnt==null}">
                                 <c:url var="url" value="../paymentView/${trainer.trainerNo }">
                                 <c:param name="classNm" value="5"/>
                              </c:url>
                                    <c:if test="${loginMember.memberGrade == 'G'}">
                                      <button onclick="location.href='${url}' " class="primary-btn membership-btn" id="order">결제하기</button>
                               </c:if>
                                </c:when>
                                <c:otherwise>
                                <p> 다른 트레이너 이용권을 모두 사용해야<br> 결제하실 수  있습니다.</p>
                                </c:otherwise>
                                </c:choose>
                    </div>
                </div>
            </div>
        </div>
    </section>
   
      <br><br>
      <link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
      <script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

      <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.1.0/css/font-awesome.min.css"/>
       <div class="section-title">
                           <h2 id="content2">REVIEW</h2>
        </div>
      <c:choose>
         <c:when test="${empty reviews }">
               <div class="container">
      
         <div class="well">
            <div class="media">
            
              <a class="pull-left" href="#">
              </a>
              <div class="media-body">
                <h4 class="media-heading"></h4>
                <p class="text-center">작성된 리뷰가 없습니다.</p>
               
             </div>
          </div>
        </div>
      </div>
         </c:when>
         <c:otherwise>
            <c:forEach var="review" items="${reviews }">
               <div class="container">
      <div class="row">
		<div class="col-md-2">
		</div>
		<div class="col-md-8">
         <div class="well">
            <div class="media">
            
              <a class="pull-left" href="#">
              </a>
              <div class="media-body">
                <h4 class="media-heading"></h4>
                <input id="reviewNo" type="hidden" value="${review.reviewNo }">
                <p class="text-right">By ${review.memberId }</p>
                <p >${review.reviewContent }</p>
                
                <ul class="list-inline list-unstyled">
                  <li>
                     <c:set var="rating" value="${review.reviewRating }"/>
                           <c:forEach var="i" begin="1" end="${rating}">
                              <span class="glyphicon glyphicon-star"></span>
                           </c:forEach>
                           <c:forEach var="i" begin="1" end="${5-rating}" >
                              <span class="glyphicon glyphicon-star-empty"></span>
                           
                           </c:forEach>
                     
                  </li>
                  <li>|</li>
                  
                  <jsp:useBean id="now" class="java.util.Date"></jsp:useBean>
                  <fmt:formatDate var="createDate" value="${review.reviewCreateDate}" pattern="yyyy-MM-dd"/>
                  <li>${createDate }</li>
                  <li>
            
               <c:choose>
                  <c:when test="${loginMember.memberId == review.memberId }">
                  <li>|</li>
                      <li>   <button type="button" id="${review.reviewNo }" class="delete-btn" >삭제</button>
                         <button type="button" class="update-btn"   data-test='${review.reviewNo }' data-toggle="modal" data-target="#myModal" >수정</button></li>
                </c:when>
               </c:choose>
               </ul>
             </div>
          </div>
        </div>
        </div>
		<div class="col-md-2">
		</div>
	</div>
      </div>
            </c:forEach>
         </c:otherwise>
      </c:choose>
    <!-- Modal -->
      <div class="modal fade" id="myModal" role="dialog">
          <div class="modal-dialog">
          
            <!-- Modal content-->
            <div class="modal-content">
              <div class="modal-header">
              </div>
              <div class="modal-body">
                 <form accept-charset="UTF-8" action="insertReview" method="post">
                        <input id="ratings-hidden" name="rating" type="hidden"> 
                        <input id="reviewNo"  type="hidden" value="">
                        <textarea class="form-control animated" cols="50" id="reviewContent" name="reviewContent" placeholder="Enter your review here..." rows="5"></textarea>
                        <div class="text-right">
                        <P id="star" name="reviewRating"> <!-- 부모 -->
                        <a href="#" value="1">★</a> <!-- 자식들-->
                         <a href="#" value="2">★</a>
                          <a href="#" value="3">★</a> 
                          <a href="#" value="4">★</a> 
                          <a href="#" value="5">★</a>
                   </p>

                        </div>
                <button type="button" class="btn btn-default" onclick="a();" id="update" >수정</button>
                    </form>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
              </div>
            </div>
            
          </div>
        </div>




<jsp:include page="../common/footer.jsp"/>

      <!-- scroll up-->
      <div class="scrollup">
         <a href="#"><i class="fa fa-chevron-up"></i></a>
      </div>
      <!-- End off scroll up -->



   </div>

   <!-- JS includes -->
   <script>
   function closeModal(){
      $('#modal').hide();
   };


   $(".delete-btn").on("click",function(){
      console.log("가나")
      var no = $(this).attr("id")
      console.log(no)
      if(confirm("리뷰를 삭제하시겠습니까?")){
         
         $.ajax({
            url : "${contextPath}/member/deleteReview",
            data : {"reviewNo": no},
            success : function(result){
               if(result>0){
                  alert("리뷰가 삭제되었습니다.")
                  location.href="${contextPath}/trainer/trainerView/${trainer.trainerNo}"
               }else{
                  alert("리뷰 삭제에 실패하였습니다.")
                  location.href="${contextPath}/trainer/trainerView/${trainer.trainerNo}"
               }
            },error : function(){
               console.log("실패")
            }
            
         })
      }
   })
   var reviewNo="0";
   $('#myModal').on('show.bs.modal', function (e) {
       var data = $(e.relatedTarget).data('test');
       console.log("리뷰리뷰"+data)
       reviewNo=data;
   });

      var rating="0";
   $('#star a').click(function (){
         $(this).parent().children("a").removeClass("on");
         $(this).addClass("on").prevAll("a").addClass("on"); 
          rating = $(this).attr("value");
   
   });
   
   function a(){
      var content = $("#reviewContent").val();
      if(rating ==0){
         alert("별점을 등록해주세요.")
      }else if(content==""){
         alert("내용을 입력해주세요.")
      }else{
      var url = "${contextPath}/member/updateReview";
      
      
      console.log("리뷰번호"+reviewNo)
      
      $.ajax({
         url : url,
         data :{"reviewContent": content,"reviewRating" : rating, "reviewNo":reviewNo},
         
         success : function(result){
            if(result>0){
               alert("리뷰가 수정되었습니다.");
               closeModal();
               location.reload();
            }else{
               swal("리뷰 수정에 실패했습니다. 다시 작성해주세요.");
            }
         },error : function(){
            console.log("실패")
         }
         
      });
   
      }
   }
   
   /* Demo purposes only */
   $(".hover").mouseleave(
     function() {
       $(this).removeClass("hover");
     }
   );
   
   $("#btn").on("click",function(){
	   alert("수강권 결제 후 예약해주세요. ")
	   
   })

   
   </script>
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