<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>트레이너 정보 수정</title>
<style>
    form{
		width : 100%;}
	body > header > div > div.logo > a > img{
		width : 150px;}
	#signUp > div{
		margin : 0 auto;}
	#register-form{
		width : 500px;
		margin-top : 30px;
		margin-bottom : 30px;}
</style>
</head>
<body>
<div class="container-scroller">
	<jsp:include page="../admin/sidebar.jsp"/>
	
	<div class="container-fluid page-body-wrapper">
		<jsp:include page="../admin/navbar.jsp"/>
		
		<div class="main-panel">
		    <div class="content-wrapper">
		        <div class="row">
		          <form action="../trainerUpdate" method="post"  enctype="multipart/form-data" name="signUpForm" id="signUp" role="form"  onsubmit="return validate();">
		            <div class="col-sm-6">
		                <div id="register-form">
		                    <h3 class="log-title mb-4">트레이너 정보 수정</h3>
		                      
		                    <input type="hidden" name="trainerNo" value="${trainer.trainerNo}">
		                     
		                    <div class="form-group">
		                        <span class="col-md-2">아이디</span>
		                        <span class="col-md-4">${trainer.trainerId}</span>
		                    </div>
		                    <div class="form-group">
		                        <span class="col-md-2">이  름</span>
		                        <span class="col-md-4">${trainer.trainerName}</span>
		                    </div>
		                    <div class="form-group">
		                        <input type="password" class="form-control" id="memberPwd" name="trainerPwd" placeholder="변경 비밀번호" data-error="*Please fill out this field">
		                        <div class="help-block with-errors"><span id="checkPwd">&nbsp;</span></div>
		                    </div>
		                    <div class="form-group">
		                        <input type="password" class="form-control" id="memberPwd2"  placeholder="비밀번호 확인">
		                        <div class="help-block with-errors"><span id="checkPwd2">&nbsp;</span></div>
		                    </div>
		                    <div class="form-group">
		                        <input type="text" class="form-control" id="memberPhone" name="trainerPhone" value="${trainer.trainerPhone}" required>
		                        <div class="help-block with-errors"><span id="checkPhone">&nbsp;</span></div>
		                    </div>
		                    <div class="form-group">
		                        <input type="email" class="form-control" id="memberEmail" name="trainerEmail" value="${trainer.trainerEmail}" required>
		                        <div class="help-block with-errors"><span id="checkEmail">&nbsp;</span></div>
		                    </div>
		                    <div class="form-group">
		                        경력 사항 <textarea class="form-control" rows="5" id="trainerCareer" name="trainerCareer" required>${trainer.trainerCareer}</textarea>
		                    </div>
		                     <div class="form-group">
		                        수상 경력 <textarea class="form-control" rows="5" id="trainerAward" name="trainerAward" required>${trainer.trainerAward}</textarea>
		                    </div>
		                    <div class="form-group">
		                        회원님들께 할 말 <textarea class="form-control" rows="5" id="trainerComment" name="trainerComment" required>${trainer.trainerComment}</textarea>
		                    </div>
		                    <div class="form-group">
		                        SNS 주소 <input type="text" class="form-control" id="trainerSNS" name="trainerSNS" value="${trainer.trainerSNS}" required>     
		                    </div>
		                    <div class="form-group">
		                        1회 수업료 <input type="text" class="form-control" id="trainerPrice" name="trainerPrice" value="${trainer.trainerPrice}" required>     
		                    </div>

		                    <div class="form-inline mb-2">
								<label class="input-group-addon mr-3 insert-label">대표사진</label>
								<div class="trainerImg" id="titleImgArea">
									<img id="titleImg" width="200" height="200" src="${contextPath}${file.filePath}/${file.fileChangeName}">
								</div>
							</div>
							
							<div id="fileArea">
								<input type="file" id="img1" name="thumbnail" onchange="LoadImg(this,1)"> 
							</div>
		                    
		                    <!-- log-line -->
		                    <div class="log-line reg-form-1">
		                        <div class="pull-right" style="text-align: center;">
		                            <button type="submit" id="reg-submit" class="btn btn-warning btn-md btn-success-filled btn-log" >트레이너 수정</button>
		                        </div>
		                    </div><!-- / log-line -->
	                    </div>
	                </div>
                  </form>
           		</div>
	        </div>

			<jsp:include page="../admin/footer.jsp"/>
		</div>
	</div>
</div>

	<script>
		/* $("#reg-submit").on("click",function(){
			 if(!$("#img1").val()){
				 alert("사진을 업로드 해주세요!");
			 }
		}); */
		// 이미지 공간을 클릭할 때 파일 첨부 창이 뜨도록 설정하는 함수
		$(function () {
		   $("#fileArea").hide();
	
		  $("#titleImgArea").click(function () {
		    $("#img1").click();
		  });
		});
	
		// 각각의 영역에 파일을 첨부 했을 경우 미리 보기가 가능하도록 하는 함수
		function LoadImg(value, num) {
		  if (value.files && value.files[0]) {
		    var reader = new FileReader();
	
		    reader.onload = function (e) {
		      switch (num) {
		        case 1:
		          $("#titleImg").attr("src", e.target.result);
		          break;
		      }
		    }
	
		    reader.readAsDataURL(value.files[0]);
		  }
		}
	  
	  
	  
		var signUpCheck={
			"pwd1" : true,
			"pwd2" : true,
			"name" : true,
			"phone" : true,

		};
		
		var $pwd1 = $("#memberPwd");
		var $pwd2 = $("#memberPwd2");
		var $pwd = $("#memberPwd, #memberPwd2")
		var $name = $("#memberName");
		var $phone = $("#memberPhone");

		
		$pwd.on("input", function(){
			var regExp = /^[A-Za-z0-9]{6,12}$/;
			
			if(!regExp.test($("#trainerPwd").val())){
				$("#checkPwd").text("비밀번호 형식이 유효하지 않습니다.").css("color", "rgb(255, 159, 64)");
				signUpCheck.pwd1 = false;
				
			}else{
				$("#checkPwd").text("사용 가능한 비밀번호 입니다.").css("color", "rgb(82, 242, 98)");
				signUpCheck.pwd1 = true;
			}
			
			if(!signUpCheck.pwd1 && $pwd2.val().length > 0){
				$pwd2.val("");
				$pwd1.focus();
			}else if(signUpCheck.pwd1 && $pwd2.val().length > 0){
				if($pwd1.val().trim() != $pwd2.val().trim()){
					$("#checkPwd2").text("비밀번호 불일치").css("color","rgb(255, 159, 64)");
					signUpCheck.pwd2 = false;
				}else{
					$("#checkPwd2").text("비밀번호 일치").css("color","rgb(82, 242, 98)");
					signUpCheck.pwd2 = true;
				}
			}
			
		});
		
		$phone.on("input", function(){
			var regExp =  /(01[016789])[-](\d{4}|\d{3})[-]\d{4}$/;
			
			if(!regExp.test($phone.val())){
				$("#checkPhone").text("전화번호가 유효하지 않습니다.").css("color", "rgb(255, 159, 64)");
				signUpCheck.phone = false;
			}else{
				$("#checkPhone").text("유효한 전화번호 입니다.").css("color", "rgb(82, 242, 98)");
				signUpCheck.phone = true;
			}
			
		});
		
		$email.on("input", function(){
			var regExp =  /^[\w]{4,}@[\w]+(\.[\w]+){1,3}$/; // 4글자 아무단어 @ 아무단어 . * 3아무3
			
			if(!regExp.test($email.val())){
				$("#checkEmail").text("유효하지 않은 이메일입니다.").css("color","rgb(255, 159, 64)");
				signUpCheck.email = false;
				
			}else{
				$("#checkEmail").text("유효한 이메일입니다.").css("color","rgb(82, 242, 98)");
				signUpCheck.email = true;
			}
		});

		function validate(){
			for(var key in signUpCheck){
				if(!signUpCheck[key]){
					var msg;
					switch(key){
					case "pwd" : msg="비밀번호가 " ; break;		
					case "name" : msg="이름이 "; break;		
					case "phone" : msg="전화번호가 "; break;		
					
					}
					alert(msg+"유효하지 않습니다.");
					var el="#"+key;
					$(el).focus();
					return false;
				}
			}
		}
		
	</script>
</body>
</html>