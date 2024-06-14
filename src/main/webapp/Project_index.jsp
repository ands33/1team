<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
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

.exam {
	width: 100%;
	height: 100%;
	background-image:
		url("C:/1kosmosc/sts/work_space3/1team/src/main/indexPage/exam.png");
	background-repeat: no-repeat;
	display: flex;
	justify-content: center;
	align-items: center;
}

.subtrahend {
	width: 100%;
	height: 100%;
	background-image:
		url("C:/1kosmosc/sts/work_space3/1team/src/main/indexPage/subtrahend.png");
	background-repeat: no-repeat;
	display: flex;
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
		url("C:/1kosmosc/sts/work_space3/1team/src/main/indexPage/notice_blue.png");
	background-repeat: no-repeat;
	display: flex;
	justify-content: center;
	align-items: center;
}

.noticeBlue {
	width: 100%;
	height: 100%;
	background-image:
		url("C:/1kosmosc/sts/work_space3/1team/src/main/indexPage/notice_green.png");
	background-repeat: no-repeat;
	display: flex;
	justify-content: center;
	align-items: center;
}

.bottom {
	width: 300px;
	height: 300px;
	background-color: #3297ff;
	border-radius: 15%;
}
</style>
<body>
	<div style="display: flex; align-items: center; width: 100%;">
		<img
			src="C:/1kosmosc/sts/work_space3/1team/src/main/indexPage/logo_none.png"
			width="180" height="60" border="0" alt="">   <span>마이페이지</span>
		<div style="margin-left: auto;">
			<span style="margin-left: auto;">${userName}위원님 안녕하십니까?</span> <input
				type="button" value="Logout" onclick="">
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
						<table width="300" height="300">
							<tr align="center">
								<td><font size="20" color="white"><strong>출제</strong></td>
							</tr>
							<tr align="center">
								<td><img
									src="C:/1kosmosc/sts/work_space3/1team/src/main/indexPage/bookUI.png"
									width="150" height="100" border="0" alt=""></td>
							</tr>
							<tr>
								<td>
									<table class="moved-table" align="left">
										<tr>
											<td colspan="2"><font size="2" color="white"><strong>출제의뢰
														현황</strong></font></td>
										</tr>
										<tr>
											<td colspan="2"><font size="1" color="white"><strong>기능해부학</strong></font>
											</td>
										</tr>
										<tr>
											<td><font size="1" color="white"><strong>0/3</strong></font>
											</td>
											<td><font size="1" color="white"><strong>(7일남음)</strong></font>
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</div>
				</td>
				<td rowspan="2">
					<div class="subtrahend">
						<table width="300" height="300">
							<tr align="center">
								<td>
								<font size="20" color="white"><strong>감수</strong>
								</td>
							</tr>
							<tr align="center">
								<td>
								<img
								src="C:/1kosmosc/sts/work_space3/1team/src/main/indexPage/glasses.png"
								width="115" height="115" border="0" alt="">
								</td>
							</tr>
							<tr>
								<td>
									<table class="moved-table" align="left">
										<tr>
											<td colspan="2"><font size="2" color="white"><strong>출제의뢰
														현황</strong></font></td>
										</tr>
										<tr>
											<td colspan="2"><font size="1" color="white"><strong>기능해부학</strong></font>
											</td>
										</tr>
										<tr>
											<td><font size="1" color="white"><strong>0/3</strong></font>
											</td>
											<td><font size="1" color="white"><strong>(7일
														남음)</strong></font></td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</div>
				</td>
				<td width="300" height="150">
					<div class="noticeGreen">
						<table border=0>
							<tr>
								<td width="200" align=center>공지사항</td>
								<td align=right><input type="button" value=" + " onclick=""></td>
							</tr>
							<tr>
								<td align=left>목록1 부분</td>
								<td align=right>날짜 부분</td>
							</tr>
							<tr>
								<td align=left>목록2 부분</td>
								<td align=right>날짜 부분</td>
							</tr>
							<tr>
								<td align=left>목록3 부분</td>
								<td align=right>날짜 부분</td>
							</tr>
							<tr>
								<td align=left>목록4 부분</td>
								<td align=right>날짜 부분</td>
							</tr>
						</table>
					</div>
				</td>
			</tr>
			<tr>
				<td width="300" height="150">
					<div class="noticeBlue">
						<table border=0>
							<tr>
								<td width="200" align="center">위원전달사항</td>
								<td align=right><input type="button" value=" + " onclick=""></td>
							</tr>
							<tr>
								<td align=left>목록1 부분</td>
								<td align=right>날짜 부분</td>
							</tr>
							<tr>
								<td align=left>목록2 부분</td>
								<td align=right>날짜 부분</td>
							</tr>
							<tr>
								<td align=left>목록3 부분</td>
								<td align=right>날짜 부분</td>
							</tr>
							<tr>
								<td align=left>목록4 부분</td>
								<td align=right>날짜 부분</td>
							</tr>
						</table>
					</div>
				</td>
			</tr>
		</table>
		<br> <br>
		<table border="1">
			<tr>
				<td><img
					src="C:/1kosmosc/sts/work_space3/1team/src/main/front-end/indexPage/left_arrow.png"
					width="40" height="80" border="0" alt=""></td>
				<td>
					<table class="center-table">
						<tr>
							<td><font size="" color=""><strong>QnA</strong></font></td>
						</tr>
						<tr>
							<td><hr></td>
						</tr>
						<tr>
							<td>궁금하신 부분은<br>직접 질문해 주세요
							</td>
						</tr>
						<tr>
							<td><font size="" color="#3297ff"><strong>고객센터
										Q&A</strong></font></td>
						</tr>
					</table>
				</td>
				<td>
					<table class="center-table">
						<tr>
							<td><font size="" color=""><strong>FAQ</strong></font></td>
						</tr>
						<tr>
							<td><hr></td>
						</tr>
						<tr>
							<td>자주 묻는 질문</td>
						</tr>
						<tr>
							<td><font size="" color="#3297ff"><strong>고객센터
										FAQ</strong></font></td>
						</tr>
					</table>
				</td>
				<td>
					<table class="center-table">
						<tr>
							<th><img
								src="C:/1kosmosc/sts/work_space3/1team/src/main/front-end/indexPage/userManual.png"
								width="60" height="50" border="0" alt=""></th>
						</tr>
						<tr>
							<td><hr></td>
						</tr>
						<tr>
							<td>일반 사용자 메뉴얼</td>
						</tr>
						<tr>
							<td><font size="" color="#3297ff"><strong>사용자
										메뉴얼</strong></font></td>
						</tr>
					</table>
				</td>
				<td>
					<table class="center-table">
						<tr>
							<th><img
								src="C:/1kosmosc/sts/work_space3/1team/src/main/front-end/indexPage/certiManual.png"
								width="80" height="80" border="0" alt=""></th>
						</tr>
						<tr>
							<td><hr></td>
						</tr>
						<tr>
							<td>공인 인증서 사용자 메뉴얼</td>
						</tr>
						<tr>
							<td><font size="" color="#3297ff"><strong>공인
										인증서 메뉴얼</strong></font></td>
						</tr>
					</table>
				</td>
				<td>
					<table class="center-table">
						<tr>
							<th><img
								src="C:/1kosmosc/sts/work_space3/1team/src/main/front-end/indexPage/userStandard.png"
								width="80" height="60" border="0" alt=""></th>
						</tr>
						<tr>
							<td><hr></td>
						</tr>
						<tr>
							<td>과목명에 따른 출제 유형</td>
						</tr>
						<tr>
							<td><font size="" color="#3297ff"><strong>출제기준</strong></font></td>
						</tr>
					</table>
				</td>
				<td><img
					src="C:/1kosmosc/sts/work_space3/1team/src/main/front-end/indexPage/right_arrow.png"
					width="40" height="80" border="0" alt=""></td>
			</tr>
		</table>
	</center>
</body>
</html>