<%@page import="com.kh.dagym.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% Member loginMember = (Member)request.getAttribute("loginMember"); %>
<!DOCTYPE html>
<html>
<head>
	<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application" />
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
 #trainer{
 padding-bottom: 100px;
 }

</style>
</head>
<body>
<c:if test="${!empty msg }">
		<script>
			swal({icon : "${status}",title : "${msg}", text : "${text}"});
			
		</script>
		<c:remove var="msg"/>
		<c:remove var="status"/>
		<c:remove var="text"/>
	</c:if>
	
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
                  <c:if test="${loginMember==null}">
                
                    <div class="single-trainer-item">  
                        <a class="trainerList" href="${contextPath}/member/login">            
                  </c:if>
                  <c:if test="${loginMember!=null}">
                    <div class="single-trainer-item">  
                           <a class="trainerList" href="${contextPath}/trainer/trainerView/${trainer.trainerNo}">
                  </c:if>
  
                     						<c:forEach items="${thList}" var="th">
	                							<c:if test="${th.parentTrainerNo == trainer.trainerNo}">
	                				
	                								<c:set var="src" value="${contextPath}${th.filePath}/${th.fileChangeName}" />
	                							
	                									<img width="370px" height="360px" src="${src}">
	                							</c:if>
	                						</c:forEach>
	                						
                        <div id="trainer-text" class="trainer-text">
                            <h5>${trainer.memberName}</h5>
                            <span>Trainer</span>
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
    <!-- Trainer Section End -->
	<jsp:include page="../common/footer.jsp"/>
</body>
	<script>
	$(".trainerList").on("click",function(event){
		if(<%=loginMember%>==null){
		alert("로그인 후 이용해주세요.");
		location.href="${contextPath}/trainer/trainerView/${trainer.trainerNo}";
		}
	});
		
	</script>
</html>