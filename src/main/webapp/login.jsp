<%@page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�Խ��� �α���</title>
 <link rel="stylesheet" href="resources/board_styles.css">
<!--  <style>
    table {border-collapse: collapse;}
    h1    {color:#336699;}
 </style> -->
</head>
<body>
	<center>
		<h1>�α���</h1>
		<hr>
		<form action="login.do" method="post">
			<table border="1" cellpadding="2" cellspacing="3">
				<tr>
					<td bgcolor="orange">���̵�</td>
					<td><input type="text" name="u_id" size="20" /></td>
				</tr>
				<tr>
					<td bgcolor="orange">��й�ȣ</td>
					<td><input type="password" name="u_pw"  size="20" /></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit"
						value="�α���" /></td>
				</tr>
			</table>
		</form>
		<hr>
	</center>
</body>
</html>