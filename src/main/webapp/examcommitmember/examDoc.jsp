<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>출제계획서</title>
</head>
<body>
	<form action="getexamDocList.do" method="post">
		<table align="center" border="1">
			<tr>
				<th colspan="10">출제계획서</th>
			</tr>
			<tr>
				<td colspan="10">과목명: 상담윤리와 철학</td>
			</tr>
			<tr>
				<td colspan="10">출제위원: (A)조성혁 (B)user B</td>
			</tr>
			<tr>
				<th colspan="4">출제영역</th>
				<th colspan="4">난이도별 문제수</th>
				<th colspan="2">출제위원</th>
			</tr>
			</form>
			<div border="1">
				<tr>
					<th>분류번호</th>
					<th>대분류</th>
					<th>중분류</th>
					<th>소분류</th>
					<th>상</th>
					<th>중</th>
					<th>하</th>
					<th>합계</th>
					<th>A</th>
					<th>B</th>
				</tr>
				<c:forEach items="${ExamDocSub}" var="examdocsub">
					<tr>
						<th>${examdocsub.categoryNumbers}</th>
						<c:choose>
							<c:when test="${examdocsub.rowspanC1 > 0}">
								<th rowspan="${examdocsub.rowspanC1}">${examdocsub.category1}</th>
							</c:when>
						</c:choose>
						<th>${examdocsub.category2}</th>
						<th>${examdocsub.category3}</th>
						<th>1</th>
						<th>0</th>
						<th>1</th>
						<th>1</th>
						<th>1</th>
						<th>0</th>
					</tr>
				</c:forEach>
				<tr>
					<th colspan="4" rowspan="2">합계</th>
					<th>2</th>
					<th>2</th>
					<th>1</th>
					<th>5</th>
					<th rowspan="2">3</th>
					<th rowspan="2">2</th>
				</tr>
				<tr>
					<th colspan="3">예상정답률</th>
					<th>40</th>
				</tr>
				<tr>
					<th colspan="10">[저장]</th>
				</tr>
				<tr>
					<td colspan="10">- 난이도의 분포도 확인</td>
				</tr>
				<tr>
					<td colspan="10">상 : 20%내외 (5-6문항)</td>
				</tr>
				<tr>
					<td colspan="10">중 : 50%내외 (13-15문항)</td>
				</tr>
				<tr>
					<td colspan="10">하 : 30%내외 (8-9문항)</td>
				</tr>
				<tr>
					<td colspan="10">-예상정답률 분포에 기초 [(상*0.5)+(중*0.75)+(하*1.0)]*4
						공식을 적용하여 과목별 기대점수를 산출(기대점수는 70/100을 유지하도록 한다)
				</tr>
			</div>
		</table>
	</form>
</body>
</html>
<%--
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>출제계획서</title>
</head>
<body>
	<form action="getexamDocList.do" method="post">
		<table align="center" border="1">
			<tr>
				<th colspan="10">출제계획서</th>
			</tr>
			<tr>
				<td colspan="10">과목명: 상담윤리와 철학</td>
			</tr>
			<tr>
				<td colspan="10">출제위원: (A)${memberNames['A']}
					(B)${memberNames['B']}</td>
			</tr>
			<tr>
				<th colspan="4">출제영역</th>
				<th colspan="4">난이도별 문제수</th>
				<th colspan="2">출제위원</th>
			</tr>
			</form>
			<div border="1">
				<tr>
					<th>분류번호</th>
					<th>대분류</th>
					<th>중분류</th>
					<th>소분류</th>
					<th>상</th>
					<th>중</th>
					<th>하</th>
					<th>합계</th>
					<th>${memberNames['A']}</th>
					<th>${memberNames['B']}</th>
				</tr>
				<c:forEach items="${ExamDocList}" var="examdoc">
					<tr>
						<th>${examdoc.categoryNumbers}</th>
						<c:choose>
							<c:when test="${examdoc.rowspanC1 > 0}">
								<th rowspan="${examdoc.rowspanC1}">${examdoc.category1}</th>
							</c:when>
						</c:choose>
						<c:choose>
							<c:when test="${examdoc.rowspanC2 > 0}">
								<th rowspan="${examdoc.rowspanC2}">${examdoc.category2}</th>
							</c:when>
						</c:choose>
						<th>${examdoc.category3}</th>

						<!-- 상/중 값에 따른 계산 및 합계 업데이트 -->
						<c:set var="upperValue" value="0" />
						<c:set var="middleValue" value="0" />
						<c:set var="lowerValue" value="0" />
						<c:set var="A_member" value="0" />
						<c:set var="B_member" value="0" />

						<th><c:choose>
								<c:when test="${examdoc.diff == '상'}">
									<c:set var="upperValue" value="1" />1</c:when>
								<c:otherwise>0</c:otherwise>
							</c:choose></th>
						<th><c:choose>
								<c:when test="${examdoc.diff == '중'}">
									<c:set var="middleValue" value="1" />1</c:when>
								<c:otherwise>0</c:otherwise>
							</c:choose></th>
						<th><c:choose>
								<c:when test="${examdoc.diff == '하'}">
									<c:set var="lowerValue" value="1" />1</c:when>
								<c:otherwise>0</c:otherwise>
							</c:choose></th>

						<c:set var="sum" value="${upperValue + middleValue + lowerValue}" />
						<th>${sum}</th>

						<th><c:choose>
								<c:when test="${examdoc.member_type == 'A'}">
									<c:set var="A_member" value="1" />1</c:when>
								<c:otherwise>0</c:otherwise>
							</c:choose></th>
						<th><c:choose>
								<c:when test="${examdoc.member_type == 'B'}">
									<c:set var="B_member" value="1" />1</c:when>
								<c:otherwise>0</c:otherwise>
							</c:choose></th>
					</tr>

					<!-- 전체 합계에 더하기 -->
					<c:set var="totalSum" value="${totalSum + sum}" />
					<c:set var="totalUpper" value="${totalUpper + upperValue}" />
					<c:set var="totalMiddle" value="${totalMiddle + middleValue}" />
					<c:set var="totalLower" value="${totalLower + lowerValue}" />
					<c:set var="totalAmember" value="${totalAmember + A_member}" />
					<c:set var="totalBmember" value="${totalBmember + B_member}" />

				</c:forEach>
			<tr>
				<th colspan="4" rowspan="2">합계</th>
				<th>${totalUpper}</th>
				<th>${totalMiddle}</th>
				<th>${totalLower}</th>
				<th>${totalSum}</th>
				<th rowspan="2">${totalAmember}</th>
				<th rowspan="2">${totalBmember}</th>
			</tr>
			<tr>
				<th colspan="3">예상정답률</th>
				<th><c:set var="expectedCorrectRate" value="${(totalUpper * 0.5 + totalMiddle * 0.75 + totalLower) * 4}" />
					${expectedCorrectRate}</th>
			</tr>
			<tr>
				<th colspan="10">[저장]</th>
			</tr>
			<tr>
				<td colspan="10">- 난이도의 분포도 확인</td>
			</tr>
			<tr>
				<td colspan="10">상 : 20%내외 (5-6문항)</td>
			</tr>
			<tr>
				<td colspan="10">중 : 50%내외 (13-15문항)</td>
			</tr>
			<tr>
				<td colspan="10">하 : 30%내외 (8-9문항)</td>
			</tr>
			<tr>
				<td colspan="10">-예상정답률 분포에 기초 [(상*0.5)+(중*0.75)+(하*1.0)]*4 공식을
					적용하여 과목별 기대점수를 산출(기대점수는 70/100을 유지하도록 한다)
			</tr>
			</div>
		</table>
	</form>
</body>
</html>--%>