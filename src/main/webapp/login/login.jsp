<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="login.css">
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>�ѱ������ȸ ���չ������� �����ý��� �α���</title>
</head>
<body>
    <div class="login-container">
        <div class="logo-container">
            <img src="file://C:/1kosmosc/sts/workspace3/1team/src/main/FAQ_criTeria_login_img/�ѱ������ȸ_01.png" alt="�ѱ������ȸ �ΰ�">
            <!-- <img src="file:///C:/1kosmosc/sts/workspace3/1team/src/main/FAQ_criTeria_login_img/�α���_03.png" alt="���չ������� �����ý���" height="100"> -->
        </div>
        <form class="login-form">
            <div class="input-group">
                <img src="file:///C:/1kosmosc/sts/workspace3/1team/src/main/FAQ_criTeria_login_img/�ڹ���_01.jpg" alt="�ڹ���" width="40" height="40">
                <label for="username">���̵�</label>
                <input type="text" id="username" name="username" required>
            </div>
            <div class="input-group">
                <img src="file:///C:/1kosmosc/sts/workspace3/1team/src/main/FAQ_criTeria_login_img/�ڹ���_01.jpg" alt="�ڹ���" width="40" height="40">
                <label for="password">��й�ȣ</label>
                <input type="password" id="password" name="password" required>
            </div>
            <button type="submit" class="login-button">�α���</button>
        </form><br>
        <div class="forgot-password">
            <a href="#">���̵�/��й�ȣ ã��</a>
        </div>
    </div>
</body>
</html>