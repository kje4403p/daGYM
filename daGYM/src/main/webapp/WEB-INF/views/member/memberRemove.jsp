<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="../common/header.jsp"%>
    <div class="row my-5">
        <%@ include file="sideMenu.jsp"%>
        <div class="col-sm-5">
            <form method="POST" action="memberRemoveAction"
                onsubmit="return validate();">
                    <h2>탈퇴약관</h2>
                    <div class="row mb-3 form-row">
                	<table class="table table-hover">
                		<tr><td></td>
                			<td>회원 탈퇴시 1개월간 재가입이 불가능하며,<br>
							남은 이용권은 환불이 불가 합니다.<br>
							탈퇴시 이전 게시물은 삭제가 불가능하게 됩니다.<br><br>
							동의합니다. <input id="removeCheck" type="checkbox">
							</td>
							<td></td>
                		</tr>
                		<tr>
                			
                			<div id="memberRemove">
                				<tr> 
                					<td><h2>회원 탈퇴</h2></td>
                					<td>회원탈퇴를 하기  위해선 비밀번호 확인이 필요 합니다.</td>
                					<td></td>
                				</tr>
                				<br><br>
                				<tr>
	                				<td>비밀번호</td>
	                				<td><input id="memberPwd" name="memberPwd" type="password" placeholder="비밀번호를 입력 해주세요"></td>
	                				<td><button id="deleteBtn">확인</button></td>
                				</tr>
                			</div>
                		</tr>
                	</table>
                </div>
            </form>
        </div>
    </div>
    <script>
    function validate() {

		if(!$("#removeCheck").prop("checked")){
			alert("약관에 동의해 주세요.");
			return false;
		}else{
			return confirm("정말로 탈퇴하시겠습니까?");
		}
		
	}
    </script>
    <%@ include file="../common/footer.jsp"%><br>
</body>
</html>