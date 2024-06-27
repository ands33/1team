<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert Form</title>
<style>
body, table, th, td, input, select, textarea, div, a, p, span, strong, b,
	i, ul, ol, li, button {
	font-family: "Montserrat", "Noto Sans KR", sans-serif;
	font-size: 15px;
	letter-spacing: -0.05em;
	line-height: 1.6em;
	color: #333;
}

th {
	white-space: nowrap;
	border: 1px solid black;
	padding: 10px;
	font-weight: bold;
	font-size: 14px;
	border-top: 1px solid #DB402E; /* 추가할 border-top 속성 */
}

table-light {
	white-space: nowrap;
	border: 1px solid black;
	padding: 10px;
	font-weight: bold;
	font-size: 14px;
	border-top: 1px solid #DB402E; /* 추가할 border-top 속성 */
}

td {
	border: 1px solid black;
	padding: 8px;
	text-align: left;
	border: 1px solid black;
	padding: 8px;
	text-align: left;
}

/* Navbar */
.navbar {
	border-top: 1px solid #D8D9DA;
	border-bottom: 3px solid #F5F5F5;
	height: 50px;
	display: flex;
	align-items: center;
	justify-content: center;
	font-weight: bold;
	font-size: 14px;
}

.navbar-nav {
	display: flex;
	justify-content: center;
	align-items: center;
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
	position: relative;
}

.navbar-nav .nav-link::after {
	content: '';
	display: block;
	width: 0;
	height: 2px;
	background: #DB402E;
	position: absolute;
	left: 0;
	bottom: -9.5px;
	opacity: 0;
}

.navbar-nav .nav-link:hover::after {
	width: 100%;
	opacity: 1;
}

.header-links a {
	text-decoration: none;
	color: black;
}

.header-links a:hover {
	color: #D8402A;
}

/* Re-submission box */
.resubmit-box {
	width: 70px;
	height: 40px;
	border: 1px solid #333;
	display: flex;
	align-items: center;
	justify-content: center;
	position: relative;
	cursor: pointer;
}

.resubmit-box::after {
	content: attr(data-review);
	display: none;
	position: absolute;
	width: 100px;
	top: 0;
	left: 0;
	background-color: #fff;
	border: 1px solid #333;
	padding: 5px;
	white-space: pre-wrap;
}

.resubmit-box:hover::after {
	display: block;
}

/* Button styles */
.btn {
	border-radius: 12px;
	padding: 6px 12px;
	font-size: 14px;
	margin: 2px;
	cursor: pointer;
	display: inline-block;
	text-align: center;
	text-decoration: none;
	color: white;
	font-weight: bold;
}

.btn-submit {
	background-color: #007bff;
}

.btn-re-review {
	background-color: #28a745;
}

.btn-pending {
	background-color: #ffc107;
	color: black;
}

.btn-approve {
	display: block;
	background-color: #dc3545;
	width: 100%;
}

/* Label container */
.label-container {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 10px;
}

/* Legend */
.legend {
	display: flex;
	flex-direction: column;
	font-family: Arial, sans-serif;
	border: 1px solid #ccc;
	padding: 10px;
	width: 300px;
}

/* Table */
.table-container {
	width: 70%;
	margin-right: 10px;
}

table {
	width: 100%;
	border-collapse: collapse;
}

th, td {
	border: 1px solid #ccc;
	padding: 10px;
	text-align: center;
}
</style>
<script>
function submitForm(event) {
    event.preventDefault(); // 폼 제출 방지

    // 폼 데이터를 비동기로 전송 (AJAX)
    var xhr = new XMLHttpRequest();
    xhr.open('POST', event.target.action, true);
    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');

    xhr.onreadystatechange = function() {
        if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
            // 폼 전송 완료 후 모달 창 닫기
            window.parent.document.getElementById('insertFormModal').classList.remove('show');
            window.parent.document.getElementsByClassName('modal-backdrop')[0].remove();

            // 부모 창에서 동적으로 폼을 생성하고 getPreBinaryClass.do로 POST 방식으로 전송
            var memberId = document.querySelector('input[name="member_id"]').value;

            var form = window.parent.document.createElement('form');
            form.method = 'POST';
            form.action = 'getPreBinaryClass.do';

            var input = window.parent.document.createElement('input');
            input.type = 'hidden';
            input.name = 'member_id';
            input.value = memberId;
            form.appendChild(input);

            window.parent.document.body.appendChild(form);
            form.submit();
        }
    };

    var formData = new FormData(event.target);
    var encodedData = new URLSearchParams(formData).toString();
    xhr.send(encodedData);
}
</script>
</head>
<body>
	<%
	String t_num = request.getParameter("t_num");
	request.setAttribute("t_num", t_num);
	%>

	<h2>
		${t_num}번 문제로 추가하기<br> <b><u>출제 완료된 문제</b></u>
	</h2>
	<input type="hidden" name="t_num" value="${t_num}" />
	<input type="hidden" name="member_id" value="${member.member_id}" />
	<div class="header"></div>
	<br>
	<table class="table table-bordered">
		<thead class="table-light">
			<tr align="center">
				<th>번호</th>
				<th>출제 과목</th>
				<th>분류코드</th>
				<th>난이도</th>
				<th>문제 (20자까지 표시)</th>
				<th>유형</th>
				<th>출제위원</th>
				<th>정답</th>
				<th>검토의견</th>
				<th>추가</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="getInsertExam" items="${getInsertExamList}">
				<tr>
					<td>${getInsertExam.num}</td>
					<td>${getInsertExam.name}</td>
					<td>${getInsertExam.categoryNumbers}</td>
					<td>${getInsertExam.diff}</td>
					<td>${getInsertExam.question}</td>
					<td>${getInsertExam.behavioral}</td>
					<td>${getInsertExam.member_name}</td>
					<td>${getInsertExam.answer}</td>
					<td>
						<div class="resubmit-box" data-review="${getInsertExam.review}">검토의견</div>
					</td>
					<td><form action="insertData.do" method="post"
							onsubmit="submitForm(event)">
							<input type="hidden" name="num" value="${getInsertExam.num}" />
							<input type="hidden" name="t_num" value="${t_num}" /> <input
								type="hidden" name="member_id" value="${member.member_id}" />
							<button type="submit" >추가</button>
						</form></td>

				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>