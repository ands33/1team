<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�����Ƿ� ���</title>
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
			<h3>����</h3>
			<h4>�����Ƿ� ���</h4>
		</div>
		<table>
			<thead>
				<tr align="center">
					<th>�����</th>
					<th>����Ÿ��</th>
					<th>����</th>
					<th>�Ƿ���</th>
					<th>�Ϸ��û��</th>
					<th>�ܿ��Ⱓ</th>
					<th>��Ȳ</th>
					<th>���༭</th>
					<th>�Ƿڼ�</th>
					<th>�ݷ�/����</th>
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
									<button>����</button>
								</c:when>
								<c:when test="${test.pledge == 0}">
								</c:when>
								<c:otherwise>
                                    �߸��� ��
                                </c:otherwise>
							</c:choose></td>
						<td><c:choose>
								<c:when test="${test.reqLetter == 1}">
									<button>����</button>
								</c:when>
								<c:when test="${test.reqLetter == 0}">
								</c:when>
								<c:otherwise>
                                    �߸��� ��
                                </c:otherwise>
							</c:choose></td>
						<td><button>�ݷ�</button>
							<button>����</button></td>
					</tr>
				</c:forEach>

			</tbody>
		</table>
	</div>
</body>
</html>