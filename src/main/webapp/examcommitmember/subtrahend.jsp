<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" type="favicon.ico" type="image/x-icon">
<link rel="stylesheet" href="exam.css">
<meta charset="EUC-KR">
<title>�����Ƿ� ���</title>

<style>
table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
}

th, td {
	border: 1px solid #F76030;
	padding: 8px;
	text-align: center;
}

th {
	background-color: #fff;
}

.container {
	margin: 20px;
}

.header {
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.header h3 {
	margin: 0;
}
</style>
</head>
<%@ include file="header.jsp"%>
<body>
	<div class="container">
		<div class="header">
			<h3>����</h3>
			<h4>�����Ƿ� ���</h4>
		</div>
		<table>
			<thead>
				<tr align="center">
					<th>�Ƿ� ��ȣ</th>
					<th>�з� �ڵ�</th>
					<th>���� ����</th>
					<th>��з�</th>
					<th>�ߺз�</th>
					<th>�Һз�</th>
					<th>���̵�</th>
					<th>���� ����</th>
					<th>��Ȳ</th>
					<th>�ݷ�/����</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="subtrahend" items="${subtrahendList}">
					<tr>
						<td>${subtrahend.num}</td>
						<td>${subtrahend.categoryNumbers}</td>
						<td>${subtrahend.name}</td>
						<td>${subtrahend.category1}</td>
						<td>${subtrahend.category2}</td>
						<td>${subtrahend.category3}</td>
						<td>${subtrahend.diff}</td>
						<td>${subtrahend.member_name}</td>
						<td>${subtrahend.e_status}</td>
						<td>

							<form action="subtrahend.do" method="post">
								<input type="hidden" name="num" value="${subtrahend.num}" />
								<button type="submit" name="action" value="approve">����</button>
							</form>

						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>