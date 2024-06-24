<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ�� ���</title>
<style>
body, table, th, td, {
   font-family: "Montserrat", "Noto Sans KR", sans-serif;
   font-size: 15px;
   letter-spacing: -0.05em;
   line-height: 1.6em;
   list-style: none;
   color: #333;
}

h2 {
	text-align: center;
	padding: 10px;
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

.button-container {
	display: flex;
	justify-content: flex-end;
	margin-bottom: 20px;
}

.button-container button {
	margin-left: 10px;
	padding: 10px;
	box-sizing: border-box;
}
</style>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>
	<h2>ȸ�� ���</h2>
	<form method="post"
		action="${pageContext.request.contextPath}/updateMember.do">
		<table>
			<thead>
				<tr>
					<th>ID</th>
					<th>PW</th>
					<th>�̸�</th>
					<th>����</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="member" items="${memberList}" varStatus="status">
					<c:choose>
						<c:when test="${status.index <= 25 }">
							<tr>
								<td>${member.member_id}</td>
								<td><input type="text"
									name="members[${member.member_id}].pw" value="${member.pw}"
									required></td>
								<td><input type="text"
									name="members[${member.member_id}].member_name"
									value="${member.member_name}" required></td>
								<td><input type="text"
									name="members[${member.member_id}].member_type"
									value="${member.member_type}" required></td>
							</tr>
						</c:when>
					</c:choose>
				</c:forEach>
			</tbody>
		</table>
		<div class="button-container">
			<button type="submit">�ϰ� ����</button>
		</div>
	</form>
		<form action="${pageContext.request.contextPath}/IndexMemberList.do"
			method="get">
			<button type="submit">ȸ�����</button>
		</form>
</body>
</html>
