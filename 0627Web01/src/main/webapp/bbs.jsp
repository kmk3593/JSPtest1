<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import = "java.io.PrintWriter" %>  <!-- 출력 도와주는 객체 -->
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<title>게시판</title>
<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor"
	crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
	crossorigin="anonymous"></script>
</head>
<body class="text-center">
	<jsp:include page="header.jsp"></jsp:include>

	<div class="container">
		<div class="row">
			<table >
				<thread>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
				</thread>
				<tbody>
					<tr>
						<th>1</th>
						<th>자바</th>
						<th>홍길동</th>
						<th>2022-06-29</th>
					</tr>
					<tr>
						<th>2</th>
						<th>호랑이형님</th>
						<th>산군</th>
						<th>1822-04-29</th>
					</tr>
				</tbody>
			</table>
			<a href="wriet.jsp" class="btn btn-primary pull-right">글쓰기</a>
		</div>
	</div>

</body>
</html>