<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="EUC-KR">
    <title>�������޻���</title>
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

    <h2>�������޻���</h2>
    <div>
        <select>
            <option value="10">10�پ� ����</option>
            <!-- �ʿ信 ���� �ٸ� �ɼ� �߰� -->
        </select>
        <select>
            <option value="����+����">����+����</option>
            <!-- �ʿ信 ���� �ٸ� �ɼ� �߰� -->
        </select>
        <input type="text" placeholder="�˻�� �Է��ϼ���">
        <button>�˻�</button>
    </div>
    <table>
        <thead>
            <tr>
                <th class="center">NO.</th>
                <th>����</th>
                <th class="center">�ۼ���</th>
                <th class="center">�ۼ���</th>
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
