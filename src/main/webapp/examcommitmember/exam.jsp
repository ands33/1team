<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>출제</title>
<style>
/* Common Styles */
body, table, th, td, input, select, textarea, div, a, p, span, strong, b,
    i, ul, ol, li, button {
    font-family: "Montserrat", "Noto Sans KR", sans-serif;
    font-size: 15px;
    letter-spacing: -0.05em;
    line-height: 1.6em;
    list-style: none;
    color: #333;
}

th {
    white-space: nowrap; /* Prevent overflow */
    padding: 10px; /* Cell padding */
    font-weight: bold; /* Bold font */
    font-size: 14px; /* Font size */
}

th, td {
    border: 1px solid black; /* Table cell border */
    padding: 8px; /* Padding */
    text-align: left; /* Left-align text */
}

/* Navbar Styles */
.navbar {
    border-top: 1px solid #D8D9DA;
    border-bottom: 3px solid #F5F5F5;
    width: 100%;
    height: 50px;
    justify-content: center;
    position: relative;
    font-weight: bold;
    font-size: 14px;
}

.navbar-nav {
    display: flex;
    justify-content: center;
    align-items: center;
    width: 100%;
    padding: 0;
    margin: 0;
    list-style: none;
}

.nav-item {
    position: relative;
}

.nav-link {
    text-decoration: none;
    color: black;
    padding: 10px 20px;
    display: block;
    position: relative;
}

.navbar-nav .nav-link:hover {
    color: #DB402E;
}

/* Navbar link underline effect */
.navbar-nav .nav-link::after {
    content: ''; /* Content for underline */
    display: block; /* Block level element */
    width: 0; /* Initially hidden */
    height: 2px; /* Underline height */
    background: #DB402E; /* Underline color */
    position: absolute; /* Absolute positioning */
    left: 0; /* Left position */
    bottom: -9.5px; /* Adjust underline position */
    opacity: 0; /* Initially hidden */
}

.navbar-nav .nav-link:hover::after {
    width: 100%; /* Expand underline on hover */
    opacity: 1; /* Show underline */
}

.header-links a {
    text-decoration: none;
    color: black;
}

.header-links a:hover {
    color: #D8402A;
}
</style>
</head>
<body>
<%@ include file="header.jsp"%>
    
    <div class="container mt-4">
        <div class="header"></div>
        <br>
        <table class="table table-bordered">
            <thead class="table-light">
                <tr align="center">
                    <th>번호</th>
                    <th>분류코드</th>
                    <th>출제 과목</th>
                    <th>대분류</th>
                    <th>중분류</th>
                    <th>소분류</th>
                    <th>난이도</th>
                    <th>출제위원</th>
                    <th>유형</th>
                    <th>상태</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="examPlan" items="${examPlanList}">
                    <tr>
                        <td>${examPlan.num}</td>
                        <td>${examPlan.categoryNumbers}</td>
                        <td>${examPlan.name}</td>
                        <td>${examPlan.category1}</td>
                        <td>${examPlan.category2}</td>
                        <td>${examPlan.category3}</td>
                        <td>${examPlan.diff}</td>
                        <td>${examPlan.member_name}</td>
                        <td>${examPlan.e_status}</td>
                        <td>
                            <form action="createTest.do" method="post">
                                <input type="hidden" name="num" value="${examPlan.num}" /> <input
                                    type="hidden" name="e_status" value="출제중" />
                                <button type="submit" name="action" value="approve"
                                    <c:if test="${examPlan.e_status == '제출(검토대기)'}">disabled</c:if>>출제</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
