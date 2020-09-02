<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 문의사항</title>
<style type="text/css">
	#list-table > *{
		color: white;}
	#list-table > thead, tfoot {
		background-color: black;}
  	#list-table > tbody {
  		background-color: #33394a;}
  	/* 모달 */
    #label-title, #content-style{
        color: rgb(56, 190, 243);}
    .modal-left{
      float: left;
      margin-bottom: 0;}
    .listBtn{
    	float: left;}
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
								1:1 문의사항
                            </div>
                            <div class="card-body">
	                            <table class="table table-bordered" id="list-table" width="100%">
	                                <thead style="color: white;">
	                                    <tr>
	                                        <th>문의 번호</th>
	                                        <th>회원 아이디</th>
	                                        <th>분류</th>
	                                        <th>제목</th>
	                                        <th>작성일</th>
	                                        <th>내용 확인</th>
	                                    </tr>
	                                </thead>
	                                <tbody>
	                                    <c:choose>
                                           	<c:when test="${empty iList}">
                                           		<tr><td colspan="6">문의사항 없음</td></tr>
                                           	</c:when>
                                           	
                                           	<c:otherwise>
                                           		<c:forEach var="board" items="${iList}">
                                           			<tr>
                                           				<td>${board.boardNo}</td>
                                           				<td>${board.memberId}</td>
                                           				<td>${board.questionCode}</td>
                                           				<td>${board.boardTitle}</td>
                                           				<td>
                                           					<fmt:formatDate var="enrollDate" value="${board.boardEnrollDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
                                           					${enrollDate}
                                           				</td>
                                           				<td><button class="btn btn-warning contentBtn" type="button"  data-toggle="modal" data-target="#en-modal">확인하기</button></td>
                                           				<input type="hidden" value="${board.boardContent}">
                                           			</tr>
                                           		</c:forEach>
                                           	</c:otherwise>
                                    	</c:choose>
	                                </tbody>
	                            </table>
                            </div>
                        </div>
				</div>
				
				<jsp:include page="../admin/footer.jsp"/>
			</div>
		</div>
	</div>
	
	<!-- Modal -->
	<div class="modal fade" id="en-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content" style="width: 400px;">
				<div class="modal-header">
					<h3 class="modal-title" id="exampleModalLabel">1:1 문의 확인하기</h3>
				    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				    <span aria-hidden="true">&times;</span>
				    </button>
				</div>
                <div class="modal-body">
					<form action="insertAnswer" id="information-en" method="GET">
						<h4 id="content-style">문의 내용</h4>
						<div id="content-area">
						</div>
						<hr>
						<label id="label-title" class="modal-left">요청 내용 입력</label> <br>
						<textarea name="replyContent" cols="50" rows="5" style="resize: none; margin-bottom: 20px;" class="modal-left"></textarea> 
						<br>
					
						<div class="modal-footer" style="clear: both; margin-bottom: 20px;">
							<input type="hidden" name="parentBoardNo" id="parentBoardNo">
					        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
					        <button type="submit" class="btn btn-primary" id=requestBtn>요청</button>
					    </div>
					</form>
                </div>
			</div>
		</div>
	</div>
        
        
	<script>
		$(document).ready( function () {
		    $('#dataTable').DataTable();
		} );
		
		$(function() {
			$(".contentBtn").on("click", function() {
				var boardNo = $(this).parent().parent().children().eq(0).text();
				var boardContent = $(this).parent().parent().children().eq(6).val();
				
				$("#content-area").html(boardContent);
				$("#parentBoardNo").val(boardNo);
			});
		});
	</script>
</body>
</html>