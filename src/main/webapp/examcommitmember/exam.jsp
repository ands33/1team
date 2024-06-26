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
/* Common Styles */
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
    white-space: nowrap; /* Prevent overflow */
    padding: 10px; /* Cell padding */
    font-weight: bold; /* Bold font */
    font-size: 14px; /* Font size */
}

th, td {
    border: 1px solid black; /* Table cell border */
    padding: 8px; /* Padding */
    text-align: left; /* Left-align text */
}

/* Navbar Styles */
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

/* Navbar link underline effect */
.navbar-nav .nav-link::after {
    content: ''; /* Content for underline */
    display: block; /* Block level element */
    width: 0; /* Initially hidden */
    height: 2px; /* Underline height */
    background: #DB402E; /* Underline color */
    position: absolute; /* Absolute positioning */
    left: 0; /* Left position */
    bottom: -9.5px; /* Adjust underline position */
    opacity: 0; /* Initially hidden */
}

.navbar-nav .nav-link:hover::after {
    width: 100%; /* Expand underline on hover */
    opacity: 1; /* Show underline */
}

.header-links a {
	text-decoration: none;
	color: black;
}

.header-links a:hover {
    color: #D8402A;
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
</style>
</head>
<body>
<%@ include file="header.jsp"%>
    
    <div class="container mt-4">
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
	<%@ include file="header.jsp"%>
	<div class="container mt-4">
		출제 필요한 문제들
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
					<th>출제방법</th>
					<th>기출여부</th>
					<th>정답</th>
					<th>출처</th>
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
								<button type="submit" name="action" value="approve"
									<c:if test="${examPlan.e_status == '제출(검토대기)'}">disabled</c:if>>출제</button>
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
		출제 완료 문제들
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
					<th>출제방법</th>
					<th>기출여부</th>
					<th>정답</th>
					<th>출처</th>
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
								<button type="submit" name="action" value="approve">수정(검토 재필요)</button>
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
