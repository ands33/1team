<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<br>
<title>출제기준</title>
<style>
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

/* cursor: pointer은 버튼에 마우스를 올렸을 때 커서 모양이 손가락 모양으로 변경되게 함 */
.custom-button {
	background-color: #F6F6F6;
	padding: 3px 20px;
	cursor: pointer;
}

.custon-button:hover {
	background-color: #E0E0E0;
}
/* 
dropdown: 클래스가 적용된 요소의 스타일 정의
display: inline-block: 인라인 블록으로 표시
margin-right: 요소의 오른쪽 여백 지정 */
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
	font-family: 'Malgun gothic', sans-serif;
}

table {
	width: 100%;
	height: 100%;
	border-collapse: collapse;
	font-size: 14px;
}

/* border : 표 테두리 색깔 지정 */
th, td {
	border: 1px solid gray;
	padding: 1px;
	text-align: center;
}

/* solid는 선 스타일을 의미, blue는 선 색상 */
th {
	border-top: 1.5px solid;
}

input[type="text"], input[type="password"] {
	width: 70%;
}

div.cell.selected {
	border: none !important;
}

.navbar {
	text-align: right;
}

/* home > 알림마당 > 출제기준 설정 부분 */
.navbar a {
	margin-left: 5px; /* 각 링크 사이의 간격을 조정합니다. */
	text-decoration: none;
	color: black;
}

/* span 태그의 요소 왼쪽 여백 지정 */
.navbar span {
	margin-left: 5px;
}

.header-container {
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.header-left {
	display: flex;
	align-items: center;
}

.header-left img {
	margin-right: 5px;
}
</style>
</head>
<body>
	<div class="header-container">
		<div class="header-left">
			<img src="C:/KCA문제은행 자동화 시스템 구축/KCA문제은행 자동화 시스템 구축/img/blue_01.png"
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
			<th class="bold" align="center" bgcolor="#EEEEF3" width="70">출제기준</th>
			<th class="bold" align="center" bgcolor="#EEEEF3">대분류명</th>
			<th class="bold" align="center" bgcolor="#EEEEF3">중분류명</th>
			<th class="bold" align="center" bgcolor="#EEEEF3">소분류명</th>
			</tr>
			<table>
				<col class=xl73 width=137
					style='mso-width-source: userset; mso-width-alt: 4377; width: 103pt'>
				<col class=xl73 width=126
					style='mso-width-source: userset; mso-width-alt: 4019; width: 94pt'>
				<col class=xl73 width=229
					style='mso-width-source: userset; mso-width-alt: 7321; width: 172pt'>
				<col class=xl73 width=278
					style='mso-width-source: userset; mso-width-alt: 8883; width: 208pt'>
				<tr height=25 style='height: 18.6pt'>
					<td height=25 class=xl72 width=137
						style='height: 18.6pt; width: 103pt'>대분류</td>
					<td class=xl72 width=126 style='border-left: none; width: 94pt'>중분류</td>
					<td class=xl74 width=229 style='border-left: none; width: 172pt'>소분류명</td>
				</tr>
				<tr height=24 style='height: 18.0pt'>
					<td rowspan=6 height=139 class=xl75 width=137
						style='border-bottom: .5pt solid #B2B2B2; height: 105.0pt; border-top: none; width: 103pt'>1.<font
						class="font7">상담철학</font></td>
					<td rowspan=5 class=xl75 width=126
						style='border-bottom: .5pt solid #B2B2B2; border-top: none; width: 94pt'>0.<font
						class="font7">상담철학과 상담자관</font></td>
					<td class=xl65 width=229
						style='border-top: none; border-left: none; width: 172pt'>0.<font
						class="font7">주요 상담이론의 성장</font><font class="font6">(</font><font
						class="font7">긍정</font><font class="font6">) </font><font
						class="font7">자원들</font></td>
				</tr>
				<tr height=23 style='height: 17.4pt'>
					<td height=23 class=xl66 width=229
						style='height: 17.4pt; border-left: none; width: 172pt'>1.<font
						class="font7">유능한 상담자 모델<span style='mso-spacerun: yes'>&nbsp;</span></font></td>
				</tr>
				<tr height=23 style='height: 17.4pt'>
					<td height=23 class=xl66 width=229
						style='height: 17.4pt; border-left: none; width: 172pt'>2.<font
						class="font7">상담에서 상담자 자신의 활용<span
							style='mso-spacerun: yes'>&nbsp;</span></font></td>
				</tr>
				<tr height=23 style='height: 17.4pt'>
					<td height=23 class=xl66 width=229
						style='height: 17.4pt; border-left: none; width: 172pt'>3.<font
						class="font7">상담자의 삶과 가치</font></td>
				</tr>
				<tr height=23 style='height: 17.4pt'>
					<td height=23 class=xl67 width=229
						style='height: 17.4pt; border-left: none; width: 172pt'>4.<font
						class="font7">상담과 문화의 관계<span style='mso-spacerun: yes'>&nbsp;</span></font></td>
				</tr>
				<tr height=23 style='height: 17.4pt'>
					<td height=23 class=xl68 width=126
						style='height: 17.4pt; border-top: none; border-left: none; width: 94pt'>1.<font
						class="font7">자격규정</font></td>
					<td class=xl69 width=229
						style='border-top: none; border-left: none; width: 172pt'>0.<font
						class="font7">한국상담학회 자격규정 및 시행세칙</font></td>
				</tr>
				<tr height=23 style='height: 17.4pt'>
					<td rowspan=12 height=277 class=xl78 width=137
						style='border-bottom: 1.5pt solid #B2B2B2; height: 209.4pt; border-top: none; width: 103pt'>2.<font
						class="font7">상담윤리</font></td>
					<td rowspan=4 class=xl78 width=126
						style='border-bottom: .5pt solid #B2B2B2; border-top: none; width: 94pt'>0.<font
						class="font7">윤리강령</font></td>
					<td class=xl70 width=229
						style='border-top: none; border-left: none; width: 172pt'>0.<font
						class="font7">상담윤리 및 윤리적 딜레마</font></td>
				</tr>
				<tr height=23 style='height: 17.4pt'>
					<td height=23 class=xl66 width=229
						style='height: 17.4pt; border-left: none; width: 172pt'>1.<font
						class="font7">상담관련 법제화의 영역</font><font class="font6">, </font><font
						class="font7">의미</font><font class="font6">, </font><font
						class="font7">과제</font></td>
				</tr>
				<tr height=23 style='height: 17.4pt'>
					<td height=23 class=xl66 width=229
						style='height: 17.4pt; border-left: none; width: 172pt'>2.<font
						class="font7">한국상담학회 윤리강령</font></td>
				</tr>
				<tr height=23 style='height: 17.4pt'>
					<td height=23 class=xl67 width=229
						style='height: 17.4pt; border-left: none; width: 172pt'>3.<font
						class="font7">한국상담학회 연구윤리규정</font></td>
				</tr>
				<tr height=23 style='height: 17.4pt'>
					<td rowspan=8 height=185 class=xl78 width=126
						style='border-bottom: 1.5pt solid #B2B2B2; height: 139.8pt; border-top: none; width: 94pt'>1.<font
						class="font7">상담관련 법률과 상담적 의미</font></td>
					<td class=xl70 width=229
						style='border-top: none; border-left: none; width: 172pt'>0.<font
						class="font7">학교폭력예방 및 대책에 관한 법률</font></td>
				</tr>
				<tr height=23 style='height: 17.4pt'>
					<td height=23 class=xl66 width=229
						style='height: 17.4pt; border-left: none; width: 172pt'>1.<font
						class="font7">아동복지 관련 법 등</font></td>
				</tr>
				<tr height=23 style='height: 17.4pt'>
					<td height=23 class=xl66 width=229
						style='height: 17.4pt; border-left: none; width: 172pt'>2.<font
						class="font7">아동</font><font class="font6">·</font><font
						class="font7">청소년의 성보호에 관한 법률</font></td>
				</tr>
				<tr height=23 style='height: 17.4pt'>
					<td height=23 class=xl66 width=229
						style='height: 17.4pt; border-left: none; width: 172pt'>3.<font
						class="font7">성폭력범죄의 처벌 등에 관한 특례법</font></td>
				</tr>
				<tr height=23 style='height: 17.4pt'>
					<td height=23 class=xl66 width=229
						style='height: 17.4pt; border-left: none; width: 172pt'>4.<font
						class="font7">가정폭력범죄의 처벌 등에 관한 특례법</font></td>
				</tr>
				<tr height=23 style='height: 17.4pt'>
					<td height=23 class=xl66 width=229
						style='height: 17.4pt; border-left: none; width: 172pt'>5.<font
						class="font7">노인복지 관련 법 등</font></td>
				</tr>
				<tr height=23 style='height: 17.4pt'>
					<td height=23 class=xl66 width=229
						style='height: 17.4pt; border-left: none; width: 172pt'>6.<font
						class="font7">장애인복지 관련 법 등</font></td>
				</tr>
				<tr height=24 style='height: 18.0pt'>
					<td height=24 class=xl71 width=229
						style='height: 18.0pt; border-left: none; width: 172pt'>7.<font
						class="font7">자살예방 관련 법 등</font></td>
				</tr>
				<tr height=24 style='height: 18.0pt'>
					<td rowspan=8 height=185 class=xl75 width=137
						style='border-bottom: .5pt solid #B2B2B2; height: 139.8pt; border-top: none; width: 103pt'>1.<font
						class="font7">상담관계</font></td>
					<td rowspan=6 class=xl75 width=126
						style='border-bottom: .5pt solid #B2B2B2; border-top: none; width: 94pt'>0.<font
						class="font7">상담관계와 상담연구</font></td>
					<td class=xl65 width=229
						style='border-top: none; border-left: none; width: 172pt'>0.<font
						class="font7">사회관계 및 전문적 태도</font></td>
				</tr>
				<tr height=23 style='height: 17.4pt'>
					<td height=23 class=xl66 width=229
						style='height: 17.4pt; border-left: none; width: 172pt'>1.<font
						class="font7">정보의 보호</font></td>
				</tr>
				<tr height=23 style='height: 17.4pt'>
					<td height=23 class=xl66 width=229
						style='height: 17.4pt; border-left: none; width: 172pt'>(<font
						class="font7">사생활보호</font><font class="font6">, </font><font
						class="font7">비밀유지</font><font class="font6">, </font><font
						class="font7">상담기록 및 보관</font><font class="font6">)</font></td>
				</tr>
				<tr height=23 style='height: 17.4pt'>
					<td height=23 class=xl66 width=229
						style='height: 17.4pt; border-left: none; width: 172pt'>2.<font
						class="font7">상담수혜자의 복지</font></td>
				</tr>
				<tr height=23 style='height: 17.4pt'>
					<td height=23 class=xl66 width=229
						style='height: 17.4pt; border-left: none; width: 172pt'>3.<font
						class="font7">상담관계</font><font class="font6">(</font><font
						class="font7">이중관계</font><font class="font6">, </font><font
						class="font7">성적관계</font><font class="font6">)</font></td>
				</tr>
				<tr height=23 style='height: 17.4pt'>
					<td height=23 class=xl67 width=229
						style='height: 17.4pt; border-left: none; width: 172pt'>4.<font
						class="font7">상담연구</font></td>
				</tr>
				<tr height=23 style='height: 17.4pt'>
					<td rowspan=2 height=46 class=xl78 width=126
						style='border-bottom: .5pt solid #B2B2B2; height: 34.8pt; border-top: none; width: 94pt'>1.<font
						class="font7">자격규정</font></td>
					<td class=xl70 width=229
						style='border-top: none; border-left: none; width: 172pt'>0.<font
						class="font7">한국상담학회 자격규정 및 시행세칙</font></td>
				</tr>
				<tr height=23 style='height: 17.4pt'>
					<td height=23 class=xl67 width=229
						style='height: 17.4pt; border-left: none; width: 172pt'>1.<font
						class="font7">윤리적 딜레마해결</font></td>
				</tr>
				<tr height=23 style='height: 17.4pt'>
					<td rowspan=7 height=162 class=xl78 width=137
						style='border-bottom: 1.5pt solid #B2B2B2; height: 122.4pt; border-top: none; width: 103pt'>2.<font
						class="font7">상담윤리</font></td>
					<td rowspan=2 class=xl78 width=126
						style='border-bottom: .5pt solid #B2B2B2; border-top: none; width: 94pt'>0.<font
						class="font7">윤리강령과 심리검사</font></td>
					<td class=xl70 width=229
						style='border-top: none; border-left: none; width: 172pt'>0.<font
						class="font7">심리검사</font><font class="font6">(</font><font
						class="font7">선택</font><font class="font6">, </font><font
						class="font7">실시조건</font><font class="font6">, </font><font
						class="font7">해석</font><font class="font6">, </font><font
						class="font7">관리</font><font class="font6">)</font></td>
				</tr>
				<tr height=23 style='height: 17.4pt'>
					<td height=23 class=xl67 width=229
						style='height: 17.4pt; border-left: none; width: 172pt'>1.<font
						class="font7">한국상담학회 윤리강령</font></td>
				</tr>
				<tr height=23 style='height: 17.4pt'>
					<td rowspan=5 height=116 class=xl78 width=126
						style='border-bottom: 1.5pt solid #B2B2B2; height: 87.6pt; border-top: none; width: 94pt'>1.<font
						class="font7">윤리문제와 징계</font></td>
					<td class=xl70 width=229
						style='border-top: none; border-left: none; width: 172pt'>0.<font
						class="font7">타 전문직과의 관계</font></td>
				</tr>
				<tr height=23 style='height: 17.4pt'>
					<td height=23 class=xl66 width=229
						style='height: 17.4pt; border-left: none; width: 172pt'>1.<font
						class="font7">윤리 문제의 해결</font></td>
				</tr>
				<tr height=23 style='height: 17.4pt'>
					<td height=23 class=xl66 width=229
						style='height: 17.4pt; border-left: none; width: 172pt'>2.<font
						class="font7">제소건 처리 절차</font></td>
				</tr>
				<tr height=23 style='height: 17.4pt'>
					<td height=23 class=xl66 width=229
						style='height: 17.4pt; border-left: none; width: 172pt'>3.<font
						class="font7">징계의 절차 및 종류</font></td>
				</tr>
				<tr height=24 style='height: 18.0pt'>
					<td height=24 class=xl71 width=229
						style='height: 18.0pt; border-left: none; width: 172pt'>4.<font
						class="font7">결정사항 통지</font></td>
				</tr>
</body>
</html>