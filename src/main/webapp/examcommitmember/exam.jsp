<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>출제</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<link rel="stylesheet" href="exam.css">
</head>
<body>
	<%@ include file="header.jsp"%>
	<div class="container mt-4">
		<div class="header"></div>
		<br>
		<table class="table table-bordered">
			<thead class="table-light">
				<tr align="center">
					<th>번호</th>
					<th>분류코드</th>
					<th>출제 과목</th>
					<th>대분류</th>
					<th>중분류</th>
					<th>소분류</th>
					<th>난이도</th>
					<th>출제위원</th>
					<th>상태</th>
					<th>기출여부</th>
					<th>출제</th>
					<th>정답</th>
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
							<form action="createTest.do" method="post" class="d-inline">
								<input type="hidden" name="num" value="${examPlan.num}" /> <input
									type="hidden" name="e_status" value="출제중" />
								<button type="submit" name="action" value="approve"
									class="btn btn-primary btn-sm"
									<c:if test="${examPlan.e_status == '반려'}">disabled</c:if>>출제</button>
							</form> 
							<!-- 정답 -->
							<form action="createTest.do" method="post" class="d-inline">
								<input type="hidden" name="num" value="${examPlan.num}" /> <input
									type="hidden" name="e_status" value="출제중" />
								<button type="submit" name="action" value="approve"
									class="btn btn-primary btn-sm"
									<c:if test="${examPlan.e_status == '반려'}">disabled</c:if>>정답</button>
							</form> 
							
							
							
							<!-- 댓글 버튼 -->
							<div class="btn-group">
								<button class="btn btn-secondary btn-sm dropdown-toggle"
									type="button" data-bs-toggle="dropdown" aria-expanded="false">댓글</button>
								<ul class="dropdown-menu">
									<li><a class="dropdown-item" href="#">댓글</a></li>
									<li><a class="dropdown-item" href="#">Another action</a></li>
									<li><a class="dropdown-item" href="#">Something else
											here</a></li>
								</ul>
							</div>
							
							
							
							<!-- 출처 -->
							<form action="createTest.do" method="post" class="d-inline">
								<input type="hidden" name="num" value="${examPlan.num}" /> <input
									type="hidden" name="e_status" value="출제중" />
								<button type="submit" name="action" value="approve"
									class="btn btn-primary btn-sm"
									<c:if test="${examPlan.e_status == '반려'}">disabled</c:if>>출처</button>
							</form> 
							
							
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
</body>
</html>