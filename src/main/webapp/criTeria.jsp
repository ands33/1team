<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>내정보관리</title>
<style>
.bold {
	font-weight: bold;
}

body {
	font-family: 'Gulim', sans-serif;
}
table {
	width: 100%;
	height: 100%;
	border-collapse: collapse;
	font-size: 14px;
}

/* border : 표 테두리 색깔 지정 */
th, td {
	border: 1px solid black;
	padding: 5px;
	text-align: center; 
}

th:first-child {
	border-top: 1.5px solid blue;
}

input[type="text"], input[type="password"] {
	width: 70%;
}

.navbar {
	text-align: right;
	margin-bottom: 10px; /* 시스템관리 메뉴와의 간격을 조정합니다. */
}

/* home > 알림마당 > 출제기준 설정 부분 */
.navbar a {
	margin-left: 5px; /* 각 링크 사이의 간격을 조정합니다. */
	text-decoration: none;
	color: black;
}

.navbar span {
	margin-left: 5px;
}
</style>
</head>
<body>
	<h5>
		<img src="C:/KCA문제은행 자동화 시스템 구축/KCA문제은행 자동화 시스템 구축/img/내정보관리_01.png"
			width="15" height="15"> 출제기준
	</h5>
	<div class="navbar">
		<a href="#">Home</a> 
		<span>></span> 
		<a href="#">알림마당</a> 
		<span>></span>
		<a href="#">출제기준</a>
	</div>
	<hr><br>
	<table>
	<td class="bold" align="center">과목명</td>
	<td><input type="text" name="name">
	<button class="search-button"><i class="fas fa-search"></i> 조회</button></td></table>
	<form action="updateInfo.jsp" method="post">
		<br><br>
		<button style="float: right;">엑셀저장</button>
		<br>
		<table>
			<tr>
				<table>
					<td class="bold" align="center">출제기준</td>
					<td class="bold" align="center">대분류명</td>
					<td class="bold" align="center">중분류명</td>
					<td class="bold" align="center">소분류명</td>
					</tr>
					<tr>
						<td>1-1-1</td>
						<td rowspan="2" align="center">1. 건강교육의 이해</td>
						<!-- 대분류가 2줄을 차지 -->
						<td>중분류1-1</td>
						<td>소분류1-1-1</td>
						
					</tr>
					<tr>
					<td rowspan="2" align="center">1-1-2</td>
						<td>중분류1-2</td>
						<td>소분류1-2-1</td>
						
					</tr>
					<td rowspan="2" align="center">1-1-2</td>
						<td>중분류1-2</td>
						<td>소분류1-2-1</td>
						
					</tr>
					<td rowspan="2" align="center">1-1-3</td>
						<td>중분류1-2</td>
						<td>소분류1-2-1</td>
						
					</tr>
					
				</table><br>
	</form>
</body>
</html>
