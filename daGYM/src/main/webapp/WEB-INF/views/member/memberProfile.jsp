<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
</head>
<body>
    <%@ include file="../common/header.jsp"%>
    <div class="row my-5">
        <%@ include file="sideMenu.jsp"%>
        <div class="col-sm-7" style="left:150px;">
            <form action="updateAction" method="POST"
                onsubmit="return validate();">
                    <div class="row mb-3 form-row">
                	<table class="table table-hover" >
                		<h1> 정보 변경 </h1>
                		<tr>
                			<td>아이디 </td>
                			<td>${loginMember.memberId}</td>
                		</tr>
                		<tr>
                			<td>이메일</td>
                			<td>${loginMember.memberEmail}</td> 
                		</tr>
                		<tr>
                			<td>* 비밀번호  </td> 	
                			<td>
                			<input id="memberPwd" name="memberPwd" type="password"> 
                			<span id="checkPwd">비밀번호는 필수 입력입니다.</span>
                			</td>
                		</tr>
                		<tr>
                		</tr>
                		<tr>
                			<td>* 비밀번호 확인 </td>
                			<td>
                			<input id="memberPwd2" name="memberPwd2" type="password">
                			<span id="checkPwd2">&nbsp;</span>
                			</td>
                		</tr>
                		<tr>
                			<td>* 이름 </td>
                			<td>
                			<input id="memberName" name="memberName" value="${loginMember.memberName}">
                			<span id="checkName">&nbsp;</span>
                			</td> 
                		</tr>
                		<tr>
                			<td>* 전화번호 </td>
                			<td>
                			<input id="memberPhone" name="memberPhone" value="${loginMember.memberPhone}">
                			<span id="checkPhone">&nbsp;</span>
                			</td> 
                		</tr>
                		<tr>
                			<td></td>
                			<td><button class="btn btn-info">확인</button> <button class="btn btn-info" type="reset" id="reset">취소</button>
                		</tr>
                	</table>
                </div>
            </form>
        </div>
    </div>
    <script>
    var signUpCheck={
    		"pwd1" : false,
    		"pwd2" : false,
    		"phone" : true,
    		"name" : true,
    		"email" : true,
    		"code" : true
    	};
    	
    	var $pwd1 = $("#memberPwd");
    	var $pwd2 = $("#memberPwd2");
    	var $pwd = $("#memberPwd, #memberPwd2");
    	var $name = $("#memberName");
    	var $phone = $("#memberPhone");
    	var $email = $("#memberEmail");
    	var $code = $("#code");
    	var $reset = $("#reset");
    $pwd.on("input", function(){
		var regExp = /^[A-Za-z0-9]{6,12}$/;
		if(!regExp.test($("#memberPwd").val())){
			$("#checkPwd").text("비밀번호 형식이 유효하지 않습니다.").css("color", "red");
			signUpCheck.pwd1 = false;
			
		}else{
			$("#checkPwd").text("사용 가능한 비밀번호 입니다.").css("color", "blue");
			signUpCheck.pwd1 = true;
		}
		
		if(!signUpCheck.pwd1 && $pwd2.val().length > 0){
			$pwd2.val("");
			$pwd1.focus();
		}else if(signUpCheck.pwd1 && $pwd2.val().length > 0){
			if($pwd1.val().trim() != $pwd2.val().trim()){
				$("#checkPwd2").text("비밀번호 불일치").css("color","red");
				signUpCheck.pwd2 = false;
			}else{
				$("#checkPwd2").text("비밀번호 일치").css("color","blue");
				signUpCheck.pwd2 = true;
			}
		}
		
	});
    
    $name.on("input", function(){
		var regExp = /^[가-힣]{2,}$/;
		if(!regExp.test($name.val())){
			$("#checkName").text("한글 두 글자 이상을 입력하세요.").css("color", "red");
			signUpCheck.name = false;
		}else{
			$("#checkName").text("유효한 이름입니다.").css("color", "blue");
			signUpCheck.name = true;
		}
		
	});
    
    $phone.on("input", function(){
		var regExp =  /(01[016789])[-](\d{4}|\d{3})[-]\d{4}$/;
		
		if(!regExp.test($phone.val())){
			$("#checkPhone").text("전화번호가 유효하지 않습니다.").css("color", "red");
			signUpCheck.phone = false;
		}else{
			$("#checkPhone").text("유효한 전화번호 입니다.").css("color", "blue");
			signUpCheck.phone = true;
		}
		
	});
	
	$email.on("input", function(){
		var regExp =  /^[\w]{4,}@[\w]+(\.[\w]+){1,3}$/; // 4글자 아무단어 @ 아무단어 . * 3아무3
		
		if(!regExp.test($email.val())){
			$("#checkEmail").text("유효하지 않은 이메일입니다.").css("color","red");
			signUpCheck.email = false;
			signUpCheck.code=false;
			$("#checkCode").text("이메일이 변경되었습니다. 다시 인증해주세요.").css("color","red");
			$("#emailCk-btn").prop("disabled", true)
		}else{
			$("#checkEmail").text("유효한 이메일입니다.").css("color","blue");
			signUpCheck.email = true;
			signUpCheck.code=false;
			$("#checkCode").text("이메일이 변경되었습니다. 다시 인증해주세요.").css("color","red");
			$("#emailCk-btn").prop("disabled", false)
			
		}
	});
	
function sendEmail(){
		var $memberEmail =$("#memberEmail"); 
		$.ajax({
			url : "sendEmail",
			data : {"memberEmail":$memberEmail.val()},
			type : "GET",
			success : function(code){
				if(code!=null){
					alert("인증번호가 전송되었습니다.")
					codeCheck(code);
				}else{
					alert("이메일을 다시 입력해주세요.")
				}
			},error:function(){
				console.log("통신실패");
			}
			
		});
	}
	
	function codeCheck(code){
		$code.on("input", function(){
		if($code.val()==code){
			$("#checkCode").text("인증번호 일치").css("color","blue");
			signUpCheck.code=true;
		}else{
			$("#checkCode").text("인증번호 불일치").css("color","red");
			signUpCheck.code=false;
		}
		});
	}
	
	$reset.on("click", function(){
		signUpCheck.pwd1 = false;
		signUpCheck.pwd2 = false;
		signUpCheck.phone = true;
		signUpCheck.name = true;
		signUpCheck.email = true;
		signUpCheck.code = true;
		$("#checkPwd").text("비밀번호는 필수 입력입니다.").css("color", "red");
		$("#checkPwd2").text("").css("color", "red");
		$("#checkName").text("").css("color", "red");
		$("#checkPhone").text("").css("color", "blue");
		$("#checkEmail").text("").css("color","blue");
		$("#checkCode").text("").css("color","blue");
	});
	
	function validate(){
		
		for(var key in signUpCheck){
			if(!signUpCheck[key]){
				var msg;
				switch(key){	
				case "pwd1" : msg="비밀번호가 " ; break;
				case "pwd2" : msg="비밀번호 확인이 " ; break;	
				case "name" : msg="이름이 "; break;		
				case "phone" : msg="전화번호가 "; break;		
				case "email" : msg="이메일이 "; break;	
				case "code" : msg="인증번호가 "; break;
				
				}
				alert(msg+"유효하지 않습니다.");
				var el="#"+key;
				$(el).focus();
				return false;
			}
			
		}
		
	}
    </script>
    <%@ include file="../common/footer.jsp"%><br>
</body>
</html>