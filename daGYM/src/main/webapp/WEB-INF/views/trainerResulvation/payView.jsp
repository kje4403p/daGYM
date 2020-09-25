

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">


<head>
<title>결제</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="Bootstrap UI Kit / Components">
<meta name="keywords" content="bootstrap ui kit, bootstrap components, html5 / css3 ui kit, web ui kit" />
<meta name="author" content="KingStudio.ro">

<!-- favicon -->
<link rel="icon" href="${contextPath}/resources/images/favicon.png">
<!-- page title -->
<title>회원권 결제하기</title>

<!-- css -->
<link href="${contextPath}/resources/css/king-ui.css" rel="stylesheet">
<link href="${contextPath}/resources/css/animate.css" rel="stylesheet">
<!-- fonts -->
<link href='https://fonts.googleapis.com/css?family=Lato:300,400,400italic,700' rel='stylesheet' type='text/css'>
<link href="${contextPath}/resources/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href='${contextPath}/resources/fonts/FontAwesome.otf' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="${contextPath}/resources/css/linear-icons.css">
<script src="${contextPath}/resources/js/jquery-3.3.1.min.js"></script>



<style>

	form{
	width : 100%;
	}
	
	#register-form{
	width : 100%;}
	body > header > div > div.logo > a > img{
	width : 150px;}
	#signUp > div{
		margin : 0 auto;
	}
	#register-form{
		width : 500px;
		margin-top : 30px;
		margin-bottom : 30px;
	}
	#forms{
	 background-color: #f5f5f5;}

</style>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>

<body>
<jsp:include page="../common/header.jsp"/>
<!-- forms -->
<div id="forms">
    <div class="container">
     
        <div class="row  ">
         <div class="col-md-3 "></div>

            <!-- register form 1 -->
          <div class="col-md-6 ">
          <form method="POST"  name="paymentForm"  >
            <div class="col-sm-6">
                <div id="register-form">
                    <h3 class="log-title">결제 확인</h3>
                        
                    <div class="form-group">
                    
                    <label>트레이너 </label>
                    	
                       <input  type="text" class="form-control" id="trainerName" name="trainerName" value="${trainer.memberName}" required data-error="*Please fill out this field" disabled>
                        <div class="help-block with-errors"></div>
                    </div>
                    
                     <div class="form-group">
                    
                    <label>회수 </label>
                    	
                       <input  type="text" class="form-control" id="name" name="classNm" value="${classNm}" required data-error="*Please fill out this field" disabled>
                        <div class="help-block with-errors"></div>
                    </div>
                    
                    <div class="form-group">
                     <label>결제할 금액</label>
                        <input type="text" class="form-control" id="amount" name="amount" value="${trainer.trainerPrice}" required data-error="*Please fill out this field" disabled>
                        <div class="help-block with-errors"></div>
                    </div>
                    <div class="form-group">
                     <label>주문자명</label>
                        <input type="text" class="form-control" id="memberName" value="${loginMember.memberName }"  disabled>
                        <div class="help-block with-errors"></div>
                    </div>
                    <div class="form-group">
                      <label>주문자 Email</label>
                        <input type="text" class="form-control" id="memberEmail" name="memberEmail" value="${loginMember.memberEmail }"  disabled>
                        <div class="help-block with-errors"></div>
                    </div>
                    <div class="form-group">
                      <label>주문자 연락처</label>
                        <input type="text" class="form-control" id="memberPhone" name="memberPhone" value="${loginMember.memberPhone }" required>
                        <div class="help-block with-errors"></div>
                    </div>
                <button class="primary-btn" type="button" id="payment"  style="border : none">결제</button>
                  
                    </div>
                </div>
                </form>
                </div>
               
            </div><!-- / col-sm-6 -->
            <!-- / register form 1 -->
            <div class="col-md-3 "></div>
        </div><!-- / row -->
        <!-- / form 1 -->


    </div><!-- / container -->
</div>
<!-- / forms -->
 <jsp:include page="../common/footer.jsp"/>
<script>

	 // 결제할 데이터 전송
	$("#payment").on("click",function(){
		var classNm = $("#name").val();
		var amount=$("#amount").val();
		var memberName=$("#memberName").val();
		var memberEmail =$("#memberEmail").val();
		var memberPhone = $("#memberPhone").val();
		var trainerNo = "${trainer.trainerNo}";
		var merchant_uid;
		$.ajax({
			url : "../payment",
			type : "post",
			data : {
				"classNm" : classNm,
				"amount" : amount,
				"memberName" : memberName,
				"memberEmail" : memberEmail,
				"memberPhone" : memberPhone,
				"trainerNo" :"${trainer.trainerNo}"}
			, success : function(merchant_uid){
				if(merchant_uid != ""){ // 결제번호가 있을 경우
					payment(classNm, amount, memberName,memberEmail, memberPhone, merchant_uid, trainerNo); // 결제 함수 실행
				}else{
					alert("실패")
				}
			},error : function(){
				console("통신실패");
			}
		})
		
		
		
	});
	 
	// 결제
	function payment(classNm, amount, memberName, memberEmail,  memberPhone, merchant_uid, trainerNo){
		var IMP = window.IMP;
		IMP.init("imp85849324");
		IMP.request_pay({
			pg : "html5_inicis",
			pay_method :"card",
			merchant_uid : merchant_uid,
			name : classNm,
			amount : amount,
			buyer_email : memberEmail,
			buyer_name : memberName,
			buyer_tel : memberPhone
		}, function(rsp){
			if(rsp.success){
				$.ajax({
					url : "../insertImpUid",
					type : "post",
					dataType : "JSON",
					data :{
						impUid : rsp.imp_uid,
						merchantUid : rsp.merchant_uid,
						trainerNo : trainerNo,
						classNm : classNm
					}
				}).done(function(result){
					if(result != ""){
						location.href = "${contextPath}/trainer/orderSuccess/"+trainerNo;
					}
				});
			}else{
				alert("결제에 실패했습니다. 다시 시도해주세요.");
				$.ajax({
					url : "../deleteMerchantUid",
					data : {"merchantUid" : rsp.merchant_uid},
					success : function(result){
						console.log("삭제")
					}, error : function(){
						console.log("실패")
					}
				})
			}
		});
	
	}
	
</script>

	
</body>


</html>
