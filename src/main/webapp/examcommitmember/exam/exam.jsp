<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
				<c:forEach var="test" items="${testList}">
					<tr>
						<td>${test.subject}</td>
						<td>${test.test_type}</td>
						<td>${test.status}</td>
						<td>${test.requestDate}</td>
						<td>${test.comRequestDate}</td>
						<td>${test.dateDifference}</td>
						<td>${test.curSituation}/3</td>
						<td><c:choose>
								<c:when test="${test.pledge == 1}">
									<button>보기</button>
								</c:when>
								<c:when test="${test.pledge == 0}">
								</c:when>
								<c:otherwise>
                                    잘못된 값
                                </c:otherwise>
							</c:choose></td>
						<td><c:choose>
								<c:when test="${test.reqLetter == 1}">
									<button>보기</button>
								</c:when>
								<c:when test="${test.reqLetter == 0}">
								</c:when>
								<c:otherwise>
                                    잘못된 값
                                </c:otherwise>
							</c:choose></td>
						<td><button>반려</button>
							<button>출제</button></td>
					</tr>
				</c:forEach>

			</tbody>
		</table>
	</div>
</body>
</html>