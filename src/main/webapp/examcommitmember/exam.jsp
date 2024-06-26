<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="icon" href="./img/favicon-32x32.png">
<title>출제</title>
<style>
body, table, th, td, input, select, textarea, div, a, p, span, strong, b, i, ul, ol, li, button {
	font-family: "Montserrat", "Noto Sans KR", sans-serif;
	font-size: 15px;
	letter-spacing: -0.05em;
	line-height: 1.6em;
	color: #333;
}

th {
	white-space: nowrap;
    border: 1px solid black;
    padding: 10px;
    font-weight: bold;
    font-size: 14px;
    border-top: 1px solid #DB402E; /* 추가할 border-top 속성 */
}

table-light {
	white-space: nowrap;
    border: 1px solid black;
    padding: 10px;
    font-weight: bold;
    font-size: 14px;
    border-top: 1px solid #DB402E; /* 추가할 border-top 속성 */
}

td {
	border: 1px solid black;
	padding: 8px;
	text-align: left;
}

/* Navbar */
.navbar {
	border-top: 1px solid #D8D9DA;
	border-bottom: 3px solid #F5F5F5;
	height: 50px;
	display: flex;
	align-items: center;
	justify-content: center;
	font-weight: bold;
	font-size: 14px;
}

.navbar-nav {
	display: flex;
	justify-content: center;
	align-items: center;
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
	position: relative;
}

.navbar-nav .nav-link:hover {
	color: #DB402E;
}

.navbar-nav .nav-link::after {
	content: '';
	display: block;
	width: 0;
	height: 2px;
	background: #DB402E;
	position: absolute;
	left: 0;
	bottom: -9.5px;
	opacity: 0;
}

.navbar-nav .nav-link:hover::after {
	width: 100%;
	opacity: 1;
}

.header-links a {
	text-decoration: none;
	color: black;
}

.header-links a:hover {
	color: #D8402A;
}

/* Re-submission box */
.resubmit-box {
	width: 100px;
	height: 50px;
	border: 1px solid #333;
	display: flex;
	align-items: center;
	justify-content: center;
	position: relative;
	cursor: pointer;
}

.resubmit-box::after {
	content: attr(data-review);
	display: none;
	position: absolute;
	top: 60px;
	left: 0;
	background-color: #fff;
	border: 1px solid #333;
	padding: 5px;
	white-space: pre-wrap;
}

.resubmit-box:hover::after {
	display: block;
}

/* Button styles */
.btn {
	border-radius: 12px;
	padding: 6px 12px;
	font-size: 14px;
	margin: 2px;
	cursor: pointer;
	display: inline-block;
	text-align: center;
	text-decoration: none;
	color: white;
	font-weight: bold;
}

.btn-submit {
	background-color: #007bff;
}

.btn-re-review {
	background-color: #28a745;
}

.btn-pending {
	background-color: #ffc107;
	color: black;
}

.btn-approve {
	display: block;
	background-color: #dc3545;
	width: 100%;
}

/* Label container */
.label-container {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 10px;
}

/* Legend */
.legend {
	display: flex;
	flex-direction: column;
	font-family: Arial, sans-serif;
	border: 1px solid #ccc;
	padding: 10px;
	width: 300px;
}

/* Table */
.table-container {
	width: 70%;
	margin-right: 10px;
}

table {
	width: 100%;
	border-collapse: collapse;
}

th, td {
	border: 1px solid #ccc;
	padding: 10px;
	text-align: center;
}

</style>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
</head>
<body>
<body>
	<%@ include file="header.jsp"%>
	<div class="container mt-4">
		<h2>
			<b><u>출제에 필요한 문제</b></u>
		</h2>
		<div class="header"></div>
		<br>
		<table class="table table-bordered">
			<thead class="table-light">
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
					<th>검토의견</th>
				</tr>
			</thead>
			<tbody>
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

								<!-- 제출(검토대기)일 때, 버튼 비활성화 -->
								<button type="submit" name="action" value="approve"
									class="button-approve"
									style="background-color: ${examPlan.e_status == '출제중' ? '#198754' : '#A5AAA3'};
                   width: 60px;"
									<c:if test='${examPlan.e_status == "검토대기"}'>disabled</c:if>>
									
									출제</button>
							</form>
						</td>
						<!-- 마우스 오버 이벤트 추가 -->
						<td><c:if test="${examPlan.e_status == '재출제요청'}">
								<div class="resubmit-box" data-review="${examPlan.review}">검토의견</div>
							</c:if></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div class="container mt-4">
		<h2>
			<b><u>출제 완료된 문제</b></u>
		</h2>
		<div class="header"></div>
		<br>
		<table class="table table-bordered">
			<thead class="table-light">
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
					<th>검토의견</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="comExamPlan" items="${comExamPlanList}">
					<tr>
						<td>${comExamPlan.num}</td>
						<td>${comExamPlan.categoryNumbers}</td>
						<td>${comExamPlan.name}</td>
						<td>${comExamPlan.category1}</td>
						<td>${comExamPlan.category2}</td>
						<td>${comExamPlan.category3}</td>
						<td>${comExamPlan.diff}</td>
						<td>${comExamPlan.member_name}</td>
						<td>${comExamPlan.e_status}</td>
						<!-- 출제 방법부터 -->
						<td>
							<form action="createTest.do" method="post">
								<input type="hidden" name="num" value="${comExamPlan.num}" /> <input
									type="hidden" name="e_status" value="출제중" />
								<button type="submit" name="action" value="approve">수정(검토
									재필요)</button>
							</form>
						</td>
						<!-- 마우스 오버 이벤트 추가 -->
						<td>
							<div class="resubmit-box" data-review="${comExamPlan.review}">검토의견</div>
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