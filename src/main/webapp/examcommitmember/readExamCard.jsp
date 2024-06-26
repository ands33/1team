<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!-- �ٹٲ� ���ڸ� <br> �±׷� ��ȯ -->

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="EUC-KR">
<link rel="icon" href="./img/favicon-16x16.png">
<title>���� ī�� - ${test.grade}�� ${test.name}</title>
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
function getBinaryClass() {
	document.getElementById("reviewForm").action = "getBinaryClass.do";
	document.getElementById("reviewForm").submit();
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
						<th rowspan="5" colspan="1" class="answer">����������/���ǻ�</th>
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

				<input type="hidden" name="num" value="${test.num}"> <input
					type="hidden" name="member_id" value="${member.member_id}">
				<input type="button" value="�������"
					onclick="getBinaryClass()">
			</form>
		</div>
	</div>
</body>
</html>