<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 글</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<style>
.w3-btn {margin-bottom:10px;}

</style>
<body>
    <%@ include file="../common/header.jsp"%>
    <div class="row my-5">
        <%@ include file="sideMenu.jsp"%>
        <div class="col-sm-5">
            <form method="POST">
                    <h1>내 글</h1>
                    <button class="w3-button w3-white w3-border w3-border-red w3-round-large" id="myBoard" >내가 쓴글</button>
                    <button class="w3-button w3-white w3-border w3-border-red w3-round-large" id="myReply">내 댓글</button>
                    <br><br>
                    <span style ="text-align: center">내 글리스트 총 1개</span>
                    <div class="row mb-3 form-row">
                    
                <table class="table table-hover">

                    	<tr>
                    		<td style ="text-align: center">게시판</td>
                    		<td style ="text-align: center">제목</td>
                    		<td style ="text-align: center">날짜</td>
                    		<td style ="text-align: center">조회</td>
                        </tr>
                        
                        <tr>
                        	<td style ="text-align: center">임시-운동 정보</td>
                        	<td style ="text-align: center">임시-운동하는법</td>
                        	<td style ="text-align: center">2020-09-07</td>
                        	<td style ="text-align: center">5</td>
                        </tr>
                	</table>
                </div>
            </form>
        </div>
    </div>
    <script>
	    $("#myBoard").on("click", function() {
			location.href= "myBoard";
		});
	    $("#myReply").on("click", function() {
			location.href= "myReply";
		});
    </script>
    <%@ include file="../common/footer.jsp"%><br>
</body>
</html>