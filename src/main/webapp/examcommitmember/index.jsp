<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<link
	rel="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
<link rel="icon" type="favicon.ico" type="image/x-icon">
<link rel="stylesheet" href="index.css">
<meta charset="EUC-KR">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<title>index</title>
</head>
<body>
	<div
		class="header-container d-flex justify-content-between align-items-center p-3">
		<div class="header-left">
			<a href="../../../index.jsp"> <img src="./img/kca_logo_short.jpg"
				alt="KCA Logo">
			</a>
		</div>
		<div class="header-links">
			<a href="https://counselors.or.kr/">�ѱ������ȸ</a> <span> �� </span> <a
				href="https://counselors.or.kr/"><img src="./img/kca_house.png"
				alt="KCA Logo">��Ʈ��</a>
		</div>
		<div class="header-right ml-auto d-flex align-items-center">
			<a href="#">����̷а� ����A</a> <span class="mx-2"> | </span> <a href="#">�α׾ƿ�</a>
			<span class="mx-2"> | </span> <a href="#">����������</a>
		</div>
	</div>
	<br>
	<nav class="navbar navbar-expand-lg bg-body-tertiary">
		<div class="container-fluid">
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul
					class="navbar-nav me-auto mb-2 mb-lg-0 justify-content-around w-100">
					<!-- <li class="nav-item"><a class="nav-link" href="../#">����
							��ȹ��</a></li> -->
					<li class="nav-item"><a class="nav-link"
						href="../../../biz/getExamPlanList.do">����</a></li>
					<li class="nav-item"><a class="nav-link"
						href="../../../biz/getSubtrahendList.do">����</a></li>
					<li class="nav-item"><a class="nav-link" href="../#">���� �̿��з�ǥ</a></li>
					<li class="nav-item"><a class="nav-link" href="../#">����
							�̿��з�ǥ</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<br>
	<div class="row">
		<div class="col"></div>
		<div class="card" style="width: 18rem;">
			<img src="./img/����J.jpg" class="card-img-top" alt="...">
			<div class="card-body">
				<h5 class="card-title">����</h5>
				<p class="card-text"></p>
				<a href="#" class="btn btn-primary">�ٷΰ���</a>
			</div>
		</div>
		<div class="col"></div>
		<div class="card" style="width: 18rem;">
			<img src="./img/�޼���.png" class="card-img-top" alt="...">
			<div class="card-body">
				<h5 class="card-title">����</h5>
				<p class="card-text"></p>
				<a href="#" class="btn btn-primary">�ٷΰ���</a>
			</div>
		</div>
		<div class="col"></div>
		<div class="card" style="width: 18rem;">
			<img src="./img/�̿��з�ǥJ.jpg" class="card-img-top" alt="...">
			<div class="card-body">
				<h5 class="card-title">�̿��з�ǥ</h5>
				<p class="card-text"></p>
				<a href="#" class="btn btn-primary">�ٷΰ���</a>
			</div>
		</div>
		<div class="col"></div>
		<div class="card" style="width: 18rem;">
			<img src="./img/�̿��з�ǥJ.jpg" class="card-img-top" alt="...">
			<div class="card-body">
				<h5 class="card-title">���� �̿��з�ǥ</h5>
				<p class="card-text"></p>
				<a href="#" class="btn btn-primary">�ٷΰ���</a>
			</div>
		</div>
	</div>
</body>
<script src="scripts.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
</body>
</html>