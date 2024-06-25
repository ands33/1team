<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="icon" href="./img/favicon-16x16.png">
<title>이원분류표(출제)</title>
<style>
.header-links a {
    text-decoration: none;
    color: black;
}

body, table, th, td, input, select, textarea, div, a, p, span, strong, b,
    i, ul, ol, li, button {
    font-family: "Montserrat", "Noto Sans KR", sans-serif;
    font-size: 15px;
    letter-spacing: -0.05em;
    line-height: 1.6em;
    list-style: none;
    color: #333;
}

th, .twh td, .th td {
    text-align: center;
    font-weight: bold;
    white-space: nowrap; /* 넘침 처리 방지 */
    padding: 10px; /* 셀 안 여백 */
    font-size: 14px; /* 글씨 크기 */
    border: 1px solid black;
}

/* 기존의 th와 td 스타일을 유지합니다. */
th, td {
    border: 1px solid black;
    padding: 8px;
    text-align: left;
}

td:nth-last-child(3) {
    min-width: 150px; /* 출처 부분 최소 너비 지정 */
    max-width: 200px; /* 출처 부분 최대 너비 지정 */
}

.wide-column {
    width: 300px;
}

.table .btn {
    margin: 2px;
}

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

/* 하단 테두리 초기 상태 */
.navbar-nav .nav-link::after {
    content: ''; /* 콘텐츠 추가 */
    display: block; /* 블록 레벨 요소로 변경 */
    width: 0; /* 너비 0으로 설정하여 초기에 숨김 */
    height: 2px; /* 높이 2px */
    background: #DB402E; /* 배경 색상 */
    position: absolute;
    left: 0; /* 왼쪽 0 */
    bottom: -9.5px; /* 아래쪽 -9.5px */
    opacity: 0; /* 초기에 숨김 */
}

/* 호버 시 테두리 효과 */
.navbar-nav .nav-link:hover::after {
    width: 100%; /* 호버 시 너비 100%로 확장 */
    opacity: 1; /* 호버 시 보이게 함 */
}

/* 재출제 요청 박스 스타일 */
.resubmit-box {
    width: 100px;
    height: 50px;
    border: 1px solid #333;
    display: flex;
    align-items: center;
    justify-content: center;
    position: relative;
    cursor: pointer; /* 커서를 포인터로 변경 */
}

.resubmit-box::after {
    content: attr(data-review); /* data-review 속성의 값을 표시 */
    display: none; /* 기본적으로 숨김 */
    position: absolute;
    top: 60px; /* 박스 아래에 표시 */
    left: 0;
    background-color: #fff;
    border: 1px solid #333;
    padding: 5px;
    white-space: pre-wrap; /* 줄바꿈을 유지 */
}

.resubmit-box:hover::after {
    display: block; /* 마우스를 올렸을 때 표시 */
}

/* 표를 가운데 정렬하는 스타일 */
.table-container {
    display: flex;
    justify-content: center;
}
</style>
<link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
    rel="stylesheet"
    integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
    crossorigin="anonymous">
</head>
<body>
        <%@ include file="adminheader.jsp"%>
    <div class="container mt-4">
        <div class="table-container">
            <table class="table table-bordered">
                <thead class="table-light">
                    <tr>
                        <th colspan="23">과목명 : ${member.subject_name}<br> 출제위원 :
                            (A) ${memberAB.memberA} (B) : ${memberAB.memberB}
                        </th>
                    </tr>
                    <tr class="twh">
                        <td colspan="4">출제영역</td>
                        <td colspan="4">난이도별 문제수</td>
                        <td colspan="2">출제위원</td>
                        <td colspan="2">출제방법</td>
                        <td colspan="3">행동영역</td>
                        <td colspan="5">정답</td>
                        <td colspan="3"></td>

                    </tr>
                    <tr class="th">
                        <td>분류코드</td>
                        <td>대분류</td>
                        <td>중분류</td>
                        <td>소분류</td>
                        <td>상</td>
                        <td>중</td>
                        <td>하</td>
                        <td>합계</td>
                        <td>${memberAB.memberA}</td>
                        <td>${memberAB.memberB}</td>
                        <td>문항제작</td>
                        <td>기출문제</td>
                        <td>지식</td>
                        <td>이해</td>
                        <td>적용</td>
                        <td>①</td>
                        <td>②</td>
                        <td>③</td>
                        <td>④</td>
                        <td>⑤</td>
                        <td>출처</td>
                        <td>문항카드</td>
                        <td>검토완료</td>
                        <td>변경</td> <!-- 새 열 추가 -->
                    </tr>
                </thead>
                <tbody>
                    <%-- 합계에 쓸 변수 선언하는 부분 --%>
                    <c:set var="sumHigh" value="0" />
                    <c:set var="sumMiddle" value="0" />
                    <c:set var="sumLow" value="0" />
                    <c:set var="sumName1" value="0" />
                    <c:set var="sumName2" value="0" />
                    <c:set var="sumCre" value="0" />
                    <c:set var="sumPas" value="0" />
                    <c:set var="sumBehavioral1" value="0" />
                    <c:set var="sumBehavioral2" value="0" />
                    <c:set var="sumBehavioral3" value="0" />
                    <c:set var="sumAnswer1" value="0" />
                    <c:set var="sumAnswer2" value="0" />
                    <c:set var="sumAnswer3" value="0" />
                    <c:set var="sumAnswer4" value="0" />
                    <c:set var="sumAnswer5" value="0" />
                    <c:forEach var="binaryClass" items="${binaryClassList}"
                        varStatus="loop">
                        <%-- 난이도에 따라 숫자 누적하기 --%>
                        <c:set var="high" value="0" />
                        <c:set var="middle" value="0" />
                        <c:set var="low" value="0" />

                        <c:choose>
                            <c:when test="${binaryClass.diff == '상'}">
                                <c:set var="high" value="${high + 1}" />
                                <c:set var="sumHigh" value="${sumHigh + 1}" />
                            </c:when>
                            <c:when test="${binaryClass.diff == '중'}">
                                <c:set var="middle" value="${middle + 1}" />
                                <c:set var="sumMiddle" value="${sumMiddle + 1}" />
                            </c:when>
                            <c:when test="${binaryClass.diff == '하'}">
                                <c:set var="low" value="${low + 1}" />
                                <c:set var="sumLow" value="${sumLow + 1}" />
                            </c:when>
                        </c:choose>
                        <c:choose>
                            <c:when test="${binaryClass.member_name == memberAB.memberA}">
                                <c:set var="sumName1" value="${sumName1 + 1}" />
                            </c:when>
                            <c:when test="${binaryClass.member_name == memberAB.memberB}">
                                <c:set var="sumName2" value="${sumName2 + 1}" />
                            </c:when>
                        </c:choose>
                        <c:choose>
                            <c:when test="${binaryClass.exam_type == '문항제작'}">
                                <c:set var="sumCre" value="${sumCre + 1}" />
                            </c:when>
                            <c:when test="${binaryClass.exam_type == '기출문제'}">
                                <c:set var="sumPas" value="${sumPas + 1}" />
                            </c:when>
                        </c:choose>
                        <c:choose>
                            <c:when test="${binaryClass.behavioral == '지식'}">
                                <c:set var="sumBehavioral1" value="${sumBehavioral1 + 1}" />
                            </c:when>
                            <c:when test="${binaryClass.behavioral == '이해'}">
                                <c:set var="sumBehavioral2" value="${sumBehavioral2 + 1}" />
                            </c:when>
                            <c:when test="${binaryClass.behavioral == '적용'}">
                                <c:set var="sumBehavioral3" value="${sumBehavioral3 + 1}" />
                            </c:when>
                        </c:choose>
                        <c:choose>
                            <c:when test="${binaryClass.answer == 1}">
                                <c:set var="sumAnswer1" value="${sumAnswer1 + 1}" />
                            </c:when>
                            <c:when test="${binaryClass.answer == 2}">
                                <c:set var="sumAnswer2" value="${sumAnswer2 + 1}" />
                            </c:when>
                            <c:when test="${binaryClass.answer == 3}">
                                <c:set var="sumAnswer3" value="${sumAnswer3 + 1}" />
                            </c:when>
                            <c:when test="${binaryClass.answer == 4}">
                                <c:set var="sumAnswer4" value="${sumAnswer4 + 1}" />
                            </c:when>
                            <c:when test="${binaryClass.answer == 5}">
                                <c:set var="sumAnswer5" value="${sumAnswer5 + 1}" />
                            </c:when>
                        </c:choose>
                        
                        <%-- 이전 행과 대분류, 중분류가 같은지 비교하기 --%>
                        <c:if
                            test="${loop.index > 0 && binaryClass.category1 == binaryClassList[loop.index - 1].category1 && binaryClass.category2 == binaryClassList[loop.index - 1].category2}">
                            <%-- 같으면 rowspan 증가하지 않고 데이터만 출력 --%>
                            <tr>
                                <td></td>
                                <td>${binaryClass.category3}</td>
                                <td>${binaryClass.diff == '상' ? 1 : ''}</td>
                                <td>${binaryClass.diff == '중' ? 1 : ''}</td>
                                <td>${binaryClass.diff == '하' ? 1 : ''}</td>
                                <td>${high + middle + low}</td>
                                <td>${binaryClass.member_name == memberAB.memberA ? 1 : ''}</td>
                                <td>${binaryClass.member_name == memberAB.memberB ? 1 : ''}</td>
                                <td>${binaryClass.exam_type == '문항제작' ? '제작' : ''}</td>
                                <td>${binaryClass.exam_type == '기출문제' ? '기출' : ''}</td>
                                <td>${binaryClass.behavioral == '지식' ? 1 : ''}</td>
                                <td>${binaryClass.behavioral == '이해' ? 1 : ''}</td>
                                <td>${binaryClass.behavioral == '적용' ? 1 : ''}</td>
                                <td>${binaryClass.answer == 1 ? '①' : ''}</td>
                                <td>${binaryClass.answer == 2 ? '②' : ''}</td>
                                <td>${binaryClass.answer == 3 ? '③' : ''}</td>
                                <td>${binaryClass.answer == 4 ? '④' : ''}</td>
                                <td>${binaryClass.answer == 5 ? '⑤' : ''}</td>
                                <td>${binaryClass.reference}</td>
                                <td><c:choose>
                                        <c:when test="${binaryClass.e_status == '미개봉'}">작성전</c:when>
                                        <c:when
                                            test="${binaryClass.e_status == '출제중' || binaryClass.e_status == '재출제요청'}">작성중</c:when>
                                        <c:when
                                            test="${binaryClass.e_status == '제출(검토대기)' || binaryClass.e_status == '제출(완료)'}">작성완료</c:when>
                                        <c:otherwise>${binaryClass.e_status}</c:otherwise>
                                    </c:choose></td>
                                <td>${binaryClass.e_status == '제출(완료)' ? '○' : ''}</td>
                                <td>
                                    <!-- 새로 추가된 부분 -->
                                    <c:choose>
                                        <c:when test="${member_type == 'A'}">
                                            <a href="?member_type=B">B로 이동</a>
                                        </c:when>
                                        <c:when test="${member_type == 'B'}">
                                            <a href="?member_type=A">A로 이동</a>
                                        </c:when>
                                    </c:choose>
                                </td>
                            </tr>
                        </c:if>
                        <c:if
                            test="${loop.index == 0 || binaryClass.category1 != binaryClassList[loop.index - 1].category1 || binaryClass.category2 != binaryClassList[loop.index - 1].category2}">
                            <%-- 다르면 rowspan 추가 --%>
                            <c:set var="rowspan" value="1" />
                            <c:forEach var="nextBinaryClass" begin="${loop.index + 1}"
                                items="${binaryClassList}" varStatus="innerLoop">
                                <c:if
                                    test="${binaryClass.category1 == nextBinaryClass.category1 && binaryClass.category2 == nextBinaryClass.category2}">
                                    <c:set var="rowspan" value="${rowspan + 1}" />
                                </c:if>
                            </c:forEach>
                            <tr>
                                <td>${binaryClass.categoryNumbers}</td>
                                <td rowspan="${rowspan}">${binaryClass.category1}</td>
                                <td rowspan="${rowspan}">${binaryClass.category2}</td>
                                <td>${binaryClass.category3}</td>
                                <td>${binaryClass.diff == '상' ? 1 : ''}</td>
                                <td>${binaryClass.diff == '중' ? 1 : ''}</td>
                                <td>${binaryClass.diff == '하' ? 1 : ''}</td>
                                <td>${high + middle + low}</td>
                                <td>${binaryClass.member_name == memberAB.memberA ? 1 : ''}</td>
                                <td>${binaryClass.member_name == memberAB.memberB ? 1 : ''}</td>
                                <td>${binaryClass.exam_type == '문항제작' ? '제작' : ''}</td>
                                <td>${binaryClass.exam_type == '기출문제' ? '기출' : ''}</td>
                                <td>${binaryClass.behavioral == '지식' ? 1 : ''}</td>
                                <td>${binaryClass.behavioral == '이해' ? 1 : ''}</td>
                                <td>${binaryClass.behavioral == '적용' ? 1 : ''}</td>
                                <td>${binaryClass.answer == 1 ? '①' : ''}</td>
                                <td>${binaryClass.answer == 2 ? '②' : ''}</td>
                                <td>${binaryClass.answer == 3 ? '③' : ''}</td>
                                <td>${binaryClass.answer == 4 ? '④' : ''}</td>
                                <td>${binaryClass.answer == 5 ? '⑤' : ''}</td>
                                <td>${binaryClass.reference}</td>
                                <td><c:choose>
                                        <c:when test="${binaryClass.e_status == '미개봉'}">작성전</c:when>
                                        <c:when
                                            test="${binaryClass.e_status == '출제중' || binaryClass.e_status == '재출제요청'}">작성중</c:when>
                                        <c:when
                                            test="${binaryClass.e_status == '제출(검토대기)' || binaryClass.e_status == '제출(완료)'}">작성완료</c:when>
                                        <c:otherwise>${binaryClass.e_status}</c:otherwise>
                                    </c:choose></td>
                                <td>${binaryClass.e_status == '제출(완료)' ? '○' : ''}</td>
                                <td>
                                    <!-- 새로 추가된 부분 -->
                                    <c:choose>
                                        <c:when test="${member_type == 'A'}">
                                            <a href="?member_type=B">B로 이동</a>
                                        </c:when>
                                        <c:when test="${member_type == 'B'}">
                                            <a href="?member_type=A">A로 이동</a>
                                        </c:when>
                                    </c:choose>
                                </td>
                            </tr>
                        </c:if>
                    </c:forEach>
                </tbody>
                <tfoot>
                    <tr class="tbt">
                        <td rowspan="2" colspan="4">합계</td>
                        <td>${sumHigh}</td>
                        <td>${sumMiddle}</td>
                        <td>${sumLow}</td>
                        <td>${sumHigh + sumMiddle + sumLow}</td>
                        <td>${sumName1}</td>
                        <td>${sumName2}</td>
                        <td>${sumCre}</td>
                        <td>${sumPas}</td>
                        <td>${sumBehavioral1}</td>
                        <td>${sumBehavioral2}</td>
                        <td>${sumBehavioral3}</td>
                        <td>${sumAnswer1}</td>
                        <td>${sumAnswer2}</td>
                        <td>${sumAnswer3}</td>
                        <td>${sumAnswer4}</td>
                        <td>${sumAnswer5}</td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                </tfoot>
            </table>
        </div>
    </div>
    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
</body>
</html>
