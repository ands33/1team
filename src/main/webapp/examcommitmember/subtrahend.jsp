<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" type="favicon.ico" type="image/x-icon">
<meta charset="EUC-KR">
<link rel="icon" href="./img/favicon-32x32.png">
<title>검토</title>
<style>
body, table, input, select, textarea, div, a, p, span, strong, b, i, ul, ol, li, button {
	font-family: "Montserrat", "Noto Sans KR", sans-serif;
	font-size: 15px;
	letter-spacing: -0.05em;
	line-height: 1.6em;
	list-style: none;
	color: #333;
}

th, td {
	width: 150px;
}

/* header-link의 밑줄 제거 */
.header-links a {
    text-decoration: none;
    color: black;
}

/* 로고 우측 글씨 호버 : 한국상담학회 */
.header-links a:hover {
    color: #D8402A;
}

body {
    background: #FFF;
    height: 100vh;
    font-size: 15px;
}

/* 지우면 ㅈ됨 */
.navbar {
    border-top: 1px solid #D8D9DA;
    border-bottom: 1px solid #F5F5F5;
    background: #FFF;
    width: 100%;
    height: 50px;
    justify-content: center;
    margin-left: 30px;
    position: relative;
    font-weight: bold;
    font-size: 14px;
}

/* 네비게이션 링크 - 지우면 안됨*/
.navbar-nav .nav-link {
    text-decoration: none;
    color: black;
    position: relative;
    font-weight: bold;
    font-size: 15px;
}

/* 하단 테두리 초기 상태 - 지우면 ㅈ됨 */
.navbar-nav .nav-link::after {
    content: ''; /* 콘텐츠 추가 */
    display: block; /* 블록 레벨 요소로 변경 */
    width: 0; /* 너비 0으로 설정하여 초기에 숨김 */
    height: 3px; /* 높이 2px */
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

.nav-item:hover {
    color: #6B6D70;
	opacity: 1; /* 호버 시 보이게 함 */
}

#header {
	width: 100%;
	padding: 20px 10px;
	background: #fff;
	z-index: 1;
}

/* header-link의 밑줄 제거 */
.header-links a {
	text-decoration: none;
	color: #000;
}

/* 로고 오른쪽 상담학회 집 인트로 글씨 호버 */
.header-links a:hover {
	color: #D8402A;
}

.header-left img {
	width: 250px;
	height: auto;
	padding-top: 20px;
	margin-left: 100px;
}

.nav-item:hover {
	color: #6B6D70;
}

</style>
</head>
<body>
	<%@ include file="header.jsp"%>
	<div class="container">
		<div class="header"></div>
		<h2>
			<b><u>검토</u></b>
		</h2>
		<table class="table table-bordered">
			<thead class="table-light">
				<tr align="center">
					<th>의뢰 번호</th>
					<th>분류 코드</th>
					<th>출제 과목</th>
					<th>대분류</th>
					<th>중분류</th>
					<th>소분류</th>
					<th>난이도</th>
					<th>출제 위원</th>
					<th>현황</th>
					<th>반려/출제</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="subtrahend" items="${subtrahendList}">
					<tr>
						<td>${subtrahend.num}</td>
						<td>${subtrahend.categoryNumbers}</td>
						<td>${subtrahend.name}</td>
						<td>${subtrahend.category1}</td>
						<td>${subtrahend.category2}</td>
						<td>${subtrahend.category3}</td>
						<td>${subtrahend.diff}</td>
						<td>${subtrahend.member_name}</td>
						<td>${subtrahend.e_status}</td>
						<td>
							<form action="subtrahend.do" method="post">
								<input type="hidden" name="num" value="${subtrahend.num}" />
								<button type="submit" name="action" value="approve">검토</button>
							</form>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>