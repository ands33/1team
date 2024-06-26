<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" href="./img/favicon-32x32.png">
<title>����</title>
<style>
body {
    background-color: #F8F9FA; /* �� �κ��� �߰��Ͽ� ������ �����ϰ� ���� */
}

th, td {
   width: 150px;
}

table {
   width: 100%;
   border-collapse: collapse;
   margin-top: 20px;
}

th, td {
   border: 1px solid #333;
   padding: 8px;
   text-align: center;
}

th {
   background-color: #F8F9FA;
}

.container {
   margin: 20px;
}
</style>
</head>
<body>
   <%@ include file="adminheader.jsp"%>
   <div class="container">
      <h2><b><u>����</u></b></h2>
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
               <th>���� ����</th>
               <th>��Ȳ</th>
               <th>�ݷ�/����</th>
            </tr>
         </thead>
         <tbody>
            <c:forEach var="subtrahend" items="${subtrahendList}">
               <tr>
                  <td>${subtrahend.num}</td>
                  <td>${subtrahend.categoryNumbers}</td>
                  <td>${subtrahend.name}</td>
                  <td>${subtrahend.category1}</td>
                  <td>${subtrahend.category2}</td>
                  <td>${subtrahend.category3}</td>
                  <td>${subtrahend.diff}</td>
                  <td>${subtrahend.member_name}</td>
                  <td>${subtrahend.e_status}</td>
                  <td>
                     <form action="subtrahend.do" method="post">
                        <input type="hidden" name="num" value="${subtrahend.num}" />
                        <button type="submit" name="action" value="approve">����</button>
                     </form>
                  </td>
               </tr>
            </c:forEach>
         </tbody>
      </table>
   </div>
</body>
</html>
