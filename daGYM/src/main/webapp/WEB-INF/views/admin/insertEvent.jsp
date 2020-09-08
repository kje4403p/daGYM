<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트 작성</title>
<style>
    .insert-label {
      display: inline-block;
      width: 80px;
      line-height: 40px
    }
</style>
</head>
<body>
<div class="container-scroller">
	<jsp:include page="../admin/sidebar.jsp"/>
	
	<div class="container-fluid page-body-wrapper">
		<jsp:include page="../admin/navbar.jsp"/>
		
		<div class="main-panel">
			<div class="content-wrapper">
	
				<h3>이벤트 등록</h3>
				<hr>
				<!-- enctype: form태그 데이터가 서버에 제출 될 때의 인코딩 방법을 지정하는 속성
					 기본값 : "application/x-www-form-urlencoded" : 데이터를 서버에 전송하기 전에 문자로 인코딩
					 multipart/form-data : 모든 데이터를 인코딩 하지 않음(원본 데이트 상태(바이트) -> 파일을 서버에 전달 가능)
					 
					   -->
				<form action="insertEvent" method="post" role="form" enctype="multipart/form-data" onsubmit="return validate();">
					<div class="form-inline mb-2">
						<label class="input-group-addon mr-3 insert-label">제목</label> 
						<input type="text" class="form-control" id="title" name="boardTitle" size="70">
					</div>
					<%-- 	
					<div class="form-inline mb-2">
						<label class="input-group-addon mr-3 insert-label">작성자</label>
						<h5 class="my-0" id="writer">${loginMember.memberId}</h5>
					</div>
	 				--%>
	
					<div class="form-inline mb-2">
						<label class="input-group-addon mr-3 insert-label">작성일</label>
						<h5 class="my-0" id="today">
							<jsp:useBean id="now" class="java.util.Date" />
							<fmt:formatDate value="${now}" pattern="yy-MM-dd"/>
						</h5>
					</div>
					
					<div class="form-inline mb-2">
						<label class="input-group-addon mr-3 insert-label">날짜</label>
						<h5>시작일</h5><input class="date ml-2 mr-5" name="startDate" type="date" >
						<h5>종료일</h5><input class="date ml-2" name="endDate" type="date">
					</div>  
	
					<hr>
	
					<div class="form-inline mb-2">
						<label class="input-group-addon mr-3 insert-label">썸네일</label>
						<div class="boardImg" id="titleImgArea">
							<img id="titleImg" width="200" height="200">
						</div>
					</div>
	
	
					<div class="form-inline mb-2">
						<label class="input-group-addon mr-3 insert-label">업로드<br>이미지</label>
						<div class="mr-2 boardImg" id="contentImgArea1">
							<img id="contentImg1" width="150" height="150">
						</div>
	
						<div class="mr-2 boardImg" id="contentImgArea2">
							<img id="contentImg2" width="150" height="150">
						</div>
	
						<div class="mr-2 boardImg" id="contentImgArea3">
							<img id="contentImg3" width="150" height="150">
						</div>
					</div>
	
	
					<!-- 파일 업로드 하는 부분 -->
					<div id="fileArea">
						<!--  multiple 속성
							- input 요소 하나에 둘 이상의 값을 입력할 수 있음을 명시 (파일 여러개 선택 가능)
						 -->
						<input type="file" id="img1" name="images" onchange="LoadImg(this,1)"> 
						<input type="file" id="img2" name="images" onchange="LoadImg(this,2)">
						<input type="file" id="img3" name="images" onchange="LoadImg(this,3)"> 
						<input type="file" id="img4" name="images" onchange="LoadImg(this,4)">
					</div>
	
					<div class="form-group">
						<div>
							<label for="content">내용</label>
						</div>
						<textarea class="form-control" id="content" name="boardContent"
							rows="10" style="resize: none;"></textarea>
					</div>
	
	
					<hr class="mb-4">
	
					<div class="text-center">
						<button type="submit" class="btn btn-warning">등록</button>
						<a class="btn btn-warning float-right" href="${header.referer}">목록으로</a>
					</div>
	
				</form>
			</div>
			<jsp:include page="../admin/footer.jsp"/>
		</div>
	</div>
</div>

	<script>

		// 유효성 검사
		function validate() {
			if($("#title").val().trim().length == 0) {
				alert("제목을 입력해주세요.");
				$("#title").focus();
				return false;
			}

			if($("#content").val().trim().length == 0) {
				alert("내용을 입력해주세요.");
				$("#content").focus();
				return false;
			}
			
			if($("input[name=startDate]").val() > $("input[name=endDate]").val() || $("input[name=startDate]").val().length == 0 || $("input[name=endDate]").val().length == 0) {
				alert("이벤트 날짜는 필수로 입력해야하며, 시작일이 종료일보다 빨라야합니다.");
				$("input[name=startDate]").focus();
				return false;
			}
		}
		
		// 이미지 공간을 클릭할 때 파일 첨부 창이 뜨도록 설정하는 함수
	    $(function () {
	       $("#fileArea").hide();

	      $("#titleImgArea").click(function () {
	        $("#img1").click();
	      });
	      $("#contentImgArea1").click(function () {
	        $("#img2").click();
	      });
	      $("#contentImgArea2").click(function () {
	        $("#img3").click();
	      });
	      $("#contentImgArea3").click(function () {
	        $("#img4").click();
	      });

	    });

	    // 각각의 영역에 파일을 첨부 했을 경우 미리 보기가 가능하도록 하는 함수
	    function LoadImg(value, num) {
	      if (value.files && value.files[0]) {
	        var reader = new FileReader();

	        reader.onload = function (e) {
	          switch (num) {
	            case 1:
	              $("#titleImg").attr("src", e.target.result);
	              break;
	            case 2:
	              $("#contentImg1").attr("src", e.target.result);
	              break;
	            case 3:
	              $("#contentImg2").attr("src", e.target.result);
	              break;
	            case 4:
	              $("#contentImg3").attr("src", e.target.result);
	              break;
	          }
	        }

	        reader.readAsDataURL(value.files[0]);
	      }
	    }
		
	</script>
</body>
</html>