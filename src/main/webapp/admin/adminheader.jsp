<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>������ ���</title>
<style>
/* header-link�� ���� ���� */
.header-links a {
    text-decoration: none;
    color: black;
}

/* �ΰ� ���� �۾� ȣ�� : �ѱ������ȸ */
.header-links a:hover {
	color: #D8402A;
}

body {
    background: #FFF;
    height: 100vh;
    font-size: 15px;
    font-family: 'Roboto', sans-serif;
}

/* ����� ���� */
.navbar {
    border-top: 1px solid #D8D9DA;
    border-bottom: 1px solid #F5F5F5;
    background: #FFF;
    width: 100%;
    height: 50px;
    justify-content: center;
    margin-left: 30px;
    position: relative;
    font-weight: bold;
    font-size: 14px;
}

/* �׺���̼� ��ũ - ����� �ȵ�*/
.navbar-nav .nav-link {
	text-decoration: none;
	color: black;
	position: relative;
	font-weight: bold;
	font-size: 15px;
}

/* �ϴ� �׵θ� �ʱ� ���� - ����� ���� */
.navbar-nav .nav-link::after {
    content: ''; /* ������ �߰� */
    display: block; /* ��� ���� ��ҷ� ���� */
    width: 0; /* �ʺ� 0���� �����Ͽ� �ʱ⿡ ���� */
    height: 3px; /* ���� 2px */
    background: #DB402E; /* ��� ���� */
    position: absolute;
    left: 0; /* ���� 0 */
    bottom: -9.5px; /* �Ʒ��� -9.5px */
    opacity: 0; /* �ʱ⿡ ���� */
}

/* ȣ�� �� �׵θ� ȿ�� */
.navbar-nav .nav-link:hover::after {
    width: 100%; /* ȣ�� �� �ʺ� 100%�� Ȯ�� */
    opacity: 1; /* ȣ�� �� ���̰� �� */
}

.nav-item:hover {
    color: #6B6D70;
} 

#header {
   width: 100%;
   padding: 20px 10px;
   background: #fff;
   z-index: 1;
}

body, table, th, td, input, select, textarea, div, a, p, span, strong, b,
   i, ul, ol, li, button {
   font-family: "Montserrat", "Noto Sans KR", sans-serif;
   font-size: 15px;
   letter-spacing: -0.05em;
   line-height: 1.6em;
   list-style: none;
   color: #333;
}

/* header-link�� ���� ���� */
.header-links a {
   text-decoration: none;
   color: #000;
}

/* �ΰ� ������ �����ȸ �� ��Ʈ�� �۾� ȣ�� */
.header-links a:hover {
   color: #D8402A;
}

.header-left img {
   width: 250px;
   height: auto;
   padding-top: 20px;
   margin-left: 100px;
}

.nav-item:hover {
   color: #6B6D70;
}
</style>
<link
    href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
    rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script
    src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script
    src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
    <div class="header-container d-flex align-items-center p-3">
    <div class="header-left">
        <a href="https://counselors.or.kr/"><img src="./img/kca_logo_short.jpg" alt="KCA Logo"></a>
    </div>
    <div class="header-links ml-3">
        <a href="https://counselors.or.kr/">�ѱ������ȸ</a> <span> �� </span> <a href="https://counselors.or.kr/">
        <img src="./img/kca_house.png" alt="KCA Logo">��Ʈ��</a>
    </div>
    <div class="header-right ml-auto d-flex align-items-center">
        <a href="#">����̷а� ����A</a> <span class="mx-2"></span> <a href="#">�α׾ƿ�</a> <span class="mx-2"></span> <a href="#">����������</a>
    </div>
</div>
    <br>
    <nav class="navbar navbar-expand-lg bg-body-tertiary">
        <div class="container-fluid">
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 justify-content-around w-50">
                    <li class="nav-item"><a class="nav-link" href="../#">���� ��ȹ��</a></li>
                    <li class="nav-item"><a class="nav-link" href="../../../biz/getExamPlanList.do">����</a></li>
                    <li class="nav-item"><a class="nav-link" href="../../../biz/getSubtrahendList.do">����</a></li>
                    <li class="nav-item"><a class="nav-link" href="../#">���� �̿��з�ǥ</a></li>
                </ul>
            </div>
        </div>
    </nav>
</body>
</html>