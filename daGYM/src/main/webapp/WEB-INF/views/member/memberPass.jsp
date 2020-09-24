<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%  String rating = (String)request.getParameter("rating");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Molla - Bootstrap eCommerce Template</title>
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
	*{
	  font-family: 'GmarketSansBold';
	}
</style>
</head>
<body>
<%@ include file="../common/header.jsp"%>
    <div class="row my-5">
        <%@ include file="sideMenu.jsp"%>
        <div class="col-sm-6">
                    <div class="row mb-3 form-row">
                    <img id="logo" src="${contextPath}/resources/images/dagym/이용권.png" style="width:400px;"alt="">
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
                        		
                        	
                        	</td>
                        </tr>
                        </c:forEach>
                        </c:otherwise>
                        </c:choose>
                	</table>
                </div>
             
        
        <br><br><br>
        
      
                    <div class="row mb-5 form-row">
                    <img id="logo" src="${contextPath}/resources/images/dagym/예약.png" style="width:200px;"alt="">
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
                        <input id="mUid" name="merchantUid" type="hidden" value="">
                        <textarea class="form-control animated" cols="50" id="reviewContent" name="reviewContent" placeholder="Enter your review here..." rows="5"></textarea>
        				<p id="mUid"></p>
                        <div class="text-right">
                        <P id="star" name="reviewRating"> <!-- 부모 -->
								<a href="#" value="1">★</a> <!-- 자식들-->
								 <a href="#" value="2">★</a>
								  <a href="#" value="3">★</a> 
								  <a href="#" value="4">★</a> 
								  <a href="#" value="5">★</a>
						 </p>

                            <button class="btn btn-success btn-lg" type="button" onclick="a();" id="submit" style="padding: 0;">작성</button>
                            <button type="button" class="btn btn-success btn-lg" id="close" onclick="closeModal();" style="padding: 0;"> 
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


	$(document).ready(function (){
		var size = $("#table tr").length;
		var memberNo = ${loginMember.memberNo}
		for(var i=0 ; i<size-1 ; i++){
			var mUid=$("table tr").eq(i+1).children().eq(0).text(); // 결제번호
			var $btn = $("table tr").eq(i+1).children().eq(6); // 버튼영역
			var $button=$("<button>").addClass("btn btn-primary btn-rounded reviewbtn").attr({"name":"review","type":"button"}).text("리뷰작성하기"); // 버튼
			(function(i){
				$.ajax({
					url : "${contextPath}/member/checkReview",
					data : {"mUid" : mUid},
					async: false,
					success : function(result){
					
						if(result>0){
							$btn.html("");
						}else{
							$btn.append($button);
							}
						
					},error : function(){
						console.log("실패")
					}
				})
			
				})(i)
			
			
		}
		
		$(".reviewbtn").on("click",function(){
			var mUid = $(this).parent().parent().children().eq(0).text();
			console.log("uid"+mUid)
			 $('#modal').show();
			$("#mUid").val(mUid)
		})
		
		
	})
	
			
			
	
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
	
	

	var rating="0";
	$('#star a').click(function (){
			$(this).parent().children("a").removeClass("on");
			$(this).addClass("on").prevAll("a").addClass("on"); 
			 rating = $(this).attr("value");
	
	});
	

		function a(){
			var content = $("#reviewContent").val();
			var merchatUid = $("#mUid").val()
			console.log("번호" + merchatUid)
			if(rating ==0){
				alert("별점을 등록해주세요.")
			}else if(content==""){
				alert("내용을 입력해주세요.")
			}else{
			var url = "../insertReview";
			var no = ${trainerNo};
			
			$.ajax({
				url : url,
				data :{"reviewContent": content,"reviewRating" : rating, "trainerNo" : no ,"merchantUid":merchatUid},
				
				success : function(result){
					if(result>0){
						alert("리뷰가 등록되었습니다.");
						closeModal();
						location.reload();
					}else{
						swal("리뷰 등록에 실패했습니다. 다시 작성해주세요.");
					}
				},error : function(){
					console.log("실패")
				}
				
			});
		
			}
		}
	
	

</script>
    <%@ include file="../common/footer.jsp"%>
</body>
</html>