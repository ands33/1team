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
            <option value="11">심리철학과 윤리</option>
            <option value="12">고급상담 이론과 실제</option>
            <option value="13">집단상담 프로그램 개발</option>
            <option value="14">심리평가와 진단</option>
            <option value="15">고급 상담연구방법론</option>
            <option value="16">상담슈퍼비전의 이론과 실제</option>
        </select>
    </div>
    <input type="hidden" name="member_id" value="${param.memberId}" />
    <button type="submit">Submit</button>
</form>

</body>
</html>
