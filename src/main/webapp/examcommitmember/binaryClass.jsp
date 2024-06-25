<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="icon" href="./img/favicon-16x16.png">
<title>����</title>
<style>
.header-links a {
	text-decoration: none;
	color: black;
}

body, table, th, td, input, select, textarea, div, a, p, span, strong, b,
	i, ul, ol, li, button {
	font-family: "Montserrat", "Noto Sans KR", sans-serif;
	font-size: 15px;
	letter-spacing: -0.05em;
	line-height: 1.6em;
	list-style: none;
	color: #333;
}

th {
	white-space: nowrap; /* ��ħ ó�� ���� */
	padding: 10px; /* �� �� ���� */
	font-weight: bold; /* ���� �۾� */
	font-size: 14px; /* �۾� ũ�� */
	font-weight: bold;
}

th, td {
	border: 1px solid black;
	padding: 8px;
	text-align: left;
}

.wide-column {
	width: 300px;
}

.table .btn {
	margin: 2px;
}

.navbar {
	border-top: 1px solid #D8D9DA;
	border-bottom: 3px solid #F5F5F5;
	width: 100%;
	height: 50px;
	justify-content: center;
	position: relative;
	font-weight: bold;
	font-size: 14px;
}

.navbar-nav {
	display: flex;
	justify-content: center;
	align-items: center;
	width: 100%;
	padding: 0;
	margin: 0;
	list-style: none;
}

.nav-item {
	position: relative;
}

.nav-link {
	text-decoration: none;
	color: black;
	padding: 10px 20px;
	display: block;
	position: relative;
}

.navbar-nav .nav-link:hover {
	color: #DB402E;
}

/* �ϴ� �׵θ� �ʱ� ���� */
.navbar-nav .nav-link::after {
	content: ''; /* ������ �߰� */
	display: block; /* ��� ���� ��ҷ� ���� */
	width: 0; /* �ʺ� 0���� �����Ͽ� �ʱ⿡ ���� */
	height: 2px; /* ���� 2px */
	background: #DB402E; /* ��� ���� */
	position: absolute;
	left: 0; /* ���� 0 */
	bottom: -9.5px; /* �Ʒ��� -9.5px */
	opacity: 0; /* �ʱ⿡ ���� */
}

/* ȣ�� �� �׵θ� ȿ�� */
.navbar-nav .nav-link:hover::after {
	width: 100%; /* ȣ�� �� �ʺ� 100%�� Ȯ�� */
	opacity: 1; /* ȣ�� �� ���̰� �� */
}

/* ������ ��û �ڽ� ��Ÿ�� */
.resubmit-box {
	width: 100px;
	height: 50px;
	border: 1px solid #333;
	display: flex;
	align-items: center;
	justify-content: center;
	position: relative;
	cursor: pointer; /* Ŀ���� �����ͷ� ���� */
}

.resubmit-box::after {
	content: attr(data-review); /* data-review �Ӽ��� ���� ǥ�� */
	display: none; /* �⺻������ ���� */
	position: absolute;
	top: 60px; /* �ڽ� �Ʒ��� ǥ�� */
	left: 0;
	background-color: #fff;
	border: 1px solid #333;
	padding: 5px;
	white-space: pre-wrap; /* �ٹٲ��� ���� */
}

.resubmit-box:hover::after {
	display: block; /* ���콺�� �÷��� �� ǥ�� */
}

/* ǥ�� ��� �����ϴ� ��Ÿ�� */
.table-container {
	display: flex;
	justify-content: center;
}
</style>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
</head>
<body>
	<%@ include file="header.jsp"%>
	<div class="container mt-4">
		<div class="table-container">
			<table class="table table-bordered">
				<thead class="table-light">
					<tr>
						<th colspan="23">����� : ${member.subject_name}<br>
						�������� : (A) ${memberAB.memberA} (B) : ${memberAB.memberB}
						</th>
					</tr>
					<tr align="center">
						<th>�з��ڵ�</th>
						<th>��з�</th>
						<th>�ߺз�</th>
						<th>�Һз�</th>
						<th>��</th>
						<th>��</th>
						<th>��</th>
						<th>�հ�</th>
						<th>��������1</th>
						<th>��������2</th>
						<th>��������</th>
						<th>���⹮��</th>
						<th>����</th>
						<th>����</th>
						<th>����</th>
						<th>��</th>
						<th>��</th>
						<th>��</th>
						<th>��</th>
						<th>��</th>
						<th>��ó</th>
						<th>����ī��</th>
						<th>����Ϸ�</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="binaryClass" items="${binaryClassList}">
						<tr>
							<td>${binaryClass.categoryNumbers}</td>
							<td>${binaryClass.category1}</td>
							<td>${binaryClass.category2}</td>
							<td>${binaryClass.category3}</td>
							<td>${binaryClass.diff}</td>
							<td>${binaryClass.diff}</td>
							<td>${binaryClass.diff}</td>
							<td>${binaryClass.diff}</td>
							<td>${binaryClass.member_name}</td>
							<td>${binaryClass.submember_name}</td>
							<td>${binaryClass.exam_type}</td>
							<td>${binaryClass.exam_type}</td>
							<td>${binaryClass.behavioral}</td>
							<td>${binaryClass.behavioral}</td>
							<td>${binaryClass.behavioral}</td>
							<td>${binaryClass.answer}</td>
							<td>${binaryClass.answer}</td>
							<td>${binaryClass.answer}</td>
							<td>${binaryClass.answer}</td>
							<td>${binaryClass.answer}</td>
							<td>${binaryClass.reference}</td>
							<td>${binaryClass.e_status}</td>
							<td>${binaryClass.e_status}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
</body>
</html>
