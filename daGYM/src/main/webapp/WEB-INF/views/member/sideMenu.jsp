<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String bbbsId = (String)request.getAttribute("bbsId"); %>
<style>
	#side > li{
		text-align: center;
		width: 200px;
		background-color: rgb(231,76,60);
		color : white;
	}
	
</style>
<script>
</script>
<div id="sideSet" class="col-sm-2 mt-1" style="left : 20px;">
	<h3>마이페이지</h3>
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
			location.href= "mypage";
		});
		
		$("#mytext").on("click", function() {
			location.href= "mytext";
		});
		
		$("#myschedule").on("click", function() {
			location.href= "myschedule";
		});
	</script>
</div>