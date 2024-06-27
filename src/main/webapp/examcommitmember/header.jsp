<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" href="./img/favicon-32x32.png">
<base href="${pageContext.request.contextPath}/">
<title>���</title>
<style>
.header-links a {
	text-decoration: none;
	color: #000;
}

/* �ѱ������ȸ �۾� ȣ�� :  */
.header-links a:hover {
	color: #D8402A;
	text-decoration: none;
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
	opacity: 1; /* ȣ�� �� ���̰� �� */
}

/* ���� ��� ���� ���� */
.header-links2 a {
	text-decoration: none;
	color: #000;
}

.header-links2 a:hover {
	color: #D8402A;
	text-decoration: none;
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
</style>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <form id="headerForm" method="post">
        <input type="hidden" name="member_id" value="${member.member_id}">
        <div class="header-container d-flex align-items-center p-3">
            <div class="header-left">
                <a href="https://counselors.or.kr/">
                    <img src="${pageContext.request.contextPath}/examcommitmember/img/kcalogo.png" alt="KCA Logo">
                </a>
            </div>
            <div class="header-links ml-3">
                <a href="https://counselors.or.kr/"><span class="mx-2"></span> �ѱ������ȸ</a> <span> �� </span> 
                <a href="https://counselors.or.kr/">
                    <img src="${pageContext.request.contextPath}/examcommitmember/img/kca_house.png" alt="KCA Logo">��Ʈ��
                </a>
            </div>
            <div class="header-links2 ml-auto d-flex align-items-center">
                <b>${member.member_name}</b> <span class="mx-1"></span> �� <span class="mx-2"></span> 
                ${member.subject_name} <span class="mx-2"></span> 
                <a href="${pageContext.request.contextPath}/login/login.jsp">�α׾ƿ�</a> <span class="mx-2"></span>
                <a href="#">����������</a>
            </div>
        </div>
    </form>
    <br>
    <nav class="navbar navbar-expand-lg bg-body-tertiary" style="justify-content: flex-start;">
    <span class="mx-1"></span>
    <div class="container-fluid" style="padding-left: 0;">
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <span class="mx-4"></span>
            <ul class="navbar-nav me-auto mb-2" style="justify-content: flex-start; width: auto; margin-left: 1rem;">
                <li class="nav-item" style="margin-right: 2rem;"><a class="nav-link" href="javascript:getExamDocSub();">���� ��ȹ��</a></li>
                <li class="nav-item" style="margin-right: 2rem;"><a class="nav-link" href="javascript:getExamPlanList();">����</a></li>
                <li class="nav-item" style="margin-right: 2rem;"><a class="nav-link" href="javascript:getSubtrahendList();">����</a></li>
                <li class="nav-item" style="margin-right: 2rem;"><a class="nav-link" href="javascript:getBinaryClass();">���� �̿��з�ǥ</a></li>
                <li class="nav-item" style="margin-right: 2rem;"><a class="nav-link" href="javascript:getPreBinaryClass();">���� �̿��з�ǥ</a></li>
            </ul>
        </div>
    </div>
</nav>
    <script>
    function getExamDocSub() {
        const form = document.getElementById('headerForm');
        form.action = "../../../biz/getExamDocList.do";
        form.submit();
    }

    function getExamPlanList() {
        const form = document.getElementById('headerForm');
        form.action = "../../../biz/getExamPlanList.do";
        form.submit();
    }

    function getSubtrahendList() {
        const form = document.getElementById('headerForm');
        form.action = "../../../biz/getSubtrahendList.do";
        form.submit();
    }

    function getBinaryClass() {
        const form = document.getElementById('headerForm');
        form.action = "../../../biz/getBinaryClass.do";
        form.submit();
    }
    
    function getPreBinaryClass() {
        const form = document.getElementById('headerForm');
        form.action = "../../../biz/getPreBinaryClass.do";
        form.submit();
    }
    </script>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
