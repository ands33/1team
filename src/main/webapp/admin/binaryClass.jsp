<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="icon" href="./img/favicon-16x16.png">
<title>�̿��з�ǥ(����)</title>
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
    white-space: nowrap; /* ��ħ ó�� ���� */
    padding: 10px; /* �� �� ���� */
    font-size: 14px; /* �۾� ũ�� */
    border: 1px solid black;
}

/* ������ th�� td ��Ÿ���� �����մϴ�. */
th, td {
    border: 1px solid black;
    padding: 8px;
    text-align: left;
}

td:nth-last-child(3) {
    min-width: 150px; /* ��ó �κ� �ּ� �ʺ� ���� */
    max-width: 200px; /* ��ó �κ� �ִ� �ʺ� ���� */
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

/* �ϴ� �׵θ� �ʱ� ���� */
.navbar-nav .nav-link::after {
    content: ''; /* ������ �߰� */
    display: block; /* ��� ���� ��ҷ� ���� */
    width: 0; /* �ʺ� 0���� �����Ͽ� �ʱ⿡ ���� */
    height: 2px; /* ���� 2px */
    background: #DB402E; /* ��� ���� */
    position: absolute;
    left: 0; /* ���� 0 */
    bottom: -9.5px; /* �Ʒ��� -9.5px */
    opacity: 0; /* �ʱ⿡ ���� */
}

/* ȣ�� �� �׵θ� ȿ�� */
.navbar-nav .nav-link:hover::after {
    width: 100%; /* ȣ�� �� �ʺ� 100%�� Ȯ�� */
    opacity: 1; /* ȣ�� �� ���̰� �� */
}

/* ������ ��û �ڽ� ��Ÿ�� */
.resubmit-box {
    width: 100px;
    height: 50px;
    border: 1px solid #333;
    display: flex;
    align-items: center;
    justify-content: center;
    position: relative;
    cursor: pointer; /* Ŀ���� �����ͷ� ���� */
}

.resubmit-box::after {
    content: attr(data-review); /* data-review �Ӽ��� ���� ǥ�� */
    display: none; /* �⺻������ ���� */
    position: absolute;
    top: 60px; /* �ڽ� �Ʒ��� ǥ�� */
    left: 0;
    background-color: #fff;
    border: 1px solid #333;
    padding: 5px;
    white-space: pre-wrap; /* �ٹٲ��� ���� */
}

.resubmit-box:hover::after {
    display: block; /* ���콺�� �÷��� �� ǥ�� */
}

/* ǥ�� ��� �����ϴ� ��Ÿ�� */
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
                        <th colspan="23">����� : ${member.subject_name}<br> �������� :
                            (A) ${memberAB.memberA} (B) : ${memberAB.memberB}
                        </th>
                    </tr>
                    <tr class="twh">
                        <td colspan="4">��������</td>
                        <td colspan="4">���̵��� ������</td>
                        <td colspan="2">��������</td>
                        <td colspan="2">�������</td>
                        <td colspan="3">�ൿ����</td>
                        <td colspan="5">����</td>
                        <td colspan="3"></td>

                    </tr>
                    <tr class="th">
                        <td>�з��ڵ�</td>
                        <td>��з�</td>
                        <td>�ߺз�</td>
                        <td>�Һз�</td>
                        <td>��</td>
                        <td>��</td>
                        <td>��</td>
                        <td>�հ�</td>
                        <td>${memberAB.memberA}</td>
                        <td>${memberAB.memberB}</td>
                        <td>��������</td>
                        <td>���⹮��</td>
                        <td>����</td>
                        <td>����</td>
                        <td>����</td>
                        <td>��</td>
                        <td>��</td>
                        <td>��</td>
                        <td>��</td>
                        <td>��</td>
                        <td>��ó</td>
                        <td>����ī��</td>
                        <td>����Ϸ�</td>
                        <td>����</td> <!-- �� �� �߰� -->
                    </tr>
                </thead>
                <tbody>
                    <%-- �հ迡 �� ���� �����ϴ� �κ� --%>
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
                        <%-- ���̵��� ���� ���� �����ϱ� --%>
                        <c:set var="high" value="0" />
                        <c:set var="middle" value="0" />
                        <c:set var="low" value="0" />

                        <c:choose>
                            <c:when test="${binaryClass.diff == '��'}">
                                <c:set var="high" value="${high + 1}" />
                                <c:set var="sumHigh" value="${sumHigh + 1}" />
                            </c:when>
                            <c:when test="${binaryClass.diff == '��'}">
                                <c:set var="middle" value="${middle + 1}" />
                                <c:set var="sumMiddle" value="${sumMiddle + 1}" />
                            </c:when>
                            <c:when test="${binaryClass.diff == '��'}">
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
                            <c:when test="${binaryClass.exam_type == '��������'}">
                                <c:set var="sumCre" value="${sumCre + 1}" />
                            </c:when>
                            <c:when test="${binaryClass.exam_type == '���⹮��'}">
                                <c:set var="sumPas" value="${sumPas + 1}" />
                            </c:when>
                        </c:choose>
                        <c:choose>
                            <c:when test="${binaryClass.behavioral == '����'}">
                                <c:set var="sumBehavioral1" value="${sumBehavioral1 + 1}" />
                            </c:when>
                            <c:when test="${binaryClass.behavioral == '����'}">
                                <c:set var="sumBehavioral2" value="${sumBehavioral2 + 1}" />
                            </c:when>
                            <c:when test="${binaryClass.behavioral == '����'}">
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
                        
                        <%-- ���� ��� ��з�, �ߺз��� ������ ���ϱ� --%>
                        <c:if
                            test="${loop.index > 0 && binaryClass.category1 == binaryClassList[loop.index - 1].category1 && binaryClass.category2 == binaryClassList[loop.index - 1].category2}">
                            <%-- ������ rowspan �������� �ʰ� �����͸� ��� --%>
                            <tr>
                                <td></td>
                                <td>${binaryClass.category3}</td>
                                <td>${binaryClass.diff == '��' ? 1 : ''}</td>
                                <td>${binaryClass.diff == '��' ? 1 : ''}</td>
                                <td>${binaryClass.diff == '��' ? 1 : ''}</td>
                                <td>${high + middle + low}</td>
                                <td>${binaryClass.member_name == memberAB.memberA ? 1 : ''}</td>
                                <td>${binaryClass.member_name == memberAB.memberB ? 1 : ''}</td>
                                <td>${binaryClass.exam_type == '��������' ? '����' : ''}</td>
                                <td>${binaryClass.exam_type == '���⹮��' ? '����' : ''}</td>
                                <td>${binaryClass.behavioral == '����' ? 1 : ''}</td>
                                <td>${binaryClass.behavioral == '����' ? 1 : ''}</td>
                                <td>${binaryClass.behavioral == '����' ? 1 : ''}</td>
                                <td>${binaryClass.answer == 1 ? '��' : ''}</td>
                                <td>${binaryClass.answer == 2 ? '��' : ''}</td>
                                <td>${binaryClass.answer == 3 ? '��' : ''}</td>
                                <td>${binaryClass.answer == 4 ? '��' : ''}</td>
                                <td>${binaryClass.answer == 5 ? '��' : ''}</td>
                                <td>${binaryClass.reference}</td>
                                <td><c:choose>
                                        <c:when test="${binaryClass.e_status == '�̰���'}">�ۼ���</c:when>
                                        <c:when
                                            test="${binaryClass.e_status == '������' || binaryClass.e_status == '��������û'}">�ۼ���</c:when>
                                        <c:when
                                            test="${binaryClass.e_status == '����(������)' || binaryClass.e_status == '����(�Ϸ�)'}">�ۼ��Ϸ�</c:when>
                                        <c:otherwise>${binaryClass.e_status}</c:otherwise>
                                    </c:choose></td>
                                <td>${binaryClass.e_status == '����(�Ϸ�)' ? '��' : ''}</td>
                                <td>
                                    <!-- ���� �߰��� �κ� -->
                                    <c:choose>
                                        <c:when test="${member_type == 'A'}">
                                            <a href="?member_type=B">B�� �̵�</a>
                                        </c:when>
                                        <c:when test="${member_type == 'B'}">
                                            <a href="?member_type=A">A�� �̵�</a>
                                        </c:when>
                                    </c:choose>
                                </td>
                            </tr>
                        </c:if>
                        <c:if
                            test="${loop.index == 0 || binaryClass.category1 != binaryClassList[loop.index - 1].category1 || binaryClass.category2 != binaryClassList[loop.index - 1].category2}">
                            <%-- �ٸ��� rowspan �߰� --%>
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
                                <td>${binaryClass.diff == '��' ? 1 : ''}</td>
                                <td>${binaryClass.diff == '��' ? 1 : ''}</td>
                                <td>${binaryClass.diff == '��' ? 1 : ''}</td>
                                <td>${high + middle + low}</td>
                                <td>${binaryClass.member_name == memberAB.memberA ? 1 : ''}</td>
                                <td>${binaryClass.member_name == memberAB.memberB ? 1 : ''}</td>
                                <td>${binaryClass.exam_type == '��������' ? '����' : ''}</td>
                                <td>${binaryClass.exam_type == '���⹮��' ? '����' : ''}</td>
                                <td>${binaryClass.behavioral == '����' ? 1 : ''}</td>
                                <td>${binaryClass.behavioral == '����' ? 1 : ''}</td>
                                <td>${binaryClass.behavioral == '����' ? 1 : ''}</td>
                                <td>${binaryClass.answer == 1 ? '��' : ''}</td>
                                <td>${binaryClass.answer == 2 ? '��' : ''}</td>
                                <td>${binaryClass.answer == 3 ? '��' : ''}</td>
                                <td>${binaryClass.answer == 4 ? '��' : ''}</td>
                                <td>${binaryClass.answer == 5 ? '��' : ''}</td>
                                <td>${binaryClass.reference}</td>
                                <td><c:choose>
                                        <c:when test="${binaryClass.e_status == '�̰���'}">�ۼ���</c:when>
                                        <c:when
                                            test="${binaryClass.e_status == '������' || binaryClass.e_status == '��������û'}">�ۼ���</c:when>
                                        <c:when
                                            test="${binaryClass.e_status == '����(������)' || binaryClass.e_status == '����(�Ϸ�)'}">�ۼ��Ϸ�</c:when>
                                        <c:otherwise>${binaryClass.e_status}</c:otherwise>
                                    </c:choose></td>
                                <td>${binaryClass.e_status == '����(�Ϸ�)' ? '��' : ''}</td>
                                <td>
                                    <!-- ���� �߰��� �κ� -->
                                    <c:choose>
                                        <c:when test="${member_type == 'A'}">
                                            <a href="?member_type=B">B�� �̵�</a>
                                        </c:when>
                                        <c:when test="${member_type == 'B'}">
                                            <a href="?member_type=A">A�� �̵�</a>
                                        </c:when>
                                    </c:choose>
                                </td>
                            </tr>
                        </c:if>
                    </c:forEach>
                </tbody>
                <tfoot>
                    <tr class="tbt">
                        <td rowspan="2" colspan="4">�հ�</td>
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
