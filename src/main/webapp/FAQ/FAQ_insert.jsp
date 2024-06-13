<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>FAQ 목록</title>
<style>
body {
	font-family: 'Malgun gothic', sans-serif;
}

h5 {
	display: flex;
	align-items: center;
}

img {
	margin-left: 5px;
	width: 10px;
	height: 10px;
}

h5 img {
	margin-right: 5px;
	width: 15px;
	height: 15px;
}

.navbar {
	text-align: right;
}

.navbar a {
	margin-left: 5px;
	text-decoration: none;
	color: black;
}

.navbar span {
	margin-left: 5px;
}

.search-container {
	display: flex;
	align-items: center;
	margin-bottom: 20px;
}

.search-container label {
	margin-right: 10px;
}

.search-container select {
	margin-right: 10px;
}

.search-container button {
	margin-left: 10px;
}

.custom-button {
	background-color: #F6F6F6;
	padding: 3px 20px;
	cursor: pointer;
}

.custom-button:hover {
	background-color: #E0E0E0;
}

.dropdown {
	position: relative;
	display: inline-block;
	margin-right: 10px;
}

.dropdown-content {
	display: none;
	position: absolute;
	background-color: #f9f9f9;
	min-width: 160px;
	z-index: 1;
}

.dropdown-content a {
	color: black;
	font-weight: bold;
	padding: 10px 10px;
	text-decoration: none;
	display: block;
}

.dropdown:hover .dropdown-content {
	display: block;
}

table {
	width: 100%;
	height: 100%;
	border-collapse: collapse;
	font-size: 14px;
}

th, td {
	border: 1px solid gray;
	padding: 5px;
	text-align: center;
}

th {
	border-top: 1.5px solid;
	background-color: #EEEEF3;
}
</style>
</head>
<body>
	<h5
		style="display: flex; justify-content: space-between; align-items: center;">
		<div>
			<img src="C:/KCA문제은행 자동화 시스템 구축/KCA문제은행 자동화 시스템 구축/img/blue_01.png"
				alt="FAQ 아이콘"> FAQ
		</div>
		<div class="navbar">
			<a href="#">Home</a> <span> > </span> <a href="#">사용자지원</a> <span>
				> </span> <a href="#">FAQ</a>
		</div>
	</h5>
	<hr>
	<br>
	<img src="C:/KCA문제은행 자동화 시스템 구축/KCA문제은행 자동화 시스템 구축/img/blue_02.png"
		alt="FAQ 아이콘"> FAQ 목록
	<br><br>
	<div class="search-container">
		<div style="display: inline-block; margin-right: 10px;">
			<select id="resultsPerPage" name="resultsPerPage">
				<option value="10">10줄씩 보기</option>
				<option value="20">20줄씩 보기</option>
				<option value="30">30줄씩 보기</option>
			</select>
		</div>
		<div style="display: inline-block;">
			<select id="searchType" name="searchType">
				<option value="제목+내용">제목+내용</option>
				<option value="제목">제목</option>
				<option value="내용">내용</option>
			</select>
		</div>
		<div style="display: inline-block; flex-grow: 1;">
			<input type="text">
			<button class="custom-button">
				<i class="fas fa-search"></i> 조회
			</button>
		</div>
		<button class="custom-button" style="margin-left: auto;">
			작성
		</button>
	</div>
	<table>
		<tr>
			<th class="bold" align="center">NO.</th>
			<th class="bold" align="center">질문</th>
			<th class="bold" align="center">첨부</th>
			<th class="bold" align="center">작성자</th>
			<th class="bold" align="center">작성일</th>
			<th class="bold" align="center">조회수</th>
		</tr>
	</table>
</body>
</html>
