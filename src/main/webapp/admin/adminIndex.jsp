<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원 정보 목록</title>
<style>
body, table, th, td, input, select, textarea, div, a, p, span, strong, b,
   i, ul, ol, li, button {
   font-family: "Montserrat", "Noto Sans KR", sans-serif;
   font-size: 15px;
   letter-spacing: -0.05em;
   line-height: 1.6em;
   list-style: none;
   color: #333;
}

body {
   padding: 20px;
}

h3 {
   text-align: left;
   margin-left: 20px;
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
   height: 15px;
}

.button-container input {
   width: 150px;
   margin-right: 10px;
   padding: 10px;
   box-sizing: border-box;
}

.button-container button, .button-container form {
   display: inline-block;
   margin-left: 5px;
}

.select-container {
   display: flex;
   flex-direction: column;
   align-items: center;
}

select {
   width: 190px;
   height: 100px;
   margin-bottom: 10px;
}

button {
   width: 85px;
   height: 30px;
}

</style>
<script>

function openMemberPopup(memberId, statusIndex) {
    var url = 'admin/popup.jsp?memberId=' + memberId + '&statusIndex=' + statusIndex;
    var name = 'memberPopup';
    var specs = 'width=200,height=160,scrollbars=yes';
    window.open(url, name, specs);
}

function setSubjects(rowIdx, subjects, subjectCodes) {
    for (var i = 0; i < subjects.length; i++) {
        document.getElementById("subjectName" + rowIdx + "_" + i).innerText = subjects[i] || '';
        document.getElementById("subjectCode" + rowIdx + "_" + i).innerText = subjectCodes[i] || '';
    }
}
</script>
</head>

<body>

<%@ include file="adminheader.jsp"%>
<br>
<br>
   <div class="button-container">
             <form action="${pageContext.request.contextPath}/updateMembersByPeriod.do" method="post">
            <input type="text" name="startDate" placeholder="시작 날짜 입력: YYYY-MM-DD" style="width: 150px;">
            <input type="text" name="endDate" placeholder="종료 날짜 입력: YYYY-MM-DD" style="width: 150px;">
            <input type="submit" value="Update Members" style="width: 150px;">
        </form>
      <form action="${pageContext.request.contextPath}/getMemberList.do"
         method="get">
         <button type="submit">위원 목록</button>
      </form>
      <button type="button" onclick="location.href='${pageContext.request.contextPath}/exportToExcel.do'">엑셀 다운</button>
   </div>

   <table class="header-table">
      <tr>
         <th colspan="5">회원 정보</th>
         <th colspan="3">로그인 정보</th>
         <th>관리</th>
      </tr>
      <tr>
         <th>급수</th>
         <th>과목</th>
         <th>과목명</th>
         <th>과목삭제</th>
         <th>과목코드</th>
         <th>ID</th>
         <th>PW</th>
         <th>유형</th>
         <th>이름</th>
      </tr>
      <c:forEach var="member" items="${memberList}" varStatus="status">
         <c:choose>
            <c:when test="${status.index == 0}">
               <tr>
                  <td rowspan="12">1급</td>
                  <td rowspan="6">1교시<br></td>
                  <c:if test="${empty subjectData[member.member_id]}">
                     <td></td>
                     <td>[삭제]</td>
                     <td></td>
                  </c:if>
                  <c:forEach var="subjectCode"
                     items="${subjectData[member.member_id].keySet()}"
                     varStatus="subStatus">
                     <td id="subjectName${status.index}_${subStatus.index}"><c:out
                           value="${subjectData[member.member_id][subjectCode]}" /></td>
                     <td><a href="${pageContext.request.contextPath}/deleteSubjectMember.do?memberId=${member.member_id}">[삭제]</a></td>
                     <td id="subjectCode${status.index}_${subStatus.index}"><c:out
                           value="${subjectCode}" /></td>
                  </c:forEach>
                  <td><a href="javascript:void(0);"
                     onclick="openMemberPopup('${member.member_id}', '${status.index}');">${member.member_id}</a></td>
                  <td>${member.pw}</td>
                  <td>${member.member_type}</td>
                  <td>${member.member_name}</td>
               </tr>
            </c:when>
            <c:when test="${status.index == 1}">
               <tr>
                  <c:if test="${empty subjectData[member.member_id]}">
                     <td></td>
                     <td>[삭제]</td>
                     <td></td>
                  </c:if>
                  <c:forEach var="subjectCode"
                     items="${subjectData[member.member_id].keySet()}"
                     varStatus="subStatus">
                     <td id="subjectName${status.index}_${subStatus.index}"><c:out
                           value="${subjectData[member.member_id][subjectCode]}" /></td>
                     <td><a href="${pageContext.request.contextPath}/deleteSubjectMember.do?memberId=${member.member_id}">[삭제]</a></td>
                     <td id="subjectCode${status.index}_${subStatus.index}"><c:out
                           value="${subjectCode}" /></td>
                  </c:forEach>
                  <td><a href="javascript:void(0);"
                     onclick="openMemberPopup('${member.member_id}', '${status.index}');">${member.member_id}</a></td>
                  <td>${member.pw}</td>
                  <td>${member.member_type}</td>
                  <td>${member.member_name}</td>
               </tr>
            </c:when>
            <c:when test="${status.index == 2}">
               <tr>
                  <c:if test="${empty subjectData[member.member_id]}">
                     <td></td>
                     <td>[삭제]</td>
                     <td></td>
                  </c:if>
                  <c:forEach var="subjectCode"
                     items="${subjectData[member.member_id].keySet()}"
                     varStatus="subStatus">
                     <td id="subjectName${status.index}_${subStatus.index}"><c:out
                           value="${subjectData[member.member_id][subjectCode]}" /></td>
                     <td><a href="${pageContext.request.contextPath}/deleteSubjectMember.do?memberId=${member.member_id}">[삭제]</a></td>
                     <td id="subjectCode${status.index}_${subStatus.index}"><c:out
                           value="${subjectCode}" /></td>
                  </c:forEach>
                  <td><a href="javascript:void(0);"
                     onclick="openMemberPopup('${member.member_id}', '${status.index}');">${member.member_id}</a></td>
                  <td>${member.pw}</td>
                  <td>${member.member_type}</td>
                  <td>${member.member_name}</td>
               </tr>
            </c:when>
            <c:when test="${status.index == 3}">
               <tr>
                  <c:if test="${empty subjectData[member.member_id]}">
                     <td></td>
                     <td>[삭제]</td>
                     <td></td>
                  </c:if>
                  <c:forEach var="subjectCode"
                     items="${subjectData[member.member_id].keySet()}"
                     varStatus="subStatus">
                     <td id="subjectName${status.index}_${subStatus.index}"><c:out
                           value="${subjectData[member.member_id][subjectCode]}" /></td>
                     <td><a href="${pageContext.request.contextPath}/deleteSubjectMember.do?memberId=${member.member_id}">[삭제]</a></td>
                     <td id="subjectCode${status.index}_${subStatus.index}"><c:out
                           value="${subjectCode}" /></td>
                  </c:forEach>
                  <td><a href="javascript:void(0);"
                     onclick="openMemberPopup('${member.member_id}', '${status.index}');">${member.member_id}</a></td>
                  <td>${member.pw}</td>
                  <td>${member.member_type}</td>
                  <td>${member.member_name}</td>
               </tr>
            </c:when>
            <c:when test="${status.index == 4}">
               <tr>
                  <c:if test="${empty subjectData[member.member_id]}">
                     <td></td>
                     <td>[삭제]</td>
                     <td></td>
                  </c:if>
                  <c:forEach var="subjectCode"
                     items="${subjectData[member.member_id].keySet()}"
                     varStatus="subStatus">
                     <td id="subjectName${status.index}_${subStatus.index}"><c:out
                           value="${subjectData[member.member_id][subjectCode]}" /></td>
                     <td><a href="${pageContext.request.contextPath}/deleteSubjectMember.do?memberId=${member.member_id}">[삭제]</a></td>
                     <td id="subjectCode${status.index}_${subStatus.index}"><c:out
                           value="${subjectCode}" /></td>
                  </c:forEach>
                  <td><a href="javascript:void(0);"
                     onclick="openMemberPopup('${member.member_id}', '${status.index}');">${member.member_id}</a></td>
                  <td>${member.pw}</td>
                  <td>${member.member_type}</td>
                  <td>${member.member_name}</td>
               </tr>
            </c:when>
            <c:when test="${status.index == 5}">
               <tr>
                  <c:if test="${empty subjectData[member.member_id]}">
                     <td></td>
                     <td>[삭제]</td>
                     <td></td>
                  </c:if>
                  <c:forEach var="subjectCode"
                     items="${subjectData[member.member_id].keySet()}"
                     varStatus="subStatus">
                     <td id="subjectName${status.index}_${subStatus.index}"><c:out
                           value="${subjectData[member.member_id][subjectCode]}" /></td>
                     <td><a href="${pageContext.request.contextPath}/deleteSubjectMember.do?memberId=${member.member_id}">[삭제]</a></td>
                     <td id="subjectCode${status.index}_${subStatus.index}"><c:out
                           value="${subjectCode}" /></td>
                  </c:forEach>
                  <td><a href="javascript:void(0);"
                     onclick="openMemberPopup('${member.member_id}', '${status.index}');">${member.member_id}</a></td>
                  <td>${member.pw}</td>
                  <td>${member.member_type}</td>
                  <td>${member.member_name}</td>
               </tr>
            </c:when>
            <c:when test="${status.index == 6}">
               <tr>
                  <td rowspan="6">2급<br>
                  </td>
                  <c:if test="${empty subjectData[member.member_id]}">
                     <td></td>
                     <td>[삭제]</td>
                     <td></td>
                  </c:if>
                  <c:forEach var="subjectCode"
                     items="${subjectData[member.member_id].keySet()}"
                     varStatus="subStatus">
                     <td id="subjectName${status.index}_${subStatus.index}"><c:out
                           value="${subjectData[member.member_id][subjectCode]}" /></td>
                     <td><a href="${pageContext.request.contextPath}/deleteSubjectMember.do?memberId=${member.member_id}">[삭제]</a></td>
                     <td id="subjectCode${status.index}_${subStatus.index}"><c:out
                           value="${subjectCode}" /></td>
                  </c:forEach>
                  <td><a href="javascript:void(0);"
                     onclick="openMemberPopup('${member.member_id}', '${status.index}');">${member.member_id}</a></td>
                  <td>${member.pw}</td>
                  <td>${member.member_type}</td>
                  <td>${member.member_name}</td>
               </tr>
            </c:when>
            <c:when test="${status.index == 7}">
               <tr>
                  <c:if test="${empty subjectData[member.member_id]}">
                     <td></td>
                     <td>[삭제]</td>
                     <td></td>
                  </c:if>
                  <c:forEach var="subjectCode"
                     items="${subjectData[member.member_id].keySet()}"
                     varStatus="subStatus">
                     <td id="subjectName${status.index}_${subStatus.index}"><c:out
                           value="${subjectData[member.member_id][subjectCode]}" /></td>
                     <td><a href="${pageContext.request.contextPath}/deleteSubjectMember.do?memberId=${member.member_id}">[삭제]</a></td>
                     <td id="subjectCode${status.index}_${subStatus.index}"><c:out
                           value="${subjectCode}" /></td>
                  </c:forEach>
                  <td><a href="javascript:void(0);"
                     onclick="openMemberPopup('${member.member_id}', '${status.index}');">${member.member_id}</a></td>
                  <td>${member.pw}</td>
                  <td>${member.member_type}</td>
                  <td>${member.member_name}</td>
               </tr>
            </c:when>
            <c:when test="${status.index == 8}">
               <tr>
                  <c:if test="${empty subjectData[member.member_id]}">
                     <td></td>
                     <td>[삭제]</td>
                     <td></td>
                  </c:if>
                  <c:forEach var="subjectCode"
                     items="${subjectData[member.member_id].keySet()}"
                     varStatus="subStatus">
                     <td id="subjectName${status.index}_${subStatus.index}"><c:out
                           value="${subjectData[member.member_id][subjectCode]}" /></td>
                     <td><a href="${pageContext.request.contextPath}/deleteSubjectMember.do?memberId=${member.member_id}">[삭제]</a></td>
                     <td id="subjectCode${status.index}_${subStatus.index}"><c:out
                           value="${subjectCode}" /></td>
                  </c:forEach>
                  <td><a href="javascript:void(0);"
                     onclick="openMemberPopup('${member.member_id}', '${status.index}');">${member.member_id}</a></td>
                  <td>${member.pw}</td>
                  <td>${member.member_type}</td>
                  <td>${member.member_name}</td>
               </tr>
            </c:when>
            <c:when test="${status.index == 9}">
               <tr>
                  <c:if test="${empty subjectData[member.member_id]}">
                     <td></td>
                     <td>[삭제]</td>
                     <td></td>
                  </c:if>
                  <c:forEach var="subjectCode"
                     items="${subjectData[member.member_id].keySet()}"
                     varStatus="subStatus">
                     <td id="subjectName${status.index}_${subStatus.index}"><c:out
                           value="${subjectData[member.member_id][subjectCode]}" /></td>
                     <td><a href="${pageContext.request.contextPath}/deleteSubjectMember.do?memberId=${member.member_id}">[삭제]</a></td>
                     <td id="subjectCode${status.index}_${subStatus.index}"><c:out
                           value="${subjectCode}" /></td>
                  </c:forEach>
                  <td><a href="javascript:void(0);"
                     onclick="openMemberPopup('${member.member_id}', '${status.index}');">${member.member_id}</a></td>
                  <td>${member.pw}</td>
                  <td>${member.member_type}</td>
                  <td>${member.member_name}</td>
               </tr>
            </c:when>
            <c:when test="${status.index == 10}">
               <tr>
                  <c:if test="${empty subjectData[member.member_id]}">
                     <td></td>
                     <td>[삭제]</td>
                     <td></td>
                  </c:if>
                  <c:forEach var="subjectCode"
                     items="${subjectData[member.member_id].keySet()}"
                     varStatus="subStatus">
                     <td id="subjectName${status.index}_${subStatus.index}"><c:out
                           value="${subjectData[member.member_id][subjectCode]}" /></td>
                     <td><a href="${pageContext.request.contextPath}/deleteSubjectMember.do?memberId=${member.member_id}">[삭제]</a></td>
                     <td id="subjectCode${status.index}_${subStatus.index}"><c:out
                           value="${subjectCode}" /></td>
                  </c:forEach>
                  <td><a href="javascript:void(0);"
                     onclick="openMemberPopup('${member.member_id}', '${status.index}');">${member.member_id}</a></td>
                  <td>${member.pw}</td>
                  <td>${member.member_type}</td>
                  <td>${member.member_name}</td>
               </tr>
            </c:when>
            <c:when test="${status.index == 11}">
               <tr>
                  <c:if test="${empty subjectData[member.member_id]}">
                     <td></td>
                     <td>[삭제]</td>
                     <td></td>
                  </c:if>
                  <c:forEach var="subjectCode"
                     items="${subjectData[member.member_id].keySet()}"
                     varStatus="subStatus">
                     <td id="subjectName${status.index}_${subStatus.index}"><c:out
                           value="${subjectData[member.member_id][subjectCode]}" /></td>
                     <td><a href="${pageContext.request.contextPath}/deleteSubjectMember.do?memberId=${member.member_id}">[삭제]</a></td>
                     <td id="subjectCode${status.index}_${subStatus.index}"><c:out
                           value="${subjectCode}" /></td>
                  </c:forEach>
                  <td><a href="javascript:void(0);"
                     onclick="openMemberPopup('${member.member_id}', '${status.index}');">${member.member_id}</a></td>
                  <td>${member.pw}</td>
                  <td>${member.member_type}</td>
                  <td>${member.member_name}</td>
               </tr>
            </c:when>
            <c:when test="${status.index == 12}">
               <tr>
                  <td rowspan="14">2급</td>
                  <td rowspan="6">1교시<br>
                  </td>
                  <c:if test="${empty subjectData[member.member_id]}">
                     <td></td>
                     <td>[삭제]</td>
                     <td></td>
                  </c:if>
                  <c:forEach var="subjectCode"
                     items="${subjectData[member.member_id].keySet()}"
                     varStatus="subStatus">
                     <td id="subjectName${status.index}_${subStatus.index}"><c:out
                           value="${subjectData[member.member_id][subjectCode]}" /></td>
                     <td><a href="${pageContext.request.contextPath}/deleteSubjectMember.do?memberId=${member.member_id}">[삭제]</a></td>
                     <td id="subjectCode${status.index}_${subStatus.index}"><c:out
                           value="${subjectCode}" /></td>
                  </c:forEach>
                  <td><a href="javascript:void(0);"
                     onclick="openMemberPopup('${member.member_id}', '${status.index}');">${member.member_id}</a></td>
                  <td>${member.pw}</td>
                  <td>${member.member_type}</td>
                  <td>${member.member_name}</td>
               </tr>
            </c:when>
            <c:when test="${status.index == 13}">
               <tr>
                  <c:if test="${empty subjectData[member.member_id]}">
                     <td></td>
                     <td>[삭제]</td>
                     <td></td>
                  </c:if>
                  <c:forEach var="subjectCode"
                     items="${subjectData[member.member_id].keySet()}"
                     varStatus="subStatus">
                     <td id="subjectName${status.index}_${subStatus.index}"><c:out
                           value="${subjectData[member.member_id][subjectCode]}" /></td>
                     <td><a href="${pageContext.request.contextPath}/deleteSubjectMember.do?memberId=${member.member_id}">[삭제]</a></td>
                     <td id="subjectCode${status.index}_${subStatus.index}"><c:out
                           value="${subjectCode}" /></td>
                  </c:forEach>
                  <td><a href="javascript:void(0);"
                     onclick="openMemberPopup('${member.member_id}', '${status.index}');">${member.member_id}</a></td>
                  <td>${member.pw}</td>
                  <td>${member.member_type}</td>
                  <td>${member.member_name}</td>
               </tr>
            </c:when>
            <c:when test="${status.index == 14}">
               <tr>
                  <c:if test="${empty subjectData[member.member_id]}">
                     <td></td>
                     <td>[삭제]</td>
                     <td></td>
                  </c:if>
                  <c:forEach var="subjectCode"
                     items="${subjectData[member.member_id].keySet()}"
                     varStatus="subStatus">
                     <td id="subjectName${status.index}_${subStatus.index}"><c:out
                           value="${subjectData[member.member_id][subjectCode]}" /></td>
                     <td><a href="${pageContext.request.contextPath}/deleteSubjectMember.do?memberId=${member.member_id}">[삭제]</a></td>
                     <td id="subjectCode${status.index}_${subStatus.index}"><c:out
                           value="${subjectCode}" /></td>
                  </c:forEach>
                  <td><a href="javascript:void(0);"
                     onclick="openMemberPopup('${member.member_id}', '${status.index}');">${member.member_id}</a></td>
                  <td>${member.pw}</td>
                  <td>${member.member_type}</td>
                  <td>${member.member_name}</td>
               </tr>
            </c:when>
            <c:when test="${status.index == 15}">
               <tr>
                  <c:if test="${empty subjectData[member.member_id]}">
                     <td></td>
                     <td>[삭제]</td>
                     <td></td>
                  </c:if>
                  <c:forEach var="subjectCode"
                     items="${subjectData[member.member_id].keySet()}"
                     varStatus="subStatus">
                     <td id="subjectName${status.index}_${subStatus.index}"><c:out
                           value="${subjectData[member.member_id][subjectCode]}" /></td>
                     <td><a href="${pageContext.request.contextPath}/deleteSubjectMember.do?memberId=${member.member_id}">[삭제]</a></td>
                     <td id="subjectCode${status.index}_${subStatus.index}"><c:out
                           value="${subjectCode}" /></td>
                  </c:forEach>
                  <td><a href="javascript:void(0);"
                     onclick="openMemberPopup('${member.member_id}', '${status.index}');">${member.member_id}</a></td>
                  <td>${member.pw}</td>
                  <td>${member.member_type}</td>
                  <td>${member.member_name}</td>
               </tr>
            </c:when>
            <c:when test="${status.index == 16}">
               <tr>
                  <c:if test="${empty subjectData[member.member_id]}">
                     <td></td>
                     <td>[삭제]</td>
                     <td></td>
                  </c:if>
                  <c:forEach var="subjectCode"
                     items="${subjectData[member.member_id].keySet()}"
                     varStatus="subStatus">
                     <td id="subjectName${status.index}_${subStatus.index}"><c:out
                           value="${subjectData[member.member_id][subjectCode]}" /></td>
                     <td><a href="${pageContext.request.contextPath}/deleteSubjectMember.do?memberId=${member.member_id}">[삭제]</a></td>
                     <td id="subjectCode${status.index}_${subStatus.index}"><c:out
                           value="${subjectCode}" /></td>
                  </c:forEach>
                  <td><a href="javascript:void(0);"
                     onclick="openMemberPopup('${member.member_id}', '${status.index}');">${member.member_id}</a></td>
                  <td>${member.pw}</td>
                  <td>${member.member_type}</td>
                  <td>${member.member_name}</td>
               </tr>
            </c:when>
            <c:when test="${status.index == 17}">
               <tr>
                  <c:if test="${empty subjectData[member.member_id]}">
                     <td></td>
                     <td>[삭제]</td>
                     <td></td>
                  </c:if>
                  <c:forEach var="subjectCode"
                     items="${subjectData[member.member_id].keySet()}"
                     varStatus="subStatus">
                     <td id="subjectName${status.index}_${subStatus.index}"><c:out
                           value="${subjectData[member.member_id][subjectCode]}" /></td>
                     <td><a href="${pageContext.request.contextPath}/deleteSubjectMember.do?memberId=${member.member_id}">[삭제]</a></td>
                     <td id="subjectCode${status.index}_${subStatus.index}"><c:out
                           value="${subjectCode}" /></td>
                  </c:forEach>
                  <td><a href="javascript:void(0);"
                     onclick="openMemberPopup('${member.member_id}', '${status.index}');">${member.member_id}</a></td>
                  <td>${member.pw}</td>
                  <td>${member.member_type}</td>
                  <td>${member.member_name}</td>
               </tr>
            </c:when>
            <c:when test="${status.index == 18}">
               <tr>
                  <td rowspan="8">2급<br>
                  </td>
                  <c:if test="${empty subjectData[member.member_id]}">
                     <td></td>
                     <td>[삭제]</td>
                     <td></td>
                  </c:if>
                  <c:forEach var="subjectCode"
                     items="${subjectData[member.member_id].keySet()}"
                     varStatus="subStatus">
                     <td id="subjectName${status.index}_${subStatus.index}"><c:out
                           value="${subjectData[member.member_id][subjectCode]}" /></td>
                     <td><a href="${pageContext.request.contextPath}/deleteSubjectMember.do?memberId=${member.member_id}">[삭제]</a></td>
                     <td id="subjectCode${status.index}_${subStatus.index}"><c:out
                           value="${subjectCode}" /></td>
                  </c:forEach>
                  <td><a href="javascript:void(0);"
                     onclick="openMemberPopup('${member.member_id}', '${status.index}');">${member.member_id}</a></td>
                  <td>${member.pw}</td>
                  <td>${member.member_type}</td>
                  <td>${member.member_name}</td>
               </tr>
            </c:when>
            <c:when test="${status.index == 19}">
               <tr>
                  <c:if test="${empty subjectData[member.member_id]}">
                     <td></td>
                     <td>[삭제]</td>
                     <td></td>
                  </c:if>
                  <c:forEach var="subjectCode"
                     items="${subjectData[member.member_id].keySet()}"
                     varStatus="subStatus">
                     <td id="subjectName${status.index}_${subStatus.index}"><c:out
                           value="${subjectData[member.member_id][subjectCode]}" /></td>
                     <td><a href="${pageContext.request.contextPath}/deleteSubjectMember.do?memberId=${member.member_id}">[삭제]</a></td>
                     <td id="subjectCode${status.index}_${subStatus.index}"><c:out
                           value="${subjectCode}" /></td>
                  </c:forEach>
                  <td><a href="javascript:void(0);"
                     onclick="openMemberPopup('${member.member_id}', '${status.index}');">${member.member_id}</a></td>
                  <td>${member.pw}</td>
                  <td>${member.member_type}</td>
                  <td>${member.member_name}</td>
               </tr>
            </c:when>
            <c:when test="${status.index == 20}">
               <tr>
                  <c:if test="${empty subjectData[member.member_id]}">
                     <td></td>
                     <td>[삭제]</td>
                     <td></td>
                  </c:if>
                  <c:forEach var="subjectCode"
                     items="${subjectData[member.member_id].keySet()}"
                     varStatus="subStatus">
                     <td id="subjectName${status.index}_${subStatus.index}"><c:out
                           value="${subjectData[member.member_id][subjectCode]}" /></td>
                     <td><a href="${pageContext.request.contextPath}/deleteSubjectMember.do?memberId=${member.member_id}">[삭제]</a></td>
                     <td id="subjectCode${status.index}_${subStatus.index}"><c:out
                           value="${subjectCode}" /></td>
                  </c:forEach>
                  <td><a href="javascript:void(0);"
                     onclick="openMemberPopup('${member.member_id}', '${status.index}');">${member.member_id}</a></td>
                  <td>${member.pw}</td>
                  <td>${member.member_type}</td>
                  <td>${member.member_name}</td>
               </tr>
            </c:when>
            <c:when test="${status.index == 21}">
               <tr>
                  <c:if test="${empty subjectData[member.member_id]}">
                     <td></td>
                     <td>[삭제]</td>
                     <td></td>
                  </c:if>
                  <c:forEach var="subjectCode"
                     items="${subjectData[member.member_id].keySet()}"
                     varStatus="subStatus">
                     <td id="subjectName${status.index}_${subStatus.index}"><c:out
                           value="${subjectData[member.member_id][subjectCode]}" /></td>
                     <td><a href="${pageContext.request.contextPath}/deleteSubjectMember.do?memberId=${member.member_id}">[삭제]</a></td>
                     <td id="subjectCode${status.index}_${subStatus.index}"><c:out
                           value="${subjectCode}" /></td>
                  </c:forEach>
                  <td><a href="javascript:void(0);"
                     onclick="openMemberPopup('${member.member_id}', '${status.index}');">${member.member_id}</a></td>
                  <td>${member.pw}</td>
                  <td>${member.member_type}</td>
                  <td>${member.member_name}</td>
               </tr>
            </c:when>
            <c:when test="${status.index == 22}">
               <tr>
                  <c:if test="${empty subjectData[member.member_id]}">
                     <td></td>
                     <td>[삭제]</td>
                     <td></td>
                  </c:if>
                  <c:forEach var="subjectCode"
                     items="${subjectData[member.member_id].keySet()}"
                     varStatus="subStatus">
                     <td id="subjectName${status.index}_${subStatus.index}"><c:out
                           value="${subjectData[member.member_id][subjectCode]}" /></td>
                     <td><a href="${pageContext.request.contextPath}/deleteSubjectMember.do?memberId=${member.member_id}">[삭제]</a></td>
                     <td id="subjectCode${status.index}_${subStatus.index}"><c:out
                           value="${subjectCode}" /></td>
                  </c:forEach>
                  <td><a href="javascript:void(0);"
                     onclick="openMemberPopup('${member.member_id}', '${status.index}');">${member.member_id}</a></td>
                  <td>${member.pw}</td>
                  <td>${member.member_type}</td>
                  <td>${member.member_name}</td>
               </tr>
            </c:when>
            <c:when test="${status.index == 23}">
               <tr>
                  <c:if test="${empty subjectData[member.member_id]}">
                     <td></td>
                     <td>[삭제]</td>
                     <td></td>
                  </c:if>
                  <c:forEach var="subjectCode"
                     items="${subjectData[member.member_id].keySet()}"
                     varStatus="subStatus">
                     <td id="subjectName${status.index}_${subStatus.index}"><c:out
                           value="${subjectData[member.member_id][subjectCode]}" /></td>
                     <td><a href="${pageContext.request.contextPath}/deleteSubjectMember.do?memberId=${member.member_id}">[삭제]</a></td>
                     <td id="subjectCode${status.index}_${subStatus.index}"><c:out
                           value="${subjectCode}" /></td>
                  </c:forEach>
                  <td><a href="javascript:void(0);"
                     onclick="openMemberPopup('${member.member_id}', '${status.index}');">${member.member_id}</a></td>
                  <td>${member.pw}</td>
                  <td>${member.member_type}</td>
                  <td>${member.member_name}</td>
               </tr>
            </c:when>
            <c:when test="${status.index == 24}">
               <tr>
                  <c:if test="${empty subjectData[member.member_id]}">
                     <td></td>
                     <td>[삭제]</td>
                     <td></td>
                  </c:if>
                  <c:forEach var="subjectCode"
                     items="${subjectData[member.member_id].keySet()}"
                     varStatus="subStatus">
                     <td id="subjectName${status.index}_${subStatus.index}"><c:out
                           value="${subjectData[member.member_id][subjectCode]}" /></td>
                     <td><a href="${pageContext.request.contextPath}/deleteSubjectMember.do?memberId=${member.member_id}">[삭제]</a></td>
                     <td id="subjectCode${status.index}_${subStatus.index}"><c:out
                           value="${subjectCode}" /></td>
                  </c:forEach>
                  <td><a href="javascript:void(0);"
                     onclick="openMemberPopup('${member.member_id}', '${status.index}');">${member.member_id}</a></td>
                  <td>${member.pw}</td>
                  <td>${member.member_type}</td>
                  <td>${member.member_name}</td>
               </tr>
            </c:when>
            <c:when test="${status.index == 25}">
               <tr>
                  <c:if test="${empty subjectData[member.member_id]}">
                     <td></td>
                     <td>[삭제]</td>
                     <td></td>
                  </c:if>
                  <c:forEach var="subjectCode"
                     items="${subjectData[member.member_id].keySet()}"
                     varStatus="subStatus">
                     <td id="subjectName${status.index}_${subStatus.index}"><c:out
                           value="${subjectData[member.member_id][subjectCode]}" /></td>
                     <td><a href="${pageContext.request.contextPath}/deleteSubjectMember.do?memberId=${member.member_id}">[삭제]</a></td>
                     <td id="subjectCode${status.index}_${subStatus.index}"><c:out
                           value="${subjectCode}" /></td>
                  </c:forEach>
                  <td><a href="javascript:void(0);"
                     onclick="openMemberPopup('${member.member_id}', '${status.index}');">${member.member_id}</a></td>
                  <td>${member.pw}</td>
                  <td>${member.member_type}</td>
                  <td>${member.member_name}</td>
               </tr>
            </c:when>
         </c:choose>
      </c:forEach>
   </table>

</body>
</html>
