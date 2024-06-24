<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.util.List" %>
<%@ page import="kca.cbt.view.criteria.CriTeriaVO" %>
<!DOCTYPE html>
<html>
<head>
    <title>Criteria List</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        table, th, td {
            border: 1px solid black;
        }
        th, td {
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        .container {
            width: 80%;
            margin: 0 auto;
        }
        .header {
            margin-bottom: 20px;
        }
        .header h1 {
            display: inline-block;
        }
        .header .add-button {
            float: right;
        }
        .search-bar {
            margin-bottom: 20px;
        }
        .search-bar select, .search-bar input {
            padding: 5px;
            margin-right: 10px;
        }
        .pagination {
            text-align: center;
            margin-top: 20px;
        }
        .pagination a {
            margin: 0 5px;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>출제기준 등록 및 수정</h1>
            <button class="add-button" onclick="location.href='addCriTeria.jsp'">추가</button>
        </div>
        <div class="search-bar">
            <form action="criteria/list.do" method="get">
                <label for="subject">과목명:</label>
                <select name="subject" id="subject">
                    <option value="상담윤리" <%= "상담윤리".equals(request.getParameter("subject")) ? "selected" : "" %>>상담윤리</option>
                    <!-- 다른 과목명도 추가 가능 -->
                </select>
                <label for="category">대분류명:</label>
                <select name="category" id="category">
                    <option value="전체">전체</option>
                    <!-- 다른 대분류명도 추가 가능 -->
                </select>
                <button type="submit">검색</button>
            </form>
        </div>
        <table>
            <thead>
                <tr>
                    <th>출제기준</th>
                    <th>대분류명</th>
                    <th>중분류명</th>
                    <th>소분류명</th>
                    <th>사용여부</th>
                    <th>최종수정일자</th>
                    <th>수정자</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<CriTeriaVO> list = (List<CriTeriaVO>) request.getAttribute("criteriaList");
                    if (list != null) {
                        for (CriTeriaVO vo : list) {
                %>
                <tr>
                    <td><%= vo.getId() %></td>
                    <td><%= vo.getName() %></td>
                    <td><%= vo.getCategory1() %></td>
                    <td><%= vo.getCategory2() %></td>
                    <td><%= vo.getCategory3() %></td>
                    <td><%= vo.getGrade() %></td>
                </tr>
                <%
                        }
                    }
                %>
            </tbody>
        </table>
        <div class="pagination">
            <a href="#">&laquo;</a>
            <a href="#">1</a>
            <a href="#">2</a>
            <a href="#">3</a>
            <a href="#">4</a>
            <a href="#">5</a>
            <a href="#">&raquo;</a>
        </div>
    </div>
</body>
</html>
