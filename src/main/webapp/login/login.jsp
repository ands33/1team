<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="login.css">
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login</title>
</head>
<body>
    <div class="login-container">
        <div class="logo-container">
           <img src="./img/kca_logo_short.jpg">
        </div>
        <form action="${pageContext.request.contextPath}/login.do" method="post">
            <h2><span class="entypo-login"><i class="fa fa-sign-in"></i></span> Login</h2>
            <div class="input-container">
                <span class="entypo-user inputUserIcon">
                    <i class="fa fa-user"></i>
                </span>
                <input type="text" class="member_id" name="member_id" placeholder="ID"/>
            </div>
            <div class="input-container">
                <span class="entypo-key inputPassIcon">
                    <i class="fa fa-key"></i>
                </span>
                <input type="password" name = "pw" class="pw" placeholder="Password"/>
            </div>
            <div class="button-container">
                <button type="submit" class="submit"><span class="entypo-lock"><i class="fa fa-lock"></i></span> Login</button>
            </div>
        </form>
    </div>
<script src="login.js"></script>
</body>
</html>
