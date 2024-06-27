<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="icon" href="./img/favicon-32x32.png">
<title>위원정보</title>
<style>
body {
    font-family: "Montserrat", "Noto Sans KR", sans-serif;
    padding: 20px;
    font-size: 20px; /* 전체 글자 크기 확대 */
}

option {
    font-size: 23px; /* 옵션 글자 크기 확대 */
}

h2 {
    text-align: center;
    padding: 10px;
    font-family: "Montserrat", "Noto Sans KR", sans-serif;
    font-size: 24px; /* 헤더 글자 크기 확대 */
}

select {
    width: 548px;
    height: 150px;
    font-size: 23px; /* 선택 상자 글자 크기 확대 */
}

button {
    width: 80px;
    height: 40px;
    font-size: 20px; /* 버튼 글자 크기 확대 */
    font-weight: bold; /* 버튼 글자 굵게 */
}
</style>
<script>
function submitFormAndClose() {
    document.getElementById("memberForm").submit();
    setTimeout(function() {
        window.opener.location.reload(); // 메인 창 새로고침
        window.close(); // 팝업 창 닫기
    }, 1000); // 1초 후 창 닫기
}

/* 비동기 작업의 시간 차이:
	웹 브라우저에서 폼을 제출하는 작업은 비동기로 처리됩니다. 즉, 폼 제출 요청이 서버로 보내지고, 서버가 응답을 돌려주는 동안 자바스크립트는 다른 작업을 계속 수행할 수 있습니다. 폼을 제출하고 즉시 창을 닫아버리면, 브라우저가 폼 제출을 완료하기 전에 창을 닫게 되어 요청이 정상적으로 완료되지 않을 수 있습니다.

	서버 응답 대기 시간:
	서버가 폼 제출 요청을 처리하고 응답을 돌려주는 데 시간이 걸립니다. 이 시간을 고려하지 않고 창을 바로 닫아버리면, 폼 데이터가 서버에 전달되지 않거나 서버 응답이 제대로 처리되지 않을 수 있습니다.

	브라우저 새로고침 타이밍:
	폼 제출 후 창을 닫기 전에 부모 창(메인 창)을 새로고침하도록 설정했습니다. 이 과정에서 부모 창이 정상적으로 업데이트되려면 서버로부터 폼 제출 응답을 받은 후에 새로고침이 이루어져야 합니다. 즉, 부모 창이 새로고침 되기 전에 폼 제출이 완료되어야 하는데, 지연 시간이 없으면 이 순서가 어긋날 수 있습니다.
	 */
	 
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
    <button type="button" onclick="submitFormAndClose()">확인</button>
</form>

</body>
</html>
