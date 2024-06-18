<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>출제의뢰서</title>

<style>
body {
	font-family: Arial, sans-serif;
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-bottom: 20px;
}

th, td {
	border: 1px solid #ddd;
	padding: 8px;
	text-align: center;
}

th {
	background-color: #f2f2f2;
}

.section-title {
	font-weight: bold;
	margin-top: 20px;
	margin-bottom: 10px;
}

.btn-close {
	margin-top: 20px;
}
</style>
</head>
<body>

	<h2>출제의뢰서</h2>

	<div class="section">
		<table>
			<tr>
				<th>과목명</th>
				<th>문제타입</th>
				<th>위원명</th>
				<th>선정방식</th>
				<th>의뢰일</th>
				<th>완료요청일</th>
				<th>잔여기간</th>
				<th>현황</th>
				<th>상태</th>
			</tr>
			<tr>
				<td>${test.subject}</td>
				<td>${test.test_type}</td>
				<td>${test.e_name}</td>
				<td>${test.selMethod}</td>
				<td>${test.requestDate}</td>
				<td>${test.comRequestDate}</td>
				<td>${test.dateDifference}</td>
				<td>${test.curSituation}/3</td>
				<td>미제출</td>
			</tr>
		</table>
	</div>

	<div class="section">
		<div class="section-title">출제기준</div>
		<table>
			<tr>
				<th>출제기준</th>
				<th>대분류명</th>
				<th>중분류명</th>
				<th>소분류명</th>
				<th>난이도별 문제수</th>
			</tr>
			<tr>
				<td>1-1-1</td>
				<td>기능해부학의 기초</td>
				<td>1. 기능해부단위 개요</td>
				<td>1. 해부학적 자세와 방향</td>
				<td>
					<table>
						<tr>
							<td>상</td>
							<td>중</td>
							<td>하</td>
							<td>합계</td>
						</tr>
						<tr>
							<td>1</td>
							<td>0</td>
							<td>0</td>
							<td>1</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td>1-1-2</td>
				<td>기능해부단의 기초</td>
				<td>1. 기능해부단의 개요</td>
				<td>2. 인체의 면</td>
				<td>
					<table>
						<tr>
							<td>상</td>
							<td>중</td>
							<td>하</td>
							<td>합계</td>
						</tr>
						<tr>
							<td>0</td>
							<td>1</td>
							<td>0</td>
							<td>1</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td>1-1-3</td>
				<td>기능해부단의 기초</td>
				<td>1. 기능해부단의 개요</td>
				<td>3. 운동의 용어</td>
				<td>
					<table>
						<tr>
							<td>상</td>
							<td>중</td>
							<td>하</td>
							<td>합계</td>
						</tr>
						<tr>
							<td>1</td>
							<td>1</td>
							<td>1</td>
							<td>3</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		<div class="btn-close">
			<button onclick="window.close()">닫기</button>
		</div>
	</div>

</body>
</html>
