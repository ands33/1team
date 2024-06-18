<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="EUC-KR">
    <title>ȸ�� ���</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            padding: 20px;
        }
        h2 {
            text-align: center;
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
            padding: 10px;
            box-sizing: border-box;
        }
    </style>
</head>
<body>

<h2>ȸ�� ���</h2>

<form method="post" action="${pageContext.request.contextPath}/updateMember.do">
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
            <c:forEach var="member" items="${memberList}">
                <tr>
                    <td>${member.member_id}</td>
                    <td><input type="text" name="members[${member.member_id}].pw" value="${member.pw}" required></td>
                    <td><input type="text" name="members[${member.member_id}].member_name" value="${member.member_name}" required></td>
                    <td><input type="text" name="members[${member.member_id}].member_type" value="${member.member_type}" required></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <div class="button-container">
        <button type="submit">�ϰ� ����</button>
    </div>
</form>

</body>
</html>