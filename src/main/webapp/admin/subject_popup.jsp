<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� ����</title>
<style>
body {
    font-family: Arial, sans-serif;
    padding: 20px;
}

button {
    width: 60px;
    height: 30px;
}
</style>
<script>
function limitSelection() {
    var checkboxes = document.querySelectorAll('input[name="subjects"]:checked');
    if (checkboxes.length > 3) {
        alert("�ִ� 3���� �׸� ������ �� �ֽ��ϴ�.");
        event.target.checked = false; // �������� Ŭ���� üũ�ڽ��� ����
        return false;
    }
    return true;
}

function submitSubjects(event) {
    event.preventDefault(); // �� ���� �⺻ ���� ����

    if (!limitSelection()) return;

    var checkboxes = document.querySelectorAll('input[name="subjects"]:checked');
    
    var subjects = [];
    var subjectCodes = [];

    for (var i = 0; i < checkboxes.length; i++) {
        subjects.push(checkboxes[i].dataset.subjectName);
        subjectCodes.push(checkboxes[i].value);
    }

    var rowIdx = document.getElementById("rowIdx").value;
    window.opener.setSubjects(rowIdx, subjects, subjectCodes);
    window.close();
}
</script>
</head>
<body>

<h2>���� ����</h2>

<form onsubmit="submitSubjects(event); return false;">
    <div>
        <c:forEach var="card" items="${rowIdx < 12 ? cardList1 : cardList2}">
            <label>
                <input type="checkbox" name="subjects" value="${card.subject_code}" data-subject-name="${card.subject_name}" onchange="limitSelection(event)">
                ${card.subject_name}
            </label>
            <br>
        </c:forEach>
    </div>
    <input type="hidden" id="rowIdx" value="${rowIdx}">
    <br>
    <button type="submit">Ȯ��</button>
</form>

</body>
</html>
