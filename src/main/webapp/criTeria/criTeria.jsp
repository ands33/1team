<%@ page contentType="text/html; charset=euc-kr" pageEncoding="euc-kr"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="criTeria.css">
    <meta charset="euc-kr">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>��������</title>
</head>
<body>
	<div class="header-container">
		<div class="header-left">
			<img src="C:/1kosmosc/sts/workspace3/1team/src/main/FAQ_criTeria_img/blue_01.png"
				width="15" height="15" alt="�������� ������"> ��������
		</div>
		<div class="navbar">
			<a href="#">Home</a> <span>></span> <a href="#">�˸�����</a> <span>></span>
			<a href="#">��������</a>
		</div>
	</div>
	<hr>
	<br>
	<table>
		<th bgcolor="#EEEEF3">�����</th>
		<th colspan="2">
			<div class="search-container">
				<select id="courseName" name="courseName">
					<option value="�ǰ�������">�ǰ�������</option>
					<option value="1. ���ö�а� �������">1. ���ö�а� �������</option>
					<option value="1-1. �������">1-1. �������</option>
					<option value="2. ��޻���̷а� ����">2. ��޻���̷а� ����</option>
					<option value="2-1. ����̷а� ����">2-1. ����̷а� ����</option>
					<option value="3. ���ܻ�� ���α׷�����">3. ���ܻ�� ���α׷�����</option>
					<option value="3-1. ���ܻ�� �̷а�����">3-1. ���ܻ�� �̷а�����</option>
					<option value="4. �ɸ��򰡿� ����">4. �ɸ��򰡿� ����</option>
					<option value="4-1. �ɸ��˻�� ���">4-1. �ɸ��˻�� ���</option>
					<option value="5. ��޻�㿬�������">5. ��޻�㿬�������</option>
					<option value="5-1. ��㿬�������">5-1. ��㿬�������</option>
					<option value="6. ���ۺ����� �̷а� ����">6. ���ۺ����� �̷а� ����</option>
					<option value="7. ���λ��">7. ���λ��</option>
				</select>
				<button class="custom-button">
					<i class="fas fa-search"></i> ��ȸ
				</button>
			</div>
			<div id="excelData"></div>
		</th>
	</table>
	<br>
	<button class="custom-button" style="float: right;">��������</button>
	<br>
	<tr>
		<table>
		<tr>
			<th class="bold" align="center" bgcolor="#EEEEF3" width="70">��������</th>
			<th class="bold" align="center" bgcolor="#EEEEF3">��з���</th>
			<th class="bold" align="center" bgcolor="#EEEEF3">�ߺз���</th>
			<th class="bold" align="center" bgcolor="#EEEEF3">�Һз���</th>
			</tr>
			</table>
			<img src="C:/1kosmosc/sts/workspace3/1team/src/main/FAQ_criTeria_img/���ö�а� �������.jpg">
</body>
</html>