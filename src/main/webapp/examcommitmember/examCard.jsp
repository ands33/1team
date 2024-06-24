<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="EUC-KR">
<title>문항카드 - 1급 고급상담이론과 실제</title>
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

th {
	white-space: nowrap; /* 넘침 처리 방지 */
	padding: 10px; /* 셀 안 여백 */
	font-size: 15px; /* 글씨 크기 */
	font-weight: bold;
	background-color: #f2f2f2;
	text-align: center;
}

.answer {
	background-color: #f2f2f2;
}

th, td {
	border: 1px solid black;
	text-align: left;
	padding: 8px;
	word-wrap: break-word;
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
	function updateBehavioral() {
		var selectBox = document.getElementById("behavioralSelect");
		var selectedValue = selectBox.options[selectBox.selectedIndex].value;
		document.getElementById("behavioralValue").innerText = selectedValue;
	}

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

	function validateAndSubmitUpdate() {
		document.getElementById("testForm").action = "updateTest.do";
		document.getElementById("testForm").submit();
	}

	function validateAndSubmitSend() {
		// 여기서 유효성 검사를 수행하고 조건에 따라 제출 여부 결정
		var allFieldsValid = validateFields(); // 예시 함수, 실제로 유효성 검사 함수를 호출하여 구현
		if (allFieldsValid) {
			document.getElementById("testForm").action = "sendTest.do";
			document.getElementById("testForm").submit();
		} else {
		}
	}

	function validateFields() {
		// 예시: 모든 필수 입력란이 채워져 있는지 확인하는 함수
		var question = document.getElementsByName("question")[0].value;
		var option1 = document.getElementsByName("option1")[0].value;
		var option2 = document.getElementsByName("option2")[0].value;
		var option3 = document.getElementsByName("option3")[0].value;
		var option4 = document.getElementsByName("option4")[0].value;
		var option5 = document.getElementsByName("option5")[0].value;
		var answer = document.getElementsByName("answer");
		var answerEx = document.getElementsByName("answerEx")[0].value;
		var questionBack = document.getElementsByName("questionBack")[0].value;
		var reference = document.getElementsByName("reference")[0].value;
		var authorYear = document.getElementsByName("authorYear")[0].value;
		var page = document.getElementsByName("page")[0].value;
		var createDate = document.getElementsByName("createDate")[0].value;
		var aff = document.getElementsByName("aff")[0].value;

		if (question === "") {
			alert("문제를 입력하세요.");
			document.getElementsByName("question")[0].focus();
			return false;
		}

		if (option1 === "") {
			alert("선택지 1번을 입력하세요.");
			document.getElementsByName("option1")[0].focus();
			return false;
		}

		if (option2 === "") {
			alert("선택지 2번을 입력하세요.");
			document.getElementsByName("option2")[0].focus();
			return false;
		}

		if (option3 === "") {
			alert("선택지 3번을 입력하세요.");
			document.getElementsByName("option3")[0].focus();
			return false;
		}

		if (option4 === "") {
			alert("선택지 4번을 입력하세요.");
			document.getElementsByName("option4")[0].focus();
			return false;
		}

		if (option5 === "") {
			alert("선택지 5번을 입력하세요.");
			document.getElementsByName("option5")[0].focus();
			return false;
		}

		var answerChecked = false;
		for (var i = 0; i < answer.length; i++) {
			if (answer[i].checked) {
				answerChecked = true;
				break;
			}
		}
		if (!answerChecked) {
			alert("정답을 체크하세요.");
			return false;
		}

		if (answerEx === "") {
			alert("정답 설명을 입력하세요.");
			document.getElementsByName("answerEx")[0].focus();
			return false;
		}

		if (questionBack === "") {
			alert("출제 배경을 입력하세요.");
			document.getElementsByName("questionBack")[0].focus();
			return false;
		}

		if (reference === "") {
			alert("참고도서명/출판사를 입력하세요.");
			document.getElementsByName("reference")[0].focus();
			return false;
		}

		if (authorYear === "") {
			alert("저자명/출판연도를 입력하세요.");
			document.getElementsByName("authorYear")[0].focus();
			return false;
		}

		if (page === "") {
			alert("페이지 정보를 입력하세요.");
			document.getElementsByName("page")[0].focus();
			return false;
		}

		if (createDate === "") {
			alert("작성일자를 입력하세요.");
			document.getElementsByName("createDate")[0].focus();
			return false;
		}

		if (aff === "") {
			alert("소속을 입력하세요.");
			document.getElementsByName("aff")[0].focus();
			return false;
		}
		return true;
	}
</script>
</head>
<%@ include file="header.jsp"%>
<body>
	<div class="container">
		<div class="details">
			<form id="testForm" method="post">
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
						<td><select id="behavioralSelect" name="behavioral"
							onchange="updateBehavioral()">
								<option value="지식" ${test.behavioral == '지식' ? 'selected' : ''}>지식</option>
								<option value="이해" ${test.behavioral == '이해' ? 'selected' : ''}>이해</option>
								<option value="적용" ${test.behavioral == '적용' ? 'selected' : ''}>적용</option>
						</select></td>
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
						<td colspan="6">[문 제] <br> <textarea name="question"
								style="height: 150px; width: 100%;"
								oninput="limitByteLength(this, 500)">${test.question}</textarea>
							<br> <br> [선택지] <br> <br>
							<ol>
								<li><input type="text" name="option1"
									value="${test.option1}" style="width: 90%;"
									oninput="limitByteLength(this, 300)"></li>
								<li><input type="text" name="option2"
									value="${test.option2}" style="width: 90%;"
									oninput="limitByteLength(this, 300)"></li>
								<li><input type="text" name="option3"
									value="${test.option3}" style="width: 90%;"
									oninput="limitByteLength(this, 300)"></li>
								<li><input type="text" name="option4"
									value="${test.option4}" style="width: 90%;"
									oninput="limitByteLength(this, 300)"></li>
								<li><input type="text" name="option5"
									value="${test.option5}" style="width: 90%;"
									oninput="limitByteLength(this, 300)"></li>
							</ol>
						</td>
					</tr>
				</table>

				<table>
					<tr>
						<th colspan="1" class="answer">정답</th>
						<td colspan="5">&nbsp; <input type="checkbox" name="answer"
							value="1" ${test.answer == 1 ? 'checked' : ''}>①&nbsp; <input
							type="checkbox" name="answer" value="2"
							${test.answer == 2 ? 'checked' : ''}>② &nbsp; <input
							type="checkbox" name="answer" value="3"
							${test.answer == 3 ? 'checked' : ''}>③ &nbsp; <input
							type="checkbox" name="answer" value="4"
							${test.answer == 4 ? 'checked' : ''}>④&nbsp; <input
							type="checkbox" name="answer" value="5"
							${test.answer == 5 ? 'checked' : ''}>⑤
						</td>
					</tr>
					<tr>
						<th colspan="1" class="answer">정답해설</th>
						<td colspan="5"><textarea name="answerEx"
								style="height: 150px; width: 100%;"
								oninput="limitByteLength(this, 1000)">${test.answerEx}</textarea></td>
					</tr>
					<tr>
						<th colspan="1" class="answer">출제배경</th>
						<td colspan="5"><textarea name="questionBack"
								style="height: 50px; width: 100%;"
								oninput="limitByteLength(this, 300)">${test.questionBack}</textarea><br>
							분류: ${test.category1} - ${test.category2} - ${test.category3}</td>
					</tr>
					<tr>
						<th rowspan="5" colspan="1" class="answer">참고도서명/출판사</th>
						<td rowspan="5" colspan="1"><textarea name="reference"
								style="height: 50px; width: 100%;"
								oninput="limitByteLength(this, 300)">${test.reference}</textarea></td>
						<th rowspan="5" colspan="1" class="answer">저자명/출판연도</th>
						<td rowspan="5" colspan="1"><textarea name="authorYear"
								style="height: 50px; width: 100%;"
								oninput="limitByteLength(this, 300)">${test.authorYear}</textarea></td>
						<th rowspan="5" colspan="1" class="answer">PAGE</th>
						<td rowspan="5" colspan="1"><textarea name="page"
								style="height: 50px; width: 100%;"
								oninput="limitByteLength(this, 50)">${test.page}</textarea></td>
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
						<td><input type="text" name="createDate"
							value="${test.createDate}" placeholder="yyyy-mm-dd"
							style="width: 100%;"></td>
						<td><input type="text" name="aff" value="${test.aff}"
							style="width: 100%;"></td>
						<td style="text-align: center;">${test.writtenName}</td>
						<td></td>
					</tr>
				</table>
				<input type="hidden" name="num" value="${test.num}"> <input
					type="hidden" name="member_id" value="${member.member_id}">
				<input type="button" value="수정하기 (updateTest.do)"
					onclick="validateAndSubmitUpdate()"> <input type="button"
					value="전송하기 (sendTest.do)" onclick="validateAndSubmitSend()">
			</form>
		</div>
	</div>
</body>
</html>
