<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>������ȹ��</title>
</head>
<body>
	<form action="getexamDocList.do" method="post">
		<table align="center" border="1">
			<tr>
				<th colspan="10">������ȹ��</th>
			</tr>
			<tr>
				<td colspan="10">�����: ��������� ö��</td>
			</tr>
			<tr>
				<td colspan="10">��������: (A)������ (B)user B</td>
			</tr>
			<tr>
				<th colspan="4">��������</th>
				<th colspan="4">���̵��� ������</th>
				<th colspan="2">��������</th>
			</tr>
			</form>
			<div border="1">
				<tr>
					<th>�з���ȣ</th>
					<th>��з�</th>
					<th>�ߺз�</th>
					<th>�Һз�</th>
					<th>��</th>
					<th>��</th>
					<th>��</th>
					<th>�հ�</th>
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
					<th colspan="4" rowspan="2">�հ�</th>
					<th>2</th>
					<th>2</th>
					<th>1</th>
					<th>5</th>
					<th rowspan="2">3</th>
					<th rowspan="2">2</th>
				</tr>
				<tr>
					<th colspan="3">���������</th>
					<th>40</th>
				</tr>
				<tr>
					<th colspan="10">[����]</th>
				</tr>
				<tr>
					<td colspan="10">- ���̵��� ������ Ȯ��</td>
				</tr>
				<tr>
					<td colspan="10">�� : 20%���� (5-6����)</td>
				</tr>
				<tr>
					<td colspan="10">�� : 50%���� (13-15����)</td>
				</tr>
				<tr>
					<td colspan="10">�� : 30%���� (8-9����)</td>
				</tr>
				<tr>
					<td colspan="10">-��������� ������ ���� [(��*0.5)+(��*0.75)+(��*1.0)]*4
						������ �����Ͽ� ���� ��������� ����(��������� 70/100�� �����ϵ��� �Ѵ�)
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
<title>������ȹ��</title>
</head>
<body>
	<form action="getexamDocList.do" method="post">
		<table align="center" border="1">
			<tr>
				<th colspan="10">������ȹ��</th>
			</tr>
			<tr>
				<td colspan="10">�����: ��������� ö��</td>
			</tr>
			<tr>
				<td colspan="10">��������: (A)${memberNames['A']}
					(B)${memberNames['B']}</td>
			</tr>
			<tr>
				<th colspan="4">��������</th>
				<th colspan="4">���̵��� ������</th>
				<th colspan="2">��������</th>
			</tr>
			</form>
			<div border="1">
				<tr>
					<th>�з���ȣ</th>
					<th>��з�</th>
					<th>�ߺз�</th>
					<th>�Һз�</th>
					<th>��</th>
					<th>��</th>
					<th>��</th>
					<th>�հ�</th>
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

						<!-- ��/�� ���� ���� ��� �� �հ� ������Ʈ -->
						<c:set var="upperValue" value="0" />
						<c:set var="middleValue" value="0" />
						<c:set var="lowerValue" value="0" />
						<c:set var="A_member" value="0" />
						<c:set var="B_member" value="0" />

						<th><c:choose>
								<c:when test="${examdoc.diff == '��'}">
									<c:set var="upperValue" value="1" />1</c:when>
								<c:otherwise>0</c:otherwise>
							</c:choose></th>
						<th><c:choose>
								<c:when test="${examdoc.diff == '��'}">
									<c:set var="middleValue" value="1" />1</c:when>
								<c:otherwise>0</c:otherwise>
							</c:choose></th>
						<th><c:choose>
								<c:when test="${examdoc.diff == '��'}">
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

					<!-- ��ü �հ迡 ���ϱ� -->
					<c:set var="totalSum" value="${totalSum + sum}" />
					<c:set var="totalUpper" value="${totalUpper + upperValue}" />
					<c:set var="totalMiddle" value="${totalMiddle + middleValue}" />
					<c:set var="totalLower" value="${totalLower + lowerValue}" />
					<c:set var="totalAmember" value="${totalAmember + A_member}" />
					<c:set var="totalBmember" value="${totalBmember + B_member}" />

				</c:forEach>
			<tr>
				<th colspan="4" rowspan="2">�հ�</th>
				<th>${totalUpper}</th>
				<th>${totalMiddle}</th>
				<th>${totalLower}</th>
				<th>${totalSum}</th>
				<th rowspan="2">${totalAmember}</th>
				<th rowspan="2">${totalBmember}</th>
			</tr>
			<tr>
				<th colspan="3">���������</th>
				<th><c:set var="expectedCorrectRate" value="${(totalUpper * 0.5 + totalMiddle * 0.75 + totalLower) * 4}" />
					${expectedCorrectRate}</th>
			</tr>
			<tr>
				<th colspan="10">[����]</th>
			</tr>
			<tr>
				<td colspan="10">- ���̵��� ������ Ȯ��</td>
			</tr>
			<tr>
				<td colspan="10">�� : 20%���� (5-6����)</td>
			</tr>
			<tr>
				<td colspan="10">�� : 50%���� (13-15����)</td>
			</tr>
			<tr>
				<td colspan="10">�� : 30%���� (8-9����)</td>
			</tr>
			<tr>
				<td colspan="10">-��������� ������ ���� [(��*0.5)+(��*0.75)+(��*1.0)]*4 ������
					�����Ͽ� ���� ��������� ����(��������� 70/100�� �����ϵ��� �Ѵ�)
			</tr>
			</div>
		</table>
	</form>
</body>
</html>--%>