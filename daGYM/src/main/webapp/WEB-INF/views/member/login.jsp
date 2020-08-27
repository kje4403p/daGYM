<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	<div id="login-container" style= "margin: auto; width:250px">
		<div style="margin: auto; width:200px; margin-bottom:20px">
		</div>
		
		<form action="loginAction" method="post" class="form-signin">
	
			<div class="form-label-group">
				<input type="text" id="memberId" name="memberId" class="form-control" placeholder="ID" required autofocus> 
				<label for="memberId">ID</label>
			</div>
	
			<div class="form-label-group">
				<input type="password" id="memberPwd" name="memberPwd" class="form-control" placeholder="Password" required> 
				<label for="memberPwd">Password</label>
			</div>
	
			<div class="checkbox mb-3">
				<label> 
					<input type="checkbox" name="saveId"> 아이디 저장
				</label>
			</div>
			<button class="btn btn-lg btn-primary btn-block" type="submit">Login</button>
		</form>
	</div>
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>