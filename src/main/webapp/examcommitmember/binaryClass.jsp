<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="icon" href="./img/favicon-16x16.png">
<title>출제</title>
<style>
.header-links a {
	text-decoration: none;
	color: black;
}

body, table, th, td, input, select, textarea, div, a, p, span, strong, b,
	i, ul, ol, li, button {
	font-family: "Montserrat", "Noto Sans KR", sans-serif;
	font-size: 15px;
	letter-spacing: -0.05em;
	line-height: 1.6em;
	list-style: none;
	color: #333;
}

th {
	white-space: nowrap; /* 넘침 처리 방지 */
	padding: 10px; /* 셀 안 여백 */
	font-weight: bold; /* 굵은 글씨 */
	font-size: 14px; /* 글씨 크기 */
	font-weight: bold;
}

th, td {
	border: 1px solid black;
	padding: 8px;
	text-align: left;
}

.wide-column {
	width: 300px;
}

.table .btn {
	margin: 2px;
}

.navbar {
	border-top: 1px solid #D8D9DA;
	border-bottom: 3px solid #F5F5F5;
	width: 100%;
	height: 50px;
	justify-content: center;
	position: relative;
	font-weight: bold;
	font-size: 14px;
}

.navbar-nav {
	display: flex;
	justify-content: center;
	align-items: center;
	width: 100%;
	padding: 0;
	margin: 0;
	list-style: none;
}

.nav-item {
	position: relative;
}

.nav-link {
	text-decoration: none;
	color: black;
	padding: 10px 20px;
	display: block;
	position: relative;
}

.navbar-nav .nav-link:hover {
	color: #DB402E;
}

/* 하단 테두리 초기 상태 */
.navbar-nav .nav-link::after {
	content: ''; /* 콘텐츠 추가 */
	display: block; /* 블록 레벨 요소로 변경 */
	width: 0; /* 너비 0으로 설정하여 초기에 숨김 */
	height: 2px; /* 높이 2px */
	background: #DB402E; /* 배경 색상 */
	position: absolute;
	left: 0; /* 왼쪽 0 */
	bottom: -9.5px; /* 아래쪽 -9.5px */
	opacity: 0; /* 초기에 숨김 */
}

/* 호버 시 테두리 효과 */
.navbar-nav .nav-link:hover::after {
	width: 100%; /* 호버 시 너비 100%로 확장 */
	opacity: 1; /* 호버 시 보이게 함 */
}

/* 재출제 요청 박스 스타일 */
.resubmit-box {
	width: 100px;
	height: 50px;
	border: 1px solid #333;
	display: flex;
	align-items: center;
	justify-content: center;
	position: relative;
	cursor: pointer; /* 커서를 포인터로 변경 */
}

.resubmit-box::after {
	content: attr(data-review); /* data-review 속성의 값을 표시 */
	display: none; /* 기본적으로 숨김 */
	position: absolute;
	top: 60px; /* 박스 아래에 표시 */
	left: 0;
	background-color: #fff;
	border: 1px solid #333;
	padding: 5px;
	white-space: pre-wrap; /* 줄바꿈을 유지 */
}

.resubmit-box:hover::after {
	display: block; /* 마우스를 올렸을 때 표시 */
}

/* 표를 가운데 정렬하는 스타일 */
.table-container {
	display: flex;
	justify-content: center;
}
</style>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
</head>
<body>
	<%@ include file="header.jsp"%>
	<div class="container mt-4">
		<div class="table-container">
			<table class="table table-bordered">
				<thead class="table-light">
					<tr>
						<th colspan="23">과목명 : ${member.subject_name}<br>
						출제위원 : (A) ${memberAB.memberA} (B) : ${memberAB.memberB}
						</th>
					</tr>
					<tr align="center">
						<th>분류코드</th>
						<th>대분류</th>
						<th>중분류</th>
						<th>소분류</th>
						<th>상</th>
						<th>중</th>
						<th>하</th>
						<th>합계</th>
						<th>출제위원1</th>
						<th>출제위원2</th>
						<th>문항제작</th>
						<th>기출문제</th>
						<th>지식</th>
						<th>이해</th>
						<th>적용</th>
						<th>①</th>
						<th>②</th>
						<th>③</th>
						<th>④</th>
						<th>⑤</th>
						<th>출처</th>
						<th>문항카드</th>
						<th>검토완료</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="binaryClass" items="${binaryClassList}">
						<tr>
							<td>${binaryClass.categoryNumbers}</td>
							<td>${binaryClass.category1}</td>
							<td>${binaryClass.category2}</td>
							<td>${binaryClass.category3}</td>
							<td>${binaryClass.diff}</td>
							<td>${binaryClass.diff}</td>
							<td>${binaryClass.diff}</td>
							<td>${binaryClass.diff}</td>
							<td>${binaryClass.member_name}</td>
							<td>${binaryClass.submember_name}</td>
							<td>${binaryClass.exam_type}</td>
							<td>${binaryClass.exam_type}</td>
							<td>${binaryClass.behavioral}</td>
							<td>${binaryClass.behavioral}</td>
							<td>${binaryClass.behavioral}</td>
							<td>${binaryClass.answer}</td>
							<td>${binaryClass.answer}</td>
							<td>${binaryClass.answer}</td>
							<td>${binaryClass.answer}</td>
							<td>${binaryClass.answer}</td>
							<td>${binaryClass.reference}</td>
							<td>${binaryClass.e_status}</td>
							<td>${binaryClass.e_status}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
</body>
</html>
