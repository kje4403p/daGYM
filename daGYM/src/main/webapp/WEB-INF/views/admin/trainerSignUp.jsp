<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>트레이너 가입</title>
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
		          <form action="${contextPath}/trainer/insertAction" method="post"  enctype="multipart/form-data" name="signUpForm" id="signUp" role="form"  onsubmit="return validate();">
		            <div class="col-sm-6">
		                <div id="register-form">
		                    <h3 class="log-title">트레이너 가입</h3>
		                        
		                    <div class="form-group">
		                        <input type="text" class="form-control" id="memberId" name="memberId" placeholder="아이디" required data-error="*Please fill out this field">
		                        <div class="help-block with-errors"><span id="checkId">&nbsp;</span></div>
		                    </div>
		                    <div class="form-group">
		                        <input type="password" class="form-control" id="memberPwd" name="memberPwd" placeholder="비밀번호" required data-error="*Please fill out this field">
		                        <div class="help-block with-errors"><span id="checkPwd">&nbsp;</span></div>
		                    </div>
		                    <div class="form-group">
		                        <input type="password" class="form-control" id="memberPwd2"  placeholder="비밀번호 확인" required>
		                        <div class="help-block with-errors"><span id="checkPwd2">&nbsp;</span></div>
		                    </div>
		                    <div class="form-group">
		                        <input type="text" class="form-control" id="memberName" name="memberName"  placeholder="이름" required>
		                        <div class="help-block with-errors"><span id="checkName">&nbsp;</span></div>
		                    </div>
		                    <div class="form-group">
		                        <input type="text" class="form-control" id="memberPhone" name="memberPhone"  placeholder="전화번호" required>
		                        <div class="help-block with-errors"><span id="checkPhone">&nbsp;</span></div>
		                    </div>
		                    <div class="form-group">
		                        <input type="email" class="form-control" id="memberEmail" name="memberEmail"  placeholder="이메일" required>
		                        <div class="help-block with-errors"><span id="checkEmail">&nbsp;</span></div>
		                    </div>
		                    <div class="form-group">
		                        <textarea class="form-control" rows="5" id="trainerCareer" name="trainerCareer" placeholder="경력(근무지 포함)" required></textarea>
		                    </div>
		                     <div class="form-group">
		                        <textarea class="form-control" rows="5" id="trainerAward" name="trainerAward"  placeholder="수상내역" required></textarea>
		                    </div>
		                    <div class="form-group">
		                        <textarea class="form-control" rows="5" id="trainerComment" name="trainerComment" placeholder="회원들에게 하고싶은 말" required></textarea>
		                    </div>
		                    <div class="form-group">
		                        <input type="text" class="form-control" id="trainerSNS" name="trainerSNS"  placeholder="개인 SNS" required>     
		                    </div>
		                    <div class="form-group">
		                        <input type="text" class="form-control" id="trainerPrice" name="trainerPrice"  placeholder="수업료" required>     
		                    </div>

		                    <div class="form-inline mb-2">
								<label class="input-group-addon mr-3 insert-label">대표사진</label>
								<div class="trainerImg" id="titleImgArea">
									<img id="titleImg" width="200" height="200">
								</div>
							</div>
							
							<div id="fileArea">
								<input type="file" id="img1" name="thumbnail" onchange="LoadImg(this,1)" required> 
							</div>
		                    
		                    <!-- log-line -->
		                    <div class="log-line reg-form-1">
		                        <div class="pull-right" style="text-align: center;">
		                            <button type="submit" id="reg-submit" class="btn btn-warning btn-md btn-success-filled btn-log" >트레이너 가입</button>
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

	$("#reg-submit").on("click",function(){
		 if(!$("#img1").val()){
			 alert("사진을 업로드 해주세요!");
		 }
	});
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
			"id" : false,
			"pwd1" : false,
			"pwd2" : false,
			"name" : false,
			"phone" : false,

		};
		
		var $id = $("#memberId");
		var $pwd1 = $("#memberPwd");
		var $pwd2 = $("#memberPwd2");
		var $pwd = $("#memberPwd, #memberPwd2")
		var $name = $("#memberName");
		var $phone = $("#memberPhone");

		
		
		$id.on("input", function(){
			signUpCheck.id=false;
			console.log("체크" +signUpCheck.id)
			var regExp = /^[a-zA-Z\d]{6,12}$/;
			console.log($id.val())
			if(!regExp.test($id.val())){
				$("#checkId").text("아이디 형식이 유효하지 않습니다.").css("color","rgb(255, 159, 64)");
				signUpCheck.id=false;
				
			}else{
				$.ajax({
					url : "${contextPath}/member/idDupCheck",
					data : {"memberId": $id.val()},
					type : "GET",
					success : function(result){
						if(result == 0){
							$("#checkId").text("사용 가능한 아이디입니다.").css("color", "rgb(82, 242, 98)");
							signUpCheck.id=true;
						}else{
							$("#checkId").text("이미 사용중인 아이디입니다.").css("color","rgb(255, 159, 64)");
						}
					}, error : function(){
						console.log("통신실패");
					}
				});
			}
		});
		
		$pwd.on("input", function(){
			var regExp = /^[A-Za-z0-9]{6,12}$/;
			console.log($("#memberPwd").val())
			console.log("22 : " + $pwd2.val())
			
			if(!regExp.test($("#trainerPwd").val())){
				$("#checkPwd").text("비밀번호 형식이 유효하지 않습니다.").css("color", "rgb(255, 159, 64)");
				signUpCheck.pwd1 = false;
				
			}else{
				$("#checkPwd").text("사용 가능한 비밀번호 입니다.").css("color", "rgb(82, 242, 98)");
				signUpCheck.pwd1 = true;
			}
			
			if(!signUpCheck.pwd1 && $pwd2.val().length > 0){
				console.log("불일치")
				$pwd2.val("");
				$pwd1.focus();
			}else if(signUpCheck.pwd1 && $pwd2.val().length > 0){
				console.log("일치")
				if($pwd1.val().trim() != $pwd2.val().trim()){
					$("#checkPwd2").text("비밀번호 불일치").css("color","rgb(255, 159, 64)");
					signUpCheck.pwd2 = false;
				}else{
					$("#checkPwd2").text("비밀번호 일치").css("color","rgb(82, 242, 98)");
					signUpCheck.pwd2 = true;
				}
			}
			
		});
		
		$name.on("input", function(){
			var regExp = /^[가-힣]{2,}$/;
			console.log("이름 " + $name.val())
			if(!regExp.test($name.val())){
				$("#checkName").text("한글 두 글자 이상을 입력하세요.").css("color", "rgb(255, 159, 64)");
				signUpCheck.name = false;
			}else{
				$("#checkName").text("유효한 이름입니다.").css("color", "rgb(82, 242, 98)");
				signUpCheck.name = true;
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
				$("#emailCk-btn").prop("disabled", false)
				
			}
		});

		function validate(){
			
			for(var key in signUpCheck){
				if(!signUpCheck[key]){
					var msg;
					switch(key){
					case "id" : msg="아이디가 "; break;		
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