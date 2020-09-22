<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	          /* The Modal (background) */
	.searchModal {
		display: none; /* Hidden by default */
		position: fixed; /* Stay in place */
		z-index: 10; /* Sit on top */
		left: 0;
		top: 0;
		width: 100%; /* Full width */
		height: 100%; /* Full height */
		overflow: auto; /* Enable scroll if needed */
		background-color: rgb(0,0,0); /* Fallback color */
		background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
	}
	/* Modal Content/Box */
	.search-modal-content {
		background-color: #fefefe;
		margin: 15% auto; /* 15% from the top and centered */
		padding: 20px;
		border: 1px solid #888;
		width: 70%; /* Could be more or less, depending on screen size */
	}
	.searchModal{
		text-align: center;
	}
	#close{
		float:right;
	}
	.search-modal-content{
		background-color: #fcf8e3;
	}
	
	button{
		width:300px;
	  background:#1AAB8A;
	  color:#fff;
	  border:none;
	  position:relative;
	  height:30px;
	  font-size:1.6em;
	  padding:0 2em;
	  cursor:pointer;
	  transition:800ms ease all;
	  outline:none;
	}
	button:hover{
	  background:#fff;
	  color:#1AAB8A;
	}
	button:before,button:after{
	  content:'';
	  position:absolute;
	  top:0;
	  right:0;
	  height:2px;
	  width:0;
	  background: #1AAB8A;
	  transition:400ms ease all;
	}
	button:after{
	  right:inherit;
	  top:inherit;
	  left:0;
	  bottom:0;
	}
	button:hover:before,button:hover:after{
	  width:100%;
	
	  transition:800ms ease all;
	}
	.btn-success{
		padding : 0;
	}
	#star a{ 
	text-decoration: none; color: gray;
	 } 
	 #star a.on{
	  color: red;
	   }
	
</style>
</head>
<body>
<%@ include file="../common/header.jsp"%>
    <div class="row my-5">
        <%@ include file="sideMenu.jsp"%>
        <div class="col-sm-6">
    
                    <div class="row mb-3 form-row">
                    <h1>이용권 및 결제정보</h1>
                	<table class="table" id="table">
                
                		<tr>
                			<td style ="text-align: center">결제 번호</td>
                			<td style ="text-align: center">상품명</td>
                			<td style ="text-align: center">결제 금액</td>
                			<td style ="text-align: center">결제 날짜</td>
                			<td style ="text-align: center">트레이너 이름</td>
                			<td style ="text-align: center">이용권</td>
                			<td style ="text-align: center"></td>
                		</tr>
                		<c:choose>
                        
                        <c:when test="${empty myPassList}">
		                     <tr>
		                        <td colspan="6">결제내역이 없습니다.</td>
		                     </tr>
                 		 </c:when>
                 		 <c:otherwise>
                     	 <c:forEach var="pass" items="${myPassList}">
                        <tr>
                        	<td style ="text-align: center">${pass.merchantUid}</td>
                        	<td style ="text-align: center">${pass.classNm} 회권</td>
                        	<td style ="text-align: center">${pass.amount}</td>
                        	<td style ="text-align: center">${pass.raymentDate}</td>
                        	<td style ="text-align: center">${pass.trainerName}</td>
                        	<td style ="text-align: center">${pass.classCnt}</td>
                        	<td style ="text-align: center">
                        	<button type="button" id="review" name="review">리뷰 작성하기</button>
                        		
                        	
                        	</td>
                        </tr>
                        </c:forEach>
                        </c:otherwise>
                        </c:choose>
                	</table>
                </div>
                <div class="my-4">
		<c:set var="url" value="${contextPath}/member/myPassList/${pInfo.boardType}?cp="></c:set>
        	<ul class="pagination">
            	<c:if test="${pInfo.currentPage > pInfo.pagingBarSize }">	
	                <li>
	                	<!-- 맨 처음으로(<<) -->
	                    <a class="page-link text-primary" href="${url}1">&lt;&lt;</a>
	                </li>
	                
	                <li>
                      <!-- 이전으로(<) -->
                      <!-- prev 생성 식 : (현재페이지-1) / 페이징바 사이즈(10) * 10 -->
                      <!-- fmt 태그를 이용한 소수점 제거 -->
                      <fmt:parseNumber var="operand1" value="${(pInfo.currentPage-1)/pInfo.pagingBarSize}" integerOnly="true"/>
                      <c:set var="prev" value="${operand1 * 5}"/>
                      
                         <%-- <a class="page-link text-primary" href="${pInfo.boardType}?cp=${prev}">&lt;</a> --%>
                         <a class="page-link text-primary" href="${url}${prev}">&lt;</a>
                   </li>
                </c:if>
                
                <!-- 10개의 페이지 목록 -->
                <c:forEach var="p" begin="${pInfo.startPage }" end="${pInfo.endPage }">
                	<c:choose>
                		<c:when test="${p == pInfo.currentPage}">
            				<li><a class="page-link">${p }</a></li>
                		</c:when>
                		<c:otherwise>
		               		<li>
<%-- 		               			<a class="page-link text-primary" href="${pInfo.boardType }?cp=${p}">${p}</a> --%>
		               			<a class="page-link text-primary" href="${url}${p}">${p}</a>
		                	</li>
                		</c:otherwise>
					</c:choose>               
                </c:forEach>
                <!-- 다음 페이지로(>) -->
                <!-- next 생성 식 : (현재 페이지 + 9) / 10 * 10 + 1 -->
                <c:if test="${pInfo.maxPage > pInfo.endPage}">
	                <li>
	                	<fmt:parseNumber var="operand2" value="${(pInfo.currentPage + pInfo.pagingBarSize - 1)/pInfo.pagingBarSize} " integerOnly="true"/>
	                	<c:set var="next" value="${operand2 * pInfo.pagingBarSize + 1 }"/>
						<a class="page-link text-primary" href="${url}${next}">&gt;</a>
	                </li>
	                
	                <!-- 맨 끝으로(>>) -->
	                <li>
	                    <a class="page-link text-primary" href="${url}${pInfo.maxPage}">&gt;&gt;</a>
	                </li>
                </c:if>
            </ul>
        </div>
        
        <br><br><br>
        
      
                    <div class="row mb-5 form-row">
                    <h1>예약</h1>
                	<table class="table" id="table2">
                	
                		<tr>
          	
                			<td style ="text-align: center">트레이너 이름</td>
                			<td style ="text-align: center">트레이너 전화번호</td>
                			<td style ="text-align: center">예약 시간</td>
     						<td style ="text-align: center">Cancel</td>
                		</tr>
                		<c:choose>
                        
                        <c:when test="${empty myPassList}">
		                     <tr>
		                        <td colspan="6">결제내역이 없습니다.</td>
		                     </tr>
                 		 </c:when>
                 		 <c:otherwise>
                     	 <c:forEach var="cancel" items="${cancel}">
                        <tr>            
                        	<td style ="text-align: center">${cancel.memberName}</td>
                        	<td style ="text-align: center">${cancel.memberPhone}</td>
                        	<td style ="text-align: center">${cancel.scheduleTime}</td>
                        	<td style ="text-align: center">
                        	<button type="button" name="close">예약취소하기</button>	        	
                        	</td>
                        </tr>
                        </c:forEach>
                        </c:otherwise>
                        </c:choose>
                	</table>
                </div>
        </div>
        
    </div>
    <div id='calendar'></div>
     <div id="modal" class="searchModal">
 	
 	<div class="search-modal-content">
 
		<div class="page-header">
		
			
		</div>
			<div class="row">
				<div class="col-sm-12">
					<div class="row">
						<div class="col-sm-12">
							<form accept-charset="UTF-8" action="insertReview" method="post">
                        <input id="ratings-hidden" name="rating" type="hidden"> 
                        <textarea class="form-control animated" cols="50" id="reviewContent" name="reviewContent" placeholder="Enter your review here..." rows="5"></textarea>
        
                        <div class="text-right">
                        <P id="star" name="reviewRating"> <!-- 부모 -->
								<a href="#" value="1">★</a> <!-- 자식들-->
								 <a href="#" value="2">★</a>
								  <a href="#" value="3">★</a> 
								  <a href="#" value="4">★</a> 
								  <a href="#" value="5">★</a>
						 <p>

                            <button class="btn btn-success btn-lg" type="button" id="submit" style="padding: 0;">작성</button>
                            <button  class="btn btn-success btn-lg" id="close" onclick="closeModal();" style="padding: 0;"> 
										닫기
							</button>
                        </div>
                    </form>
						</div>
					</div>
				</div>
			</div>

			
	
		</div>
	</div>
<script>

function closeModal(){
	$('#modal').hide();
};

	$("button[name=review]").on("click",function(){
	console.log("가나다")
	//	window.screen.width
	//	window.screen.height
		
	//	var popupWidth = 500;
	//	var popupHeight = 300;
		
	//	var popupX = (window.screen.width/2)-(popupWidth/2);
	//	var popupY=(window.screen.height/2)-(popupHeight/2);
		var memberNo = ${loginMember.memberNo}
			var url = "${contextPath }/member/${trainerNo}/review";
			var options = "width=500, height=300, resizable=no, scrollbars=no";
			
			$('#modal').show();
			
	});
	$("button[name=close]").on("click",function(){
		if(confirm("정말 예약 취소하시겠습니까?")){
			var checkBtn = $(this);
			
			var tr = checkBtn.parent().parent();
			var td = tr.children();
			
	
			var scheduleTime = td.eq(2).text();

		
			console.log(scheduleTime);
		
			$.ajax({
				url : "${contextPath}/member/cancel",
				data:{"scheduleTime":scheduleTime},
				success : function(result){
					console.log(result)
					if(result>0){
					location.reload();
					alert("예약 취소 성공!!");
					}
				}, error : function(){
					console.log("실패")
				}	
			})
		}
		
	});
	// 리뷰 작성 여부 확인하기
	$(function(){
		var $td = $("#table tr").eq(1).children().eq(6)
		var $btn =$("<button>"); 
		$.ajax({
			url : "${contextPath}/member/checkReview",
			success : function(result){
				console.log(result)
				if(result>0){
					$td.html("")
				}
			}, error : function(){
				console.log("실패")
			}	
		})
		
	})
	
	// 리뷰작성
	
		$("#submit").click(function(){
			var rating;
			$('#star a').click(function(){
				$(this).parent().children("a").removeClass("on");
				$(this).addClass("on").prevAll("a").addClass("on"); 
				console.log($(this).attr("value")); 
				rating = $(this).attr("value")
				console.log("별"+rating)
			
			console.log("별별별 "+ rating)
			if(rating === undefined){
				alert("별점을 등록해주세요.")
			}else{
				var $content = $("#reviewContent").val();
				var url = "../insertReview"
				var no = ${trainerNo}
				console.log("트"+no)
				console.log("별"+rating)
					$.ajax({
						url : url,
						data :{"reviewContent": $content,"reviewRating" : rating, "trainerNo" : no },
						
						success : function(result){
							console.log("성공")
							if(result>0){
								alert("리뷰가 등록되었습니다.");
								window.close();
							}else{
								swal("리뷰 등록에 실패했습니다. 다시 작성해주세요.");
							}
						},error : function(){
							console.log("실패")
						}
						
					})
			}
			});
		})
	//	insertReview(rating);

	/*
	$("#submit").click(function insertReview(rating){
		console.log("lating" + rating)
		if(rating.length ==0){
			alert("별점을 등록해주세요")
		}
		var $content = $("#reviewContent").val();
		var url = "../insertReview"
		var no = ${trainerNo}
		console.log("트"+no)
		console.log("별"+rating)
			$.ajax({
				url : url,
				data :{"reviewContent": $content,"reviewRating" : rating, "trainerNo" : no },
				
				success : function(result){
					console.log("성공")
					if(result>0){
						alert("리뷰가 등록되었습니다.");
						window.close();
					}else{
						swal("리뷰 등록에 실패했습니다. 다시 작성해주세요.");
					}
				},error : function(){
					console.log("실패")
				}
				
			})
	
	})
*/

</script>
    <%@ include file="../common/footer.jsp"%>
</body>
</html>