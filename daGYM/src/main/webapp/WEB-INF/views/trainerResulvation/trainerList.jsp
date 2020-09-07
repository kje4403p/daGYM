<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application" />
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
 #trainer{
 padding-bottom: 100px;
 }
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	<!-- Trainer Section Begin -->
    <section class="trainer-section spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h2>EXPERT TRAINERS</h2>
                    </div>
                </div>
            </div>
            
           
            <div class="row">
              <c:forEach var="trainer" items="${trainerList}">
            
                <div id="trainer" class="col-lg-4 col-md-6">
                    <div class="single-trainer-item">     
                    <a href="${contextPath}/trainer/trainerView/${trainer.trainerNo}">
                     						<c:forEach items="${thList}" var="th">
	                							<c:if test="${th.parentTrainerNo == trainer.trainerNo}">
	                				
	                								<c:set var="src" value="${contextPath}${th.filePath}/${th.fileChangeName}" />
	                							
	                									<img width="370px" height="360px" src="${src}">
	                							</c:if>
	                						</c:forEach>
	                						
                        <div id="trainer-text" class="trainer-text">
                            <h5>${trainer.memberName}</h5>
                            <span>Leader</span>
                            <br><br>
                            <p>Phone: ${trainer.memberPhone}</p>
                            <p>회원 수: ${trainer.trainerMcnt}</p>
                      	    <p>수상내역: ${trainer.trainerAward}</p>
                        </div>
                        </a>
                      
                    </div>
                </div>
            
          		 </c:forEach>            
            </div>
        </div>
    </section>
    <a href="${contextPath}/trainer/signUp">트레이너 추가</a>
    <!-- Trainer Section End -->
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>