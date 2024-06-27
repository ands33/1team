<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="icon" href="./img/favicon-16x16.png">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>메인화면</title>
<style>
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

.nav-item:hover {
    color: #6B6D70;
}

/* 지우면 안됨 */
.flex-container {
    display: flex;
    justify-content: center;
    gap: 20px;
    margin-top: 20px; /* Adjust margin as needed */
}

/* Styling for each link and image */
.flex-container a {
    display: block; /* Ensure each link occupies full width of container */
    text-align: center; /* Center text horizontally within link */
}

.flex-container img {
    max-width: 100%;
    height: auto;
    max-height: 200px; /* Example: limit image height */
}
</style>
<script>

function getExamPlanList() {
    const form = document.getElementById('indexForm');
    form.action = "../../../biz/getExamPlanList.do";
    form.submit();
}

function getSubtrahendList() {
    const form = document.getElementById('indexForm');
    form.action = "../../../biz/getSubtrahendList.do";
    form.submit();
}

function getBinaryClass() {
    const form = document.getElementById('indexForm');
    form.action = "../../../biz/getBinaryClass.do";
    form.submit();
}
</script>
<link
    href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
    rel="stylesheet">
</head>
<body>
    <div id="header" class="header-container d-flex align-items-center p-3">
        <div class="header-left">
            <a href=""><img src="./img/kcalogo.png" alt="KCA Logo"></a>
        </div>
        <div class="header-links ml-3">
            <a href="https://counselors.or.kr/">한국상담학회</a> <span> · </span> <a
                href="https://counselors.or.kr/"><img src="./img/kca_house.png"
                alt="KCA Logo">인트로</a>
        </div>
        <div class="header-links ml-auto d-flex align-items-center">
            <div>
                <a><b>${member.member_name}</b>님<span class="mx-1"></span> </a>
            </div>
            <a href="${pageContext.request.contextPath}/login/login.jsp">로그아웃</a> <span class="mx-2"></span>
            <a href="#">마이페이지</a>
        </div>
    </div>
    <br>
    <br>
    <form id="indexForm" method="post">
        <input type="hidden" name="member_id" value="${member.member_id}">
        <div class="flex-container">
            <div>
                <a href="javascript:getExamPlanList();"><img src="./img/출.png" alt="출"></a>
            </div>
            <div>
                <a href="javascript:getSubtrahendList();"><img src="./img/검.png" alt="검"></a>
            </div>
        </div>
        <br>
        <div class="flex-container">
            <div>
                <a href="javascript:getBinaryClass()";><img src="./img/이.png" alt="이"></a>
            </div>
            <div>
                <a href="preBinaryClass.jsp"><img src="./img/선제.png" alt="선제"></a>
            </div>
        </div>
    </form>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script
        src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script
        src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="scripts.js"></script>
</body>
</html>
