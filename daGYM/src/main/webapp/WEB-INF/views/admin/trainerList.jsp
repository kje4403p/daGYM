<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link href="https://cdn.datatables.net/1.10.21/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
	<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.css" rel="stylesheet" crossorigin="anonymous" />
<title>트레이너 조회</title>
<style type="text/css">
	#dataTable > tbody {
	color: white;}
	.table-hover tbody tr:hover {
  	color: white;}
</style>
</head>
<body>
	<div class="container-scroller">
		<jsp:include page="../admin/sidebar.jsp"/>
		
		<div class="container-fluid page-body-wrapper">
			<jsp:include page="../admin/navbar.jsp"/>
			
			<div class="main-panel">
				<div class="content-wrapper">
					<div class="card mb-4">
                            <div class="card-header">
								트레이너 조회
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered table-hover" id="trainerTable" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th>트레이너 번호</th>
                                                <th>아이디</th>
                                                <th>이름</th>
                                                <th>전화번호</th>
                                                <th>회원수</th>
                                                <th>1회 수업료</th>
                                                <th>입사일</th>
                                                <th>수정/탈퇴</th>
                                            </tr>
                                        </thead>
                                        <tfoot>
                                            <tr>
                                                <th>트레이너 번호</th>
                                                <th>아이디</th>
                                                <th>이름</th>
                                                <th>전화번호</th>
                                                <th>회원수</th>
                                                <th>1회 수업료</th>
                                                <th>입사일</th>
                                                <th>수정/탈퇴</th>
                                            </tr>
                                        </tfoot>
                                        <tbody>
                                            <c:choose>
                                            	<c:when test="${empty tList}">
                                            		<tr><td colspan="7">트레이너 없음</td></tr>
                                            	</c:when>
                                            	
                                            	<c:otherwise>
                                            		<c:forEach var="trainer" items="${tList}">
                                            			<tr>
                                            				<td>${trainer.trainerNo}</td>
                                            				<td>${trainer.trainerId}</td>
                                            				<td>${trainer.trainerName}</td>
                                            				<td>${trainer.trainerPhone}</td>
                                            				<td>${trainer.trainerMemberCount}</td>
                                            				<td>
                                            					<fmt:formatNumber  var="trainerPrice" type="number" maxFractionDigits="3" value="${trainer.trainerPrice}"/>
                                            					${trainerPrice}
                                            				</td>
                                            				<td>${trainer.trainerEnrollDate}</td>
                                            				<td>
                                            					<button class="btn-warning updateTrainer" type="button">수정</button>
                                            					<button class="btn-warning ml-3 deleteTrainer" type="button">탈퇴</button>
                                            				</td>
                                            			</tr>
                                            		</c:forEach>
                                            	</c:otherwise>
                                            </c:choose>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
				</div>
				
				<jsp:include page="../admin/footer.jsp"/>
			</div>
		</div>
	</div>
	
	<script>
		$(function() {
			$(".updateTrainer").on("click", function() {
				var trainerNo = $(this).parent().parent().children().eq(0).text();
				
				location.href = "${contextPath}/admin/updateTrainer/" + trainerNo;
			});
			
			$(".deleteTrainer").on("click", function() {
				if(confirm("정말 탈퇴시키시겠습니까 ?")) {
					var trainerNo = $(this).parent().parent().children().eq(0).text();
					
					location.href = "deleteTrainer/" + trainerNo;
				}
			});
		});
	
		$(document).ready( function () {
		    $('#trainerTable').DataTable();
		} );
	</script>
	
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	
	<script src="https://code.jquery.com/jquery-3.5.1.js" crossorigin="anonymous"></script>
	<script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
	<script src="https://cdn.datatables.net/1.10.21/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
	
	<script src="${contextPath}/resources/js/admin/datatables-demo.js"></script>
</body>
</html>