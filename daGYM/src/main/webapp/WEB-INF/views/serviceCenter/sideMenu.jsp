<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
</style>

<!DOCTYPE html>
<!-- Created By CodingNepal -->
<html lang="en" dir="ltr">
<head>
<meta charset="utf-8">
<title>Animated Sidebar Menu | CodingLab</title>
<link rel="stylesheet" href="style.css">
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
</head>
<body>
	<div class="wrapper">
		<input type="checkbox" id="btn" hidden> <label for="btn"
			class="menu-btn"> <i class="fas fa-bars"></i> <i
			class="fas fa-times"></i>
		</label>
		<nav id="sidebar">
			<div class="title">고객센터</div>
			<ul class="list-items">
				
				<li><a href="${contextPath}/service/question/3" onclick="return loginCheck();"><i class="fas fa-stream"></i>1:1 문의</a></li>
				<li><a href="${contextPath}/service/faq/4"><i class="fas fa-stream"></i>자주묻는 질문</a></li>
				
				<div class="icons">
					
				</div>
			</ul>
		</nav>
	</div>
	<div class="content">
		<div class="header"></div>
		<p></p>
	</div>
	<script>
		function loginCheck(){
			if(${empty loginMember}){
				 alert("로그인 후 사용가능 합니다.");
				  return false;
			}else{
				  return true;
			}
		}
	</script>
</body>
</html>
