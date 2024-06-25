<%@ page contentType="text/html; charset=euc-kr" pageEncoding="euc-kr" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="euc-kr">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>출제기준</title>
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
	margin-right: 10px; /* 조회 버튼과의 간격 조정 */
}

/*  position: 옵션을 열었을 때 창의 크기가 변경되지 않도록 함 */
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

/* border : 표 테두리 색깔 지정 */
th, td {
	border: 1px solid gray;
	padding: 1px;
	text-align: center;
}

/* solid는 선 스타일을 의미, blue는 선 색상 */
th {
	border-top: 1.5px solid #95A4CE;
}

div.cell.selected {
	border: none !important;
}

.navbar {
	text-align: right;
}

/* home > 알림마당 > 출제기준 설정 부분 */
.navbar a {
	margin-left: 5px; /* 각 링크 사이의 간격을 조정합니다. */
	text-decoration: none;
	color: black;
}

/* span 태그의 요소 왼쪽 여백 지정 */
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
            <img src="./img/blue_01.png" width="15" height="15" alt="출제기준 아이콘"> 출제기준
        </div>
        <div class="navbar">
            <a href="#">Home</a> 
            <span>></span> 
            <a href="#">알림마당</a> 
            <span>></span> 
            <a href="#">출제기준</a>
        </div>
    </div>
    <hr>
    <br>
    <table>
        <tr>
            <th bgcolor="#EBEFF2">과목명</th>
            <th colspan="2">
                <div class="search-container">
                    <select id="courseName" name="courseName">
                        <option value="1상담철학과 상담윤리_2상담윤리">1상담철학과 윤리_2상담윤리</option>
                        <option value="1고급상담이론과 실제_2상담이론과 실제">1고급상담이론과 실제_2상담이론과 실제</option>
                        <option value="1집단상담 프로그램개발_2집단상담 이론과실제">1집단상담 프로그램개발_2집단상담 이론과실제</option>
                        <option value="1심리평가와 진단_2심리검사와 상담">1심리평가와 진단_2심리검사와 상담</option>
                        <option value="1고급상담연구방법론_2상담연구방법론">1고급상담연구방법론_2상담연구방법론</option>
                        <option value="1수퍼비전의 이론과 실제">1수퍼비전의 이론과 실제</option>
                        <option value="2진로상담">2진로상담</option>
                        <option value="2가족상담">2가족상담</option>
                    </select>
                    <button class="custom-button" onclick="fetchData()">
                        <i class="fas fa-search"></i> 조회
                    </button>
                </div>
            </th>
        </tr>
    </table>
    <br>
    <button class="custom-button" style="float: right;" onclick="exportTableToExcel('data-table', 'data')">엑셀저장</button>
    <br>
    <table id="data-table">
        <tr>
            <th class="bold" align="center" bgcolor="#EBEFF2" width="70">출제기준</th>
            <th class="bold" align="center" bgcolor="#EBEFF2">대분류명</th>
            <th class="bold" align="center" bgcolor="#EBEFF2">중분류명</th>
            <th class="bold" align="center" bgcolor="#EBEFF2">소분류명</th>
        </tr></table>
        <table>
        <tr>
            <th>출제기준</th>
            <th>대분류명</th>
            <th>중분류명</th>
            <th>소분류명</th>
        </tr>
        <% 
            Connection conn = null;
            Statement stmt = null;
            ResultSet rs = null;
            String url = "jdbc:oracle:thin:@localhost:1521:xe";
            String uid = "root";
            String pwd = "1234";
            String sql = "SELECT * FROM SUBJECT;"; // 실제 테이블명으로 변경 필요

            try {
                Class.forName("oracle.jdbc.driver.OracleDriver");
                conn = DriverManager.getConnection(url, uid, pwd);
                stmt = conn.createStatement();
                rs = stmt.executeQuery(sql);

                while (rs.next()) {
        %>
        <tr>
            <td><%=rs.getString(1)%></td> <!-- 출제기준 컬럼 -->
            <td><%=rs.getString(2)%></td> <!-- 대분류명 컬럼 -->
            <td><%=rs.getString(3)%></td> <!-- 중분류명 컬럼 -->
            <td><%=rs.getString(4)%></td> <!-- 소분류명 컬럼 -->
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
