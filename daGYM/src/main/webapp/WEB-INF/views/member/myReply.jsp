<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 댓글</title>
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
            <form method="POST"
                onsubmit="return validate();">
                    <h1>내 글</h1>
                    <button class="w3-button w3-white w3-border w3-border-red w3-round-large" id="myBoard" >내가 쓴글</button>
                    <button class="w3-button w3-white w3-border w3-border-red w3-round-large" id="myReply">내 댓글</button>
                    <br><br>
                    <span style ="text-align: center">내 댓글 리스트 총 1개</span>
                    <div class="row mb-3 form-row">
                    
                <table class="table table-hover">

                    	<tr>
                    		<td style ="text-align: center">댓글 내용</td>
                    		<td style ="text-align: center">작성일</td>
                        </tr>
                        
                        <tr>
                        	<td style ="text-align: center">임시-댓글인척</td>
                        	<td style ="text-align: center">2020-09-07</td>
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