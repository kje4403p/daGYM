<%@page import="java.util.List"%>
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
			<form method="POST" onsubmit="return validate();">
				<h1>내 정보</h1>
				<div class="row mb-3 form-row">
					<br>
					<table>
						<tr>
							<td id="profile" style="text-align: center;">회원정보<br> <img
								src="${contextPath}/resources/images/dagym/profile.png" alt=""><br>비밀번호,닉네임,주소등
								회원정보를 수정 할 수 있습니다.
							</td>
							<c:choose>
								<c:when test="${empty loginMember }">
									<a href="${contextPath}/member/login"
										class="primary-btn signup-btn">Login</a>

								</c:when>
								<c:otherwise>
									<c:if test="${loginMember.memberGrade == 'G'}">
										<td id="pass" style="text-align: center;">PT이용권/결제정보<br>
											<img src="${contextPath}/resources/images/dagym/pass.jpg"
											alt=""><br>PT이용권 및 결제정보를 확인 할 수 있습니다.
										</td>
									</c:if>
									<c:if test="${loginMember.memberGrade == 'T'}">
										<td id="Students" style="text-align: center;">내 수강생 조회<br>
											<img src="${contextPath}/resources/images/dagym/pass.jpg"
											alt=""><br>내 수강생을 조회할 수 있습니다.
										</td>
									</c:if>
								</c:otherwise>
							</c:choose>

							<td id="remove" style="text-align: center;">회원 탈퇴<br> <img
								src="${contextPath}/resources/images/dagym/remove.png" alt=""><br>남은
								헬스이용권은 환불되지 않습니다.
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