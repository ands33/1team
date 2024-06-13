<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>출제의뢰 목록</title>
<style>
table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
}

th, td {
	border: 1px solid #ddd;
	padding: 8px;
	text-align: center;
}

th {
	background-color: #f2f2f2;
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
<%@ include file="../header.jsp"%>
<body>
	<div class="container">
		<div class="header">
			<h3>출제</h3>
			<h4>출제의뢰 목록</h4>
		</div>
		<table>
			<thead>
				<tr align="center">
					<th>과목명</th>
					<th>문제타입</th>
					<th>상태</th>
					<th>의뢰일</th>
					<th>완료요청일</th>
					<th>잔여기간</th>
					<th>현황</th>
					<th>서약서</th>
					<th>의뢰서</th>
					<th>반려/출제</th>
				</tr>
			</thead>
			<tbody>
					<tr>
						<td>기능해부학</td>
						<td>객관-4지선다</td>
						<td>미개봉</td>
						<td>2015-01-27</td>
						<td>2015-02-03</td>
						<td>7</td>
						<td>0/3</td>
						<td><button>보기</button></td>
						<td><button>보기</button></td>
						<td><button>반려</button>
							<button>출제</button></td>
					</tr>
					
					
			</tbody>
		</table>
	</div>
</body>
</html>