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
						<th>${examdoc.category1}</th>
						<th>${examdoc.category2}</th>
						<th>${examdoc.category3}</th>
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