<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="EUC-KR">
    <title>문항 카드 - 1급 고급상담이론과 실제</title>
    <style>
       bn{
            border: none; /* 테두리 제거 */
            padding: 8px;
        }
        body {
            font-family: Arial, sans-serif;
        }
        .container {
            width: 1000px;
            margin: auto;
            padding: 20px;
            border: 1px solid #000;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        th, td {
            border: 1px solid #000;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f4f4f4;
        }
        .title {
            text-align: center;
            font-weight: bold;
            background-color: #f4f4f4;
        }
        .subtitle {

           text-align: left;
            background-color: #f4f4f4;
            padding: 5px;
            border: 1px solid #ddd;
            margin-bottom: auto;
            width: 50%; /* 가로 너비를 50%로 설정 */
          margin-left: auto; /* 가운데 정렬을 위해 추가 */
          margin-right: auto; /* 가운데 정렬을 위해 추가 */
        }
        .answer {
            text-align: center;
            font-weight: bold;
        }
    </style>
</head>
<%@ include file="header.jsp"%>
<body>
<div class="container">
    <div class="details">
        <h2 class="title">한국상담학회 검정 시험문제</h2>
        <table>
        <tr>
           <td style="border: none;"></td>
           <td style="border: none;"></td>
            <th colspan="2">관리번호</th>
            <td colspan="4"><!-- 여기에 관리번호를 입력해 주세요. 비워놨습니다 --></td>
        </tr>
        <tr>
            <th>자격</th>
            <td>${test.grade}급 전문상담사</td>
            <th>유형</th>
            <td>지식</td>
            <th>난이도</th>
            <td style="text-align: center;">${test.diff}</td>
        </tr>
        <tr>
            <th>과목명</th>
            <td colspan="3">${test.name}</td>
            <th>출제기준</th>
            <td style="text-align: center;" colspan="5">${test.categoryNumbers}</td>
        </tr>
    </table>
    <table>
        <tr>
        <td colspan="6">
            [문 제] 2019-1. &lt;보기&gt;에서 설명하고 있는 방어기제 유형은?<br><br>
            
                <div class="subtitle">
                    <p><strong>&lt;보기&gt;</strong></p>
                    <p>- 감정을 조절하고 수치적인 충돌을 맞춘다.</p>
                    <p>- 사회적 문제에 대해 정당한 논리를 주장한다.</p>
                    <p>- 인생의 의미와 목적에 대해 심층에서 이야기한다.</p>
                </div>
                <br>
                
                <ol>
                    <li>승화(sublimation)</li>
                    <li>치환(displacement)</li>
                    <li>반동형성(reaction formation)</li>
                    <li>주지화(intellectualization)</li>
                    <li>합리화(rationalization)</li>
                </ol>
            </td>
        </tr>
    </table>
    
    <table>
        <tr>
            <th colspan="1" class="answer">정답</th>
            <td style="text-align: center;" colspan="5">③</td>
        </tr>
        <tr>
            <th colspan="1" class="answer">정답해설</th>
            <td colspan="5">82.52%</td>
        </tr>
        <tr>
            <th colspan="1" class="answer">출제배경</th>
            <td colspan="5">방어기제 유형의 개념과 특징에 대해 이해하고 있는지를 평가함.<br>
               분류: ${test.category1} - ${test.category2} - ${test.category3}</td>
        </tr>
        <tr>
            <th rowspan="5" colspan="1" class="answer">참고도서명/출판사</th>
            <td rowspan="5" colspan="1">-상담학개론/학지사, 상담의 이론과 실제(2판)/학지사, 상담학총서: 상담이론과 실제/학지사, 심리치료와 상담이론: 개념 및 사례(5판)/센게이지러닝</td>
           <th rowspan="5" colspan="1" class="answer">저자명/출판연도</th>
           <td rowspan="5" colspan="1">-김계현 외/2011, 김춘경 외/2016, 양명숙 외/2013, 천성문 외 공역/2014</td>
           <th rowspan="5" colspan="1" class="answer">PAGE</th>
           <td rowspan="5" colspan="1">-184, 89, 66, 39-40</td>          
        </tr>
    </table>
    
    <table>
        <tr>
            <td class="answer">구분</td>
            <td class="answer">일자</td>
            <td class="answer">소속</td>
            <td class="answer">성명</td>
            <td class="answer">서명</td>
         </tr>
         <tr>
            <td class="answer">출제자</td>
            <td>2019-09-06</td>
            <td style="text-align: center;color: red;">소속</td>
            <td style="text-align: center;">${test.writtenName}</td>
            <td></td>
        </tr>
    </table>
</div>
</div>
</body>
</html>
