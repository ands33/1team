<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="icon" href="./img/favicon-16x16.png">
<title>���� �̿��з�ǥ</title>
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
	padding: 5px; /* �� �� ���� */
	font-size: 14px; /* �۾� ũ�� */
	border: 1px solid black;
}

/* ������ th�� td ��Ÿ���� �����մϴ�. */
th, td {
	border: 1px solid black;
	padding: 5px;
	text-align: center;
	vertical-align: middle; /* ���� �߾� ���� */
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
	width: 40px;
	height: 40px;
	display: flex;
	align-items: center;
	justify-content: center;
	position: relative;
	cursor: pointer;
	margin: auto; /* ��� ���� */
}

.resubmit-box::after {
	content: attr(data-review); /* data-review �Ӽ��� ���� ǥ�� */
	display: none; /* �⺻������ ���� */
	position: absolute;
	top: -70px; /* �ڽ� ���� ǥ�� */
	left: -20px;
	backgronnd-color: #fff;
	border: 1px solid #333;
	padding: 5px;
	white-space: pre-wrap; /* �ٹٲ��� ���� */
}

.resubmit-box:hover::after {
	display: block; /* ���콺�� �÷��� �� ǥ�� */
}

/* ǥ�� ��� �����ϴ� ��Ÿ�� */
.table-container {
	width: 100%; /* �����̳ʰ� ��ü �ʺ� ����ϵ��� ���� */
}

/* ��з�, �ߺз�, �Һз� ĭ�� ������ ���� ��Ÿ�� �߰� */
.wide-column {
	min-width: 150px; /* ��ó �κ� �ּ� �ʺ� ���� */
	max-width: 150px; /* ��ó �κ� �ִ� �ʺ� ���� */
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
	<div class="table-container">
		<table class="table table-bordered">
			<thead class="table-light">
				<tr class="twh">
					<td>����<br>����<br>��ȣ
					</td>
					<td>����</td>
					<td>��������</td>
					<td>��ó</td>
					<td colspan="2">��������</td>
					<td colspan="2">�������</td>
					<td colspan="3">���̵�</td>
					<td colspan="3">�ൿ����</td>
					<td>���װ����ǰ�<br>(���� ������ ���� �� ��ó)
					</td>
					<td></td>
				</tr>
				<tr class="th">
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td>��������A</td>
					<td>��������B</td>
					<td>��������</td>
					<td>���⹮��</td>
					<td>��</td>
					<td>��</td>
					<td>��</td>
					<td>����</td>
					<td>����</td>
					<td>����</td>
					<td></td>
					<td>�߰�</td>
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
				<c:set var="sumQuestion" value="0" />
				<c:forEach var="i" begin="1" end="25">

					<c:choose>
						<c:when test="${fn:length(preBinaryClassList) > 0}">
							<c:set var="found" value="false" />
							<c:forEach var="preBinaryClass" items="${preBinaryClassList}">
								<c:if test="${preBinaryClass.t_num == i}">
									<c:choose>
										<c:when test="${preBinaryClass.diff == '��'}">
											<c:set var="sumHigh" value="${sumHigh + 1}" />
										</c:when>
										<c:when test="${preBinaryClass.diff == '��'}">
											<c:set var="sumMiddle" value="${sumMiddle + 1}" />
										</c:when>
										<c:when test="${preBinaryClass.diff == '��'}">
											<c:set var="sumLow" value="${sumLow + 1}" />
										</c:when>
									</c:choose>
									<c:choose>
										<c:when
											test="${preBinaryClass.member_name == memberAB.memberA}">
											<c:set var="sumName1" value="${sumName1 + 1}" />
										</c:when>
										<c:when
											test="${preBinaryClass.member_name == memberAB.memberB}">
											<c:set var="sumName2" value="${sumName2 + 1}" />
										</c:when>
									</c:choose>
									<c:choose>
										<c:when test="${preBinaryClass.exam_type == '��������'}">
											<c:set var="sumCre" value="${sumCre + 1}" />
										</c:when>
										<c:when test="${preBinaryClass.exam_type == '���⹮��'}">
											<c:set var="sumPas" value="${sumPas + 1}" />
										</c:when>
									</c:choose>
									<c:choose>
										<c:when test="${preBinaryClass.behavioral == '����'}">
											<c:set var="sumBehavioral1" value="${sumBehavioral1 + 1}" />
										</c:when>
										<c:when test="${preBinaryClass.behavioral == '����'}">
											<c:set var="sumBehavioral2" value="${sumBehavioral2 + 1}" />
										</c:when>
										<c:when test="${preBinaryClass.behavioral == '����'}">
											<c:set var="sumBehavioral3" value="${sumBehavioral3 + 1}" />
										</c:when>
									</c:choose>
									<c:choose>
										<c:when test="${preBinaryClass.answer == 1}">
											<c:set var="sumAnswer1" value="${sumAnswer1 + 1}" />
										</c:when>
										<c:when test="${preBinaryClass.answer == 2}">
											<c:set var="sumAnswer2" value="${sumAnswer2 + 1}" />
										</c:when>
										<c:when test="${preBinaryClass.answer == 3}">
											<c:set var="sumAnswer3" value="${sumAnswer3 + 1}" />
										</c:when>
										<c:when test="${preBinaryClass.answer == 4}">
											<c:set var="sumAnswer4" value="${sumAnswer4 + 1}" />
										</c:when>
										<c:when test="${preBinaryClass.answer == 5}">
											<c:set var="sumAnswer5" value="${sumAnswer5 + 1}" />
										</c:when>
									</c:choose>
									<c:set var="sumQuestion" value="${sumQuestion + 1}" />
									<tr>
										<td>${i}</td>
										<td><c:choose>
												<c:when test="${preBinaryClass.answer == 1}">
            ��
        </c:when>
												<c:when test="${preBinaryClass.answer == 2}">
            ��
        </c:when>
												<c:when test="${preBinaryClass.answer == 3}">
            ��
        </c:when>
												<c:when test="${preBinaryClass.answer == 4}">
            ��
        </c:when>
												<c:when test="${preBinaryClass.answer == 5}">
            ��
        </c:when>
											</c:choose></td>
										<td>${preBinaryClass.categoryNumbers}</td>
										<td>${preBinaryClass.reference}</td>
										<td>${preBinaryClass.member_name == memberAB.memberA ? 1 : ''}</td>
										<td>${preBinaryClass.member_name == memberAB.memberB ? 1 : ''}</td>
										<td>${preBinaryClass.exam_type == '��������' ? '����' : ''}</td>
										<td>${preBinaryClass.exam_type == '���⹮��' ? '����' : ''}</td>
										<td>${preBinaryClass.diff == '��' ? 1 : ''}</td>
										<td>${preBinaryClass.diff == '��' ? 1 : ''}</td>
										<td>${preBinaryClass.diff == '��' ? 1 : ''}</td>
										<td>${preBinaryClass.behavioral == '����' ? 1 : ''}</td>
										<td>${preBinaryClass.behavioral == '����' ? 1 : ''}</td>
										<td>${preBinaryClass.behavioral == '����' ? 1 : ''}</td>
										<td>${preBinaryClass.review}</td>
										<td>
											<button type="button"
												onclick="openInsertFormModal(${i}, '${member.member_id}')"
												class="button-approve" style="background-color: #A5AAA3">�߰�</button>
										</td>
									</tr>
									<c:set var="found" value="true" />
								</c:if>
							</c:forEach>
							<c:if test="${!found}">
								<tr>
									<td>${i}</td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td><button type="button"
											onclick="openInsertFormModal(${i}, '${member.member_id}')"
											class="button-approve" style="background-color: #A5AAA3">�߰�</button></td>
								</tr>
							</c:if>
						</c:when>
						<c:otherwise>
							<tr>
								<td>${i}</td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td><button type="button"
										onclick="openInsertFormModal(${i}, '${member.member_id}')"
										class="button-approve" style="background-color: #A5AAA3">�߰�</button></td>
							</tr>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</tbody>
			<tfoot>
				<tr class="tbt">
					<td colspan="4" class="table-light" style="font-weight: bold;">�հ�</td>
					<td>${sumName1}</td>
					<td>${sumName2}</td>
					<td>${sumCre}</td>
					<td>${sumPas}</td>
					<td>${sumHigh}</td>
					<td>${sumMiddle}</td>
					<td>${sumLow}</td>
					<td>${sumBehavioral1}</td>
					<td>${sumBehavioral2}</td>
					<td>${sumBehavioral3}</td>
					<td class="table-light" style="font-weight: bold;">���� ���� ��</td>
					<td>${sumQuestion}</td>
				</tr>
			</tfoot>
		</table>
		
	</div>
	<br>
	<h3>�� ������ ����</h3>
	<div class="table-container">
		<table class="table table-bordered">
			<thead class="table-light">
				<tr class="th">
					<td>����</td>
					<td>��</td>
					<td>��</td>
					<td>��</td>
					<td>��</td>
					<td>��</td>
				</tr>
			</thead>
			<tbody>
			<tr>
			<td class="table-light" style="font-weight: bold;">��</td>
			<td>${sumAnswer1}</td>
			<td>${sumAnswer2}</td>
			<td>${sumAnswer3}</td>
			<td>${sumAnswer4}</td>
			<td>${sumAnswer5}</td>
			</tr>
			</tbody>
		</table>
	</div>
	<br>
	<h3>�� ��������� ���� �� ��� ����</h3>
	<div class="table-container">
		<table class="table table-bordered">
			<thead class="table-light">
				<tr class="th">
					<td>���̵�</td>
					<td>��</td>
					<td>��</td>
					<td>��</td>
					<td>��� ����</td>
				</tr>
			</thead>
			<tbody>
			<tr>
			<td class="table-light" style="font-weight: bold;">��</td>
			<td>${sumHigh}</td>
			<td>${sumMiddle}</td>
			<td>${sumLow}</td>
			<c:set var="correctRate" value="${(sumHigh * 0.5 + sumMiddle * 0.75 + sumLow) * 4}" />
			<td>( ${correctRate} ) / 100</td>
			</tr>
			</tbody>
		</table>
	</div>
	<!-- �߰� ��ư Ŭ�� �� ���� �� â ���� -->
	<script>
    function openInsertFormModal(t_num, member_id) {
        const iframe = document.getElementById('insertFormIframe');
        iframe.src = 'getInsertForm.do?t_num=' + t_num + '&member_id=' + member_id;
        const insertFormModal = new bootstrap.Modal(document.getElementById('insertFormModal'));
        insertFormModal.show();
    }
    </script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
	<div class="modal fade" id="insertFormModal" tabindex="-1"
		aria-labelledby="insertFormModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="insertFormModalLabel">�߰�</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<iframe id="insertFormIframe" src="" width="100%" height="400px"
						frameborder="0"></iframe>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
