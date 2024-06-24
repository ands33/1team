<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
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
		<div class="header"></div>
		<br>
		<table class="table table-bordered">
			<thead class="table-light">
			</thead>
			<tbody>
				<tr>
				<tr align="center">
					<th>번호</th>
					<th>분류코드</th>
					<th>출제 과목</th>
					<th>대분류</th>
					<th>중분류</th>
					<th>소분류</th>
					<th>난이도</th>
					<th>출제위원</th>
					<th>유형</th>
					<th>상태</th>
					<th>출제방법</th>
					<th>기출여부</th>
					<th>정답</th>
					<th>출처</th>
				</tr>
				<c:forEach var="examPlan" items="${examPlanList}">
				<tr>
					<td>${examPlan.num}</td>
					<td>${examPlan.categoryNumbers}</td>
					<td>${examPlan.name}</td>
					<td>${examPlan.category1}</td>
					<td>${examPlan.category2}</td>
					<td>${examPlan.category3}</td>
					<td>${examPlan.diff}</td>
					<td>${examPlan.member_name}</td>
					<td>${examPlan.e_status}</td>
					<!-- 출제 방법부터 -->
					
					<td>
						<form action="createTest.do" method="post">
							<input type="hidden" name="num" value="${examPlan.num}" /> <input
								type="hidden" name="e_status" value="출제중" />
							<button type="submit" name="action" value="approve"
								<c:if test="${examPlan.e_status == '제출(검토대기)'}">disabled</c:if>>출제</button>
						</form>
					</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
</body>
</html>