<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>������ȹ��</title>
</head>
<body>
	<table align="center" border="1">
		<tr>
			<th colspan="10">������ȹ��</th>
		</tr>
		<tr>
			<td colspan="10">�����: ��������� ö��</td>
		</tr>
		<td colspan="10">��������: (A)ȫ�浿 (B)�躹��
		<tr>
			<th colspan="4">��������</th>
			<th colspan="4">���̵��� ������</th>
			<th colspan="2">��������</th>
		</tr>
		<div border="1">
			<tr>
				<th>�з���ȣ</th>
				<th>��з�</th>
				<th>�ߺз�</th>
				<th>����</th>
				<th>��</th>
				<th>��</th>
				<th>��</th>
				<th>�հ�</th>
				<th>������ ${examdoc.member_name}</th>
				<th>user ${examdoc.member_name}</th>
			</tr>
			<c:forEach items="${ExamDocList}" var="examdoc">
				<tr>
					<th>1-0-0</th>
					<th>${examdoc.category1}</th>
					<th>${examdoc.category2}</th>
					<th>${examdoc.category3}</th>
					<th>1</th>
					<th>0</th>
					<th>1</th>
					<th>1</th>
					<th>1</th>
					<th>0</th>
				</tr>
			</c:forEach>
		<tr>
			<th></th>
			<th></th>
			<th></th>
			<th></th>
			<th></th>
			<th></th>
			<th></th>
			<th></th>
			<th></th>
			<th></th>
		</tr>
		<tr>
			<th colspan="4" rowspan="2">�հ�</th>
			<th>2</th>
			<th>2</th>
			<th>1</th>
			<th>5</th>
			<th rowspan="2">3</th>
			<th rowspan="2">2</th>
		</tr>
		<tr>
			<th colspan="3">���������</th>
			<th>40</th>
		</tr>
		</div>
	</table>
</body>
</html>