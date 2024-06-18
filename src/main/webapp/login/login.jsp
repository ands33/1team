<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="login.css">
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>한국상담학회 통합문제은행 정보시스템 로그인</title>
</head>
<body>
    <div class="login-container">
        <div class="logo-container">
            <img src="file://C:/1kosmosc/sts/workspace3/1team/src/main/FAQ_criTeria_login_img/한국상담학회_01.png" alt="한국상담학회 로고">
            <!-- <img src="file:///C:/1kosmosc/sts/workspace3/1team/src/main/FAQ_criTeria_login_img/로그인_03.png" alt="통합문제은행 정보시스템" height="100"> -->
        </div>
        <form class="login-form">
            <div class="input-group">
                <img src="file:///C:/1kosmosc/sts/workspace3/1team/src/main/FAQ_criTeria_login_img/자물쇠_01.jpg" alt="자물쇠" width="40" height="40">
                <label for="username">아이디</label>
                <input type="text" id="username" name="username" required>
            </div>
            <div class="input-group">
                <img src="file:///C:/1kosmosc/sts/workspace3/1team/src/main/FAQ_criTeria_login_img/자물쇠_01.jpg" alt="자물쇠" width="40" height="40">
                <label for="password">비밀번호</label>
                <input type="password" id="password" name="password" required>
            </div>
            <button type="submit" class="login-button">로그인</button>
        </form><br>
        <div class="forgot-password">
            <a href="#">아이디/비밀번호 찾기</a>
        </div>
    </div>
</body>
</html>