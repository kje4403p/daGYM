<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
            <form action="checkPwd" method="POST"
                onsubmit="return validate();">
                    
                    <div class="col-sm-6"  style="left:400px;">
                    <h1 style ="text-align: center;">회원정보</h1>
                	<table>
                    	<tr>
                    		<td id="profile" style ="text-align: center;">회원정보를 수정하기 위해선 비밀번호 확인이 필요 합니다.</td>
                        </tr>
                        <tr>
                    		<td style ="text-align: center;">비밀번호 <input id="memberPwd" name="memberPwd" type="password" required> <button class="btn btn-info">확인</button></td>
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