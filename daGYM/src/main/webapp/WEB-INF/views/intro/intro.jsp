<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
<style>
 #images>img{
	width : 100%;
	height : 800px; 
	
}
	table{
		margin : 20px;
	}
	body > section.services-section > div{
	padding-left : 0;
	padding-right : 0;
	}
	
	#top_btn {
    position: fixed;
    right: 2%;
    bottom: 50px;
  	
    z-index: 999;
    }
    #top_btn>img{
    width:80px;
    height:80px;
    }
    
   section{
    	    background-color: #f5f5f5;
    }
    #content2{
    	padding-top: 10px;
    }
}


출처: https://cofs.tistory.com/188 [CofS]
</style>
</head>

<body>
<jsp:include page="../common/header.jsp"/>
	<!-- Grey with black text -->
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark nav justify-content-center">
	  <ul class="navbar-nav nav">
	    
	    <li class="nav-item">
	      <a class="nav-link" href="#content1">시설 소개</a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link" href="#content2">오시는 길</a>
	    </li>
	    
	  </ul>
	</nav>
    

    <!-- Services Section Begin -->
    <section class="services-section">
        <div class="container-fluid">
            <div class="row">
               <div class="col-md-12" id="images">
                             <img src="resources/images/dagym/dagym1.jpg" alt="">
                             <img src="resources/images/dagym/dagym2.jpg" alt="">
                             <img src="resources/images/dagym/dagym3.jpg" alt="">
                             <img src="resources/images/dagym/dagym4.jpg" alt="">
              </div>
            </div>
        </div>
    </section>
    <!-- Services Section End -->

   
    
    <!-- Testimonial Section End -->
	<section id="intro">
	
		 <div class="section-title">
	                        <h2 id="content2">오시는 길</h2>
	     </div>
	       <div class="row" >
                  <div class="col-md-2" ></div>
	     		<div class="col-md-8">
	     			<table class="table" cellpadding="0" cellspacing="0" style="display:table;">
	     				<tbody>
	     					<tr>
	     						<td colspan="2">
	     						
	     							<div id="map" style="width:800px;height:500px;"></div>
	     						
	     		
	     						</td>
	     					</tr>
	     					
	     					<tr>
	     						<th style="padding-top:30px;">주소</th>
	     						<td style="padding-top:30px;">서울특별시 중구 남대문로 120 대일빌딩 2F, 3F (T: 1544-9970 / F: 02-722-0858)</td>
	     					</tr>
	     					<tr>
	     						<th >버스</th>
	     						<td>우리은행 종로지점 정류장<br>
	     							163/172/201<br>
	     							7017/7121/7022</td>
	     						
	     					</tr>
	     					<tr>
	     						<th>지하철</th>
	     						<td>지하철 2호선 을지로입구역 3번출구 100M / 1호선 종각역 4번, 5번 출구 200M 
	     					</tr>	
	     					
	     					
	     					
	     				</tbody>
	     			</table>
	     		</div>
	     		<div class="col-md-2" ></div>
	     		
	     			<a href="#" id="top_btn"><img src="resources/images/dagym/top.png" ></a>
	     		
	     </div>
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9c1e469e1fb64b426f1c9b793e7d792d"></script>
		<script>
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			    mapOption = { 
			        center: new kakao.maps.LatLng(37.567921, 126.9819415), // 지도의 중심좌표
			        level: 4 // 지도의 확대 레벨
			    };
			
			var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
			
			// 마커가 표시될 위치입니다 
			var markerPosition  = new kakao.maps.LatLng(37.567921, 126.9819415); 
			
			// 마커를 생성합니다
			var marker = new kakao.maps.Marker({
			    position: markerPosition
			});
			
			// 마커가 지도 위에 표시되도록 설정합니다
			marker.setMap(map);

		
	</script>
	    
                    
	</section>
	<script>
    $(function() {
        $(window).scroll(function() {
            if ($(this).scrollTop() > 500) {
                $('#MOVE_TOP_BTN').fadeIn();
            } else {
                $('#MOVE_TOP_BTN').fadeOut();
            }
        });
    });

	</script>
                
  

    <!-- Js Plugins -->
    <script src="resources/js/jquery-3.3.1.min.js"></script>
    <script src="resources/js/bootstrap.min.js"></script>
    <script src="resources/js/jquery.magnific-popup.min.js"></script>
    <script src="resources/js/mixitup.min.js"></script>
    <script src="resources/js/jquery.slicknav.js"></script>
    <script src="resources/js/owl.carousel.min.js"></script>
    <script src="resources/js/main.js"></script>
    	<jsp:include page="../common/footer.jsp"/>
</body>

</html>