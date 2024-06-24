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
<title>검토의뢰 목록</title>

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
			<h3>검토</h3>
			<h4>검토의뢰 목록</h4>
		</div>
		<table>
			<thead>
				<tr align="center">
					<th>의뢰 번호</th>
					<th>분류 코드</th>
					<th>출제 과목</th>
					<th>대분류</th>
					<th>중분류</th>
					<th>소분류</th>
					<th>난이도</th>
					<th>출제 위원</th>
					<th>현황</th>
					<th>반려/출제</th>
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
								<button type="submit" name="action" value="approve">검토</button>
							</form>

						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>