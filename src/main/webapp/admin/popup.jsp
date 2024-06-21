<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Member Info</title>
<style>
body {
    font-family: Arial, sans-serif;
    padding: 20px;
}

h2 {
    text-align: center;
}

select {
    width: 200px;
    height: 150px;
}
</style>
</head>
<body>

<h2>Member Info</h2>
<form action="${pageContext.request.contextPath}/updateSubjectMember.do" method="post">
    <div class="select-container">
        <select name="subject_code" multiple>
            <option value="11">�ɸ�ö�а� ����</option>
            <option value="12">��޻�� �̷а� ����</option>
            <option value="13">���ܻ�� ���α׷� ����</option>
            <option value="14">�ɸ��򰡿� ����</option>
            <option value="15">��� ��㿬�������</option>
            <option value="16">��㽴�ۺ����� �̷а� ����</option>
        </select>
    </div>
    <input type="hidden" name="member_id" value="${param.memberId}" />
    <button type="submit">Submit</button>
</form>

</body>
</html>
