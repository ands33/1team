<%@ page contentType="text/html; charset=euc-kr" pageEncoding="euc-kr"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="criTeria.css">
    <meta charset="euc-kr">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>출제기준</title>
</head>
<body>
	<div class="header-container">
		<div class="header-left">
			<img src="C:/1kosmosc/sts/workspace3/1team/src/main/FAQ_criTeria_img/blue_01.png"
				width="15" height="15" alt="출제기준 아이콘"> 출제기준
		</div>
		<div class="navbar">
			<a href="#">Home</a> <span>></span> <a href="#">알림마당</a> <span>></span>
			<a href="#">출제기준</a>
		</div>
	</div>
	<hr>
	<br>
	<table>
		<th bgcolor="#EEEEF3">과목명</th>
		<th colspan="2">
			<div class="search-container">
				<select id="courseName" name="courseName">
					<option value="건강교육론">건강교육론</option>
					<option value="1. 상담철학과 상담윤리">1. 상담철학과 상담윤리</option>
					<option value="1-1. 상담윤리">1-1. 상담윤리</option>
					<option value="2. 고급상담이론과 실제">2. 고급상담이론과 실제</option>
					<option value="2-1. 상담이론과 실제">2-1. 상담이론과 실제</option>
					<option value="3. 집단상담 프로그램개발">3. 집단상담 프로그램개발</option>
					<option value="3-1. 집단상담 이론과실제">3-1. 집단상담 이론과실제</option>
					<option value="4. 심리평가와 진단">4. 심리평가와 진단</option>
					<option value="4-1. 심리검사와 상담">4-1. 심리검사와 상담</option>
					<option value="5. 고급상담연구방법론">5. 고급상담연구방법론</option>
					<option value="5-1. 상담연구방법론">5-1. 상담연구방법론</option>
					<option value="6. 수퍼비전의 이론과 실제">6. 수퍼비전의 이론과 실제</option>
					<option value="7. 진로상담">7. 진로상담</option>
				</select>
				<button class="custom-button">
					<i class="fas fa-search"></i> 조회
				</button>
			</div>
			<div id="excelData"></div>
		</th>
	</table>
	<br>
	<button class="custom-button" style="float: right;">엑셀저장</button>
	<br>
	<tr>
		<table>
		<tr>
			<th class="bold" align="center" bgcolor="#EEEEF3" width="70">출제기준</th>
			<th class="bold" align="center" bgcolor="#EEEEF3">대분류명</th>
			<th class="bold" align="center" bgcolor="#EEEEF3">중분류명</th>
			<th class="bold" align="center" bgcolor="#EEEEF3">소분류명</th>
			</tr>
			</table>
			<img src="C:/1kosmosc/sts/workspace3/1team/src/main/FAQ_criTeria_img/상담철학과 상담윤리.jpg">
</body>
</html>