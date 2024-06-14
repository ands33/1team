<%@ page contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<link rel="stylesheet" href="FAQ.css">
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>FAQ</title>
</head>
<body>
	<h5 style="display: flex; justify-content: space-between; align-items: center;">
    <div>
        <img src="C:/1kosmosc/sts/workspace3/1team/src/main/FAQ_criTeria_img/blue_01.png" alt="FAQ ������">
        FAQ
    </div>
    <div class="navbar">
        <a href="#">Home</a> 
        <span> > </span> 
        <a href="#">���������</a> 
        <span> > </span>
        <a href="#">FAQ</a>
    </div>
</h5><hr>
<div class="search-container">
	<div style="display: inline-block; margin-right: 10px;">
		<select id="resultsPerPage" name="resultsPerPage">
			<option value="10">10�پ� ����</option>
			<option value="20">20�پ� ����</option>
			<option value="30">30�پ� ����</option>
		</select>
	</div>
	<div style="display: inline-block;">
		<select id="searchType" name="searchType">
			<option value="����+����">����+����</option>
			<option value="����">����</option>
			<option value="����">����</option>
		</select>
	
	<div style="display: inline-block; margin-left: auto;">
		<input type="text">
		<button class="custom-button">
			<i class="fas fa-search"></i> ��ȸ
		</button>
	</div></div>
</div>
	<table>
		<tr>
			<th class="bold" align="center">NO.</th>
			<th class="bold" align="center">����</th>
			<th class="bold" align="center">÷��</th>
			<th class="bold" align="center">�ۼ���</th>
			<th class="bold" align="center">�ۼ���</th>
			<th class="bold" align="center">��ȸ��</th>
		</tr>
	</table>
</body>
</html>
