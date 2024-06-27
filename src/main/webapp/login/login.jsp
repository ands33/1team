<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="login.css">
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" href="./img/favicon-32x32.png">

<title>Login</title>
<style>
[class*="entypo="]:before {
    font-family: 'entypo', sans-serif;
}

*,
*:before,
*:after {
    moz-box-sizing: border-box;
    webkit-box-sizing: border-box;
    box-sizing: border-box;
}

body {
    background: #fff;
    font-family: 'Roboto', sans-serif;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    margin: 0;
}

.login-container {
    text-align: center;
}

form {
    border: 1px solid #ccc;
    border-radius: 10px;
    padding: 20px;
    width: 300px;
    background: #f9f9f9;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    margin-top: 10px;
}

h2 {
    color: #333;
    margin-bottom: 20px;
}

.input-container {
    position: relative;
    margin-bottom: 15px;
}

input {
    padding: 16px;
    border-radius: 7px;
    border: 1px solid #ccc;
    background: rgba(0, 0, 0, 0.1);
    width: 100%;
    color: #333;
    font-size: 18px;
}

input:focus {
    outline-color: rgba(0, 0, 0, 0);
    background: rgba(255, 255, 255, 0.95);
    color: #e74c3c;
}

.inputUserIcon, .inputPassIcon {
    position: absolute;
    top: 50%;
    transform: translateY(-50%);
    right: 15px;
    color: #333;
}

button.submit {
    width: 100%;
    padding: 15px;
    border: none;
    border-radius: 7px;
    background: #e74c3c;
    color: white;
    font-size: 18px;
    cursor: pointer;
}

button.submit:hover {
    background: #c0392b;
}

.logo-container {
    text-align: center;
    margin-bottom: 10px;
}

.logo-container img {
    width: 280px;
    height: auto;
}
</style>
</head>
<body>
    <div class="login-container">
        <div class="logo-container">
           <img src="./img/kcalogo.png">
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
