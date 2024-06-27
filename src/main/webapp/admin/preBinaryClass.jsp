<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="icon" href="./img/favicon-16x16.png">
<title>선제 이원분류표</title>
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
	white-space: nowrap; /* 넘침 처리 방지 */
	padding: 5px; /* 셀 안 여백 */
	font-size: 14px; /* 글씨 크기 */
	border: 1px solid black;
}

/* 기존의 th와 td 스타일을 유지합니다. */
th, td {
	border: 1px solid black;
	padding: 5px;
	text-align: center;
	vertical-align: middle; /* 세로 중앙 정렬 */
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

/* 하단 테두리 초기 상태 */
.navbar-nav .nav-link::after {
	content: ''; /* 콘텐츠 추가 */
	display: block; /* 블록 레벨 요소로 변경 */
	width: 0; /* 너비 0으로 설정하여 초기에 숨김 */
	height: 2px; /* 높이 2px */
	background: #DB402E; /* 배경 색상 */
	position: absolute;
	left: 0; /* 왼쪽 0 */
	bottom: -9.5px; /* 아래쪽 -9.5px */
	opacity: 0; /* 초기에 숨김 */
}

/* 호버 시 테두리 효과 */
.navbar-nav .nav-link:hover::after {
	width: 100%; /* 호버 시 너비 100%로 확장 */
	opacity: 1; /* 호버 시 보이게 함 */
}

/* 재출제 요청 박스 스타일 */
.resubmit-box {
	width: 40px;
	height: 40px;
	display: flex;
	align-items: center;
	justify-content: center;
	position: relative;
	cursor: pointer;
	margin: auto; /* 가운데 정렬 */
}

.resubmit-box::after {
	content: attr(data-review); /* data-review 속성의 값을 표시 */
	display: none; /* 기본적으로 숨김 */
	position: absolute;
	top: -70px; /* 박스 위에 표시 */
	left: -20px;
	backgronnd-color: #fff;
	border: 1px solid #333;
	padding: 5px;
	white-space: pre-wrap; /* 줄바꿈을 유지 */
}

.resubmit-box:hover::after {
	display: block; /* 마우스를 올렸을 때 표시 */
}

/* 표를 가운데 정렬하는 스타일 */
.table-container {
	width: 100%; /* 컨테이너가 전체 너비를 사용하도록 설정 */
}

/* 대분류, 중분류, 소분류 칸을 넓히기 위한 스타일 추가 */
.wide-column {
	min-width: 150px; /* 출처 부분 최소 너비 지정 */
	max-width: 150px; /* 출처 부분 최대 너비 지정 */
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
					<td>최종<br>문항<br>번호
					</td>
					<td>정답</td>
					<td>출제영역</td>
					<td>출처</td>
					<td colspan="2">출제위원</td>
					<td colspan="2">출제방법</td>
					<td colspan="3">난이도</td>
					<td colspan="3">행동영역</td>
					<td>문항검토의견<br>(문항 오류의 사유 및 출처)
					</td>
					<td></td>
				</tr>
				<tr class="th">
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td>출제위원A</td>
					<td>출제위원B</td>
					<td>문항제작</td>
					<td>기출문제</td>
					<td>상</td>
					<td>중</td>
					<td>하</td>
					<td>지식</td>
					<td>이해</td>
					<td>적용</td>
					<td></td>
					<td>추가</td>
				</tr>
			</thead>
			<tbody>
				<%-- 합계에 쓸 변수 선언하는 부분 --%>
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
										<c:when test="${preBinaryClass.diff == '상'}">
											<c:set var="sumHigh" value="${sumHigh + 1}" />
										</c:when>
										<c:when test="${preBinaryClass.diff == '중'}">
											<c:set var="sumMiddle" value="${sumMiddle + 1}" />
										</c:when>
										<c:when test="${preBinaryClass.diff == '하'}">
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
										<c:when test="${preBinaryClass.exam_type == '문항제작'}">
											<c:set var="sumCre" value="${sumCre + 1}" />
										</c:when>
										<c:when test="${preBinaryClass.exam_type == '기출문제'}">
											<c:set var="sumPas" value="${sumPas + 1}" />
										</c:when>
									</c:choose>
									<c:choose>
										<c:when test="${preBinaryClass.behavioral == '지식'}">
											<c:set var="sumBehavioral1" value="${sumBehavioral1 + 1}" />
										</c:when>
										<c:when test="${preBinaryClass.behavioral == '이해'}">
											<c:set var="sumBehavioral2" value="${sumBehavioral2 + 1}" />
										</c:when>
										<c:when test="${preBinaryClass.behavioral == '적용'}">
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
            ①
        </c:when>
												<c:when test="${preBinaryClass.answer == 2}">
            ②
        </c:when>
												<c:when test="${preBinaryClass.answer == 3}">
            ③
        </c:when>
												<c:when test="${preBinaryClass.answer == 4}">
            ④
        </c:when>
												<c:when test="${preBinaryClass.answer == 5}">
            ⑤
        </c:when>
											</c:choose></td>
										<td>${preBinaryClass.categoryNumbers}</td>
										<td>${preBinaryClass.reference}</td>
										<td>${preBinaryClass.member_name == memberAB.memberA ? 1 : ''}</td>
										<td>${preBinaryClass.member_name == memberAB.memberB ? 1 : ''}</td>
										<td>${preBinaryClass.exam_type == '문항제작' ? '제작' : ''}</td>
										<td>${preBinaryClass.exam_type == '기출문제' ? '기출' : ''}</td>
										<td>${preBinaryClass.diff == '상' ? 1 : ''}</td>
										<td>${preBinaryClass.diff == '중' ? 1 : ''}</td>
										<td>${preBinaryClass.diff == '하' ? 1 : ''}</td>
										<td>${preBinaryClass.behavioral == '지식' ? 1 : ''}</td>
										<td>${preBinaryClass.behavioral == '이해' ? 1 : ''}</td>
										<td>${preBinaryClass.behavioral == '적용' ? 1 : ''}</td>
										<td>${preBinaryClass.review}</td>
										<td>
											<button type="button"
												onclick="openInsertFormModal(${i}, '${member.member_id}')"
												class="button-approve" style="background-color: #A5AAA3">추가</button>
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
											class="button-approve" style="background-color: #A5AAA3">추가</button></td>
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
										class="button-approve" style="background-color: #A5AAA3">추가</button></td>
							</tr>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</tbody>
			<tfoot>
				<tr class="tbt">
					<td colspan="4" class="table-light" style="font-weight: bold;">합계</td>
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
					<td class="table-light" style="font-weight: bold;">문제 갯수 합</td>
					<td>${sumQuestion}</td>
				</tr>
			</tfoot>
		</table>
		
	</div>
	<br>
	<h3>◎ 정답지 분포</h3>
	<div class="table-container">
		<table class="table table-bordered">
			<thead class="table-light">
				<tr class="th">
					<td>답지</td>
					<td>①</td>
					<td>②</td>
					<td>③</td>
					<td>④</td>
					<td>⑤</td>
				</tr>
			</thead>
			<tbody>
			<tr>
			<td class="table-light" style="font-weight: bold;">빈도</td>
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
	<h3>◎ 예상정답률 분포 및 기대 점수</h3>
	<div class="table-container">
		<table class="table table-bordered">
			<thead class="table-light">
				<tr class="th">
					<td>난이도</td>
					<td>상</td>
					<td>중</td>
					<td>하</td>
					<td>기대 점수</td>
				</tr>
			</thead>
			<tbody>
			<tr>
			<td class="table-light" style="font-weight: bold;">빈도</td>
			<td>${sumHigh}</td>
			<td>${sumMiddle}</td>
			<td>${sumLow}</td>
			<c:set var="correctRate" value="${(sumHigh * 0.5 + sumMiddle * 0.75 + sumLow) * 4}" />
			<td>( ${correctRate} ) / 100</td>
			</tr>
			</tbody>
		</table>
	</div>
	<!-- 추가 버튼 클릭 시 열릴 새 창 설정 -->
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
					<h5 class="modal-title" id="insertFormModalLabel">추가</h5>
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
