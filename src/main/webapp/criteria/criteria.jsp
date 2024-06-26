<%@ page contentType="text/html; charset=euc-kr" pageEncoding="euc-kr" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="euc-kr">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>��������</title>
    <style>
    .search-container {
	display: flex;
	align-items: center;
	margin-bottom: 5px;
}

.search-container label {
	margin-right: 10px;
}

.search-container select {
	margin-right: 1px;
}

.search-container button {
	margin-left: 4px;
	cursor: pointer;
}

.custom-button {
	background-color: #F6F6F6;
	padding: 4px 17x
	cursor: pointer;
}

.custon-button:hover {
	background-color: #E0E0E0;
}

.dropdown {
	position: relative;
	display: inline-block;
	margin-right: 10px; /* ��ȸ ��ư���� ���� ���� */
}

/*  position: �ɼ��� ������ �� â�� ũ�Ⱑ ������� �ʵ��� �� */
.dropdown-content {
	display: none;
	position: absolute;
	background-color: #f9f9f9;
	min-width: 160px;
}

.dropdown-content a {
	color: black;
	padding: 10px 10px;
	text-decoration: none;
	display: block;
}

.dropdown:hover .dropdown-content {
	display: block;
}

.bold {
	font-weight: bold;
}

body {
	font-family: 'Malgun gothic', sans-serif;
}

table {
	width: 100%;
	height: 100%;
	border-collapse: collapse;
	font-size: 14px;
}

/* border : ǥ �׵θ� ���� ���� */
th, td {
	border: 1px solid gray;
	padding: 1px;
	text-align: center;
}

/* solid�� �� ��Ÿ���� �ǹ�, blue�� �� ���� */
th {
	border-top: 1.5px solid #95A4CE;
}

div.cell.selected {
	border: none !important;
}

.navbar {
	text-align: right;
}

/* home > �˸����� > �������� ���� �κ� */
.navbar a {
	margin-left: 5px; /* �� ��ũ ������ ������ �����մϴ�. */
	text-decoration: none;
	color: black;
}

/* span �±��� ��� ���� ���� ���� */
.navbar span {
	margin-left: 5px;
}

.header-container {
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.header-left {
	display: flex;
	align-items: center;
}

.header-left img {
	margin-right: 5px;
}
    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="criteria.css">
</head>
<body>
    <div class="header-container">
        <div class="header-left">
            <img src="./img/blue_01.png" width="15" height="15" alt="�������� ������"> ��������
        </div>
        <div class="navbar">
            <a href="#">Home</a> 
            <span>></span> 
            <a href="#">�˸�����</a> 
            <span>></span> 
            <a href="#">��������</a>
        </div>
    </div>
    <hr>
    <br>
    <table>
        <tr>
            <th bgcolor="#EBEFF2">�����</th>
            <th colspan="2">
                <div class="search-container">
                    <select id="courseName" name="courseName">
                        <option value="1���ö�а� �������_2�������">1���ö�а� ����_2�������</option>
                        <option value="1���޻���̷а� ����_2����̷а� ����">1���޻���̷а� ����_2����̷а� ����</option>
                        <option value="1���ܻ�� ���α׷�����_2���ܻ�� �̷а�����">1���ܻ�� ���α׷�����_2���ܻ�� �̷а�����</option>
                        <option value="1�ɸ��򰡿� ����_2�ɸ��˻�� ���">1�ɸ��򰡿� ����_2�ɸ��˻�� ���</option>
                        <option value="1���޻�㿬�������_2��㿬�������">1���޻�㿬�������_2��㿬�������</option>
                        <option value="1���ۺ����� �̷а� ����">1���ۺ����� �̷а� ����</option>
                        <option value="2���λ��">2���λ��</option>
                        <option value="2�������">2�������</option>
                    </select>
                    <button class="custom-button" onclick="fetchData()">
                        <i class="fas fa-search"></i> ��ȸ
                    </button>
                </div>
            </th>
        </tr>
    </table>
    <br>
    <button class="custom-button" style="float: right;" onclick="exportTableToExcel('data-table', 'data')">��������</button>
    <br>
    <table id="data-table">
        <tr>
            <th class="bold" align="center" bgcolor="#EBEFF2" width="70">��������</th>
            <th class="bold" align="center" bgcolor="#EBEFF2">��з���</th>
            <th class="bold" align="center" bgcolor="#EBEFF2">�ߺз���</th>
            <th class="bold" align="center" bgcolor="#EBEFF2">�Һз���</th>
        </tr></table>
        <table>
        <tr>
            <th>��������</th>
            <th>��з���</th>
            <th>�ߺз���</th>
            <th>�Һз���</th>
        </tr>
        <% 
            Connection conn = null;
            Statement stmt = null;
            ResultSet rs = null;
            String url = "jdbc:oracle:thin:@localhost:1521:xe";
            String uid = "root";
            String pwd = "1234";
            String sql = "SELECT * FROM SUBJECT;"; // ���� ���̺������� ���� �ʿ�

            try {
                Class.forName("oracle.jdbc.driver.OracleDriver");
                conn = DriverManager.getConnection(url, uid, pwd);
                stmt = conn.createStatement();
                rs = stmt.executeQuery(sql);

                while (rs.next()) {
        %>
        <tr>
            <td><%=rs.getString(1)%></td> <!-- �������� �÷� -->
            <td><%=rs.getString(2)%></td> <!-- ��з��� �÷� -->
            <td><%=rs.getString(3)%></td> <!-- �ߺз��� �÷� -->
            <td><%=rs.getString(4)%></td> <!-- �Һз��� �÷� -->
        </tr>
        <% 
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                try {
                    if (rs != null) rs.close();
                    if (stmt != null) stmt.close();
                    if (conn != null) conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        %>
    </table>
    <script src="criteria.js"></script>
</body>
</html>