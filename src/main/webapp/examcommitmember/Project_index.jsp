<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="EUC-KR">
    <title>출제 문항 카드</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            padding: 20px;
        }
        h2 {
            text-align: center;
        }
        .header-table, .main-table {
            width: 100%;
            border-collapse: collapse;
        }
        .header-table th, .header-table td, .main-table th, .main-table td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: center;
        }
        .header-table th, .main-table th {
            background-color: #f2f2f2;
        }
        .button-container {
            display: flex;
            align-items: center;
            justify-content: flex-end;
            margin-bottom: 20px;
        }
        .button-container input {
            width: 300px;
            margin-right: 10px;
            padding: 10px;
            box-sizing: border-box;
        }
        .button-container button,
        .button-container form {
            display: inline-block;
            margin-left: 10px;
        }
    </style>
</head>
<body>

<h2>출제 문항 카드</h2>

<div class="button-container">
    <input type="text" placeholder="출제기간: 년 월 일 ~ 년 월 일">
    <form action="${pageContext.request.contextPath}/getMemberList.do" method="get">
        <button type="submit">회원목록</button>
    </form>
    <button type="button" onclick="location.href='excel_export.jsp'">엑셀파일출력</button>
</div>

<table class="header-table">
    <tr>
        <th colspan="5">출제과목</th>
        <th colspan="3">사용계정 선택</th>
        <th>출제위원 정보</th>
    </tr>
    <tr>
        <th>급수</th>
        <th>교시</th>
        <th>과목명</th>
        <th>과목삭제</th>
        <th>과목코드</th>
        <th>ID</th>
        <th>PW</th>
        <th>A + B / A</th>
        <th>이름</th>
    </tr>
    <c:forEach var="member" items="${memberList}" varStatus="status">
        <tr>
            <td rowspan="12">1급</td>
            <td rowspan="6">1교시<br>[+과목추가]</td>
            <td>상담철학과 윤리</td>
            <td>[삭제]</td>
            <td>11</td>
            <td>${member.member_id}</td>
            <td>${member.pw}</td>
            <td>○</td>
            <td>${member.member_name}</td>
        </tr>
        <tr>
            <td></td>
            <td></td>
            <td></td>
            <td>${member.member_id}</td>
            <td>${member.pw}</td>
            <td>○</td>
            <td>${member.member_name}</td>
        </tr>
        <tr>
            <td>고급상담 이론과 실제</td>
            <td>[삭제]</td>
            <td>12</td>
            <td>${member.member_id}</td>
            <td>${member.pw}</td>
            <td>○</td>
            <td>${member.member_name}</td>
        </tr>
        <tr>
            <td></td>
            <td></td>
            <td></td>
            <td>${member.member_id}</td>
            <td>${member.pw}</td>
            <td>○</td>
            <td>${member.member_name}</td>
        </tr>
        <tr>
            <td>집단상담 프로그램 개발</td>
            <td>[삭제]</td>
            <td>13</td>
            <td>${member.member_id}</td>
            <td>${member.pw}</td>
            <td>○</td>
            <td>${member.member_name}</td>
        </tr>
        <tr>
            <td></td>
            <td></td>
            <td></td>
            <td>${member.member_id}</td>
            <td>${member.pw}</td>
            <td>○</td>
            <td>${member.member_name}</td>
        </tr>
        <tr>
            <td rowspan="6">2교시<br>[+과목추가]</td>
            <td>심리평가와 진단</td>
            <td>[삭제]</td>
            <td>21</td>
            <td>${member.member_id}</td>
            <td>${member.pw}</td>
            <td>○</td>
            <td>${member.member_name}</td>
        </tr>
        <tr>
            <td></td>
            <td></td>
            <td></td>
            <td>${member.member_id}</td>
            <td>${member.pw}</td>
            <td>○</td>
            <td>${member.member_name}</td>
        </tr>
        <tr>
            <td>고급 상담연구방법론</td>
            <td>[삭제]</td>
            <td>14</td>
            <td>${member.member_id}</td>
            <td>${member.pw}</td>
            <td>○</td>
            <td>${member.member_name}</td>
        </tr>
        <tr>
            <td></td>
            <td></td>
            <td></td>
            <td>${member.member_id}</td>
            <td>${member.pw}</td>
            <td>○</td>
            <td>${member.member_name}</td>
        </tr>
        <tr>
            <td>상담슈퍼비전의 이론과 실제</td>
            <td>[삭제]</td>
            <td>22</td>
            <td>${member.member_id}</td>
            <td>${member.pw}</td>
            <td>○</td>
            <td>${member.member_name}</td>
        </tr>
        <tr>
            <td></td>
            <td></td>
            <td></td>
            <td>${member.member_id}</td>
            <td>${member.pw}</td>
            <td>○</td>
            <td>${member.member_name}</td>
        </tr>

        <!-- 2급 데이터 -->
        <tr>
            <td rowspan="14">2급</td>
            <td rowspan="6">1교시<br>[+과목추가]</td>
            <td>상담윤리</td>
            <td>[삭제]</td>
            <td>11</td>
            <td>${member.member_id}</td>
            <td>${member.pw}</td>
            <td>○</td>
            <td>${member.member_name}</td>
        </tr>
        <tr>
            <td></td>
            <td></td>
            <td></td>
            <td>${member.member_id}</td>
            <td>${member.pw}</td>
            <td>○</td>
            <td>${member.member_name}</td>
        </tr>
        <tr>
            <td>상담이론과 실제</td>
            <td>[삭제]</td>
            <td>23</td>
            <td>${member.member_id}</td>
            <td>${member.pw}</td>
            <td>○</td>
            <td>${member.member_name}</td>
        </tr>
        <tr>
            <td></td>
            <td></td>
            <td></td>
            <td>${member.member_id}</td>
            <td>${member.pw}</td>
            <td>○</td>
            <td>${member.member_name}</td>
        </tr>
        <tr>
            <td>집단상담 이론과 실제</td>
            <td>[삭제]</td>
            <td>12</td>
            <td>${member.member_id}</td>
            <td>${member.pw}</td>
            <td>○</td>
            <td>${member.member_name}</td>
        </tr>
        <tr>
            <td></td>
            <td></td>
            <td></td>
            <td>${member.member_id}</td>
            <td>${member.pw}</td>
            <td>○</td>
            <td>${member.member_name}</td>
        </tr>
        <tr>
            <td rowspan="8">2교시<br>[+과목추가]</td>
            <td>심리검사와 상담</td>
            <td>[삭제]</td>
            <td>21</td>
            <td>${member.member_id}</td>
            <td>${member.pw}</td>
            <td>○</td>
            <td>${member.member_name}</td>
        </tr>
        <tr>
            <td></td>
            <td></td>
            <td></td>
            <td>${member.member_id}</td>
            <td>${member.pw}</td>
            <td>○</td>
            <td>${member.member_name}</td>
        </tr>
        <tr>
            <td>상담연구방법론</td>
            <td>[삭제]</td>
            <td>22</td>
            <td>${member.member_id}</td>
            <td>${member.pw}</td>
            <td>○</td>
            <td>${member.member_name}</td>
        </tr>
        <tr>
            <td></td>
            <td></td>
            <td></td>
            <td>${member.member_id}</td>
            <td>${member.pw}</td>
            <td>○</td>
            <td>${member.member_name}</td>
        </tr>
        <tr>
            <td>진로상담</td>
            <td>[삭제]</td>
            <td>23</td>
            <td>${member.member_id}</td>
            <td>${member.pw}</td>
            <td>○</td>
            <td>${member.member_name}</td>
        </tr>
        <tr>
            <td></td>
            <td></td>
            <td></td>
            <td>${member.member_id}</td>
            <td>${member.pw}</td>
            <td>○</td>
            <td>${member.member_name}</td>
        </tr>
        <tr>
            <td>가족상담</td>
            <td>[삭제]</td>
            <td>23</td>
            <td>${member.member_id}</td>
            <td>${member.pw}</td>
            <td>○</td>
            <td>${member.member_name}</td>
        </tr>
        <tr>
            <td></td>
            <td></td>
            <td></td>
            <td>${member.member_id}</td>
            <td>${member.pw}</td>
            <td>○</td>
            <td>${member.member_name}</td>
        </tr>
    </c:forEach>
</table>

</body>
</html>
