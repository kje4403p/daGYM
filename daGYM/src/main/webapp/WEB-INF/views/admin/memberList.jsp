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
<title>회원 조회</title>
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
								회원 조회
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered table-hover" id="dataTable" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th>회원 번호</th>
                                                <th>아이디</th>
                                                <th>이름</th>
                                                <th>전화번호</th>
                                                <th>이메일</th>
                                                <th>가입일</th>
                                            </tr>
                                        </thead>
                                        <tfoot>
                                            <tr>
                                                <th>회원 번호</th>
                                                <th>아이디</th>
                                                <th>이름</th>
                                                <th>전화번호</th>
                                                <th>이메일</th>
                                                <th>가입일</th>
                                            </tr>
                                        </tfoot>
                                        <tbody>
                                            <c:choose>
                                            	<c:when test="${empty mList}">
                                            		<tr><td colspan="6">회원 없음</td></tr>
                                            	</c:when>
                                            	
                                            	<c:otherwise>
                                            		<c:forEach var="member" items="${mList}">
                                            			<tr>
                                            				<td>${member.memberNo}</td>
                                            				<td>${member.memberId}</td>
                                            				<td>${member.memberName}</td>
                                            				<td>${member.memberPhone}</td>
                                            				<td>${member.memberEmail}</td>
                                            				<td>${member.memberEnrollDate}</td>
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
		$(document).ready( function () {
		    $('#dataTable').DataTable();
		} );
	</script>
	
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	
	<script src="https://code.jquery.com/jquery-3.5.1.js" crossorigin="anonymous"></script>
	<script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
	<script src="https://cdn.datatables.net/1.10.21/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
	
	<script src="${contextPath}/resources/js/admin/datatables-demo.js"></script>
</body>
</html>