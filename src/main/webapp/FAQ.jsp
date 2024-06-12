<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>FAQ</title>
<style>
 /* 스타일링 */
.dropdown {
    position: relative;
    display: inline-block;
    margin-right: 10px; /* 조회 버튼과의 간격 조정 */
  }
  
/*  position: 옵션을 열었을 때 창의 크기가 변경되지 않도록 함 
	background-color: 옵션의 배경색을 지정함 */
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

th {
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
<body>
	<h5>
		<img src="C:/KCA문제은행 자동화 시스템 구축/KCA문제은행 자동화 시스템 구축/img/내정보관리_01.png" width="15" height="15"> FAQ
	</h5>
	<div class="navbar">
		<a href="#">Home</a> 
		<span>></span> 
		<a href="#">사용자지원</a> 
		<span>></span>
		<a href="#">FAQ</a>
	</div>
	<hr><br>
	<th colspan="2">
    <input list="10jul">
    <datalist id="10jul">
      <option value="10줄씩 보기">
    </datalist>
</th>
  <th colspan="2">
    <input list="title+content">
    <datalist id="title+content">
      <option value="제목+내용">
    </datalist>
</th>
	<th class="search-button"><button><i class="fas fa-search"></i> 조회</button>  
</th>
</head>
<body>
</body>
</html>