<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="login1.css">
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login</title>
</head>
<body>
    <div class="login-container">
        <div class="logo-container">
            <img src="file:///C:/1kosmosc/sts/workspace3/1team/src/main/FAQ_criTeria_login_img/kca_logo.jpg" alt="KCA Logo">
        </div>
        <form action="">
            <h2><span class="entypo-login"><i class="fa fa-sign-in"></i></span> Login</h2>
            <div class="input-container">
                <span class="entypo-user inputUserIcon">
                    <i class="fa fa-user"></i>
                </span>
                <input type="text" class="id" placeholder="ID"/>
            </div>
            <div class="input-container">
                <span class="entypo-key inputPassIcon">
                    <i class="fa fa-key"></i>
                </span>
                <input type="password" class="pass" placeholder="Password"/>
            </div>
            <div class="button-container">
                <button type="submit" class="submit"><span class="entypo-lock"><i class="fa fa-lock"></i></span> Login</button>
            </div>
        </form>
    </div>
<script src="login1.js"></script>
</body>
</html>
