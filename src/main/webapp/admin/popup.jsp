<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="icon" href="./img/favicon-32x32.png">
<title>��������</title>
<style>
body {
    font-family: "Montserrat", "Noto Sans KR", sans-serif;
    padding: 20px;
    font-size: 20px; /* ��ü ���� ũ�� Ȯ�� */
}

option {
    font-size: 23px; /* �ɼ� ���� ũ�� Ȯ�� */
}

h2 {
    text-align: center;
    padding: 10px;
    font-family: "Montserrat", "Noto Sans KR", sans-serif;
    font-size: 24px; /* ��� ���� ũ�� Ȯ�� */
}

select {
    width: 548px;
    height: 150px;
    font-size: 23px; /* ���� ���� ���� ũ�� Ȯ�� */
}

button {
    width: 80px;
    height: 40px;
    font-size: 20px; /* ��ư ���� ũ�� Ȯ�� */
    font-weight: bold; /* ��ư ���� ���� */
}
</style>
<script>
function submitFormAndClose() {
    document.getElementById("memberForm").submit();
    setTimeout(function() {
        window.opener.location.reload(); // ���� â ���ΰ�ħ
        window.close(); // �˾� â �ݱ�
    }, 1000); // 1�� �� â �ݱ�
}

/* �񵿱� �۾��� �ð� ����:
	�� ���������� ���� �����ϴ� �۾��� �񵿱�� ó���˴ϴ�. ��, �� ���� ��û�� ������ ��������, ������ ������ �����ִ� ���� �ڹٽ�ũ��Ʈ�� �ٸ� �۾��� ��� ������ �� �ֽ��ϴ�. ���� �����ϰ� ��� â�� �ݾƹ�����, �������� �� ������ �Ϸ��ϱ� ���� â�� �ݰ� �Ǿ� ��û�� ���������� �Ϸ���� ���� �� �ֽ��ϴ�.

	���� ���� ��� �ð�:
	������ �� ���� ��û�� ó���ϰ� ������ �����ִ� �� �ð��� �ɸ��ϴ�. �� �ð��� ������� �ʰ� â�� �ٷ� �ݾƹ�����, �� �����Ͱ� ������ ���޵��� �ʰų� ���� ������ ����� ó������ ���� �� �ֽ��ϴ�.

	������ ���ΰ�ħ Ÿ�̹�:
	�� ���� �� â�� �ݱ� ���� �θ� â(���� â)�� ���ΰ�ħ�ϵ��� �����߽��ϴ�. �� �������� �θ� â�� ���������� ������Ʈ�Ƿ��� �����κ��� �� ���� ������ ���� �Ŀ� ���ΰ�ħ�� �̷������ �մϴ�. ��, �θ� â�� ���ΰ�ħ �Ǳ� ���� �� ������ �Ϸ�Ǿ�� �ϴµ�, ���� �ð��� ������ �� ������ ��߳� �� �ֽ��ϴ�.
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
                    <option value="11">�ɸ�ö�а� ����</option>
                    <option value="12">��޻�� �̷а� ����</option>
                    <option value="13">���ܻ�� ���α׷� ����</option>
                    <option value="14">�ɸ��򰡿� ����</option>
                    <option value="15">��� ��㿬�������</option>
                    <option value="16">��㽴�ۺ����� �̷а� ����</option>
                </c:when>
                <c:otherwise>
                    <option value="24">�������</option>
                    <option value="21">����̷а� ����</option>
                    <option value="23">���ܻ�� �̷а� ����</option>
                    <option value="22">�ɸ��˻�� ���</option>
                    <option value="25">��㿬�������</option>
                    <option value="26">���λ��</option>
                    <option value="27">�������</option>
                </c:otherwise>
            </c:choose>
        </select>
    </div>
    <input type="hidden" name="member_id" value="${param.memberId}" />
    <button type="button" onclick="submitFormAndClose()">Ȯ��</button>
</form>

</body>
</html>
