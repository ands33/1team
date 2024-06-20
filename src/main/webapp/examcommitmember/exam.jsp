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
<title>출제의뢰 목록</title>

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
			<h3>출제</h3>
			<h4>출제의뢰 목록</h4>
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
					<th>담당 위원</th>
					<th>현황</th>
					<th>반려/출제</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="examPlan" items="${examPlanList}">
					<tr>
						<td>${examPlan.num}</td>
						<td>${examPlan.categoryNumbers}</td>
						<td>${examPlan.name}</td>
						<td>${examPlan.category1}</td>
						<td>${examPlan.category2}</td>
						<td>${examPlan.category3}</td>
						<td>${examPlan.diff}</td>
						<td>${examPlan.member_name}</td>
						<td>${examPlan.e_status}</td>
						<td>

							<form action="createTest.do" method="post">
								<input type="hidden" name="num" value="${examPlan.num}" /> <input
									type="hidden" name="e_status" value="출제중" />
								<button type="submit" name="action" value="approve"
									<c:if test="${examPlan.e_status == '반려' || examPlan.e_status == '제출(감수대기)'}">disabled</c:if>>출제</button>
							</form>
							<form id="rejectForm1" action="updateStatus.do" method="post">
								<input type="hidden" name="num" value="${examPlan.num}" /> <input
									type="hidden" name="e_status" value="반려" />
								<button type="submit" name="action" value="reject" <c:if test="${examPlan.e_status == '반려' || examPlan.e_status == '제출(감수대기)'}">disabled</c:if>>반려</button>
							</form>
							<form action="updateStatus.do" method="post">
								<input type="hidden" name="num" value="${examPlan.num}" /> <input
									type="hidden" name="e_status" value="미개봉" />
								<button type="submit" name="action" value="test">테스트용</button>
							</form>

						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>