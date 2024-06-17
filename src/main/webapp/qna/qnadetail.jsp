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
    .form-container label, .form-container input, .form-container textarea {
        display: block;
        margin-bottom: 10px;
    }
    .form-container input[type="text"], .form-container textarea {
        width: 100%;
    }
    .form-container textarea {
        height: 200px;
    }
    .button-container {
        text-align: right;
        margin-top: 10px;
    }
    .button-container form {
        display: inline;
    }
    .button-container button {
        margin-left: 5px;
    }
</style>
</head>
<body>

<h2>${qna != null ? 'QnA 수정' : 'QnA 작성'}</h2>

<div class="form-container">
    <c:choose>
        <c:when test="${qna != null}">
            <form method="post" action="${pageContext.request.contextPath}/updateQna.do" enctype="multipart/form-data">
                <input type="hidden" name="seq_number" value="${qna.seq_number}">
        </c:when>
        <c:otherwise>
            <form method="post" action="${pageContext.request.contextPath}/insertQna.do" enctype="multipart/form-data">
        </c:otherwise>
    </c:choose>
        <table>
            <tr>
                <th>작성자</th>
                <td><input type="text" id="member_id" name="member_id" value="${qna != null ? qna.member_id : ''}" required></td>
            </tr>
            <tr>
                <th>제목</th>
                <td><input type="text" id="title" name="title" value="${qna != null ? qna.title : ''}" required></td>
            </tr>
            <tr>
                <th>질문</th>
                <td><textarea name="q" required>${qna != null ? qna.q : ''}</textarea></td>
            </tr>
            <tr>
                <th>첨부</th>
                <td><input type="file" id="file_data" name="file_data"></td>
            </tr>
        </table>
        <div class="button-container">
            <button type="submit">${qna != null ? '수정' : '제출'}</button>
            </form>
            <form action="${pageContext.request.contextPath}/getQnaList.do" method="get">
                <button type="submit">취소</button>
            </form>
            <c:if test="${qna != null}">
                <form action="${pageContext.request.contextPath}/deleteQna.do" method="post">
                    <input type="hidden" name="seq_number" value="${qna.seq_number}">
                    <button type="submit">삭제</button>
                </form>
            </c:if>
        </div>
</div>

</body>
</html>
