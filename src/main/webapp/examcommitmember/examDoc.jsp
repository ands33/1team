<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>출제계획서</title>
</head>
<body>
	<table align="center" border="1">
		<tr>
			<th colspan="10">출제계획서</th>
		</tr>
		<tr>
			<td colspan="10">과목명: 상담윤리와 철학</td>
		</tr>
		<td colspan="10">출제위원: (A)홍길동 (B)김복순
		<tr>
			<th colspan="4">출제영역</th>
			<th colspan="4">난이도별 문제수</th>
			<th colspan="2">출제위원</th>
		</tr>
		<div border="1">
			<tr>
				<th>분류번호</th>
				<th>대분류</th>
				<th>중분류</th>
				<th>세부</th>
				<th>상</th>
				<th>중</th>
				<th>하</th>
				<th>합계</th>
				<th>조성혁 ${examdoc.member_name}</th>
				<th>user ${examdoc.member_name}</th>
			</tr>
			<c:forEach items="${ExamDocList}" var="examdoc">
				<tr>
					<th>1-0-0</th>
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
			<th></th>
			<th></th>
			<th></th>
			<th></th>
			<th></th>
			<th></th>
			<th></th>
			<th></th>
			<th></th>
			<th></th>
		</tr>
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
		</div>
	</table>
</body>
</html>