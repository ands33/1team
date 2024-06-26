<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="icon" href="./img/favicon-32x32.png">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>헤더</title>
<style>
/* 공통 스타일 */
body, table, th, td, input, select, textarea, div, a, p, span, strong, b,
i, ul, ol, li, button {
    font-family: "Montserrat", "Noto Sans KR", sans-serif;
    font-size: 15px;
    letter-spacing: -0.05em;
    line-height: 1.6em;
    color: #333;
    list-style: none;
}

body {
    background: #FFF;
    height: 100vh;
    font-size: 15px;
    font-family: 'Roboto', sans-serif;
}

/* 링크 스타일 */
.header-links a,
.header-links2 a {
    text-decoration: none;
    color: #000;
}

.header-links a:hover,
.header-links2 a:hover {
    color: #D8402A;
    text-decoration: none;
}

/* 네비게이션 바 */
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

.navbar-nav {
    display: flex;
    align-items: center;
    padding: 0;
    margin: 0px;
    list-style: none;
}

.navbar-nav .nav-link {
    text-decoration: none;
    color: black;
    position: relative;
    font-weight: bold;
    font-size: 15px;
}

.navbar-nav .nav-link::after {
    content: '';
    display: block;
    width: 0;
    height: 3px;
    background: #DB402E;
    position: absolute;
    left: 0;
    bottom: -9.5px;
    opacity: 0;
}

.navbar-nav .nav-link:hover::after {
    width: 100%;
    opacity: 1;
}

.nav-item:hover {
    color: #6B6D70;
}

/* 로고 */
.header-left img {
    width: 250px;
    height: auto;
    padding-top: 20px;
    margin-left: 100px;
}

</style>
<script>
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
    const form = document.getElementById('headerForm');
    form.action = "../../../biz/getSubtrahendList.do";
    form.submit();
}

function getBinaryClass() {
    const form = document.getElementById('headerForm');
    form.action = "../../../biz/getBinaryClass.do";
    form.submit();
}

</script>
<link
   href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
   rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script
   src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script
   src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<base href="${pageContext.request.contextPath}/">
</head>
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
            <div class="header-right ml-auto d-flex align-items-center">
                <b>${member.member_name}</b> <span class="mx-1"></span> 님 <span class="mx-2"></span> 
                ${member.subject_name} <span class="mx-2"></span> 
                <a href="${pageContext.request.contextPath}/login/login.jsp">로그아웃</a> <span class="mx-2"></span>
                <a href="#">마이페이지</a>
            </div>
        </div>
    </form>
    <br>
    <nav class="navbar navbar-expand-lg bg-body-tertiary">
        <div class="container-fluid">
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 justify-content-around w-50"><span class="mx-1.5"></span>  
                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/IndexMemberList.do">설정</a></li>
                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/getMembersBySubjectAndType.do">문항입고 대기</a></li>
                </ul>
            </div>
        </div>
    </nav>
</body>
</html>