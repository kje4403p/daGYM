<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css" rel="stylesheet"> <!--CDN 링크 -->

<meta charset="UTF-8">
<title>마이페이지</title>
<style>
/*
	@font-face {
    font-family: 'MaplestoryOTFBold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/MaplestoryOTFBold.woff') format('woff');
    font-weight: normal;
    font-style: normal;
	}
*/
	#profile,#pass,#Students,#remove{
		/* border:3px solid black; */
		border-radius : 50px;
		background-color : rgb(255,157,159);
		
		width : 370px;
		height: 150px;
		font-family: GmarketSansBold;
	}
	
	#profile:hover,#pass:hover,#Students:hover,#remove:hover{
		cursor:pointer;
		background-color : RGB(255,185,187);
	}
	
	#space{
		width : 30px;
	}
</style>
</head>
<body >
	<%@ include file="../common/header.jsp"%>
	
	<div class="row my-5" style="height:500px;">
		<%@ include file="sideMenu.jsp"%>
		<div class="col-sm-10">
			<form method="POST" onsubmit="return validate();" style="padding-top: 80px;">
	
				
				<br>
				<div class="row mb-5 form-row" style="margin-left: 150px;">
					<br>
					<table>
					<tr>
					</tr>
						<tr>
							<td id="profile" style="text-align: center;">회원정보<br>
								<i class="fa fa-address-card fa-3x"></i> 
								<br>비밀번호,닉네임,주소등<br>
								회원정보를 수정 할 수 있습니다.
								
							</td>
							
							<td id="space">
							</td>
							<c:choose>
								<c:when test="${empty loginMember }">
								</c:when>
								<c:otherwise>
									<c:if test="${loginMember.memberGrade == 'G'}">
										<td id="pass" style="text-align: center;">PT이용권/결제정보/리뷰등록/예약취소<br>
											<i class="fas fa-money-check-alt fa-3x"></i>
											<br>PT이용권,결제정보등 확인 할 수 있습니다.
										</td>
										<td id="space">
										
										</td>
									</c:if>
									<c:if test="${loginMember.memberGrade == 'T'}">
										<td id="Students" style="text-align: center;">내 수강생 조회<br>
											<i class="fas fa-user-graduate fa-3x"></i>
											<br>내 수강생을 조회할 수 있습니다.
										</td>
										<td id="space">
										</td>
									</c:if>
								</c:otherwise>
							</c:choose>
							<c:if test="${loginMember.memberGrade == 'G'}">
							<td id="remove" style="text-align: center;">회원 탈퇴<br>
								<i class="fas fa-user-times fa-3x"></i>
								<br>남은 헬스이용권은 환불되지 않습니다.
							</td>
							</c:if>
							<td id="space">
							</td>
						</tr>
					</table>
				</div>
			</form>
		</div>
	</div>
	<script>
		$("#profile").on("click", function() {
			location.href = "${contextPath}/member/memberProfileCk";
		});
		$("#pass").on("click", function() {
			location.href = "${contextPath}/member/myPassList/1";
		});
		$("#Students").on("click", function() {
			location.href = "${contextPath}/member/myStudentsList/1";
		});
		$("#remove").on("click", function() {
			location.href = "${contextPath}/member/memberRemove";
		});
	</script>
	<%@ include file="../common/footer.jsp"%><br>
</body>
</html>