<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>메인화면</title>
<link rel="stylesheet" href="header.css">
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div id="header" class="header-container d-flex align-items-center p-3">
        <div class="header-left">
            <a href="https://counselors.or.kr/"><img src="./img/kca_logo_short.jpg" alt="KCA Logo"></a>
        </div>
        <div class="header-links ml-3">
            <a href="https://counselors.or.kr/">한국상담학회</a> <span> · </span> 
            <a href="https://counselors.or.kr/"><img src="./img/kca_house.png" alt="KCA Logo">인트로</a>
        </div>
        <div class="header-right ml-auto d-flex align-items-center">
            <a href="#">상담이론과 실제A</a> 
            <span class="mx-2"></span> 
            <a href="#">로그아웃</a> 
            <span class="mx-2"></span> 
            <a href="#">마이페이지</a>
        </div>
    </div>
    <br><br>
    <div class="row">
        <div class="col-6">
                <a href="../../../biz/getExamPlanList.do"><img src="./img/출.png"></a></div>
        <div class="col-6">
                <a href="../../../biz/getSubtrahendList.do"><img src="./img/검.png"></a></div>
    </div><br>
    <div class="row">
        <div class="col-6">
                <a href="binaryClass.jsp"><img src="./img/이.png"></a></div>
        <div class="col-6">
                <a href="preBinaryClass.jsp"><img src="./img/선제.png"></a></div>
    </div>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="scripts.js"></script>
</body>
</html>
