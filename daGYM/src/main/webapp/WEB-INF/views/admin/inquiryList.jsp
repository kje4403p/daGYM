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
    .pagination {
	    justify-content: center;}
	    
	.imageView {
		width: 70px;
		height: 70px;}
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
                                           				<td>${board.questionType}</td>
                                           				<td>${board.boardTitle}</td>
                                           				<td>
                                           					<fmt:formatDate var="enrollDate" value="${board.boardEnrollDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
                                           					${enrollDate}
                                           				</td>
                                           				<td><button class="btn btn-warning contentBtn btn-rounded" type="button"  data-toggle="modal" data-target="#en-modal">확인하기</button></td>
                                           				<input type="hidden" value="${board.boardContent}">
                                           			</tr>
                                           		</c:forEach>
                                           	</c:otherwise>
                                    	</c:choose>
	                                </tbody>
	                            </table>
                            </div>
                            
							<!-- 페이징바 -->
							<div class="my-4">
					            <ul class="pagination">
					            	
					            	<c:if test="${pInfo.currentPage > pInfo.pagingBarSize}">
						                <li>
						                	<!-- 맨 처음으로(<<) -->
						                    <a class="page-link text-primary" href="inquiryList?cp=1">&lt;&lt;</a>
						                </li>
						                
						                <li>
						                	<!-- 이전으로(<) -->
						                	<!-- prev 생성 식 : (현재페이지 - 1) / 페이징바 사이즈(10) * 10 -->
						                	<!-- fmt 태그를 이용한 소수점 제거 -->
						                	<fmt:parseNumber var="operand1" value="${(pInfo.currentPage-1)/pInfo.pagingBarSize}" integerOnly="true"/>
						                	
						                	<c:set var="prev" value="${operand1 * pInfo.pagingBarSize}"/>
						                	
					                   		<a class="page-link text-primary" href="inquiryList?cp=${prev}">&lt;</a>
						                </li>
					                </c:if>
					                
					                <!-- 10개의 페이지 목록 -->
					                <c:forEach var="p" begin="${pInfo.startPage}" end="${pInfo.endPage}">
					                	<c:choose>
					                		<c:when test="${p == pInfo.currentPage}">
					                			<li><a class="page-link">${p}</a></li>
					                		</c:when>
					                		
					                		<c:otherwise>
						                		<li>
						                			<a class="page-link text-primary" href="inquiryList?cp=${p}">${p}</a>
							                	</li>
							                </c:otherwise>
					                	</c:choose>
					                </c:forEach>
					                
					                <!-- 다음 페이지로(>) -->
					                <!-- next 생성 식 : (현재 페이지 + 9) / 10 * 10 + 1 -->
					                <c:if test="${pInfo.maxPage > pInfo.endPage}">
					                
					                	<!-- 다음 페이지(>) -->
						                <li>
						                	<fmt:parseNumber var="operand2" value="${(pInfo.currentPage + pInfo.pagingBarSize - 1) / pInfo.pagingBarSize}" integerOnly="true"/>
						                	<c:set var="next" value="${operand2 * pInfo.pagingBarSize + 1}"/>
											<a class="page-link text-primary" href="inquiryList?cp=${next}">&gt;</a>
						                </li>
						                
						                <!-- 맨 끝으로(>>) -->
						                <li>
						                    <a class="page-link text-primary" href="inquiryList?cp=${pInfo.maxPage}">&gt;&gt;</a>
						                </li>
					                </c:if>
					            </ul>
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
					<h3 class="modal-title" id="exampleModalLabel">1:1 문의 답변하기</h3>
				    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				    <span aria-hidden="true">&times;</span>
				    </button>
				</div>
                <div class="modal-body">
					<form action="insertAnswer" id="information-en" method="GET">
						<h4 id="content-style">문의 내용</h4>
						
						<div id="content-area">
						</div>
						
						<!-- 이미지 부분 -->
						<div class="mt-3" id="imageArea">
	                    </div>
						
						<hr>
						<label id="label-title" class="modal-left">답변 내용 입력</label> <br>
						<textarea name="replyContent" cols="50" rows="5" style="resize: none; margin-bottom: 20px;" class="modal-left" required></textarea> 
						<br>
					
						<div class="modal-footer" style="clear: both; margin-bottom: 20px;">
							<input type="hidden" name="parentBoardNo" id="parentBoardNo">
					        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
					        <button type="submit" class="btn btn-primary" id=requestBtn>완료</button>
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
				
				$.ajax({
					url : "fileList",
					data : {"boardNo":boardNo},
					dataType : "JSON",
					success : function(fList) {
						$("#imageArea").empty();
						for(var i=0; i<fList.length; i++) {
							var resultUrl = fList[i].filePath + "/" + fList[i].fileChangeName;
							var $img = $("<img>").addClass("imageView ml-3").attr("src", "${contextPath}/" + resultUrl);
							$("#imageArea").append($img);
						}
					}, error : function() {
						console.log("통신 실패");
					}
				});
				
				$("#content-area").html(boardContent);
				$("#parentBoardNo").val(boardNo);
			});
		});
	</script>
</body>
</html>