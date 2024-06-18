<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�����Ƿڼ�</title>

<style>
body {
	font-family: Arial, sans-serif;
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-bottom: 20px;
}

th, td {
	border: 1px solid #ddd;
	padding: 8px;
	text-align: center;
}

th {
	background-color: #f2f2f2;
}

.section-title {
	font-weight: bold;
	margin-top: 20px;
	margin-bottom: 10px;
}

.btn-close {
	margin-top: 20px;
}
</style>
</head>
<body>

	<h2>�����Ƿڼ�</h2>

	<div class="section">
		<table>
			<tr>
				<th>�����</th>
				<th>����Ÿ��</th>
				<th>������</th>
				<th>�������</th>
				<th>�Ƿ���</th>
				<th>�Ϸ��û��</th>
				<th>�ܿ��Ⱓ</th>
				<th>��Ȳ</th>
				<th>����</th>
			</tr>
			<tr>
				<td>${test.subject}</td>
				<td>${test.test_type}</td>
				<td>${test.e_name}</td>
				<td>${test.selMethod}</td>
				<td>${test.requestDate}</td>
				<td>${test.comRequestDate}</td>
				<td>${test.dateDifference}</td>
				<td>${test.curSituation}/3</td>
				<td>������</td>
			</tr>
		</table>
	</div>

	<div class="section">
		<div class="section-title">��������</div>
		<table>
			<tr>
				<th>��������</th>
				<th>��з���</th>
				<th>�ߺз���</th>
				<th>�Һз���</th>
				<th>���̵��� ������</th>
			</tr>
			<tr>
				<td>1-1-1</td>
				<td>����غ����� ����</td>
				<td>1. ����غδ��� ����</td>
				<td>1. �غ����� �ڼ��� ����</td>
				<td>
					<table>
						<tr>
							<td>��</td>
							<td>��</td>
							<td>��</td>
							<td>�հ�</td>
						</tr>
						<tr>
							<td>1</td>
							<td>0</td>
							<td>0</td>
							<td>1</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td>1-1-2</td>
				<td>����غδ��� ����</td>
				<td>1. ����غδ��� ����</td>
				<td>2. ��ü�� ��</td>
				<td>
					<table>
						<tr>
							<td>��</td>
							<td>��</td>
							<td>��</td>
							<td>�հ�</td>
						</tr>
						<tr>
							<td>0</td>
							<td>1</td>
							<td>0</td>
							<td>1</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td>1-1-3</td>
				<td>����غδ��� ����</td>
				<td>1. ����غδ��� ����</td>
				<td>3. ��� ���</td>
				<td>
					<table>
						<tr>
							<td>��</td>
							<td>��</td>
							<td>��</td>
							<td>�հ�</td>
						</tr>
						<tr>
							<td>1</td>
							<td>1</td>
							<td>1</td>
							<td>3</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		<div class="btn-close">
			<button onclick="window.close()">�ݱ�</button>
		</div>
	</div>

</body>
</html>
