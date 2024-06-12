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
			<img src="C:/KCA문제은행 자동화 시스템 구축/KCA문제은행 자동화 시스템 구축/img/blue_01.png" width="15" height="15" alt="출제기준 아이콘">
			출제기준
		</div>
		<div class="navbar">
			<a href="#">Home</a> 
			<span>></span> 
			<a href="#">알림마당</a> 
			<span>></span>
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
			<script>
				$(document).ready(function() {
					var selectedCourse = $('#courseName').val();
					$.ajax({
						type: 'GET',
						url: 'get_excel_data',
						data: { course: selectedCourse },
						success: function(response) {
							$('#excelData').html(response);
						},
						error: function(error) {
							console.log(error);
						}
					});
				});
			</script>
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
		</table>
		<script>
				// 엑셀 파일 로드 함수
				function loadExcel(file){
					var reader = new FileReader();
					reader.onload = function(e) {
						var data = new Uint8Array(e.target.result);
						var workbook = XLSX.read(data, {type: 'array'});
						var sheet = workbook.Sheets[workbook.SheetNames[0]];
						var htmlTable = XLSX.utils.sheet_to_html(sheet);
						document.getElementById('excelTable').innerHTML += htmlTable;
					};
					reader.readAsArrayBuffer(file);
				}
				// 파일 입력을 감지하여 엑셀 파일 로드
				document.getElementById('excelFile').addEventListener('change', function(e) {
					var file = e.target.files[0];
					if (file) {
						loadExcel(file);
					}
				}); 
		</script>
		<input type="file" id="excelFile" accept=".xlsx, .xls">
</body>
</html>
