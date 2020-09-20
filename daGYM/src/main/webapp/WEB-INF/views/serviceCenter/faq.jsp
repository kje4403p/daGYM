<%@page import="com.kh.dagym.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>

	

</style>
<link rel="stylesheet" href="${contextPath}/resources/css/service/faq.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="/resource/js/bootstrap.js"></script>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<%-- <%@include file="../common/header.jsp" %> --%>

	<div id="d1">

		<div id="left">

			<%-- <%@ include file="sideMenu.jsp"%> --%>
			<jsp:include page="sideMenu.jsp" />

		</div>

		<div id="right">

			<div id="table1" >
				<table id="table2">
					<thead>
						<tr>
							<th><c:if test="${flag}">번호</c:if></th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th><c:if test="${flag}">조회수</c:if></th>
						</tr>
					</thead>

					<tbody>
						<c:choose>
							<c:when test="${empty bList}">
								<tr>
									<td colspan="5">존재하는 게시글이 없습니다.</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="board" items="${bList}"  varStatus="status">
									<div>
										<tr>
										
											<td> <c:if test="${flag}">${board.boardNo}</c:if>
												<c:choose>
												<c:when test="${flag2}">
												<input type="hidden" value="${board.boardNo}">
												</c:when>
												<c:otherwise>
												<input type="hidden" value="${nList[status.index].boardNo}">
												</c:otherwise>
												</c:choose>
											</td>
											<td>${board.boardTitle}</td>
											<td id="writer"><%-- ${board.memberNo} --%>
												${mList[status.index].memberId}</td>
											<td><jsp:useBean id="now" class="java.util.Date" /> <fmt:formatDate
													var="today" value="${now}" pattern="yyyy-MM-dd" /> <fmt:formatDate
													var="createDate" value="${board.boardEnrollDate}"
													pattern="yyyy-MM-dd" /> <fmt:formatDate var="createTime"
													value="${board.boardEnrollDate}" pattern="hh:mm:ss" /> <c:choose>
													<c:when test="${today == createDate}">
                							${createTime}
                						</c:when>
													<c:otherwise>
                							${createDate}
                						</c:otherwise>
												</c:choose></td>
											<td><c:if test="${flag}">${board.views}</c:if></td>
										</tr>
									</div>
								</c:forEach>

							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
				<!-- 관리자 로그인된 경우 글쓰기 버튼 -->
				<c:if test="${loginMember.memberGrade == 'A'}" >
					<button class="btn btn-primary" type="submit" id="newInsert">글쓰기</button>
				</c:if>
				<!-- 페이징바 -->
				<input type="hidden" id="cp" value="${pInfo.currentPage}">
				<input type="hidden" id="bType" value="${pInfo.boardType}">
				
				<c:url var="searchParameter" value="${pInfo.boardType}">
					<c:if test="${!empty param.sVal}">
						<c:param name="sKey" value="${param.sKey}"/>
						<c:param name="sVal" value="${param.sVal}" />
						
					</c:if>
				</c:url>


				<c:choose>

					<c:when test="${!empty param.sVal}">
						<c:set var="url" value="${searchParameter}&cp=" />
					</c:when>
					<c:otherwise>
						<c:set var="url" value="${searchParameter}?cp=" />
					</c:otherwise>

				</c:choose>

				<div>
				<nav id="pagingBar" aria-label="Page navigation example">
					<ul class="pagination">
						<c:if test="${pInfo.currentPage > pInfo.pagingBarSize}">
							<li class="page-item">
							<a class="page-link" href="${url}1" aria-label="Previous"> <span aria-hidden="true">&lt;&lt;</span>
							</a>
							</li>

							<li class="page-item"><fmt:parseNumber var="operand1"
									value="${(pInfo.currentPage-1)/pInfo.pagingBarSize}"
									integerOnly="true" /> <c:set var="prev" value="${operand1 *5}" />
								<a class="page-link" href="${url}${prev}"><span aria-hidden="true">&lt;</span></a>
							</li>
						</c:if>

						<c:forEach var="p" begin="${pInfo.startPage}"
							end="${pInfo.endPage}">
							<c:choose>
								<c:when test="${p==pInfo.currentPage}">
									<li class="page-item"><a class="page-link">${p}</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link" href="${url}${p}">${p}</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>

						<c:if test="${pInfo.maxPage > pInfo.endPage}">
							<li class="page-item"><fmt:parseNumber var="operand2"
									value="${(pInfo.currentPage +pInfo.pagingBarSize-1)/pInfo.pagingBarSize }"
									integerOnly="true" /> <c:set var="next"
									value="${operand2*5 + 1}" /> <a class="page-link" href="${url}${next}" aria-label="Next"><span aria-hidden="true">&gt;</span></a></li>

							<li><a class="page-item" href="${url}${pInfo.maxPage}" aria-label="Next"><span aria-hidden="true">&gt;&gt;</span></a></li>
						</c:if>
					</ul>
					</nav>
				</div>

				<div id="search">

				<select name="sKey" style="width:100px; display:inline-block;">
					<option value="tit">글제목</option>
					<option value="con">내용</option>
					<option value="tit-con">제목+내용</option>
				</select>


				<!-- 검색창 -->
				<input type="text" id="searchInput" name="sVal" 
					style="width: 25% display: inline-block;">
				<button id="searchBtn" type="button" class="btn btn-primary"
					style="width: 100px; display: inline-block;">검색</button>
				
				</div>

			</div>

		</div>
	</div>

	



	<jsp:include page="../common/footer.jsp" />
	<%-- <%@include file="../common/footer.jsp" %> --%>
	
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script>
		
	 <%
	 	Member tempMember = (Member)session.getAttribute("loginMember");
	 %>
	 var loginMember;
	 <% if(tempMember != null){ %>
	 	loginMember = "<%= tempMember.getMemberId() %>"
	 <%}%>

		$("#table2 td").on("click",function(e) {
					$click=$(this);						
					var boardNo = $(this).parent().children().eq(0).children().val();
					var this1 = $(this);
					var boardUrl = "${contextPath}/service/${pInfo.boardType}/"
							+ boardNo + "?cp=${pInfo.currentPage}";
					/* location.href=boardUrl; */
					var ttr;
					$.ajax({
						url : boardUrl,
						type : "POST",
						data : {
							"boardNo" : boardNo
						},
						dataType : "json",
						success : function(map) {

							$ttr = $tr = $("<tr>").attr("id", "tr1");
							$td = $("<td>").attr({
								colspan : "5",
								height : "auto",
								id : "td1"
							});
							
							$divout = $("<div>").attr({
								id : "tddiv",
								height : "auto%",
								width : "100%"
							});
							
							if(map.files != null){
							
							if(map.files[0]!= null){
							var src = "${contextPath}"+map.files[0].filePath+"/"+map.files[0].fileChangeName;
							$divin2 = $("<img>").attr({"src":src,"height":"300px","width":"300px"});
							$divout.append($divin2,"<br>");
							}
							
							if(map.files[1]!= null){
							var src = "${contextPath}"+map.files[1].filePath+"/"+map.files[1].fileChangeName;
							$divin3 = $("<img>").attr({"src":src,"height":"300px","width":"300px"});
							$divout.append($divin3,"<br>");
							}
							
							if(map.files[2]!= null){
							var src = "${contextPath}"+map.files[2].filePath+"/"+map.files[2].fileChangeName;
							$divin4 = $("<img>").attr({"src":src,"height":"300px","width":"300px"});
							$divout.append($divin4,"<br>");
							}
							
							if(map.files[3]!= null){
							var src = "${contextPath}"+map.files[3].filePath+"/"+map.files[3].fileChangeName;
							$divin5 = $("<img>").attr({"src":src,"height":"300px","width":"300px"});
							$divout.append(	$divin5,"<br>");
							}
							
							}
							
							$divin = $("<div>").html(
									map.board.boardContent
							);
							
							$divout.append($divin);
							
							if(loginMember == $click.parent().children().eq(2).text().trim()){
								/* var url = "location.href="'+$("#bType").val()+"/"+boardNo+"/update?cp="+$("#cp").val()+'""; */
									var updateUrl = "location.href="+"'../faq/"+  +$("#bType").val()+"/"+boardNo+"/update?cp="+$("#cp").val()+"'";
									var deleteUrl = "location.href="+"'"+  +$("#bType").val()+"/"+boardNo+"/delete?cp="+$("#cp").val()+"'";
								
								$updateBtn = $("<button>").attr({type:"button",
															  onclick:updateUrl}).text("수정");
								$updateBtn.addClass("btn btn-primary");
								
								$deleteBtn = $("<button>").attr("type","button").text("삭제").on("click",function(){
									  							  if(confirm("정말 삭제하시겠습니까?")){
									  								location.href="../faq/"+$("#bType").val()+"/"+boardNo+"/delete?cp="+$("#cp").val()+"";
									  							  };
									  						  });
								$deleteBtn.addClass("btn btn-danger");
								/* $button = $("<button>").attr({type:"button",id:"upBtn"}); */							  
								$divout.append($updateBtn,$deleteBtn);
							}
							
							$("#upBtn").on("click",function(){
								location.href=$("#bType").val()+"/"+boardNo+"/update?cp="+$("#cp").val();
							}); 
							
							
							$td.append($divout);
							$tr.append($td);
							$(this1).parent().after($tr);

							 $("#table2 td").on("click", function() {
								$divin.html("");
								$tr.remove();
							}); 

						},
						error : function() {
							console.log("ajax통신실패");
						}

					}); //
					 $('html').click(function(e) {
						if (!$(e.target).hasClass("#table2 td")) {
							 $ttr.remove();
						}
					});
				});

		//--------사이드바
		
		//--------검색동작
		$("#searchBtn").on("click",function(){
			var searchUrl="";
			var $sVal=$("input[name='sVal']");
			var $sKey=$("select[name='sKey']");
			
			if($sVal.val().trim().length == 0){
				searchUrl="${pInfo.boardType}";
			}else{
				
				searchUrl+="../search/${pInfo.boardType}?";
				searchUrl+="sKey="+$sKey.val()+"&sVal="+$sVal.val();
			}
			
			location.href=searchUrl;
		});
		
		
	
	//글쓰기 동작
	$("#newInsert").on("click",function(){
		
		location.href="../${pInfo.boardType}/insert";
	});
		
		
	
	</script>
	
</body>
</html>