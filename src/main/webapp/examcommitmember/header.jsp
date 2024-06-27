<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" href="./img/favicon-32x32.png">
<base href="${pageContext.request.contextPath}/">
<title>헤더</title>
<style>
.header-links a {
	text-decoration: none;
	color: #000;
}

/* 한국상담학회 글씨 호버 :  */
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

/* 지우면 ㅈ됨 */
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

/* 네비게이션 링크 - 지우면 안됨*/
.navbar-nav .nav-link {
   text-decoration: none;
   color: black;
   position: relative;
   font-weight: bold;
   font-size: 15px;
}

/* 하단 테두리 초기 상태 - 지우면 ㅈ됨 */
.navbar-nav .nav-link::after {
   content: ''; /* 콘텐츠 추가 */
   display: block; /* 블록 레벨 요소로 변경 */
   width: 0; /* 너비 0으로 설정하여 초기에 숨김 */
   height: 3px; /* 높이 2px */
   background: #DB402E; /* 배경 색상 */
   position: absolute;
   left: 0; /* 왼쪽 0 */
   bottom: -9.5px; /* 아래쪽 -9.5px */
   opacity: 0; /* 초기에 숨김 */
}

/* 호버 시 테두리 효과 */
.navbar-nav .nav-link:hover::after {
   width: 100%; /* 호버 시 너비 100%로 확장 */
   opacity: 1; /* 호버 시 보이게 함 */
}

.nav-item:hover {
	color: #6B6D70;
	opacity: 1; /* 호버 시 보이게 함 */
}

/* 우측 헤더 밑줄 제거 */
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

/* header-link의 밑줄 제거 */
.header-links a {
   text-decoration: none;
   color: #000;
}

/* 로고 오른쪽 상담학회 집 인트로 글씨 호버 */
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
                <a href="https://counselors.or.kr/"><span class="mx-2"></span> 한국상담학회</a> <span> · </span> 
                <a href="https://counselors.or.kr/">
                    <img src="${pageContext.request.contextPath}/examcommitmember/img/kca_house.png" alt="KCA Logo">인트로
                </a>
            </div>
            <div class="header-links2 ml-auto d-flex align-items-center">
                <b>${member.member_name}</b> <span class="mx-1"></span> 님 <span class="mx-2"></span> 
                ${member.subject_name} <span class="mx-2"></span> 
                <a href="${pageContext.request.contextPath}/login/login.jsp">로그아웃</a> <span class="mx-2"></span>
                <a href="#">마이페이지</a>
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
                <li class="nav-item" style="margin-right: 2rem;"><a class="nav-link" href="javascript:getExamDocSub();">출제 계획서</a></li>
                <li class="nav-item" style="margin-right: 2rem;"><a class="nav-link" href="javascript:getExamPlanList();">출제</a></li>
                <li class="nav-item" style="margin-right: 2rem;"><a class="nav-link" href="javascript:getSubtrahendList();">검토</a></li>
                <li class="nav-item" style="margin-right: 2rem;"><a class="nav-link" href="javascript:getBinaryClass();">출제 이원분류표</a></li>
                <li class="nav-item" style="margin-right: 2rem;"><a class="nav-link" href="javascript:getPreBinaryClass();">선제 이원분류표</a></li>
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
