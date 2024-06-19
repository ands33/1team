<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
</style>
<script>
function limitSelection(selectElement) {
    var selectedOptions = selectElement.selectedOptions;
    if (selectedOptions.length > 3) {
        alert("최대 3개의 항목만 선택할 수 있습니다.");
        selectElement.selectedIndex = -1;
    }
}

function addSubject(rowIdx) {
    var selectElement = document.getElementById("subjectSelect" + rowIdx);
    var selectedOptions = selectElement.selectedOptions;
    
    var subjects = [];
    var subjectCodes = [];

    for (var i = 0; i < selectedOptions.length; i++) {
        subjects.push(selectedOptions[i].text);
        subjectCodes.push(selectedOptions[i].value);
    }

    document.getElementById("subjectName" + rowIdx).innerText = subjects.join(", ");
    document.getElementById("subjectCode" + rowIdx).innerText = subjectCodes.join(", ");
}
</script>
</head>
<body>

	<h2>출제 문항 카드</h2>

	<div class="button-container">
		<input type="text" placeholder="출제기간: 년 월 일 ~ 년 월 일">
		<form action="${pageContext.request.contextPath}/getMemberList.do"
			method="get">
			<button type="submit">회원목록</button>
		</form>
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
		<c:forEach var="member" items="${memberList}" varStatus="status">
			<c:choose>
				<c:when test="${status.index == 0}">
					<tr>
						<td rowspan="12">1급</td>
						<td rowspan="6">
							1교시<br>
							<select id="subjectSelect${status.index}" multiple size="5" onchange="limitSelection(this); addSubject(${status.index});">
								<c:forEach var="card" items="${cardList1}">
									<option value="${card.subject_code}">${card.subject_name}</option>
								</c:forEach>
							</select>
						</td>
						<td id="subjectName${status.index}">상담철학과 윤리</td>
						<td>[삭제]</td>
						<td id="subjectCode${status.index}">11</td>
						<td>${member.member_id}</td>
						<td>${member.pw}</td>
						<td>○</td>
						<td>${member.member_name}</td>
					</tr>
				</c:when>
				<c:when test="${status.index == 1}">
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td>${member.member_id}</td>
						<td>${member.pw}</td>
						<td>○</td>
						<td>${member.member_name}</td>
					</tr>
				</c:when>
				<c:when test="${status.index == 2}">
					<tr>
						<td>고급상담 이론과 실제</td>
						<td>[삭제]</td>
						<td>12</td>
						<td>${member.member_id}</td>
						<td>${member.pw}</td>
						<td>○</td>
						<td>${member.member_name}</td>
					</tr>
				</c:when>
				<c:when test="${status.index == 3}">
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td>${member.member_id}</td>
						<td>${member.pw}</td>
						<td>○</td>
						<td>${member.member_name}</td>
					</tr>
				</c:when>
				<c:when test="${status.index == 4}">
					<tr>
						<td>집단상담 프로그램 개발</td>
						<td>[삭제]</td>
						<td>13</td>
						<td>${member.member_id}</td>
						<td>${member.pw}</td>
						<td>○</td>
						<td>${member.member_name}</td>
					</tr>
				</c:when>
				<c:when test="${status.index == 5}">
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td>${member.member_id}</td>
						<td>${member.pw}</td>
						<td>○</td>
						<td>${member.member_name}</td>
					</tr>
				</c:when>
				<c:when test="${status.index == 6}">
					<tr>
						<td rowspan="6">
							2교시<br>
							<select id="subjectSelect2${status.index}" multiple size="5" onchange="limitSelection(this); addSubject('2${status.index}');">
								<c:forEach var="card" items="${cardList1}">
									<option value="${card.subject_code}">${card.subject_name}</option>
								</c:forEach>
							</select>
						</td>
						<td>심리평가와 진단</td>
						<td>[삭제]</td>
						<td>21</td>
						<td>${member.member_id}</td>
						<td>${member.pw}</td>
						<td>○</td>
						<td>${member.member_name}</td>
					</tr>
				</c:when>
				<c:when test="${status.index == 7}">
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td>${member.member_id}</td>
						<td>${member.pw}</td>
						<td>○</td>
						<td>${member.member_name}</td>
					</tr>
				</c:when>
				<c:when test="${status.index == 8}">
					<tr>
						<td>고급 상담연구방법론</td>
						<td>[삭제]</td>
						<td>14</td>
						<td>${member.member_id}</td>
						<td>${member.pw}</td>
						<td>○</td>
						<td>${member.member_name}</td>
					</tr>
				</c:when>
				<c:when test="${status.index == 9}">
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td>${member.member_id}</td>
						<td>${member.pw}</td>
						<td>○</td>
						<td>${member.member_name}</td>
					</tr>
				</c:when>
				<c:when test="${status.index == 10}">
					<tr>
						<td>상담슈퍼비전의 이론과 실제</td>
						<td>[삭제]</td>
						<td>22</td>
						<td>${member.member_id}</td>
						<td>${member.pw}</td>
						<td>○</td>
						<td>${member.member_name}</td>
					</tr>
				</c:when>
				<c:when test="${status.index == 11}">
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td>${member.member_id}</td>
						<td>${member.pw}</td>
						<td>○</td>
						<td>${member.member_name}</td>
					</tr>
				</c:when>
				<c:when test="${status.index == 12}">
					<tr>
						<td rowspan="14">2급</td>
						<td rowspan="6">
							1교시<br>
							<select id="subjectSelect3${status.index}" multiple size="5" onchange="limitSelection(this); addSubject('3${status.index}');">
								<c:forEach var="card" items="${cardList2}">
									<option value="${card.subject_code}">${card.subject_name}</option>
								</c:forEach>
							</select>
						</td>
						<td>상담윤리</td>
						<td>[삭제]</td>
						<td>11</td>
						<td>${member.member_id}</td>
						<td>${member.pw}</td>
						<td>○</td>
						<td>${member.member_name}</td>
					</tr>
				</c:when>
				<c:when test="${status.index == 13}">
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td>${member.member_id}</td>
						<td>${member.pw}</td>
						<td>○</td>
						<td>${member.member_name}</td>
					</tr>
				</c:when>
				<c:when test="${status.index == 14}">
					<tr>
						<td>상담이론과 실제</td>
						<td>[삭제]</td>
						<td>23</td>
						<td>${member.member_id}</td>
						<td>${member.pw}</td>
						<td>○</td>
						<td>${member.member_name}</td>
					</tr>
				</c:when>
				<c:when test="${status.index == 15}">
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td>${member.member_id}</td>
						<td>${member.pw}</td>
						<td>○</td>
						<td>${member.member_name}</td>
					</tr>
				</c:when>
				<c:when test="${status.index == 16}">
					<tr>
						<td>집단상담 이론과 실제</td>
						<td>[삭제]</td>
						<td>12</td>
						<td>${member.member_id}</td>
						<td>${member.pw}</td>
						<td>○</td>
						<td>${member.member_name}</td>
					</tr>
				</c:when>
				<c:when test="${status.index == 17}">
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td>${member.member_id}</td>
						<td>${member.pw}</td>
						<td>○</td>
						<td>${member.member_name}</td>
					</tr>
				</c:when>
				<c:when test="${status.index == 18}">
					<tr>
						<td rowspan="8">
							2교시<br>
							<select id="subjectSelect4${status.index}" multiple size="5" onchange="limitSelection(this); addSubject('4${status.index}');">
								<c:forEach var="card" items="${cardList2}">
									<option value="${card.subject_code}">${card.subject_name}</option>
								</c:forEach>
							</select>
						</td>
						<td>심리검사와 상담</td>
						<td>[삭제]</td>
						<td>21</td>
						<td>${member.member_id}</td>
						<td>${member.pw}</td>
						<td>○</td>
						<td>${member.member_name}</td>
					</tr>
				</c:when>
				<c:when test="${status.index == 19}">
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td>${member.member_id}</td>
						<td>${member.pw}</td>
						<td>○</td>
						<td>${member.member_name}</td>
					</tr>
				</c:when>
				<c:when test="${status.index == 20}">
					<tr>
						<td>상담연구방법론</td>
						<td>[삭제]</td>
						<td>22</td>
						<td>${member.member_id}</td>
						<td>${member.pw}</td>
						<td>○</td>
						<td>${member.member_name}</td>
					</tr>
				</c:when>
				<c:when test="${status.index == 21}">
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td>${member.member_id}</td>
						<td>${member.pw}</td>
						<td>○</td>
						<td>${member.member_name}</td>
					</tr>
				</c:when>
				<c:when test="${status.index == 22}">
					<tr>
						<td>진로상담</td>
						<td>[삭제]</td>
						<td>23</td>
						<td>${member.member_id}</td>
						<td>${member.pw}</td>
						<td>○</td>
						<td>${member.member_name}</td>
					</tr>
				</c:when>
				<c:when test="${status.index == 23}">
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td>${member.member_id}</td>
						<td>${member.pw}</td>
						<td>○</td>
						<td>${member.member_name}</td>
					</tr>
				</c:when>
				<c:when test="${status.index == 24}">
					<tr>
						<td>가족상담</td>
						<td>[삭제]</td>
						<td>23</td>
						<td>${member.member_id}</td>
						<td>${member.pw}</td>
						<td>○</td>
						<td>${member.member_name}</td>
					</tr>
				</c:when>
				<c:when test="${status.index == 25}">
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td>${member.member_id}</td>
						<td>${member.pw}</td>
						<td>○</td>
						<td>${member.member_name}</td>
					</tr>
				</c:when>
			</c:choose>
		</c:forEach>
	</table>

</body>
</html>
