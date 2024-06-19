<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" type="favicon.ico" type="image/x-icon">>
<link rel="stylesheet" href="exam.css">
<meta charset="EUC-KR">
<title>�����Ƿ� ���</title>
<script>
   function open2() {
      window.open("../../../biz/getTestList.do", "_blank",
            "width=1000, height=500");
   }
</script>
</head>
<%@ include file="header.jsp"%>
<body>
   <div class="container">
      <div class="header">
      </div>
      <table>
         <thead>
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
                  <td>${examPlan.status}</td>
                  <td>
                     <form action="examcommitmember/examCard.jsp" method="post">
                        <input type="hidden" name="num" value="${examPlan.num}" />
                        <button type="submit" name="action" value="approve"
                           <c:if test="${examPlan.status == '�ݷ�'}">disabled</c:if>>����</button>
                     </form>
                     <form id="rejectForm1" action="updateStatus.do" method="post">
                        <input type="hidden" name="num" value="${examPlan.num}" /> <input
                           type="hidden" name="status" value="�ݷ�" />
                        <button type="submit" name="action" value="reject">�ݷ�</button>
                     </form>
                     <form action="updateStatus.do" method="post">
                        <input type="hidden" name="num" value="${examPlan.num}" /> <input
                           type="hidden" name="status" value="�̰���" />
                        <button type="submit" name="action" value="test">�׽�Ʈ��</button>
                     </form>
                  </td>
               </tr>
            </c:forEach>
         </tbody>
      </table>
   </div>