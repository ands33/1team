<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="EUC-KR">
<title>����ī�� - 1�� ��޻���̷а� ����</title>
<style>
bn {
	border: none; /* �׵θ� ���� */
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
	white-space: nowrap; /* ��ħ ó�� ���� */
	padding: 10px; /* �� �� ���� */
	font-size: 15px; /* �۾� ũ�� */
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
	width: 50%; /* ���� �ʺ� 50%�� ���� */
	margin-left: auto; /* ��� ������ ���� �߰� */
	margin-right: auto; /* ��� ������ ���� �߰� */
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
		// ���⼭ ��ȿ�� �˻縦 �����ϰ� ���ǿ� ���� ���� ���� ����
		var allFieldsValid = validateFields(); // ���� �Լ�, ������ ��ȿ�� �˻� �Լ��� ȣ���Ͽ� ����
		if (allFieldsValid) {
			document.getElementById("testForm").action = "sendTest.do";
			document.getElementById("testForm").submit();
		} else {
		}
	}

	function validateFields() {
		// ����: ��� �ʼ� �Է¶��� ä���� �ִ��� Ȯ���ϴ� �Լ�
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
			alert("������ �Է��ϼ���.");
			document.getElementsByName("question")[0].focus();
			return false;
		}

		if (option1 === "") {
			alert("������ 1���� �Է��ϼ���.");
			document.getElementsByName("option1")[0].focus();
			return false;
		}

		if (option2 === "") {
			alert("������ 2���� �Է��ϼ���.");
			document.getElementsByName("option2")[0].focus();
			return false;
		}

		if (option3 === "") {
			alert("������ 3���� �Է��ϼ���.");
			document.getElementsByName("option3")[0].focus();
			return false;
		}

		if (option4 === "") {
			alert("������ 4���� �Է��ϼ���.");
			document.getElementsByName("option4")[0].focus();
			return false;
		}

		if (option5 === "") {
			alert("������ 5���� �Է��ϼ���.");
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
			alert("������ üũ�ϼ���.");
			return false;
		}

		if (answerEx === "") {
			alert("���� ������ �Է��ϼ���.");
			document.getElementsByName("answerEx")[0].focus();
			return false;
		}

		if (questionBack === "") {
			alert("���� ����� �Է��ϼ���.");
			document.getElementsByName("questionBack")[0].focus();
			return false;
		}

		if (reference === "") {
			alert("��������/���ǻ縦 �Է��ϼ���.");
			document.getElementsByName("reference")[0].focus();
			return false;
		}

		if (authorYear === "") {
			alert("���ڸ�/���ǿ����� �Է��ϼ���.");
			document.getElementsByName("authorYear")[0].focus();
			return false;
		}

		if (page === "") {
			alert("������ ������ �Է��ϼ���.");
			document.getElementsByName("page")[0].focus();
			return false;
		}

		if (createDate === "") {
			alert("�ۼ����ڸ� �Է��ϼ���.");
			document.getElementsByName("createDate")[0].focus();
			return false;
		}

		if (aff === "") {
			alert("�Ҽ��� �Է��ϼ���.");
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
				<h2 class="title">�ѱ������ȸ ���� ���蹮��</h2>
				<table>
					<tr>
						<td style="border: none;"></td>
						<td style="border: none;"></td>
						<th colspan="2">������ȣ</th>
						<td colspan="4">
							<!-- ���⿡ ������ȣ�� �Է��� �ּ���. ��������ϴ� -->
						</td>
					</tr>
					<tr>
						<th>�ڰ�</th>
						<td>${test.grade}����������</td>
						<th>����</th>
						<td><select id="behavioralSelect" name="behavioral"
							onchange="updateBehavioral()">
								<option value="����" ${test.behavioral == '����' ? 'selected' : ''}>����</option>
								<option value="����" ${test.behavioral == '����' ? 'selected' : ''}>����</option>
								<option value="����" ${test.behavioral == '����' ? 'selected' : ''}>����</option>
						</select></td>
						<th>���̵�</th>
						<td style="text-align: center;">${test.diff}</td>
					</tr>
					<tr>
						<th>�����</th>
						<td colspan="3">${test.name}</td>
						<th>��������</th>
						<td style="text-align: center;" colspan="5">${test.categoryNumbers}</td>
					</tr>
				</table>
				<table>
					<tr>
						<td colspan="6">[�� ��] <br> <textarea name="question"
								style="height: 150px; width: 100%;"
								oninput="limitByteLength(this, 500)">${test.question}</textarea>
							<br> <br> [������] <br> <br>
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
						<th colspan="1" class="answer">����</th>
						<td colspan="5">&nbsp; <input type="checkbox" name="answer"
							value="1" ${test.answer == 1 ? 'checked' : ''}>��&nbsp; <input
							type="checkbox" name="answer" value="2"
							${test.answer == 2 ? 'checked' : ''}>�� &nbsp; <input
							type="checkbox" name="answer" value="3"
							${test.answer == 3 ? 'checked' : ''}>�� &nbsp; <input
							type="checkbox" name="answer" value="4"
							${test.answer == 4 ? 'checked' : ''}>��&nbsp; <input
							type="checkbox" name="answer" value="5"
							${test.answer == 5 ? 'checked' : ''}>��
						</td>
					</tr>
					<tr>
						<th colspan="1" class="answer">�����ؼ�</th>
						<td colspan="5"><textarea name="answerEx"
								style="height: 150px; width: 100%;"
								oninput="limitByteLength(this, 1000)">${test.answerEx}</textarea></td>
					</tr>
					<tr>
						<th colspan="1" class="answer">�������</th>
						<td colspan="5"><textarea name="questionBack"
								style="height: 50px; width: 100%;"
								oninput="limitByteLength(this, 300)">${test.questionBack}</textarea><br>
							�з�: ${test.category1} - ${test.category2} - ${test.category3}</td>
					</tr>
					<tr>
						<th rowspan="5" colspan="1" class="answer">��������/���ǻ�</th>
						<td rowspan="5" colspan="1"><textarea name="reference"
								style="height: 50px; width: 100%;"
								oninput="limitByteLength(this, 300)">${test.reference}</textarea></td>
						<th rowspan="5" colspan="1" class="answer">���ڸ�/���ǿ���</th>
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
						<td class="answer">����</td>
						<td class="answer">����</td>
						<td class="answer">�Ҽ�</td>
						<td class="answer">����</td>
						<td class="answer">����</td>
					</tr>
					<tr>
						<td class="answer">������</td>
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
				<input type="button" value="�����ϱ� (updateTest.do)"
					onclick="validateAndSubmitUpdate()"> <input type="button"
					value="�����ϱ� (sendTest.do)" onclick="validateAndSubmitSend()">
			</form>
		</div>
	</div>
</body>
</html>
