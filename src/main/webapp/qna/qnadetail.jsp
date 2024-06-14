<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>QnA 작성</title>
<style>
    table {
        width: 100%;
        border-collapse: collapse;
        margin-bottom: 20px;
    }
    th, td {
        border: 1px solid #ddd;
        padding: 8px;
    }
    th {
        background-color: #f2f2f2;
        text-align: left;
        width: 150px;
    }
    td {
        text-align: left;
    }
    .form-container {
        margin-top: 20px;
    }
    .form-container label, .form-container input, .form-container textarea, .form-container button {
        display: block;
        margin-bottom: 10px;
    }
    .form-container input[type="text"], .form-container textarea {
        width: 100%;
    }
    .form-container textarea {
        height: 200px;
    }
</style>
</head>
<body>

<h2>QnA 작성</h2>

<div class="form-container">
    <form method="post" action="${pageContext.request.contextPath}/getQnaList.do" enctype="multipart/form-data">
        <table>
            <tr>
                <th>작성자</th>
                <td><input type="text" id="member_id" name="member_id" required></td>
            </tr>
            <tr>
                <th>제목</th>
                <td><input type="text" id="title" name="title" required></td>
            </tr>
            <tr>
                <th>질문</th>
                <td><textarea name="q" required></textarea></td>
            </tr>
            <tr>
                <th>첨부</th>
                <td><input type="file" id="file_data" name="file_data"></td>
            </tr>
        </table>
        <button type="submit">제출</button>
        <button type="button" onclick="history.back();">취소</button>
    </form>
</div>

</body>
</html>
