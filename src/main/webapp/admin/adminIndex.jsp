<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="icon" href="./img/favicon-32x32.png">

<title>������ ������</title>
<title>���� ���� ī��</title>
<style>
#header {
   width: 100%;
   padding: 20px 10px;
   background: #fff;
   z-index: 1;
}

/* header-link�� ���� ���� */
.header-links a {
   text-decoration: none;
   color: #000;
}

/* �ΰ� ������ �����ȸ �� ��Ʈ�� �۾� ȣ�� */
.header-links a:hover {
   color: #D8402A;
}

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

.button-container button, .button-container form {
	display: inline-block;
	margin-left: 10px;
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
	width: 60px;
	height: 30px;
}

body {
	background: #FFF;
	height: 100vh;
	font-size: 15px;
	font-family: 'Roboto', sans-serif;
}

/* header-link�� ���� ���� */
.header-links a {
    text-decoration: none;
    color: black;
}

/* �ΰ� ���� �۾� ȣ�� : �ѱ������ȸ */
.header-links a:hover {
	color: #D8402A;
}
</style>
<script>

	function setSubjects(rowIdx, subjects, subjectCodes) {
		for (var i = 0; i < subjects.length; i++) {
			document.getElementById("subjectName" + rowIdx + "_" + i).innerText = subjects[i]
					|| '';
			document.getElementById("subjectCode" + rowIdx + "_" + i).innerText = subjectCodes[i]
					|| '';
		}
	}
	function openMemberPopup(memberId, statusIndex) {
		var url = 'admin/popup.jsp?memberId=' + memberId + '&statusIndex='
				+ statusIndex;
		var name = 'memberPopup';
		var specs = 'width=600,height=400,scrollbars=yes';
		window.open(url, name, specs);
	}
function openMemberPopup(memberId, statusIndex) {
    var url = 'admin/popup.jsp?memberId=' + memberId + '&statusIndex=' + statusIndex;
    var name = 'memberPopup';
    var specs = 'width=600,height=400,scrollbars=yes';
    window.open(url, name, specs);
}

	function setSubjects(rowIdx, subjects, subjectCodes) {
		for (var i = 0; i < subjects.length; i++) {
			document.getElementById("subjectName" + rowIdx + "_" + i).innerText = subjects[i]
					|| '';
			document.getElementById("subjectCode" + rowIdx + "_" + i).innerText = subjectCodes[i]
					|| '';
		}
	}
	
	function getExamPlanList() {
	    const form = document.getElementById('headerForm');
	    form.action = "../../../biz/getExamPlanList.do";
	    form.submit();
	}

	function getSubtrahendList() {
	    const form = document.getElementById('headerForm');
	    form.action = "../../../biz/getSubtrahendList.do";
	    form.submit();
	}
</script>
</head>
<body>
<%@ include file="adminheader.jsp"%>
		<h2>������ �α���</h2>
		<div class="button-container">
			<input type="text" placeholder="YYYY�� MM�� DD��">
			<button class="custom-button" onclick="fetchData()">
				��ȸ <i class="fas fa-search"></i>
			</button>
			<form action="${pageContext.request.contextPath}/getMemberList.do"
				method="get">
				<button type="submit">ȸ�����</button>
			</form>
			<button type="button" onclick="location.href='excel_export.jsp'">�����������</button>
		</div>
		<table class="header-table">
			<tr>
				<th colspan="5">��������</th>
				<th colspan="3">������ ����</th>
				<th>�������� ����</th>
			</tr>
			<tr>
				<th>�޼�</th>
				<th>����</th>
				<th>�����</th>
				<th>�������</th>
				<th>�����ڵ�</th>
				<th>ID</th>
				<th>PW</th>
				<th>A + B / A</th>
				<th>�̸�</th>
			</tr>
			<c:forEach var="member" items="${memberList}" varStatus="status">
				<c:choose>
					<c:when test="${status.index == 0}">
						<tr>
							<td rowspan="12">1��</td>
							<td rowspan="6">1����<br></td>
							<c:if test="${empty subjectData[member.member_id]}">
								<td></td>
								<td>[����]</td>
								<td></td>
							</c:if>
							<c:forEach var="subjectCode"
								items="${subjectData[member.member_id].keySet()}"
								varStatus="subStatus">
								<td id="subjectName${status.index}_${subStatus.index}"><c:out
										value="${subjectData[member.member_id][subjectCode]}" /></td>
								<td><a
									href="${pageContext.request.contextPath}/deleteSubjectMember.do?memberId=${member.member_id}">[����]</a></td>
								<td><a
									href="${pageContext.request.contextPath}/deleteSubjectMember.do?memberId=${member.member_id}">[����]</a></td>
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
								<td>[����]</td>
								<td></td>
							</c:if>
							<c:forEach var="subjectCode"
								items="${subjectData[member.member_id].keySet()}"
								varStatus="subStatus">
								<td id="subjectName${status.index}_${subStatus.index}"><c:out
										value="${subjectData[member.member_id][subjectCode]}" /></td>
								<td><a
									href="${pageContext.request.contextPath}/deleteSubjectMember.do?memberId=${member.member_id}">[����]</a></td>
								<td><a
									href="${pageContext.request.contextPath}/deleteSubjectMember.do?memberId=${member.member_id}">[����]</a></td>
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
								<td>[����]</td>
								<td></td>
							</c:if>
							<c:forEach var="subjectCode"
								items="${subjectData[member.member_id].keySet()}"
								varStatus="subStatus">
								<td id="subjectName${status.index}_${subStatus.index}"><c:out
										value="${subjectData[member.member_id][subjectCode]}" /></td>
								<td><a
									href="${pageContext.request.contextPath}/deleteSubjectMember.do?memberId=${member.member_id}">[����]</a></td>
								<td><a
									href="${pageContext.request.contextPath}/deleteSubjectMember.do?memberId=${member.member_id}">[����]</a></td>
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
								<td>[����]</td>
								<td></td>
							</c:if>
							<c:forEach var="subjectCode"
								items="${subjectData[member.member_id].keySet()}"
								varStatus="subStatus">
								<td id="subjectName${status.index}_${subStatus.index}"><c:out
										value="${subjectData[member.member_id][subjectCode]}" /></td>
								<td><a
									href="${pageContext.request.contextPath}/deleteSubjectMember.do?memberId=${member.member_id}">[����]</a></td>
								<td><a
									href="${pageContext.request.contextPath}/deleteSubjectMember.do?memberId=${member.member_id}">[����]</a></td>
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
								<td>[����]</td>
								<td></td>
							</c:if>
							<c:forEach var="subjectCode"
								items="${subjectData[member.member_id].keySet()}"
								varStatus="subStatus">
								<td id="subjectName${status.index}_${subStatus.index}"><c:out
										value="${subjectData[member.member_id][subjectCode]}" /></td>
								<td><a
									href="${pageContext.request.contextPath}/deleteSubjectMember.do?memberId=${member.member_id}">[����]</a></td>
								<td><a
									href="${pageContext.request.contextPath}/deleteSubjectMember.do?memberId=${member.member_id}">[����]</a></td>
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
								<td>[����]</td>
								<td></td>
							</c:if>
							<c:forEach var="subjectCode"
								items="${subjectData[member.member_id].keySet()}"
								varStatus="subStatus">
								<td id="subjectName${status.index}_${subStatus.index}"><c:out
										value="${subjectData[member.member_id][subjectCode]}" /></td>
								<td><a
									href="${pageContext.request.contextPath}/deleteSubjectMember.do?memberId=${member.member_id}">[����]</a></td>
								<td><a
									href="${pageContext.request.contextPath}/deleteSubjectMember.do?memberId=${member.member_id}">[����]</a></td>
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
							<td rowspan="6">2����<br>
							</td>
							<c:if test="${empty subjectData[member.member_id]}">
								<td></td>
								<td>[����]</td>
								<td></td>
							</c:if>
							<c:forEach var="subjectCode"
								items="${subjectData[member.member_id].keySet()}"
								varStatus="subStatus">
								<td id="subjectName${status.index}_${subStatus.index}"><c:out
										value="${subjectData[member.member_id][subjectCode]}" /></td>
								<td><a
									href="${pageContext.request.contextPath}/deleteSubjectMember.do?memberId=${member.member_id}">[����]</a></td>
								<td><a
									href="${pageContext.request.contextPath}/deleteSubjectMember.do?memberId=${member.member_id}">[����]</a></td>
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
								<td>[����]</td>
								<td></td>
							</c:if>
							<c:forEach var="subjectCode"
								items="${subjectData[member.member_id].keySet()}"
								varStatus="subStatus">
								<td id="subjectName${status.index}_${subStatus.index}"><c:out
										value="${subjectData[member.member_id][subjectCode]}" /></td>
								<td><a
									href="${pageContext.request.contextPath}/deleteSubjectMember.do?memberId=${member.member_id}">[����]</a></td>
								<td><a
									href="${pageContext.request.contextPath}/deleteSubjectMember.do?memberId=${member.member_id}">[����]</a></td>
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
								<td>[����]</td>
								<td></td>
							</c:if>
							<c:forEach var="subjectCode"
								items="${subjectData[member.member_id].keySet()}"
								varStatus="subStatus">
								<td id="subjectName${status.index}_${subStatus.index}"><c:out
										value="${subjectData[member.member_id][subjectCode]}" /></td>
								<td><a
									href="${pageContext.request.contextPath}/deleteSubjectMember.do?memberId=${member.member_id}">[����]</a></td>
								<td><a
									href="${pageContext.request.contextPath}/deleteSubjectMember.do?memberId=${member.member_id}">[����]</a></td>
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
								<td>[����]</td>
								<td></td>
							</c:if>
							<c:forEach var="subjectCode"
								items="${subjectData[member.member_id].keySet()}"
								varStatus="subStatus">
								<td id="subjectName${status.index}_${subStatus.index}"><c:out
										value="${subjectData[member.member_id][subjectCode]}" /></td>
								<td><a
									href="${pageContext.request.contextPath}/deleteSubjectMember.do?memberId=${member.member_id}">[����]</a></td>
								<td><a
									href="${pageContext.request.contextPath}/deleteSubjectMember.do?memberId=${member.member_id}">[����]</a></td>
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
								<td>[����]</td>
								<td></td>
							</c:if>
							<c:forEach var="subjectCode"
								items="${subjectData[member.member_id].keySet()}"
								varStatus="subStatus">
								<td id="subjectName${status.index}_${subStatus.index}"><c:out
										value="${subjectData[member.member_id][subjectCode]}" /></td>
								<td><a
									href="${pageContext.request.contextPath}/deleteSubjectMember.do?memberId=${member.member_id}">[����]</a></td>
								<td><a
									href="${pageContext.request.contextPath}/deleteSubjectMember.do?memberId=${member.member_id}">[����]</a></td>
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
								<td>[����]</td>
								<td></td>
							</c:if>
							<c:forEach var="subjectCode"
								items="${subjectData[member.member_id].keySet()}"
								varStatus="subStatus">
								<td id="subjectName${status.index}_${subStatus.index}"><c:out
										value="${subjectData[member.member_id][subjectCode]}" /></td>
								<td><a
									href="${pageContext.request.contextPath}/deleteSubjectMember.do?memberId=${member.member_id}">[����]</a></td>
								<td><a
									href="${pageContext.request.contextPath}/deleteSubjectMember.do?memberId=${member.member_id}">[����]</a></td>
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
							<td rowspan="14">2��</td>
							<td rowspan="6">1����<br>

							</td>
							<c:if test="${empty subjectData[member.member_id]}">
								<td></td>
								<td>[����]</td>
								<td></td>
							</c:if>
							<c:forEach var="subjectCode"
								items="${subjectData[member.member_id].keySet()}"
								varStatus="subStatus">
								<td id="subjectName${status.index}_${subStatus.index}"><c:out
										value="${subjectData[member.member_id][subjectCode]}" /></td>
								<td><a
									href="${pageContext.request.contextPath}/deleteSubjectMember.do?memberId=${member.member_id}">[����]</a></td>
								<td><a
									href="${pageContext.request.contextPath}/deleteSubjectMember.do?memberId=${member.member_id}">[����]</a></td>
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
								<td>[����]</td>
								<td></td>
							</c:if>
							<c:forEach var="subjectCode"
								items="${subjectData[member.member_id].keySet()}"
								varStatus="subStatus">
								<td id="subjectName${status.index}_${subStatus.index}"><c:out
										value="${subjectData[member.member_id][subjectCode]}" /></td>
								<td><a
									href="${pageContext.request.contextPath}/deleteSubjectMember.do?memberId=${member.member_id}">[����]</a></td>
								<td><a
									href="${pageContext.request.contextPath}/deleteSubjectMember.do?memberId=${member.member_id}">[����]</a></td>
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
								<td>[����]</td>
								<td></td>
							</c:if>
							<c:forEach var="subjectCode"
								items="${subjectData[member.member_id].keySet()}"
								varStatus="subStatus">
								<td id="subjectName${status.index}_${subStatus.index}"><c:out
										value="${subjectData[member.member_id][subjectCode]}" /></td>
								<td><a
									href="${pageContext.request.contextPath}/deleteSubjectMember.do?memberId=${member.member_id}">[����]</a></td>
								<td><a
									href="${pageContext.request.contextPath}/deleteSubjectMember.do?memberId=${member.member_id}">[����]</a></td>
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
								<td>[����]</td>
								<td></td>
							</c:if>
							<c:forEach var="subjectCode"
								items="${subjectData[member.member_id].keySet()}"
								varStatus="subStatus">
								<td id="subjectName${status.index}_${subStatus.index}"><c:out
										value="${subjectData[member.member_id][subjectCode]}" /></td>
								<td><a
									href="${pageContext.request.contextPath}/deleteSubjectMember.do?memberId=${member.member_id}">[����]</a></td>
								<td><a
									href="${pageContext.request.contextPath}/deleteSubjectMember.do?memberId=${member.member_id}">[����]</a></td>
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
								<td>[����]</td>
								<td></td>
							</c:if>
							<c:forEach var="subjectCode"
								items="${subjectData[member.member_id].keySet()}"
								varStatus="subStatus">
								<td id="subjectName${status.index}_${subStatus.index}"><c:out
										value="${subjectData[member.member_id][subjectCode]}" /></td>
								<td><a
									href="${pageContext.request.contextPath}/deleteSubjectMember.do?memberId=${member.member_id}">[����]</a></td>
								<td><a
									href="${pageContext.request.contextPath}/deleteSubjectMember.do?memberId=${member.member_id}">[����]</a></td>
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
								<td>[����]</td>
								<td></td>
							</c:if>
							<c:forEach var="subjectCode"
								items="${subjectData[member.member_id].keySet()}"
								varStatus="subStatus">
								<td id="subjectName${status.index}_${subStatus.index}"><c:out
										value="${subjectData[member.member_id][subjectCode]}" /></td>
								<td><a
									href="${pageContext.request.contextPath}/deleteSubjectMember.do?memberId=${member.member_id}">[����]</a></td>
								<td><a
									href="${pageContext.request.contextPath}/deleteSubjectMember.do?memberId=${member.member_id}">[����]</a></td>
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
							<td rowspan="8">2����<br>
							</td>
							<c:if test="${empty subjectData[member.member_id]}">
								<td></td>
								<td>[����]</td>
								<td></td>
							</c:if>
							<c:forEach var="subjectCode"
								items="${subjectData[member.member_id].keySet()}"
								varStatus="subStatus">
								<td id="subjectName${status.index}_${subStatus.index}"><c:out
										value="${subjectData[member.member_id][subjectCode]}" /></td>
								<td><a
									href="${pageContext.request.contextPath}/deleteSubjectMember.do?memberId=${member.member_id}">[����]</a></td>
								<td><a
									href="${pageContext.request.contextPath}/deleteSubjectMember.do?memberId=${member.member_id}">[����]</a></td>
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
								<td>[����]</td>
								<td></td>
							</c:if>
							<c:forEach var="subjectCode"
								items="${subjectData[member.member_id].keySet()}"
								varStatus="subStatus">
								<td id="subjectName${status.index}_${subStatus.index}"><c:out
										value="${subjectData[member.member_id][subjectCode]}" /></td>
								<td><a
									href="${pageContext.request.contextPath}/deleteSubjectMember.do?memberId=${member.member_id}">[����]</a></td>
								<td><a
									href="${pageContext.request.contextPath}/deleteSubjectMember.do?memberId=${member.member_id}">[����]</a></td>
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
								<td>[����]</td>
								<td></td>
							</c:if>
							<c:forEach var="subjectCode"
								items="${subjectData[member.member_id].keySet()}"
								varStatus="subStatus">
								<td id="subjectName${status.index}_${subStatus.index}"><c:out
										value="${subjectData[member.member_id][subjectCode]}" /></td>
								<td><a
									href="${pageContext.request.contextPath}/deleteSubjectMember.do?memberId=${member.member_id}">[����]</a></td>
								<td><a
									href="${pageContext.request.contextPath}/deleteSubjectMember.do?memberId=${member.member_id}">[����]</a></td>
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
								<td>[����]</td>
								<td></td>
							</c:if>
							<c:forEach var="subjectCode"
								items="${subjectData[member.member_id].keySet()}"
								varStatus="subStatus">
								<td id="subjectName${status.index}_${subStatus.index}"><c:out
										value="${subjectData[member.member_id][subjectCode]}" /></td>
								<td><a
									href="${pageContext.request.contextPath}/deleteSubjectMember.do?memberId=${member.member_id}">[����]</a></td>
								<td><a
									href="${pageContext.request.contextPath}/deleteSubjectMember.do?memberId=${member.member_id}">[����]</a></td>
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
								<td>[����]</td>
								<td></td>
							</c:if>
							<c:forEach var="subjectCode"
								items="${subjectData[member.member_id].keySet()}"
								varStatus="subStatus">
								<td id="subjectName${status.index}_${subStatus.index}"><c:out
										value="${subjectData[member.member_id][subjectCode]}" /></td>
								<td><a
									href="${pageContext.request.contextPath}/deleteSubjectMember.do?memberId=${member.member_id}">[����]</a></td>
								<td><a
									href="${pageContext.request.contextPath}/deleteSubjectMember.do?memberId=${member.member_id}">[����]</a></td>
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
								<td>[����]</td>
								<td></td>
							</c:if>
							<c:forEach var="subjectCode"
								items="${subjectData[member.member_id].keySet()}"
								varStatus="subStatus">
								<td id="subjectName${status.index}_${subStatus.index}"><c:out
										value="${subjectData[member.member_id][subjectCode]}" /></td>
								<td><a
									href="${pageContext.request.contextPath}/deleteSubjectMember.do?memberId=${member.member_id}">[����]</a></td>
								<td><a
									href="${pageContext.request.contextPath}/deleteSubjectMember.do?memberId=${member.member_id}">[����]</a></td>
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
								<td>[����]</td>
								<td></td>
							</c:if>
							<c:forEach var="subjectCode"
								items="${subjectData[member.member_id].keySet()}"
								varStatus="subStatus">
								<td id="subjectName${status.index}_${subStatus.index}"><c:out
										value="${subjectData[member.member_id][subjectCode]}" /></td>
								<td><a
									href="${pageContext.request.contextPath}/deleteSubjectMember.do?memberId=${member.member_id}">[����]</a></td>
								<td><a
									href="${pageContext.request.contextPath}/deleteSubjectMember.do?memberId=${member.member_id}">[����]</a></td>
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
								<td>[����]</td>
								<td></td>
							</c:if>
							<c:forEach var="subjectCode"
								items="${subjectData[member.member_id].keySet()}"
								varStatus="subStatus">
								<td id="subjectName${status.index}_${subStatus.index}"><c:out
										value="${subjectData[member.member_id][subjectCode]}" /></td>
								<td><a
									href="${pageContext.request.contextPath}/deleteSubjectMember.do?memberId=${member.member_id}">[����]</a></td>
								<td><a
									href="${pageContext.request.contextPath}/deleteSubjectMember.do?memberId=${member.member_id}">[����]</a></td>
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
	<h2>���� ���� ī��</h2>
	<div class="button-container">
		<input type="text" placeholder="�����Ⱓ: �� �� �� ~ �� �� ��">
		<form action="${pageContext.request.contextPath}/getMemberList.do"
			method="get">
			<button type="submit">ȸ�����</button>
		</form>
		<button type="button" onclick="location.href='excel_export.jsp'">�����������</button>
	</div>

	<table class="header-table">
		<tr>
			<th colspan="5">��������</th>
			<th colspan="3">������ ����</th>
			<th>�������� ����</th>
		</tr>
		<tr>
			<th>�޼�</th>
			<th>����</th>
			<th>�����</th>
			<th>�������</th>
			<th>�����ڵ�</th>
			<th>ID</th>
			<th>PW</th>
			<th>A + B / A</th>
			<th>�̸�</th>
		</tr>
		<c:forEach var="member" items="${memberList}" varStatus="status">
			<c:choose>
				<c:when test="${status.index == 0}">
					<tr>
						<td rowspan="12">1��</td>
						<td rowspan="6">1����<br></td>
						<c:if test="${empty subjectData[member.member_id]}">
							<td></td>
							<td>[����]</td>
							<td></td>
						</c:if>
						<c:forEach var="subjectCode"
							items="${subjectData[member.member_id].keySet()}"
							varStatus="subStatus">
							<td id="subjectName${status.index}_${subStatus.index}"><c:out
									value="${subjectData[member.member_id][subjectCode]}" /></td>
							<td><a href="${pageContext.request.contextPath}/deleteSubjectMember.do?memberId=${member.member_id}">[����]</a></td>
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
							<td>[����]</td>
							<td></td>
						</c:if>
						<c:forEach var="subjectCode"
							items="${subjectData[member.member_id].keySet()}"
							varStatus="subStatus">
							<td id="subjectName${status.index}_${subStatus.index}"><c:out
									value="${subjectData[member.member_id][subjectCode]}" /></td>
							<td><a href="${pageContext.request.contextPath}/deleteSubjectMember.do?memberId=${member.member_id}">[����]</a></td>
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
							<td>[����]</td>
							<td></td>
						</c:if>
						<c:forEach var="subjectCode"
							items="${subjectData[member.member_id].keySet()}"
							varStatus="subStatus">
							<td id="subjectName${status.index}_${subStatus.index}"><c:out
									value="${subjectData[member.member_id][subjectCode]}" /></td>
							<td><a href="${pageContext.request.contextPath}/deleteSubjectMember.do?memberId=${member.member_id}">[����]</a></td>
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
							<td>[����]</td>
							<td></td>
						</c:if>
						<c:forEach var="subjectCode"
							items="${subjectData[member.member_id].keySet()}"
							varStatus="subStatus">
							<td id="subjectName${status.index}_${subStatus.index}"><c:out
									value="${subjectData[member.member_id][subjectCode]}" /></td>
							<td><a href="${pageContext.request.contextPath}/deleteSubjectMember.do?memberId=${member.member_id}">[����]</a></td>
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
							<td>[����]</td>
							<td></td>
						</c:if>
						<c:forEach var="subjectCode"
							items="${subjectData[member.member_id].keySet()}"
							varStatus="subStatus">
							<td id="subjectName${status.index}_${subStatus.index}"><c:out
									value="${subjectData[member.member_id][subjectCode]}" /></td>
							<td><a href="${pageContext.request.contextPath}/deleteSubjectMember.do?memberId=${member.member_id}">[����]</a></td>
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
							<td>[����]</td>
							<td></td>
						</c:if>
						<c:forEach var="subjectCode"
							items="${subjectData[member.member_id].keySet()}"
							varStatus="subStatus">
							<td id="subjectName${status.index}_${subStatus.index}"><c:out
									value="${subjectData[member.member_id][subjectCode]}" /></td>
							<td><a href="${pageContext.request.contextPath}/deleteSubjectMember.do?memberId=${member.member_id}">[����]</a></td>
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
						<td rowspan="6">2����<br>
						</td>
						<c:if test="${empty subjectData[member.member_id]}">
							<td></td>
							<td>[����]</td>
							<td></td>
						</c:if>
						<c:forEach var="subjectCode"
							items="${subjectData[member.member_id].keySet()}"
							varStatus="subStatus">
							<td id="subjectName${status.index}_${subStatus.index}"><c:out
									value="${subjectData[member.member_id][subjectCode]}" /></td>
							<td><a href="${pageContext.request.contextPath}/deleteSubjectMember.do?memberId=${member.member_id}">[����]</a></td>
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
							<td>[����]</td>
							<td></td>
						</c:if>
						<c:forEach var="subjectCode"
							items="${subjectData[member.member_id].keySet()}"
							varStatus="subStatus">
							<td id="subjectName${status.index}_${subStatus.index}"><c:out
									value="${subjectData[member.member_id][subjectCode]}" /></td>
							<td><a href="${pageContext.request.contextPath}/deleteSubjectMember.do?memberId=${member.member_id}">[����]</a></td>
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
							<td>[����]</td>
							<td></td>
						</c:if>
						<c:forEach var="subjectCode"
							items="${subjectData[member.member_id].keySet()}"
							varStatus="subStatus">
							<td id="subjectName${status.index}_${subStatus.index}"><c:out
									value="${subjectData[member.member_id][subjectCode]}" /></td>
							<td><a href="${pageContext.request.contextPath}/deleteSubjectMember.do?memberId=${member.member_id}">[����]</a></td>
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
							<td>[����]</td>
							<td></td>
						</c:if>
						<c:forEach var="subjectCode"
							items="${subjectData[member.member_id].keySet()}"
							varStatus="subStatus">
							<td id="subjectName${status.index}_${subStatus.index}"><c:out
									value="${subjectData[member.member_id][subjectCode]}" /></td>
							<td><a href="${pageContext.request.contextPath}/deleteSubjectMember.do?memberId=${member.member_id}">[����]</a></td>
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
							<td>[����]</td>
							<td></td>
						</c:if>
						<c:forEach var="subjectCode"
							items="${subjectData[member.member_id].keySet()}"
							varStatus="subStatus">
							<td id="subjectName${status.index}_${subStatus.index}"><c:out
									value="${subjectData[member.member_id][subjectCode]}" /></td>
							<td><a href="${pageContext.request.contextPath}/deleteSubjectMember.do?memberId=${member.member_id}">[����]</a></td>
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
							<td>[����]</td>
							<td></td>
						</c:if>
						<c:forEach var="subjectCode"
							items="${subjectData[member.member_id].keySet()}"
							varStatus="subStatus">
							<td id="subjectName${status.index}_${subStatus.index}"><c:out
									value="${subjectData[member.member_id][subjectCode]}" /></td>
							<td><a href="${pageContext.request.contextPath}/deleteSubjectMember.do?memberId=${member.member_id}">[����]</a></td>
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
						<td rowspan="14">2��</td>
						<td rowspan="6">1����<br>

						</td>
						<c:if test="${empty subjectData[member.member_id]}">
							<td></td>
							<td>[����]</td>
							<td></td>
						</c:if>
						<c:forEach var="subjectCode"
							items="${subjectData[member.member_id].keySet()}"
							varStatus="subStatus">
							<td id="subjectName${status.index}_${subStatus.index}"><c:out
									value="${subjectData[member.member_id][subjectCode]}" /></td>
							<td><a href="${pageContext.request.contextPath}/deleteSubjectMember.do?memberId=${member.member_id}">[����]</a></td>
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
							<td>[����]</td>
							<td></td>
						</c:if>
						<c:forEach var="subjectCode"
							items="${subjectData[member.member_id].keySet()}"
							varStatus="subStatus">
							<td id="subjectName${status.index}_${subStatus.index}"><c:out
									value="${subjectData[member.member_id][subjectCode]}" /></td>
							<td><a href="${pageContext.request.contextPath}/deleteSubjectMember.do?memberId=${member.member_id}">[����]</a></td>
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
							<td>[����]</td>
							<td></td>
						</c:if>
						<c:forEach var="subjectCode"
							items="${subjectData[member.member_id].keySet()}"
							varStatus="subStatus">
							<td id="subjectName${status.index}_${subStatus.index}"><c:out
									value="${subjectData[member.member_id][subjectCode]}" /></td>
							<td><a href="${pageContext.request.contextPath}/deleteSubjectMember.do?memberId=${member.member_id}">[����]</a></td>
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
							<td>[����]</td>
							<td></td>
						</c:if>
						<c:forEach var="subjectCode"
							items="${subjectData[member.member_id].keySet()}"
							varStatus="subStatus">
							<td id="subjectName${status.index}_${subStatus.index}"><c:out
									value="${subjectData[member.member_id][subjectCode]}" /></td>
							<td><a href="${pageContext.request.contextPath}/deleteSubjectMember.do?memberId=${member.member_id}">[����]</a></td>
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
							<td>[����]</td>
							<td></td>
						</c:if>
						<c:forEach var="subjectCode"
							items="${subjectData[member.member_id].keySet()}"
							varStatus="subStatus">
							<td id="subjectName${status.index}_${subStatus.index}"><c:out
									value="${subjectData[member.member_id][subjectCode]}" /></td>
							<td><a href="${pageContext.request.contextPath}/deleteSubjectMember.do?memberId=${member.member_id}">[����]</a></td>
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
							<td>[����]</td>
							<td></td>
						</c:if>
						<c:forEach var="subjectCode"
							items="${subjectData[member.member_id].keySet()}"
							varStatus="subStatus">
							<td id="subjectName${status.index}_${subStatus.index}"><c:out
									value="${subjectData[member.member_id][subjectCode]}" /></td>
							<td><a href="${pageContext.request.contextPath}/deleteSubjectMember.do?memberId=${member.member_id}">[����]</a></td>
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
						<td rowspan="8">2����<br>
						</td>
						<c:if test="${empty subjectData[member.member_id]}">
							<td></td>
							<td>[����]</td>
							<td></td>
						</c:if>
						<c:forEach var="subjectCode"
							items="${subjectData[member.member_id].keySet()}"
							varStatus="subStatus">
							<td id="subjectName${status.index}_${subStatus.index}"><c:out
									value="${subjectData[member.member_id][subjectCode]}" /></td>
							<td><a href="${pageContext.request.contextPath}/deleteSubjectMember.do?memberId=${member.member_id}">[����]</a></td>
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
							<td>[����]</td>
							<td></td>
						</c:if>
						<c:forEach var="subjectCode"
							items="${subjectData[member.member_id].keySet()}"
							varStatus="subStatus">
							<td id="subjectName${status.index}_${subStatus.index}"><c:out
									value="${subjectData[member.member_id][subjectCode]}" /></td>
							<td><a href="${pageContext.request.contextPath}/deleteSubjectMember.do?memberId=${member.member_id}">[����]</a></td>
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
							<td>[����]</td>
							<td></td>
						</c:if>
						<c:forEach var="subjectCode"
							items="${subjectData[member.member_id].keySet()}"
							varStatus="subStatus">
							<td id="subjectName${status.index}_${subStatus.index}"><c:out
									value="${subjectData[member.member_id][subjectCode]}" /></td>
							<td><a href="${pageContext.request.contextPath}/deleteSubjectMember.do?memberId=${member.member_id}">[����]</a></td>
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
							<td>[����]</td>
							<td></td>
						</c:if>
						<c:forEach var="subjectCode"
							items="${subjectData[member.member_id].keySet()}"
							varStatus="subStatus">
							<td id="subjectName${status.index}_${subStatus.index}"><c:out
									value="${subjectData[member.member_id][subjectCode]}" /></td>
							<td><a href="${pageContext.request.contextPath}/deleteSubjectMember.do?memberId=${member.member_id}">[����]</a></td>
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
							<td>[����]</td>
							<td></td>
						</c:if>
						<c:forEach var="subjectCode"
							items="${subjectData[member.member_id].keySet()}"
							varStatus="subStatus">
							<td id="subjectName${status.index}_${subStatus.index}"><c:out
									value="${subjectData[member.member_id][subjectCode]}" /></td>
							<td><a href="${pageContext.request.contextPath}/deleteSubjectMember.do?memberId=${member.member_id}">[����]</a></td>
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
							<td>[����]</td>
							<td></td>
						</c:if>
						<c:forEach var="subjectCode"
							items="${subjectData[member.member_id].keySet()}"
							varStatus="subStatus">
							<td id="subjectName${status.index}_${subStatus.index}"><c:out
									value="${subjectData[member.member_id][subjectCode]}" /></td>
							<td><a href="${pageContext.request.contextPath}/deleteSubjectMember.do?memberId=${member.member_id}">[����]</a></td>
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
							<td>[����]</td>
							<td></td>
						</c:if>
						<c:forEach var="subjectCode"
							items="${subjectData[member.member_id].keySet()}"
							varStatus="subStatus">
							<td id="subjectName${status.index}_${subStatus.index}"><c:out
									value="${subjectData[member.member_id][subjectCode]}" /></td>
							<td><a href="${pageContext.request.contextPath}/deleteSubjectMember.do?memberId=${member.member_id}">[����]</a></td>
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
							<td>[����]</td>
							<td></td>
						</c:if>
						<c:forEach var="subjectCode"
							items="${subjectData[member.member_id].keySet()}"
							varStatus="subStatus">
							<td id="subjectName${status.index}_${subStatus.index}"><c:out
									value="${subjectData[member.member_id][subjectCode]}" /></td>
							<td><a href="${pageContext.request.contextPath}/deleteSubjectMember.do?memberId=${member.member_id}">[����]</a></td>
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
