<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� ���� ī��</title>
<style>
body {
	font-family: Arial, sans-serif;
	padding: 20px;
}

h2 {
	text-align: center;
}

.header-table, .main-table {
	width: 100%;
	border-collapse: collapse;
}

.header-table th, .header-table td, .main-table th, .main-table td {
	border: 1px solid #ddd;
	padding: 8px;
	text-align: center;
}

.header-table th, .main-table th {
	background-color: #f2f2f2;
}

.button-container {
	display: flex;
	align-items: center;
	justify-content: flex-end;
	margin-bottom: 20px;
}

.button-container input {
	width: 300px;
	margin-right: 10px;
	padding: 10px;
	box-sizing: border-box;
}

.button-container button, .button-container form {
	display: inline-block;
	margin-left: 10px;
}

.select-container {
	display: flex;
	flex-direction: column;
	align-items: center;
}

select {
	width: 190px;
	height: 100px;
	margin-bottom: 10px;
}

button {
	width: 60px;
	height: 30px;
}

</style>
<script>
function openSubjectPopup(rowIdx) {
    var popup = window.open("openSubjectPopup.do?rowIdx=" + rowIdx, "subjectPopup", "width=400,height=400");
}

function setSubjects(rowIdx, subjects, subjectCodes) {
    for (var i = 0; i < subjects.length; i++) {
        document.getElementById("subjectName" + rowIdx + "_" + i).innerText = subjects[i] || '';
        document.getElementById("subjectCode" + rowIdx + "_" + i).innerText = subjectCodes[i] || '';
    }
}
</script>
</head>
<body>

	<h2>���� ���� ī��</h2>

	<div class="button-container">
		<input type="text" placeholder="�����Ⱓ: �� �� �� ~ �� �� ��">
		<form action="${pageContext.request.contextPath}/getMemberList.do"
			method="get">
			<button type="submit">ȸ�����</button>
		</form>
		<button type="button" onclick="location.href='excel_export.jsp'">�����������</button>
	</div>

	<table class="header-table">
		<tr>
			<th colspan="5">��������</th>
			<th colspan="3">������ ����</th>
			<th>�������� ����</th>
		</tr>
		<tr>
			<th>�޼�</th>
			<th>����</th>
			<th>�����</th>
			<th>�������</th>
			<th>�����ڵ�</th>
			<th>ID</th>
			<th>PW</th>
			<th>A + B / A</th>
			<th>�̸�</th>
		</tr>
		 <c:forEach var="member" items="${memberList}" varStatus="status">
            <c:choose>
                <c:when test="${status.index == 0}">
                    <tr>
                        <td rowspan="12">1��</td>            
                        <td rowspan="6">
                            1����<br> 
                            <button type="button" onclick="openSubjectPopup(${status.index});">�����߰�+</button>
                        </td>
                        <td id="subjectName${status.index}_0">
                            <c:out value="${subjectData[member.member_id].subjectName}" />
                        </td>
                        <td>[����]</td>
                        <td id="subjectCode${status.index}_0">
                            <c:out value="${subjectData[member.member_id].subjectCode}" />
                        </td>
                        <td>${member.member_id}</td>
                        <td>${member.pw}</td>
                        <td>${member.member_type}</td>
                        <td>${member.member_name}</td>
                    </tr>
                </c:when>
                <c:when test="${status.index == 1}">
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td>${member.member_id}</td>
                        <td>${member.pw}</td>
                        <td>${member.member_type}</td>
                        <td>${member.member_name}</td>
                    </tr>
                </c:when>
                <c:when test="${status.index == 2}">
                    <tr>
                        <td id="subjectName${status.index}_1">
                            <c:out value="${subjectData[member.member_id].subjectName}" />
                        </td>
                        <td>[����]</td>
                        <td id="subjectCode${status.index}_1">
                            <c:out value="${subjectData[member.member_id].subjectCode}" />
                        </td>
                        <td>${member.member_id}</td>
                        <td>${member.pw}</td>
                        <td>${member.member_type}</td>
                        <td>${member.member_name}</td>
                    </tr>
                </c:when>
                <c:when test="${status.index == 3}">
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td>${member.member_id}</td>
                        <td>${member.pw}</td>
                        <td>${member.member_type}</td>
                        <td>${member.member_name}</td>
                    </tr>
                </c:when>
                <c:when test="${status.index == 4}">
                    <tr>
                        <td>
                            <c:out value="${subjectData[member.member_id].subjectName}" />
                        </td>
                        <td>[����]</td>
                        <td>
                            <c:out value="${subjectData[member.member_id].subjectCode}" />
                        </td>
                        <td>${member.member_id}</td>
                        <td>${member.pw}</td>
                        <td>${member.member_type}</td>
                        <td>${member.member_name}</td>
                    </tr>
                </c:when>
                <c:when test="${status.index == 5}">
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td>${member.member_id}</td>
                        <td>${member.pw}</td>
                        <td>${member.member_type}</td>
                        <td>${member.member_name}</td>
                    </tr>
                </c:when>
                <c:when test="${status.index == 6}">
                    <tr>         
                        <td rowspan="6">
                            2����<br> 
                            <button type="button" onclick="openSubjectPopup(${status.index});">�����߰�+</button>
                        </td>
                        <td id="subjectName${status.index}_0">
                            <c:out value="${subjectData[member.member_id].subjectName}" />
                        </td>
                        <td>[����]</td>
                        <td id="subjectCode${status.index}_0">
                            <c:out value="${subjectData[member.member_id].subjectCode}" />
                        </td>
                        <td>${member.member_id}</td>
                        <td>${member.pw}</td>
                        <td>${member.member_type}</td>
                        <td>${member.member_name}</td>
                    </tr>
                </c:when>
                <c:when test="${status.index == 7}">
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td>${member.member_id}</td>
                        <td>${member.pw}</td>
                        <td>${member.member_type}</td>
                        <td>${member.member_name}</td>
                    </tr>
                </c:when>
                <c:when test="${status.index == 8}">
                    <tr>
                        <td>
                            <c:out value="${subjectData[member.member_id].subjectName}" />
                        </td>
                        <td>[����]</td>
                        <td>
                            <c:out value="${subjectData[member.member_id].subjectCode}" />
                        </td>
                        <td>${member.member_id}</td>
                        <td>${member.pw}</td>
                        <td>${member.member_type}</td>
                        <td>${member.member_name}</td>
                    </tr>
                </c:when>
                <c:when test="${status.index == 9}">
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td>${member.member_id}</td>
                        <td>${member.pw}</td>
                        <td>${member.member_type}</td>
                        <td>${member.member_name}</td>
                    </tr>
                </c:when>
                <c:when test="${status.index == 10}">
                    <tr>
                        <td>
                            <c:out value="${subjectData[member.member_id].subjectName}" />
                        </td>
                        <td>[����]</td>
                        <td>
                            <c:out value="${subjectData[member.member_id].subjectCode}" />
                        </td>
                        <td>${member.member_id}</td>
                        <td>${member.pw}</td>
                        <td>${member.member_type}</td>
                        <td>${member.member_name}</td>
                    </tr>
                </c:when>
                <c:when test="${status.index == 11}">
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td>${member.member_id}</td>
                        <td>${member.pw}</td>
                        <td>${member.member_type}</td>
                        <td>${member.member_name}</td>
                    </tr>
                </c:when>
                <c:when test="${status.index == 12}">
                    <tr>
                         <td rowspan="14">2��</td>            
                        <td rowspan="6">
                            1����<br> 
                            <button type="button" onclick="openSubjectPopup(${status.index});">�����߰�+</button>
                        </td>
                        <td id="subjectName${status.index}_0">
                            <c:out value="${subjectData[member.member_id].subjectName}" />
                        </td>
                        <td>[����]</td>
                        <td id="subjectCode${status.index}_0">
                            <c:out value="${subjectData[member.member_id].subjectCode}" />
                        </td>
                        <td>${member.member_id}</td>
                        <td>${member.pw}</td>
                        <td>${member.member_type}</td>
                        <td>${member.member_name}</td>
                    </tr>
                </c:when>
                <c:when test="${status.index == 13}">
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td>${member.member_id}</td>
                        <td>${member.pw}</td>
                        <td>${member.member_type}</td>
                        <td>${member.member_name}</td>
                    </tr>
                </c:when>
                <c:when test="${status.index == 14}">
                    <tr>
                        <td>
                            <c:out value="${subjectData[member.member_id].subjectName}" />
                        </td>
                        <td>[����]</td>
                        <td>
                            <c:out value="${subjectData[member.member_id].subjectCode}" />
                        </td>
                        <td>${member.member_id}</td>
                        <td>${member.pw}</td>
                        <td>${member.member_type}</td>
                        <td>${member.member_name}</td>
                    </tr>
                </c:when>
                <c:when test="${status.index == 15}">
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td>${member.member_id}</td>
                        <td>${member.pw}</td>
                        <td>${member.member_type}</td>
                        <td>${member.member_name}</td>
                    </tr>
                </c:when>
                <c:when test="${status.index == 16}">
                    <tr>
                        <td>
                            <c:out value="${subjectData[member.member_id].subjectName}" />
                        </td>
                        <td>[����]</td>
                        <td>
                            <c:out value="${subjectData[member.member_id].subjectCode}" />
                        </td>
                        <td>${member.member_id}</td>
                        <td>${member.pw}</td>
                        <td>${member.member_type}</td>
                        <td>${member.member_name}</td>
                    </tr>
                </c:when>
                <c:when test="${status.index == 17}">
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td>${member.member_id}</td>
                        <td>${member.pw}</td>
                        <td>${member.member_type}</td>
                        <td>${member.member_name}</td>
                    </tr>
                </c:when>
                <c:when test="${status.index == 18}">
                    <tr>          
                        <td rowspan="8">
                            2����<br> 
                            <button type="button" onclick="openSubjectPopup(${status.index});">�����߰�+</button>
                        </td>
                        <td id="subjectName${status.index}_0">
                            <c:out value="${subjectData[member.member_id].subjectName}" />
                        </td>
                        <td>[����]</td>
                        <td id="subjectCode${status.index}_0">
                            <c:out value="${subjectData[member.member_id].subjectCode}" />
                        </td>
                        <td>${member.member_id}</td>
                        <td>${member.pw}</td>
                        <td>${member.member_type}</td>
                        <td>${member.member_name}</td>
                    </tr>
                </c:when>
                <c:when test="${status.index == 19}">
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td>${member.member_id}</td>
                        <td>${member.pw}</td>
                        <td>${member.member_type}</td>
                        <td>${member.member_name}</td>
                    </tr>
                </c:when>
                <c:when test="${status.index == 20}">
                    <tr>
                        <td>
                            <c:out value="${subjectData[member.member_id].subjectName}" />
                        </td>
                        <td>[����]</td>
                        <td>
                            <c:out value="${subjectData[member.member_id].subjectCode}" />
                        </td>
                        <td>${member.member_id}</td>
                        <td>${member.pw}</td>
                        <td>${member.member_type}</td>
                        <td>${member.member_name}</td>
                    </tr>
                </c:when>
                <c:when test="${status.index == 21}">
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td>${member.member_id}</td>
                        <td>${member.pw}</td>
                        <td>${member.member_type}</td>
                        <td>${member.member_name}</td>
                    </tr>
                </c:when>
                <c:when test="${status.index == 22}">
                    <tr>
                        <td>
                            <c:out value="${subjectData[member.member_id].subjectName}" />
                        </td>
                        <td>[����]</td>
                        <td>
                            <c:out value="${subjectData[member.member_id].subjectCode}" />
                        </td>
                        <td>${member.member_id}</td>
                        <td>${member.pw}</td>
                        <td>${member.member_type}</td>
                        <td>${member.member_name}</td>
                    </tr>
                </c:when>
                <c:when test="${status.index == 23}">
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td>${member.member_id}</td>
                        <td>${member.pw}</td>
                        <td>${member.member_type}</td>
                        <td>${member.member_name}</td>
                    </tr>
                </c:when>
                <c:when test="${status.index == 24}">
                    <tr>
                        <td>
                            <c:out value="${subjectData[member.member_id].subjectName}" />
                        </td>
                        <td>[����]</td>
                        <td>
                            <c:out value="${subjectData[member.member_id].subjectCode}" />
                        </td>
                        <td>${member.member_id}</td>
                        <td>${member.pw}</td>
                        <td>${member.member_type}</td>
                        <td>${member.member_name}</td>
                    </tr>
                </c:when>
                <c:when test="${status.index == 25}">
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td>${member.member_id}</td>
                        <td>${member.pw}</td>
                        <td>${member.member_type}</td>
                        <td>${member.member_name}</td>
                    </tr>
                </c:when>
            </c:choose>
        </c:forEach>
    </table>

</body>
</html>

