<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="EUC-KR">
    <title>����</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="exam.css">
</head>
<body>
    <%@ include file="header.jsp"%>
    <div class="container mt-4">
        <div class="header"></div>
        <br>
        <table class="table table-bordered">
            <thead class="table-light">
                <tr align="center">
                    <th>�Ƿ� ��ȣ</th>
                    <th>�з� �ڵ�</th>
                    <th>���� ����</th>
                    <th>��з�</th>
                    <th>�ߺз�</th>
                    <th>�Һз�</th>
                    <th>���̵�</th>
                    <th>��� ����</th>
                    <th>��Ȳ</th>
                    <th>�ݷ�/����</th>
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
                            <form action="createTest.do" method="post" class="d-inline">
                                <input type="hidden" name="num" value="${examPlan.num}" />
                                <input type="hidden" name="e_status" value="������" />
                                <button type="submit" name="action" value="approve" class="btn btn-primary btn-sm" <c:if test="${examPlan.e_status == '�ݷ�'}">disabled</c:if>>����</button>
                            </form>
                            <form action="updateStatus.do" method="post" class="d-inline">
                                <input type="hidden" name="num" value="${examPlan.num}" />
                                <input type="hidden" name="e_status" value="�ݷ�" />
                                <button type="submit" name="action" value="reject" class="btn btn-warning btn-sm">�ݷ�</button>
                            </form>
                            <form action="updateStatus.do" method="post" class="d-inline">
                                <input type="hidden" name="num" value="${examPlan.num}" />
                                <input type="hidden" name="e_status" value="�̰���" />
                                <button type="submit" name="action" value="test" class="btn btn-secondary btn-sm">�׽�Ʈ��</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
