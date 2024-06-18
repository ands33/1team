<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
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
        .input-container {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
        }
        .input-container input {
            width: 48%;
            padding: 10px;
            box-sizing: border-box;
        }
        .button-container {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
        }
        .button-container button {
            padding: 10px;
            box-sizing: border-box;
        }
    </style>
</head>
<body>

<h2>출제 문항 카드</h2>

<div class="button-container">
    <input type="text" placeholder="출제기간: 년 월 일 ~ 년 월 일">
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
    <tr>
        <td>1급</td>
        <td>1교시<br>[+과목추가]</td>
        <td>상담학개론</td>
        <td>[삭제]</td>
        <td>11</td>
        <td>certi11A</td>
        <td>certi11B</td>
        <td>○</td>
        <td>certi11C</td>
    </tr>
    <tr>
        <td></td>
        <td></td>
        <td>고급상담이론과 실제</td>
        <td>[삭제]</td>
        <td>12</td>
        <td>certi12A</td>
        <td>certi12B</td>
        <td>○</td>
        <td>certi12C</td>
    </tr>
    <tr>
        <td></td>
        <td></td>
        <td>진단상담 프로그램 개발</td>
        <td>[삭제]</td>
        <td>13</td>
        <td>certi13A</td>
        <td>certi13B</td>
        <td>○</td>
        <td>certi13C</td>
    </tr>
    <tr>
        <td></td>
        <td></td>
        <td>심리평가와 진단</td>
        <td>[삭제]</td>
        <td>14</td>
        <td>certi14A</td>
        <td>certi14B</td>
        <td>○</td>
        <td>certi14C</td>
    </tr>
    <tr>
        <td>1급</td>
        <td>2교시<br>[+과목추가]</td>
        <td>상담이론과 실제</td>
        <td>[삭제]</td>
        <td>21</td>
        <td>certi21A</td>
        <td>certi21B</td>
        <td>○</td>
        <td>certi21C</td>
    </tr>
    <tr>
        <td></td>
        <td></td>
        <td>진단상담 이론과 실제</td>
        <td>[삭제]</td>
        <td>22</td>
        <td>certi22A</td>
        <td>certi22B</td>
        <td>○</td>
        <td>certi22C</td>
    </tr>
    <tr>
        <td></td>
        <td></td>
        <td>가족상담</td>
        <td>[삭제]</td>
        <td>23</td>
        <td>certi23A</td>
        <td>certi23B</td>
        <td>○</td>
        <td>certi23C</td>
    </tr>
</table>

</body>
</html>
