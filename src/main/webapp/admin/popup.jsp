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
    font-family: "Montserrat", "Noto Sans KR", sans-serif;
    padding: 20px;
}

option {
	font-size: 15px;
}


h2 {
    text-align: center;
    padding: 10px;
    font-family: "Montserrat", "Noto Sans KR", sans-serif;
}

select {
    width: 548px;
    height: 150px;
}

button {
	width: 80px;
	height: 40px;
	font-size: 15px;
	bold: auto;
}
</style>
<script>
function submitFormAndClose() {
    document.getElementById("memberForm").submit();
    
    window.opener.location.reload(); // 메인 창 새로고침
    window.close(); // 팝업 창 닫기
}
</script>
</head>
<body>

<h2>Member Info</h2>
<form id="memberForm" action="${pageContext.request.contextPath}/updateSubjectMember.do" method="post">
    <div class="select-container">
        <select name="subject_code" multiple>
            <c:choose>
                <c:when test="${param.statusIndex lt 12}">
                    <option value="11">심리철학과 윤리</option>
                    <option value="12">고급상담 이론과 실제</option>
                    <option value="13">집단상담 프로그램 개발</option>
                    <option value="14">심리평가와 진단</option>
                    <option value="15">고급 상담연구방법론</option>
                    <option value="16">상담슈퍼비전의 이론과 실제</option>
                </c:when>
                <c:otherwise>
                    <option value="24">상담윤리</option>
                    <option value="21">상담이론과 실제</option>
                    <option value="23">집단상담 이론과 실제</option>
                    <option value="22">심리검사와 상담</option>
                    <option value="25">상담연구방법론</option>
                    <option value="26">진로상담</option>
                    <option value="27">가족상담</option>
                </c:otherwise>
            </c:choose>
        </select>
    </div>
    <input type="hidden" name="member_id" value="${param.memberId}" />
    <button type="button" onclick="submitFormAndClose()">Submit</button>
</form>

</body>
</html>
