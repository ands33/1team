<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" href="./img/favicon-16x16.png">
<title>index화면 구현(main)</title>
</head>
<style>
.center-table td {
	text-align: center;
}
.squareTop {
	width: 100%;
	height: 40px;
	background-color: #5BA3E6;
}
.exam:hover {
	color: yellow;
}
.exam {
	width: 100%;
	height: 100%;
	background-image:
		url("C:/1kosmosc/sts/work_space3/1team/src/main/indexPage/exam.png");
	background-repeat: no-repeat;
	justify-content: center;
	align-items: center;
}
.substrahend {
	width: 100%;
	height: 100%;
	background-image:
		url("C:/1kosmosc/sts/work_space3/1team/src/main/indexPage/subtrahend.png");
	background-repeat: no-repeat;
	justify-content: center;
	align-items: center;
}
.squareNotice1 {
	width: 300px;
	height: 150px;
	border-radius: 10%;
	border: 2px solid black;
}
.squareNotice2 {
	width: 300px;
	height: 150px;
	border-radius: 10%;
	border: 2px solid black;
}
.moved-table {
	margin-left: 25px;
}
.QnA, .FAQ {
	width: 100px;
	height: 50px;
	font-family: 'Song Myung', serif;
	font-weight: bold;
	display: flex;
	justify-content: center;
	align-items: center;
	text-align: center;
	border: 1px solid #000;
}
.noticeGreen {
	width: 100%;
	height: 100%;
	background-image:
		url("C:/1kosmosc/sts/work_space3/1team/src/main/indexPage/notice_green.png");
	background-repeat: no-repeat;
	justify-content: center;
	align-items: center;
}
.noticeBlue {
	width: 100%;
	height: 100%;
	background-image:
		url("C:/1kosmosc/sts/work_space3/1team/src/main/indexPage/notice_blue.png");
	background-repeat: no-repeat;
	justify-content: center;
	align-items: center;
}
.menu {
	width: 100%;
	height: 100%;
	background-image:
		url("C:/1kosmosc/sts/work_space3/1team/src/main/indexPage/menu_box.png");
	background-repeat: no-repeat;
	justify-content: center;
	align-items: center;
}
.img {
	display: block;
	margin: 0 auto;
}
.highlight {
	color: #A1C2C7;
	font-family: Impact, sans-serif;
	font-size: 40px;
}
</style>
<body>
	<div style="display: flex; align-items: center; width: 100%;">
		<img
			src="C:/1kosmosc/sts/work_space3/1team/src/main/indexPage/logo_none.png"
			width="180" height="60" border="0" alt="">&nbsp;&nbsp;<span>마이페이지</span>
		<div style="margin-left: auto;">
			<font size="3">${userName}위원님 안녕하십니까?</font> &nbsp;&nbsp; <span><a
				href="">로그아웃</a></span>
		</div>
	</div>
	<hr>
	<div class="squareTop"></div>
	<br>
	<br>
	<center>
		<table border="0">
			<tr>
				<td rowspan="2">
					<div class="exam">
						<table width="300" height="300" border="0">
							<tr>
								<td align="center"><font size="20" color="white"><strong>출제</strong></font>
								</td>
							</tr>
							<tr>
								<td align="center"><img
									src="C:\1kosmosc\sts\work_space3\1team\src\main\indexPage\bookUI.png"
									width="150" height="100" border="0" alt=""></td>
							</tr>
							<tr>
								<td>
									<div class="moved-table">
										<table>
											<tr>
												<td><font size="2" color="white"><strong>출제의뢰현황</strong></font>
												</td>
											</tr>
											<tr>
												<td><font size="1" color="white"><strong>기능해부학</strong></font>
												</td>
											</tr>
											<tr>
												<td><font size="1" color="white"><strong>0/3
															(7일남음)</strong></font></td>
											</tr>
										</table>
									</div>
								</td>
							</tr>
						</table>
					</div>
				</td>
				<td rowspan="2">
					<div class="substrahend">
						<table width="300" height="300" border="0">
							<tr>
								<td align="center"><font size="20" color="white"><strong>감수</strong></font>
								</td>
							</tr>
							<tr>
								<td align="center"><img
									src="C:/1kosmosc/sts/work_space3/1team/src/main/indexPage/glasses.png"
									width="100" height="100" border="0" alt=""></td>
							</tr>
							<tr>
								<td>
									<div class="moved-table">
										<table>
											<tr>
												<td><font size="2" color="white"><strong>감수의뢰현황</strong></font>
												</td>
											</tr>
											<tr>
												<td><font size="1" color="white"><strong>기능해부학</strong></font>
												</td>
											</tr>
											<tr>
												<td><font size="1" color="white"><strong>0/3
															(7일남음)</strong></font></td>
											</tr>
										</table>
									</div>
								</td>
							</tr>
						</table>
					</div>
				</td>
				<td width="300" height="150">
					<div class="noticeGreen">
						<table align="center" border="0" height="150" width="260">
							<tr border="1">
								<td align="left">공지사항</td>
								<td align="right"><input type="button" value=" + "
									onclick=""></td>
							</tr>
							<tr border="1">
								<td align="left"><font size="2" />내용</td>
								<td align="right"><font size="2" />2024-06-17</td>
							</tr>
							<tr border="1">
								<td align="left"><font size="2" />내용2</td>
								<td align="right"><font size="2" />2024-06-18</td>
							</tr>
							<tr border="1">
								<td align="left"><font size="2" />내용3</td>
								<td align="right"><font size="2" />2024-06-19</td>
							</tr>
							<tr border="1">
								<td align="left"><font size="2" />내용4</td>
								<td align="right"><font size="2" />2024-06-20</td>
							</tr>
						</table>
			</div>
			</td>
			</tr>
			<tr>
				<td width="300" height="150">
					<div class="noticeBlue">
						<table align="center" border="0" height="150" width="260">
							<tr>
								<td align="left">위원전달사항</td>
								<td align="right"><input type="button" value=" + "
									onclick=""></td>
							</tr>
							<tr border="1">
								<td align="left"><font size="2" />내용</td>
								<td align="right"><font size="2" />2024-06-17</td>
							</tr>
							<tr border="1">
								<td align="left"><font size="2" />내용2</td>
								<td align="right"><font size="2" />2024-06-18</td>
							</tr>
							<tr border="1">
								<td align="left"><font size="2" />내용3</td>
								<td align="right"><font size="2" />2024-06-19</td>
							</tr>
							<tr border="1">
								<td align="left"><font size="2" />내용4</td>
								<td align="right"><font size="2" />2024-06-20</td>
							</tr>
						</table>
			</div>
			</td>
			</tr>
		</table>
		<br> <br>
		<table border="0">
			<tr>
				<td><img
					src="C:/1kosmosc/sts/work_space3/1team/src/main/indexPage/left_arrow.png"
					width="40" height="80" border="0" alt=""></td>
				<td>
					<div class="menu">
						<table width="150" height="150" border="0">
							<tr height="50" border="0">
								<th class="highlight">QnA</th>
							</tr>
							<tr height="50">
								<td align="center">궁금하신 부분은<br>직접 질문해 주세요
								</td>
							</tr>
							<tr height="50">
								<th><font size="" color="#3297ff"><strong>고객센터Q&A</strong></font>
								</th>
							</tr>
						</table>
					</div>
				</td>
				<td>
					<div class="menu">
						<table width="150" height="150" border="0">
							<tr height="50">
								<th class="highlight">FAQ</th>
							</tr>
							<tr height="50">
								<td align="center">자주 묻는 질문</td>
							</tr>
							<tr height="50">
								<th><font size="" color="#3297ff"><strong>고객센터FAQ</strong></font>
								</th>
							</tr>
						</table>
					</div>
				</td>
				<td>
					<div class="menu">
						<table width="150" height="150" border="0">
							<tr height="50">
								<th><img
									src="C:/1kosmosc/sts/work_space3/1team/src/main/indexPage/UserManual.png"
									width="50" height="40" border="0" alt=""></th>
							</tr>
							<tr height="50">
								<td align="center">일반 사용자 메뉴얼</td>
							</tr>
							<tr height="50">
								<th><font size="" color="#3297ff"><strong>사용자
											메뉴얼</strong></font></th>
							</tr>
						</table>
					</div>
				</td>
				<td>
					<div class="menu">
						<table width="150" height="150" border="0">
							<tr height="50">
								<th><img
									src="C:/1kosmosc/sts/work_space3/1team/src/main/indexPage/certiManual.png"
									width="40" height="40" border="0" alt=""></th>
							</tr>
							<tr height="50">
								<td align="center">공인 인증서<br>사용자 메뉴얼
								</td>
							</tr>
							<tr height="50">
								<th><font size="" color="#3297ff"><strong>공인인증서
											메뉴얼</strong></font></th>
							</tr>
						</table>
				</td>
				<td>
					<div class="menu">
						<table width="150" height="150" border="0">
							<tr height="50">
								<th><img
									src="C:/1kosmosc/sts/work_space3/1team/src/main/indexPage/standard.png"
									width="56" height="40" border="0" alt=""></th>
							</tr>
							<tr height="50">
								<td align="center">과목명에 따른<br>출제 유형
								</td>
							</tr>
							<tr height="50">
								<th><font size="" color="#3297ff"><strong>출제기준</strong></font>
								</th>
							</tr>
						</table>
					</div>
				</td>
				<td><img
					src="C:/1kosmosc/sts/work_space3/1team/src/main/indexPage/right_arrow.png"
					width="40" height="80" border="0" alt=""></td>
			</tr>
		</table>
	</center>
</body>
</html>
