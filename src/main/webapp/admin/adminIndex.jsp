<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원 정보 목록</title>
<style>
/* 기존 스타일 생략 */
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

.error-message {
   color: red;
   font-weight: bold;
   margin-top: 10px;
}

</style>
<script>
function openMemberPopup(memberId, statusIndex) {
    var url = '${pageContext.request.contextPath}/admin/popup.jsp?memberId=' + memberId + '&statusIndex=' + statusIndex;
    var name = 'memberPopup';
    var specs = 'width=600,height=400,scrollbars=yes';
    window.open(url, name, specs);
}

document.addEventListener("DOMContentLoaded", function() {
    document.getElementById("updateForm").addEventListener("submit", function(event) {
        var startDate = document.getElementById("startDate").value;
        var endDate = document.getElementById("endDate").value;

        if (new Date(startDate) > new Date(endDate)) {
            event.preventDefault();
            document.getElementById("error-message").innerText = "시작 날짜는 종료 날짜보다 클 수 없습니다.";
        } else {
            document.getElementById("error-message").innerText = "";
        }
    });
});
</script>
</head>

<body>

<%@ include file="adminheader.jsp"%>
<br>
<br>
    <div class="button-container">
        <form id="updateForm" action="${pageContext.request.contextPath}/updateMembersByPeriod.do" method="post">
            <input type="date" id="startDate" name="startDate" placeholder="시작 날짜 입력: YYYY-MM-DD" style="width: 150px;">
            <input type="date" id="endDate" name="endDate" placeholder="종료 날짜 입력: YYYY-MM-DD" style="width: 150px;">
            <input type="submit" value="Update Members" style="width: 150px;">
        </form>
        <div id="error-message" class="error-message"></div>
      <form action="${pageContext.request.contextPath}/getMemberList.do" method="get">
         <button type="submit">위원 목록</button>
      </form>
      <button type="button" onclick="location.href='${pageContext.request.contextPath}/exportToExcel.do'">엑셀 다운</button>
   </div>

   <table class="header-table">
      <tr>
         <th colspan="5">회원 정보</th>
         <th colspan="3">로그인 정보</th>
         <th>비고</th>
      </tr>
      <tr>
         <th>구분</th>
         <th>부서</th>
         <th>부서명</th>
         <th>부서코드</th>
         <th>부서직위</th>
         <th>ID</th>
         <th>PW</th>
         <th>타입</th>
         <th>이름</th>
      </tr>
      <c:forEach var="member" items="${memberList}" varStatus="status">
         <c:choose>
            <c:when test="${status.index == 0}">
               <tr>
                  <td rowspan="12">1구분</td>
                  <td rowspan="6">1부서<br></td>
                  <c:if test="${empty subjectData[member.member_id]}">
                     <td></td>
                     <td>[없음]</td>
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
                     <td>[없음]</td>
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
                     <td>[없음]</td>
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
                     <td>[없음]</td>
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
                     <td>[없음]</td>
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
                     <td>[없음]</td>
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
                  <td rowspan="6">2구분<br>
                  </td>
                  <c:if test="${empty subjectData[member.member_id]}">
                     <td></td>
                     <td>[없음]</td>
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
                     <td>[없음]</td>
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
                     <td>[없음]</td>
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
                     <td>[없음]</td>
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
                     <td>[없음]</td>
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
                     <td>[없음]</td>
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
                  <td rowspan="14">2구분</td>
                  <td rowspan="6">1부서<br>
                  </td>
                  <c:if test="${empty subjectData[member.member_id]}">
                     <td></td>
                     <td>[없음]</td>
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
                     <td>[없음]</td>
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
                     <td>[없음]</td>
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
                     <td>[없음]</td>
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
                     <td>[없음]</td>
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
                     <td>[없음]</td>
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
                  <td rowspan="8">2구분<br>
                  </td>
                  <c:if test="${empty subjectData[member.member_id]}">
                     <td></td>
                     <td>[없음]</td>
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
                     <td>[없음]</td>
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
                     <td>[없음]</td>
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
                     <td>[없음]</td>
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
                     <td>[없음]</td>
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
                     <td>[없음]</td>
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
                     <td>[없음]</td>
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
                     <td>[없음]</td>
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
