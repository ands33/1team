<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>QnA ���</title>
<style>
    table {
        width: 100%;
        border-collapse: collapse;
    }
    th, td {
        border: 1px solid #ddd;
        padding: 8px;
    }
    th {
        background-color: #f2f2f2;
        text-align: center;
    }
    td {
        text-align: center;
    }
    .search-container {
        margin-bottom: 20px;
    }
    .search-container label, .search-container select, .search-container input, .search-container button {
        margin-right: 10px;
    }
    .button-container {
        display: flex;
        justify-content: flex-end;
        margin-bottom: 10px;
    }
</style>
</head>
<body>

<h2>QnA ���</h2>

<div class="button-container">
    <button class="top-right-button" onclick="location.href='qnadetail.jsp'">�� ���� �ۼ�</button>
</div>

<form method="get" action="search.jsp" class="search-container">
    <select id="numItems" name="numItems">
        <option value="10">10�پ� ����</option>
        <!-- �ʿ��� �ٸ� �ɼ��� �߰��ϼ��� -->
    </select>
    <select id="searchType" name="searchType">
        <option value="title+content">����+����</option>
    </select>
    <input type="text" id="search" name="search">
    <button type="submit">��ȸ</button>
</form>

<table>
    <thead>
        <tr>
            <th>NO.</th>
            <th style="width: 400px;">����</th>
            <th>÷��</th>
            <th>�ۼ���</th>
            <th style="width: 150px;">�ۼ���</th>
            <th>��ȸ��</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="qna" items="${qnaList}">
            <tr>
                <td>${qna.no}</td>
                <td><a href="detail.jsp?id=${qna.id}">${qna.question}</a></td>
                <td>
                    <c:if test="${qna.attachment}">
                        <img src="attachment_icon.png" alt="÷��">
                    </c:if>
                </td>
                <td>${qna.author}</td>
                <td>${qna.date}</td>
                <td>${qna.views}</td>
            </tr>
        </c:forEach>
    </tbody>
</table>

<div class="pagination">
    <!-- ����¡ ó���� ���� ���� -->
</div>

</body>
</html>
