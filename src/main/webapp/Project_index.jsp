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
	height: 100%;
	background-image:
		url("C:/1kosmosc/sts/work_space3/1team/src/main/indexPage/notice_green.png");
	background-repeat: no-repeat;
}

.noticeBlue {
	width: 100%;
	height: 100%;
	background-image:
		url("C:/1kosmosc/sts/work_space3/1team/src/main/indexPage/notice_blue.png");
	background-repeat: no-repeat;
	justify-content: center;
	align-items: center;
	height: 100%;
	background-image:
		url("C:/1kosmosc/sts/work_space3/1team/src/main/indexPage/notice_blue.png");
	background-repeat: no-repeat;
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
</style>
<body>
<<<<<<< HEAD
	<div style="display: flex; align-items: center; width: 100%;">
		<img
			src="C:/1kosmosc/sts/work_space3/1team/src/main/indexPage/logo_none.png"
			width="180" height="60" border="0" alt=""><span>마이페이지</span>
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
		<table border="1">
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
									\
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
				<td>
					<div class="noticeGreen">
						<table align="center" width="300" height="150">
							<tr align="center">
								<td>공지사항</td>
								<td><input type="button" value=" + " onclick=""></td>
							</tr>
						</table>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="noticeBlue">
						<table align="center" width="300" height="150">
							<tr align="center">
								<td>위원전달사항</td>
								<td><input type="button" value=" + " onclick=""></td>
							</tr>
						</table>
					</div>
				</td>
			</tr>
		</table>
		<br> <br>
		<table border="1" height="150">
			<tr>
				<td><img
					src="C:/1kosmosc/sts/work_space3/1team/src/main/indexPage/left_arrow.png"
					width="40" height="80" border="1" alt=""></td>
				<td>
					<div class="menu">
						<table width="150" height="150">
							<tr height="50" border="1">
								<td><font size="" color=""><strong>QnA</strong></font></td>
							</tr>
							<tr height="50">
								<td>궁금하신 부분은<br>직접 질문해 주세요
								</td>
							</tr>
							<tr height="50">
								<td><font size="" color="#3297ff"><strong>고객센터
											Q&A</strong></font></td>
							</tr>
						</table>
					</div>
				</td>
				<td>
					<div class="menu">
						<table width="150" height="150" border="1">
							<tr height="50">
								<td><font size="" color=""><strong>FAQ</strong></font></td>
							</tr>
							<tr height="50">
								<td>자주 묻는 질문</td>
							</tr>
							<tr height="50">
								<td><font size="" color="#3297ff"><strong>고객센터
											FAQ</strong></font></td>
							</tr>
						</table>
					</div>
				</td>
				<td>
					<div class="menu">
						<table width="150" height="150" border="1">
							<tr height="50">
								<th><img
									src="C:/1kosmosc/sts/work_space3/1team/src/main/indexPage/UserManual.png"
									width="60" height="50" border="1" alt=""></th>
							</tr>
							<tr height="50">
								<td>일반 사용자 메뉴얼</td>
							</tr>
							<tr height="50">
								<td><font size="" color="#3297ff"><strong>사용자
											메뉴얼</strong></font></td>
							</tr>
						</table>
					</div>
				</td>
				<td>
				<div class="menu">
					<table>
						<tr>
							<th><img
								src="C:/Users/user/Desktop/핵심역량프로젝트/front-end/certiManual.png"
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
					<table>
						<tr>
							<th><img
								src="C:/Users/user/Desktop/핵심역량프로젝트/front-end/butterfly.png"
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
					src="C:/1kosmosc/sts/work_space3/1team/src/main/indexPage/right_arrow.png"
					width="40" height="80" border="0" alt=""></td>
			</tr>
		</table>
	</center>
</body>
</html>
=======
<div style="display: flex; align-items: center; width: 100%;">
    <img src="C:/Users/user/Desktop/인증마스터/front-end/로고 이미지.png" width="180" height="60" border="0" alt=""> 
    <span>유저 님</span>
    <div style="margin-left: auto;">
        <span style="margin-left: auto;">${userName}님 반갑습니다!</span>
        <input type="button" value="Logout" onclick="">
    </div>
</div>
<hr>
<div class="squareTop"></div>
<br><br>
<center>
<table border="1">
    <tr>
        <td rowspan="2">
            <div class="square1">
                <center>
                    <p><font size="20" color="white"><strong>업데이트</strong></font></p>
                    <img src="C:/Users/user/Desktop/인증마스터/front-end/이미지.png" width="150" height="100" border="0" alt="">
                </center>
                <br>
                <table class="moved-table">
                    <tr>
                        <td colspan="2">
                            <font size="2" color="white"><strong>업데이트 정보</strong></font>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <font size="1" color="white"><strong>상세 정보</strong></font>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <font size="1" color="white"><strong>0/3</strong></font>
                        </td>
                        <td>
                            <font size="1" color="white"><strong>(7일 남음)</strong></font>
                        </td>
                    </tr>
                </table>
            </div>
        </td>
        <td rowspan="2">
            <div class="square2">
                <center>
                    <p><font size="20" color="white"><strong>공지사항</strong></font></p>
                    <img src="C:/Users/user/Desktop/인증마스터/front-end/공지사항.png" width="115" height="115" border="0" alt="">
                </center>
                <table class="moved-table">
                    <tr>
                        <td colspan="2">
                            <font size="2" color="white"><strong>공지사항 정보</strong></font>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <font size="1" color="white"><strong>상세 정보</strong></font>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <font size="1" color="white"><strong>0/3</strong></font>
                        </td>
                        <td>
                            <font size="1" color="white"><strong>(7일 남음)</strong></font>
                        </td>
                    </tr>
                </table>
            </div>
        </td>
        <td>
            <div class="noticeGreen">
                <table align="center">
                    <tr>
                        <td>공지사항</td>
                        <td><input type="button" value="보기" onclick=""></td>
                    </tr>
                </table>
            </div>
        </td>
    </tr>
    <tr>
        <td>
            <div class="noticeBlue">
                <table align="center">
                    <tr>
                        <td>FAQ</td>
                        <td><input type="button" value="보기" onclick=""></td>
                    </tr>
                </table>
            </div>
        </td>
    </tr>
</table>
<br><br>
<table border="1">
    <tr>
        <td>
            <img src="C:/Users/user/Desktop/인증마스터/front-end/왼쪽 화살표.png" width="40" height="80" border="0" alt="">
        </td>
        <td>
            <table class="center-table">
                <tr>
                    <td><font size="" color=""><strong>QnA</strong></font></td>
                </tr>
                <tr>
                    <td><hr></td>
                </tr>
                <tr>
                    <td>자주 묻는 질문<br>여기에 작성합니다</td>
                </tr>
                <tr>
                    <td><font size="" color="#3297ff"><strong>자주 묻는 Q&A</strong></font></td>
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
                    <td>자주 묻는 질문<br>여기에 작성합니다</td>
                </tr>
                <tr>
                    <td><font size="" color="#3297ff"><strong>자주 묻는 FAQ</strong></font></td>
                </tr>
            </table>
        </td>
        <td>
            <table class="center-table">
                <tr>
                    <th><img src="C:/Users/user/Desktop/인증마스터/front-end/아이콘.png" width="60" height="50" border="0" alt=""></th>
                </tr>
                <tr>
                    <td><hr></td>
                </tr>
                <tr>
                    <td>아이콘 설명</td>
                </tr>
                <tr>
                    <td><font size="" color="#3297ff"><strong>아이콘 설명</strong></font></td>
                </tr>
            </table>
        </td>
        <td>
            <table class="center-table">
                <tr>
                    <th><img src="C:/Users/user/Desktop/인증마스터/front-end/certiManual.png" width="80" height="80" border="0" alt=""></th>
                </tr>
                <tr>
                    <td><hr></td>
                </tr>
                <tr>
                    <td>매뉴얼 설명</td>
                </tr>
                <tr>
                    <td><font size="" color="#3297ff"><strong>매뉴얼 설명</strong></font></td>
                </tr>
            </table>
        </td>
        <td>
            <table class="center-table">
                <tr>
                    <th><img src="C:/Users/user/Desktop/인증마스터/front-end/butterfly.png" width="80" height="60" border="0" alt=""></th>
                </tr>
                <tr>
                    <td><hr></td>
                </tr>
                <tr>
                    <td>자주 묻는 질문<br>여기에 작성
>>>>>>> develop
