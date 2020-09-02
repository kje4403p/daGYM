<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application" />
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#trainerImg{
		margin:0 auto;
	}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	<div class="container" id="content-main">
		   <img id="trainerImg" src="${contextPath}/resources/img/trainer/trainer-1.jpg" alt="">
		   <h2>${trainer.trainerName}</h2>
		    
	</div>
	<jsp:include page="../common/footer.jsp"/>
</body>

</html>