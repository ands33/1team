<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>������ȹ��</title>
</head>
<body>
	<form action="getexamDocList.do" method="post">
		<table align="center" border="1">
			<tr>
				<th colspan="10">������ȹ��</th>
			</tr>
			<tr>
				<td colspan="10">�����: ��������� ö��</td>
			</tr>
			<tr>
				<td colspan="10">��������: (A)${memberNames['A']}
					(B)${memberNames['B']}</td>
			</tr>
			<tr>
				<th colspan="4">��������</th>
				<th colspan="4">���̵��� ������</th>
				<th colspan="2">��������</th>
			</tr>
			</form>
			<div border="1">
				<tr>
					<th>�з���ȣ</th>
					<th>��з�</th>
					<th>�ߺз�</th>
					<th>�Һз�</th>
					<th>��</th>
					<th>��</th>
					<th>��</th>
					<th>�հ�</th>
					<th>${memberNames['A']}</th>
					<th>${memberNames['B']}</th>
				</tr>
				<c:forEach items="${ExamDocList}" var="examdoc">
					<tr>
						<th>${examdoc.categoryNumbers}</th>
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
				<tr>
					<th colspan="10">[����]</th>
				</tr>
				<tr>
					<td colspan="10">- ���̵��� ������ Ȯ��</td>
				</tr>
				<tr>
					<td colspan="10">�� : 20%���� (5-6����)</td>
				</tr>
				<tr>
					<td colspan="10">�� : 50%���� (13-15����)</td>
				</tr>
				<tr>
					<td colspan="10">�� : 30%���� (8-9����)</td>
				</tr>
				<tr>
					<td colspan="10">-��������� ������ ���� [(��*0.5)+(��*0.75)+(��*1.0)]*4
						������ �����Ͽ� ���� ��������� ����(��������� 70/100�� �����ϵ��� �Ѵ�)
				</tr>
			</div>
		</table>
	</form>
</body>
</html>