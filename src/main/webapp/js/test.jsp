<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="EUC-KR">
    <title>FAQ</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        h2 {
            color: #007bff;
        }
        .container {
            width: 80%;
            margin: 0 auto;
        }
        .search-bar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }
        .search-bar select, .search-bar input, .search-bar button {
            margin-right: 10px;
            padding: 5px;
        }
        .search-bar button {
            padding: 5px 10px;
            cursor: pointer;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 10px;
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
        .pagination a {
            margin: 0 5px;
            cursor: pointer;
            text-decoration: none;
            color: #007bff;
        }
        .pagination a:hover {
            text-decoration: underline;
        }
        .breadcrumb {
            margin-bottom: 10px;
        }
        .breadcrumb a {
            text-decoration: none;
            color: #007bff;
            margin-right: 5px;
        }
        .breadcrumb span {
            margin-right: 5px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="breadcrumb">
            <a href="#">Home</a>
            <span>&gt;</span>
            <a href="#">사용자지원</a>
            <span>&gt;</span>
            <span>FAQ</span>
        </div>
        <h2>FAQ</h2>
        <div class="search-bar">
            <div>
                <select>
                    <option value="10">10줄씩 보기</option>
                    <!-- 필요에 따라 다른 옵션 추가 -->
                </select>
                <select>
                    <option value="제목+내용">제목+내용</option>
                    <!-- 필요에 따라 다른 옵션 추가 -->
                </select>
            </div>
            <div>
                <input type="text" placeholder="검색어를 입력하세요">
                <button>조회</button>
            </div>
        </div>
        <table>
            <thead>
                <tr>
                    <th class="center">NO.</th>
                    <th>질문</th>
                    <th class="center">첨부</th>
                    <th class="center">작성자</th>
                    <th class="center">작성일</th>
                    <th class="center">조회수</th>
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
                    String query = "SELECT no, question, writer, date, views FROM faq LIMIT ?, ?";

                    int currentPage = 1;
                    int recordsPerPage = 10;
                    if(request.getParameter("page") != null)
                        currentPage = Integer.parseInt(request.getParameter("page"));

                    int start = (currentPage-1) * recordsPerPage;

                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        conn = DriverManager.getConnection(url, user, password);
                        pstmt = conn.prepareStatement(query);
                        pstmt.setInt(1, start);
                        pstmt.setInt(2, recordsPerPage);
                        rs = pstmt.executeQuery();

                        while(rs.next()) {
                            int no = rs.getInt("no");
                            String question = rs.getString("question");
                            String writer = rs.getString("writer");
                            String date = rs.getString("date");
                            int views = rs.getInt("views");
                %>
                <tr>
                    <td class="center"><%= no %></td>
                    <td><%= question %></td>
                    <td class="center">없음</td>
                    <td class="center"><%= writer %></td>
                    <td class="center"><%= date %></td>
                    <td class="center"><%= views %></td>
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
            <%
                int totalRecords = 0;
                int totalPages = 0;

                try {
                    conn = DriverManager.getConnection(url, user, password);
                    pstmt = conn.prepareStatement("SELECT COUNT(*) FROM faq");
                    rs = pstmt.executeQuery();
                    if(rs.next()) {
                        totalRecords = rs.getInt(1);
                    }
                    totalPages = (int) Math.ceil(totalRecords * 1.0 / recordsPerPage);
                } catch(Exception e) {
                    e.printStackTrace();
                } finally {
                    if(rs != null) try { rs.close(); } catch(SQLException e) {}
                    if(pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
                    if(conn != null) try { conn.close(); } catch(SQLException e) {}
                }

                for(int i = 1; i <= totalPages; i++) {
                    if(i == currentPage) {
            %>
                        <a href="FAQ.jsp?page=<%= i %>" style="font-weight: bold;"><%= i %></a>
            <%
                    } else {
            %>
                        <a href="FAQ.jsp?page=<%= i %>"><%= i %></a>
            <%
                    }
                }
            %>
        </div>
    </div>
</body>
</html>
