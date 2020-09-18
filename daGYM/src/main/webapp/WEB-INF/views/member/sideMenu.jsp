<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String bbbsId = (String)request.getAttribute("bbsId"); %>
<style>

	@font-face {
    font-family: 'MaplestoryOTFBold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/MaplestoryOTFBold.woff') format('woff');
    font-weight: normal;
    font-style: normal;
	}
	
	#side > li{
		border-radius : 50px;
		text-align: center;
		width: 200px;
		background-color: rgb(197,254,254);
		color : rgb(5,148,216);
		font-family: MaplestoryOTFBold;
	}
	
	#side > li:hover{
		background-color : RGB(141,254,254);
	}
	
</style>
<script>
</script>
<div id="sideSet" class="col-sm-2 mt-1" style="left : 20px;">
	<h3 style ="font-family: MaplestoryOTFBold; color:rgb(5,148,216);">마이페이지</h3>
	<br>
	<ul id="side" class="list-group">
		<li id="mypage" type="button" class="list-group-item list-group-item-action">내 정보</li>
		<br>
		<li id="mytext" type="button" class="list-group-item list-group-item-action">내 글</li>
		<br>
		<li id="myschedule" type="button" class="list-group-item list-group-item-action">내 스케줄</li>
		<br>
	</ul>
	
	<script>
		$("#mypage").on("click", function() {
			location.href= "${contextPath}/member/myPage";
		});
		
		$("#mytext").on("click", function() {
			location.href= "${contextPath}/member/myBoardList/1";
		});
		
		$("#myschedule").on("click", function() {
			location.href= "${contextPath}/member/mySchedule";
		});
	</script>
</div>