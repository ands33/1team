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
            <h1>�������� ��� �� ����</h1>
            <button class="add-button" onclick="location.href='addCriTeria.jsp'">�߰�</button>
        </div>
        <div class="search-bar">
            <form action="criteria/list.do" method="get">
                <label for="subject">�����:</label>
                <select name="subject" id="subject">
                    <option value="�������" <%= "�������".equals(request.getParameter("subject")) ? "selected" : "" %>>�������</option>
                    <!-- �ٸ� ����� �߰� ���� -->
                </select>
                <label for="category">��з���:</label>
                <select name="category" id="category">
                    <option value="��ü">��ü</option>
                    <!-- �ٸ� ��з��� �߰� ���� -->
                </select>
                <button type="submit">�˻�</button>
            </form>
        </div>
        <table>
            <thead>
                <tr>
                    <th>��������</th>
                    <th>��з���</th>
                    <th>�ߺз���</th>
                    <th>�Һз���</th>
                    <th>��뿩��</th>
                    <th>������������</th>
                    <th>������</th>
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
