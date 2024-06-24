<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!-- 줄바꿈 문자를 <br> 태그로 변환 -->

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="EUC-KR">
<title>문항 카드 - 1급 고급상담이론과 실제</title>
<style>
bn {
	border: none; /* 테두리 제거 */
	padding: 8px;
}

body {
	font-family: Arial, sans-serif;
}

.container {
	width: 1000px;
	margin: auto;
	padding: 20px;
	border: 1px solid #000;
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-bottom: 20px;
}

th, td {
	border: 1px solid #000;
	padding: 8px;
	text-align: left;
}

th {
	background-color: #f4f4f4;
}

.title {
	text-align: center;
	font-weight: bold;
	background-color: #f4f4f4;
}

.subtitle {
	text-align: left;
	background-color: #f4f4f4;
	padding: 5px;
	border: 1px solid #ddd;
	margin-bottom: auto;
	width: 50%; /* 가로 너비를 50%로 설정 */
	margin-left: auto; /* 가운데 정렬을 위해 추가 */
	margin-right: auto; /* 가운데 정렬을 위해 추가 */
}

.answer {
	text-align: center;
	font-weight: bold;
}
</style>
<script>
	function getByteLength(str) {
		var byteLength = 0;
		for (var i = 0; i < str.length; i++) {
			var charCode = str.charCodeAt(i);
			if (charCode <= 0x007F) {
				byteLength += 1;
			} else if (charCode <= 0x07FF) {
				byteLength += 2;
			} else if (charCode <= 0xFFFF) {
				byteLength += 2;
			} else {
				byteLength += 4;
			}
		}
		return byteLength;
	}

	function limitByteLength(element, maxBytes) {
		var value = element.value;
		while (getByteLength(value) > maxBytes) {
			value = value.substring(0, value.length - 1);
		}
		element.value = value;
	}

	function validateAndSubmitUpdateReview() {
		document.getElementById("reviewForm").action = "updateReview.do";
		document.getElementById("reviewForm").submit();
	}
	
	function validateAndSubmitReExam() {
		document.getElementById("reviewForm").action = "reExam.do";
		document.getElementById("reviewForm").submit();
	}

	function validateAndSubmitComplete() {
		// 여기서 유효성 검사를 수행하고 조건에 따라 제출 여부 결정
		var allFieldsValid = validateFields(); // 예시 함수, 실제로 유효성 검사 함수를 호출하여 구현
		if (allFieldsValid) {
			document.getElementById("reviewForm").action = "testComplete.do";
			document.getElementById("reviewForm").submit();
		} else {
		}
	}
</script>
</head>
<%@ include file="header.jsp"%>
<body>

	<div class="container">
		<div class="details">
			<form id="reviewForm" method="post">
				<h2 class="title">한국상담학회 검정 시험문제</h2>
				<table>
					<tr>
						<td style="border: none;"></td>
						<td style="border: none;"></td>
						<th colspan="2">관리번호</th>
						<td colspan="4">
							<!-- 여기에 관리번호를 입력해 주세요. 비워놨습니다 -->
						</td>
					</tr>
					<tr>
						<th>자격</th>
						<td>${test.grade}급전문상담사</td>
						<th>유형</th>
						<td>${test.behavioral}</td>
						<th>난이도</th>
						<td style="text-align: center;">${test.diff}</td>
					</tr>
					<tr>
						<th>과목명</th>

						<td colspan="3">${test.name}</td>
						<th>출제기준</th>
						<td style="text-align: center;" colspan="5">${test.categoryNumbers}</td>
					</tr>
				</table>
				<table>
					<tr>
						<td colspan="6">[문 제] <br> ${test.subQuestion} <br>
							<br> [선택지] <br> <br>
							<ol>
								<li>${test.option1}</li>
								<li>${test.option2}</li>
								<li>${test.option3}</li>
								<li>${test.option4}</li>
								<li>${test.option5}</li>
							</ol>
						</td>
					</tr>
				</table>

				<table>
					<tr>
						<th colspan="1" class="answer">정답</th>
						<td colspan="5" style="text-align: center;">
							${test.subAnswer}</td>
					</tr>
					<tr>
						<th colspan="1" class="answer">정답해설</th>
						<td colspan="5">${test.subAnswerEx}</td>
					</tr>
					<tr>
						<th colspan="1" class="answer">출제배경</th>
						<td colspan="5">${test.subQuestionBack}<br> 분류:
							${test.category1} - ${test.category2} - ${test.category3}
						</td>
					</tr>
					<tr>
						<th rowspan="5" colspan="1" class="answer">참고도서명/출판사</th>
						<td rowspan="5" colspan="1">${test.subReference}</td>
						<th rowspan="5" colspan="1" class="answer">저자명/출판연도</th>
						<td rowspan="5" colspan="1">${test.subAuthorYear}</td>
						<th rowspan="5" colspan="1" class="answer">PAGE</th>
						<td rowspan="5" colspan="1">${test.subPage}</td>
					</tr>
				</table>

				<table>
					<tr>
						<td class="answer">구분</td>
						<td class="answer">일자</td>
						<td class="answer">소속</td>
						<td class="answer">성명</td>
						<td class="answer">서명</td>
					</tr>
					<tr>
						<td class="answer">출제자</td>
						<td style="text-align: center;">${test.createDate}</td>
						<td style="text-align: center;">${test.aff}</td>
						<td style="text-align: center;">${test.writtenName}</td>
						<td></td>
					</tr>
				</table>

				<table>
					<tr>
						<td class="answer">구분</td>
						<td class="answer">검토의견</td>
						<td class="answer">성명</td>
					</tr>
					<tr>
						<td class="answer">검토자</td>
						<td><input type="text" name="review" value="${test.review}" oninput="limitByteLength(this, 300)"
							style="width: 100%;"></td>
						<td style="text-align: center;">${test.reviewer}</td>
					</tr>
				</table>
				<input type="hidden" name="num" value="${test.num}"> <input
					type="button" value="임시저장" onclick="validateAndSubmitUpdateReview()">
				<input type="button" value="검토완료"
					onclick="validateAndSubmitComplete()"> <input type="button"
					value="재출제요청" onclick="validateAndSubmitReExam()">
			</form>
		</div>
	</div>
</body>
</html>
