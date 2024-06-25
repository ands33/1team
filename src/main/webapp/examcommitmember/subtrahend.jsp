<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" type="favicon.ico" type="image/x-icon">
<meta charset="EUC-KR">
<link rel="icon" href="./img/favicon-32x32.png">
<title>����</title>
<style>
body, table, input, select, textarea, div, a, p, span, strong, b, i, ul, ol, li, button {
	font-family: "Montserrat", "Noto Sans KR", sans-serif;
	font-size: 15px;
	letter-spacing: -0.05em;
	line-height: 1.6em;
	list-style: none;
	color: #333;
}

th, td {
	width: 150px;
}

/* header-link�� ���� ���� */
.header-links a {
    text-decoration: none;
    color: black;
}

/* �ΰ� ���� �۾� ȣ�� : �ѱ������ȸ */
.header-links a:hover {
    color: #D8402A;
}

body {
    background: #FFF;
    height: 100vh;
    font-size: 15px;
}

/* ����� ���� */
.navbar {
    border-top: 1px solid #D8D9DA;
    border-bottom: 1px solid #F5F5F5;
    background: #FFF;
    width: 100%;
    height: 50px;
    justify-content: center;
    margin-left: 30px;
    position: relative;
    font-weight: bold;
    font-size: 14px;
}

/* �׺���̼� ��ũ - ����� �ȵ�*/
.navbar-nav .nav-link {
    text-decoration: none;
    color: black;
    position: relative;
    font-weight: bold;
    font-size: 15px;
}

/* �ϴ� �׵θ� �ʱ� ���� - ����� ���� */
.navbar-nav .nav-link::after {
    content: ''; /* ������ �߰� */
    display: block; /* ��� ���� ��ҷ� ���� */
    width: 0; /* �ʺ� 0���� �����Ͽ� �ʱ⿡ ���� */
    height: 3px; /* ���� 2px */
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

.nav-item:hover {
    color: #6B6D70;
	opacity: 1; /* ȣ�� �� ���̰� �� */
}

#header {
	width: 100%;
	padding: 20px 10px;
	background: #fff;
	z-index: 1;
}

/* header-link�� ���� ���� */
.header-links a {
	text-decoration: none;
	color: #000;
}

/* �ΰ� ������ �����ȸ �� ��Ʈ�� �۾� ȣ�� */
.header-links a:hover {
	color: #D8402A;
}

.header-left img {
	width: 250px;
	height: auto;
	padding-top: 20px;
	margin-left: 100px;
}

.nav-item:hover {
	color: #6B6D70;
}

</style>
</head>
<body>
	<%@ include file="header.jsp"%>
	<div class="container">
		<div class="header"></div>
		<h2>
			<b><u>����</u></b>
		</h2>
		<table class="table table-bordered">
			<thead class="table-light">
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