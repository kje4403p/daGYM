<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.side{float:left; height:2300px; max-width:15%; min-width:15%;}
</style>
</head>
<body>
	<div class="col-sm-2 side mr-5 ml-0" style="max-width:13%;">
	<h3>Side Menu</h3>
	<ul class="list-group">
		<li class="list-group-item list-group-item-action"><a href="${contextPath}/event/list">이벤트</a></li>
		<li class="list-group-item list-group-item-action"><a href="${contextPath}/info/list">정보 게시판</a></li>
	</ul>
</div>
</body>
</html>