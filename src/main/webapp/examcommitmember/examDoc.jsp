<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
				<th>������</th>
				<th>user</th>
			</tr>
			<c:forEach items="${ExamDoc}" var="examdoci">
				<tr>
					<th>1-0-0</th>
					<th>${examdoci.category1}</th>
					<th>${examdoci.category2}</th>
					<th>${examdoci.category3}</th>
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