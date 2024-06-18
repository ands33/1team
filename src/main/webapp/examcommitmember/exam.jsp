<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�����Ƿ� ���</title>
<script>
	function open2() {
		window.open("../../../biz/getTestList.do", "_blank", "width=1000, height=500");
	}
</script>
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
<%@ include file="header.jsp"%>
<body>
	<div class="container">
		<div class="header">
			<h3>����</h3>
			<h4>�����Ƿ� ���</h4>
		</div>
		<table>
			<thead>
				<tr align="center">
					<th>�Ƿ� ��ȣ</th>
					<th>�з� �ڵ�</th>
					<th>���� ����</th>
					<th>��з�</th>
					<th>�ߺз�</th>
					<th>�Һз�</th>
					<th>���̵�</th>
					<th>��� ����</th>
					<th>��Ȳ</th>
					<th>�ݷ�/����</th>
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
						<td>${examPlan.status}</td>
						<td><button>�ݷ�</button>
							<button>����</button></td>
					</tr>
				</c:forEach>

			</tbody>
		</table>
	</div>

</body>
</html>