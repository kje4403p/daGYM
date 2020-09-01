<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

#b1{
	height: 100%;
}

#b1{
	margin: 0;
	background: linear-gradient(45deg, #49a09d, #5f2c82);
	font-family: sans-serif;
	font-weight: 100;
}

.container1 {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
}

table {
	width: 800px;
	border-collapse: collapse;
	overflow: hidden;
	box-shadow: 0 0 20px rgba(0,0,0,0.1);
}

th,
td {
	padding: 15px;
	background-color: rgba(255,255,255,0.2);
	color: #fff;
}

th {
	text-align: left;
}

thead {
	th {
		background-color: #55608f;
	}
}

tbody {
	tr {
		&:hover {
			background-color: rgba(255,255,255,0.3);
		}
	}
	td {
		position: relative;
		&:hover {
			&:before {
				content: "";
				position: absolute;
				left: 0;
				right: 0;
				top: -9999px;
				bottom: -9999px;
				background-color: rgba(255,255,255,0.2);
				z-index: -1;
			}
		}
	}
}

#dd1{
	width:1000px;
	height:1000px;
}
</style>
</head>
<body id="b1">
	<%-- <%@include file="../common/header.jsp" %> --%>
	<jsp:include page="../common/header.jsp" />
	
	<div id="dd1">
	
	
	</div>
	
	
	</div>
<div class="container1">
	<table>
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${empty boardList}">
					<tr>
						<td>존재하는 게시글이 없습니다.</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="board" items="${boardList}">
						<tr>
							<td>${board.boardNo}</td>
							<td>${board.boardTitle}</td>
							<td>${board.memberNo}</td>
							<td><jsp:useBean id="now" class="java.util.Date" /> <fmt:formatDate
									var="today" value="${now}" pattern="yyyy-MM-dd" /> <fmt:formatDate
									var="createDate" value="${board.boardEnrollDate}"
									pattern="yyyy-MM-dd" /> <fmt:formatDate var="createTime"
									value="${board.boardEnrollDate}" pattern="hh:mm:ss" /> <c:choose>
									<c:when test="${today == createDate}">
                							${createTime}
                						</c:when>
									<c:otherwise>
                							${createDate}
                						</c:otherwise>
								</c:choose></td>
							<td>${board.views}</td>
						</tr>
					</c:forEach>

				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
</div>

	<jsp:include page="../common/footer.jsp" />
	<%-- <%@include file="../common/footer.jsp" %> --%>
</body>
</html>