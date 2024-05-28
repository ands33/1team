<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ�� ����Ʈ</title>
<link rel="stylesheet" href="resources/user_style.css">
</head>
<body>
	<center>
		<h1>ȸ�� ����Ʈ</h1>
		<hr>
		<table border="1" width="800">
			<tr>
				<th width="50">��ȣ</th>
				<th width="100">�̸�</th>
				<th width="100">���̵�</th>
				<th width="50">����</th>
				<th width="100">��ȭ��ȣ</th>
				<th width="150">�̸���</th>
				<th width="250">�ּ�</th>
				<th width="250">�ڱ�Ұ�</th>
			</tr>
			<c:forEach items="${userList}" var="user">
				<tr>
					<td align="center">${user.u_seq}</td>
					<td align="center"><a href="modifyUser.do?u_id=${user.u_id}">${user.u_name}</a></td>
					<td align="center">${user.u_id}</td>
					<td align="center">${user.u_gender}</td>
					<td>${user.u_phone}</td>
					<td>${user.u_email}</td>
					<td>${user.u_addr}</td>
					<td>${user.u_introduce}</td>
				</tr>
			</c:forEach>
		</table>
	</center>
</body>
</html>