<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="EUC-KR">
<title>ȸ�� ����</title>
<link rel="stylesheet" href="resources/user_style.css">
</head>

<body>
	<center>
		<form method="post" action="updateUser.do" target="_self">
		<input name="u_id" type="hidden" value="${user.u_id}" >
			<table border="0" width="650">
				<tr>
				<th colspan="2">
						<a href="deleteUser.do?u_id=${user.u_id }">�����ϱ�</a>&nbsp;&nbsp;&nbsp;
						<a href="getUserList.do">��Ϻ���</a>&nbsp;&nbsp;&nbsp;
						<a href="updateUser.do">�����ϱ�</a>
					</th>
				</tr>
				<tr>
					<th colspan="2">
						<h1>ȸ�� ���� ����</h1>
					</th>
				</tr>

				<tr>
					<td align="center" width="150">�̸�</td>
					<td>${user.u_name}</td>
				</tr>
				<tr>
					<td align="center">����</td>
					<td>${user.u_gender}</td>
				</tr>
				<tr>
					<td align="center">���̵�</td>
					<td>
					${user.u_id}
					</td>
				</tr>
				<tr>
					<td align="center">��й�ȣ</td>
					<td><input type="password" name="u_pw" value = "${user.u_pw}" size="10" max="20"></td>
				</tr>
				<tr>
					<td align="center">��й�ȣ Ȯ��</td>
					<td><input type="password" name="u_pwc" value = "${user.u_pw}" size="10" max="20"></td>
				</tr>
				<tr>
					<td align="center">�ּ�</td>
					<td><input type="text" name="u_addr" value = "${user.u_addr}"size="50" max="100">
						<input type="button" name="addrSearch" value="�ּ�ã��" onclick="">
					</td>
				</tr>
				<tr>
					<td align="center">�̸���</td>
					<td><input type="text" name="u_email" value = "${user.u_email}"  size="10" max="20">@
						<input type="text" name="u_emailAddr" value = "${user.u_emailAddr}" size="15" max="20">
						<select name="emailAddrSelect">
							<option value="" selected>�����Է�
							<option value="naver.com">naver.com
							<option value="daum.net">daum.net
							<option value="gmail.com">gmail.com
							<option value="nate.com">nate.com
							<option value="yahoo.com">yahoo.com
					</select></td>
				</tr>
				<tr>
					<td align="center">��ȭ��ȣ</td>
					<td><input type="text" name="u_phone" value = "${user.u_phone}" size="12" max="12">
						<br> ���� : 01012345678</td>
				</tr>
				<tr>
					<td align="center">���</td>
					<td><input type="checkbox" name="u_hobby" value="����" checked>����
						<input type="checkbox" name="u_hobby" value="����">���� <input
						type="checkbox" name="u_hobby" value="����">���� <input
						type="checkbox" name="u_hobby" value="�౸">�౸ <input
						type="checkbox" name="u_hobby" value="���ǵ��">���ǵ�� <input
						type="checkbox" name="u_hobby" value="����̺�">����̺� <input
						type="checkbox" name="u_hobby" value="��Ÿ">��Ÿ</td>
				</tr>
				<tr>
					<td align="center">�ڱ�Ұ�</td>
					<td><textarea name="u_introduce"  value = "${user.u_introduce}" rows="10" cols="60"></textarea>

					</td>
				</tr>
				<tr>
					<th colspan="2">
					<input type="submit" value="���� �ϱ�"> 
					<input type="reset" value="�ٽ� �ۼ�"></th>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>