<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>헤더</title>
<link rel="stylesheet" href="header.css">
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
	<div class="header-container">
        <div class="header-left">
            <img src="./img/kca_logo_short.jpg" alt="KCA Logo">
        </div>
        <div>
            <a href="#">한국상담학회</a>
            <span> · </span>
            <a href="#">출제위원 페이지</a>
        </div>
    </div>
        <br>
	<nav class="navbar navbar-expand-lg navbar-light bg-white">
		<a class="navbar-brand" href="../../../index.jsp">출제위원 페이지</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNav" aria-controls="navbarNav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item"><a class="nav-link" href="../#">출제 계획서</a>
				</li>
				<li class="nav-item"><a class="nav-link"
					href="../../../biz/getExamPlanList.do">출제</a></li>
				<li class="nav-item"><a class="nav-link" href="../#">감수</a></li>
				<li class="nav-item"><a class="nav-link" href="../#">출제 이원
						분류표</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="../#" id="noticeDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> 전달사항 </a>
					<div class="dropdown-menu" aria-labelledby="noticeDropdown">
						<a class="dropdown-item" href="../#">공지사항</a> <a
							class="dropdown-item" href="../#">위원전달사항</a>
					</div></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="../#" id="noticeDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> 그 외 메뉴 </a>
					<div class="dropdown-menu" aria-labelledby="noticeDropdown">
						<a class="dropdown-item" href="../#">Q&A</a> <a
							class="dropdown-item" href="../#">FAQ</a> <a
							class="dropdown-item" href="../#">사용자 메뉴얼</a> <a
							class="dropdown-item" href="../#">공인인증서 메뉴얼</a> <a
							class="dropdown-item" href="../#">출제기준</a>
					</div></li>
			</ul>
		</div>
	</nav>