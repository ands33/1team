<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="EUC-KR">
    <title>위원전달사항</title>
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
        }
        tr:hover {
            background-color: #f1f1f1;
        }
        .center {
            text-align: center;
        }
        .pagination {
            text-align: center;
            margin-top: 20px;
        }
        .pagination span {
            margin: 0 5px;
            cursor: pointer;
        }
    </style>
</head>
<body>

    <h2>위원전달사항</h2>
    <div>
        <select>
            <option value="10">10줄씩 보기</option>
            <!-- 필요에 따라 다른 옵션 추가 -->
        </select>
        <select>
            <option value="제목+내용">제목+내용</option>
            <!-- 필요에 따라 다른 옵션 추가 -->
        </select>
        <input type="text" placeholder="검색어를 입력하세요">
        <button>검색</button>
    </div>
    <table>
        <thead>
            <tr>
                <th class="center">NO.</th>
                <th>제목</th>
                <th class="center">작성자</th>
                <th class="center">작성일</th>
            </tr>
        </thead>
        <tbody>
            <%
                Connection conn = null;
                PreparedStatement pstmt = null;
                ResultSet rs = null;

                String url = "jdbc:mysql://localhost:3306/yourdatabase";
                String user = "yourusername";
                String password = "yourpassword";
                String query = "SELECT no, title, writer, date FROM yourtable";

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection(url, user, password);
                    pstmt = conn.prepareStatement(query);
                    rs = pstmt.executeQuery();

                    while(rs.next()) {
                        int no = rs.getInt("no");
                        String title = rs.getString("title");
                        String writer = rs.getString("writer");
                        String date = rs.getString("date");
            %>
            <tr>
                <td class="center"><%= no %></td>
                <td><%= title %></td>
                <td class="center"><%= writer %></td>
                <td class="center"><%= date %></td>
            </tr>
            <%
                    }
                } catch(Exception e) {
                    e.printStackTrace();
                } finally {
                    if(rs != null) try { rs.close(); } catch(SQLException e) {}
                    if(pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
                    if(conn != null) try { conn.close(); } catch(SQLException e) {}
                }
            %>
        </tbody>
    </table>
    <div class="pagination">
        <span>&laquo;</span>
        <span>1</span>
        <span>2</span>
        <span>3</span>
        <span>&raquo;</span>
    </div>
</body>
</html>
