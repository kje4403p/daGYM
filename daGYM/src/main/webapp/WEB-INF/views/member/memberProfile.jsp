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
        <div class="col-sm-5">
            <form action="memberProfile" method="POST"
                onsubmit="return validate();">
                    <h1>회원정보</h1>
                    <div class="row mb-3 form-row">
                	<table class="table table-hover">
                		<tr>
                			<td>* 아이디 </td>
                			<td>${loginMember.memberId}</td>
                		</tr>
                		<tr>
                			<td>* 비밀번호  </td> 	
                			<td><input type="password"></td>
                		</tr>
                		<tr>
                		</tr>
                		<tr>
                			<td>* 비밀번호 확인 </td>
                			<td><input type="password"></td> 
                		</tr>
                		<tr>
                			<td>* 닉네임 </td>
                			<td><input value="${loginMember.memberName}"></td> 
                		</tr>
                		<tr>
                			<td>* 전화번호 </td>
                			<td><input value="${loginMember.memberPhone}"></td> 
                		</tr>
                		<tr>
                			<td>* 이메일 </td>
                			<td><input type="email" value="${loginMember.memberEmail}"></td> 
                		</tr>
                		<tr>
                			<td></td>
                			<td><button>확인</button> <button type="reset">취소</button>
                		</tr>
                	</table>
                </div>
            </form>
        </div>
    </div>
    <script>
    </script>
    <%@ include file="../common/footer.jsp"%><br>
</body>
</html>