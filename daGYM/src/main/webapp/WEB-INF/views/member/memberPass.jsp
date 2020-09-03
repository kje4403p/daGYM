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
            <form action="updateAction" method="POST"
                onsubmit="return validate();">
                    <h1>이용권 및 결제정보</h1>
                    <div class="row mb-3 form-row">
                	<table class="table table-hover">
                		<tr>
                			<td>결제 번호</td>
                			<td>상품명</td>
                			<td>결제 금액</td>
                			<td>결제 날짜</td>
                			<td>트레이너 이름</td>
                			<td>이용권</td>
                		</tr>
                		<tr>
                			<td>${paymentNo}</td>
                			<td>${classNm}</td>
                			<td>${classSum }</td>
                			<td>${paymentDate}</td>
                			<td>${trainnerNm}</td>
                			<td>뭐 넣어야 할까요?~?</td>
                		</tr>
                	</table>
                </div>
            </form>
        </div>
    </div>
    <%@ include file="../common/footer.jsp"%><br>
</body>
</html>