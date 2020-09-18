<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/* 	.side{float:left; height:2300px; max-width:15% ; min-width:15% ;}
	#sidenav{
		width:10%;
		display:flex;
	}
	#sidenav li{
		}
	#sidenav a{
	
	} */
	#side-nav{
		margin-top:10px;
		float: left;
	    width: 15%;
	    background-color: white;
	    /* margin:60px 30px 0px 20px; */
	    border-radius: 20px;
	    width:100%;
	}
	#side-nav a:hover{
		color:red;
	}
	#side-nave a {
		font-size: 2em;
	}
	#wrapper {
		height:100%;
		display:inline-block;
		width: 15%;
		float:left;
		margin:80px 30px 0px 20px;
	}
</style>
</head>
<body>
<!-- 	<div class="col-sm-2 side m-0" style="max-width:13%;">
	<h3>Side Menu</h3> -->
<%-- 	<ul class="list-group">
		<li class="list-group-item list-group-item-action"><a href="${contextPath}/event/list">이벤트</a></li>
		<li class="list-group-item list-group-item-action"><a href="${contextPath}/info/list">정보 게시판</a></li>
	</ul> --%>
	<div id="wrapper">
	<h3>Side Menu</h3>
	<ul class="nav flex-column" id="side-nav">
	  <li class="nav-item">
	    <a class="nav-link active" href="${contextPath}/event/list">이벤트</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link" href="${contextPath}/info/list">정보 게시판</a>
	  </li>
	</ul>
	</div>
</body>
</html>