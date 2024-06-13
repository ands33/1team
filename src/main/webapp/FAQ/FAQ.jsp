<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<link rel="stylesheet" href="FAQ.css">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>FAQ</title>
</head>
<body>
	<h5 style="display: flex; justify-content: space-between; align-items: center;">
    <div>
        <img src="C:/KCA문제은행 자동화 시스템 구축/KCA문제은행 자동화 시스템 구축/img/blue_01.png" alt="FAQ 아이콘">
        FAQ
    </div>
    <div class="navbar">
        <a href="#">Home</a> 
        <span> > </span> 
        <a href="#">사용자지원</a> 
        <span> > </span>
        <a href="#">FAQ</a>
    </div>
</h5><hr>
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
	
	<div style="display: inline-block; margin-left: auto;">
		<input type="text">
		<button class="custom-button">
			<i class="fas fa-search"></i> 조회
		</button>
	</div></div>
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
