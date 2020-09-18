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
        <div class="col-sm-10">
            <form method="POST" action="memberRemoveAction"
                onsubmit="return validate();">
                    <h2>탈퇴약관</h2>
                    <div class="row mb-3 form-row">
                	<table class="table table-hover">
                		<tr><td></td>
                			<td>
                			▶ 탈퇴 신청 시 즉시 탈퇴 처리됩니다.<br>
                			▶ 사용하고 계신 아이디는 탈퇴 후 재가입이 불가능합니다.<br>
                			▶ 탈퇴 전 작성딘 게시물이나 댓글 등은 탈퇴 후 삭제가 불가능합니다.<br>
                			▶ 구매한 이용권 환불 및 사용이 불가능합니다.<br>
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
	                				<td><input id="memberPwd" name="memberPwd" type="password" placeholder="비밀번호를 입력 해주세요" required></td>
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