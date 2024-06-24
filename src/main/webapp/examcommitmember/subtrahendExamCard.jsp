<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!-- �ٹٲ� ���ڸ� <br> �±׷� ��ȯ -->

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="EUC-KR">
<title>���� ī�� - 1�� ��޻���̷а� ����</title>
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
		// ���⼭ ��ȿ�� �˻縦 �����ϰ� ���ǿ� ���� ���� ���� ����
		var allFieldsValid = validateFields(); // ���� �Լ�, ������ ��ȿ�� �˻� �Լ��� ȣ���Ͽ� ����
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
						<td>${test.behavioral}</td>
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
						<td colspan="6">[�� ��] <br> ${test.subQuestion} <br>
							<br> [������] <br> <br>
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
						<th colspan="1" class="answer">����</th>
						<td colspan="5" style="text-align: center;">
							${test.subAnswer}</td>
					</tr>
					<tr>
						<th colspan="1" class="answer">�����ؼ�</th>
						<td colspan="5">${test.subAnswerEx}</td>
					</tr>
					<tr>
						<th colspan="1" class="answer">�������</th>
						<td colspan="5">${test.subQuestionBack}<br> �з�:
							${test.category1} - ${test.category2} - ${test.category3}
						</td>
					</tr>
					<tr>
						<th rowspan="5" colspan="1" class="answer">��������/���ǻ�</th>
						<td rowspan="5" colspan="1">${test.subReference}</td>
						<th rowspan="5" colspan="1" class="answer">���ڸ�/���ǿ���</th>
						<td rowspan="5" colspan="1">${test.subAuthorYear}</td>
						<th rowspan="5" colspan="1" class="answer">PAGE</th>
						<td rowspan="5" colspan="1">${test.subPage}</td>
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
						<td style="text-align: center;">${test.createDate}</td>
						<td style="text-align: center;">${test.aff}</td>
						<td style="text-align: center;">${test.writtenName}</td>
						<td></td>
					</tr>
				</table>

				<table>
					<tr>
						<td class="answer">����</td>
						<td class="answer">�����ǰ�</td>
						<td class="answer">����</td>
					</tr>
					<tr>
						<td class="answer">������</td>
						<td><input type="text" name="review" value="${test.review}" oninput="limitByteLength(this, 300)"
							style="width: 100%;"></td>
						<td style="text-align: center;">${test.reviewer}</td>
					</tr>
				</table>
				<input type="hidden" name="num" value="${test.num}"> <input
					type="button" value="�ӽ�����" onclick="validateAndSubmitUpdateReview()">
				<input type="button" value="����Ϸ�"
					onclick="validateAndSubmitComplete()"> <input type="button"
					value="��������û" onclick="validateAndSubmitReExam()">
			</form>
		</div>
	</div>
</body>
</html>
