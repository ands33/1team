<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
=======
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
>>>>>>> 75a0fe3b7960cff35f12d8cfb75ff5cfdd690508
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>index 메인 페이지 (main)</title>
<style>
.center-table td {
<<<<<<< HEAD
	text-align: center;
=======
    text-align: center;
>>>>>>> 75a0fe3b7960cff35f12d8cfb75ff5cfdd690508
}

.squareTop {
<<<<<<< HEAD
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
=======
    width : 100%;
    height : 40px;
    background-color : #0066ff;
}
.square1 {
    width: 300px;
    height: 300px;
    background-color: #00ff83;
    border-radius: 15%;
}
.square2 {
    width: 300px;
    height: 300px;
    background-color: #3297ff;
    border-radius: 15%;
>>>>>>> 75a0fe3b7960cff35f12d8cfb75ff5cfdd690508
}

.squareNotice1 {
<<<<<<< HEAD
	width: 300px;
	height: 150px;
	border-radius: 10%;
	border: 2px solid black;
=======
    width: 300px;
    height: 150px;
    border-radius: 10%;
    border: 2px solid black;
>>>>>>> 75a0fe3b7960cff35f12d8cfb75ff5cfdd690508
}

.squareNotice2 {
<<<<<<< HEAD
	width: 300px;
	height: 150px;
	border-radius: 10%;
	border: 2px solid black;
=======
    width: 300px;
    height: 150px;
    border-radius: 10%;
    border: 2px solid black;
>>>>>>> 75a0fe3b7960cff35f12d8cfb75ff5cfdd690508
}

.moved-table {
<<<<<<< HEAD
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
=======
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
>>>>>>> 75a0fe3b7960cff35f12d8cfb75ff5cfdd690508
}

.noticeGreen {
<<<<<<< HEAD
	width: 100%;
	height: 100%;
	background-image:
		url("C:/1kosmosc/sts/work_space3/1team/src/main/indexPage/notice_blue.png");
	background-repeat: no-repeat;
	display: flex;
	justify-content: center;
	align-items: center;
=======
    position: relative;
    width: 300px;
    height: 100px;
    background-image: url("C:/Users/user/Desktop/인증마스터/front-end/공지사항 이미지.png");
    background-size: cover;
    background-repeat: no-repeat;
    display: flex;
    justify-content: center;
    align-items: center;
>>>>>>> 75a0fe3b7960cff35f12d8cfb75ff5cfdd690508
}

.noticeBlue {
<<<<<<< HEAD
	width: 100%;
	height: 100%;
	background-image:
		url("C:/1kosmosc/sts/work_space3/1team/src/main/indexPage/notice_green.png");
	background-repeat: no-repeat;
	display: flex;
	justify-content: center;
	align-items: center;
=======
    position: relative;
    width: 300px;
    height: 100px;
    background-image: url("C:/Users/user/Desktop/인증마스터/front-end/공지사항 이미지.png");
    background-size: cover;
    background-repeat: no-repeat;
    display: flex;
    justify-content: center;
    align-items: center;
>>>>>>> 75a0fe3b7960cff35f12d8cfb75ff5cfdd690508
}

.bottom {
<<<<<<< HEAD
	width: 300px;
	height: 300px;
	background-color: #3297ff;
	border-radius: 15%;
=======
    width: 300px;
    height: 300px;
    background-color: #3297ff;
    border-radius: 15%;
>>>>>>> 75a0fe3b7960cff35f12d8cfb75ff5cfdd690508
}
</style>
</head>
<body>
<<<<<<< HEAD
	<div style="display: flex; align-items: center; width: 100%;">
		<img
			src="C:/1kosmosc/sts/work_space3/1team/src/main/indexPage/logo_none.png"
			width="180" height="60" border="0" alt="">혻혻 <span>留덉씠�럹�씠吏�</span>
		<div style="margin-left: auto;">
			<span style="margin-left: auto;">${userName}�쐞�썝�떂 �븞�뀞�븯�떗�땲源�?</span> <input
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
								<td><font size="20" color="white"><strong>異쒖젣</strong></td>
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
											<td colspan="2"><font size="2" color="white"><strong>異쒖젣�쓽猶�
														�쁽�솴</strong></font></td>
										</tr>
										<tr>
											<td colspan="2"><font size="1" color="white"><strong>湲곕뒫�빐遺��븰</strong></font>
											</td>
										</tr>
										<tr>
											<td><font size="1" color="white"><strong>0/3</strong></font>
											</td>
											<td><font size="1" color="white"><strong>(7�씪�궓�쓬)</strong></font>
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
								<font size="20" color="white"><strong>媛먯닔</strong>
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
											<td colspan="2"><font size="2" color="white"><strong>異쒖젣�쓽猶�
														�쁽�솴</strong></font></td>
										</tr>
										<tr>
											<td colspan="2"><font size="1" color="white"><strong>湲곕뒫�빐遺��븰</strong></font>
											</td>
										</tr>
										<tr>
											<td><font size="1" color="white"><strong>0/3</strong></font>
											</td>
											<td><font size="1" color="white"><strong>(7�씪
														�궓�쓬)</strong></font></td>
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
								<td width="200" align=center>怨듭���궗�빆</td>
								<td align=right><input type="button" value=" + " onclick=""></td>
							</tr>
							<tr>
								<td align=left>紐⑸줉1 遺�遺�</td>
								<td align=right>�궇吏� 遺�遺�</td>
							</tr>
							<tr>
								<td align=left>紐⑸줉2 遺�遺�</td>
								<td align=right>�궇吏� 遺�遺�</td>
							</tr>
							<tr>
								<td align=left>紐⑸줉3 遺�遺�</td>
								<td align=right>�궇吏� 遺�遺�</td>
							</tr>
							<tr>
								<td align=left>紐⑸줉4 遺�遺�</td>
								<td align=right>�궇吏� 遺�遺�</td>
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
								<td width="200" align="center">�쐞�썝�쟾�떖�궗�빆</td>
								<td align=right><input type="button" value=" + " onclick=""></td>
							</tr>
							<tr>
								<td align=left>紐⑸줉1 遺�遺�</td>
								<td align=right>�궇吏� 遺�遺�</td>
							</tr>
							<tr>
								<td align=left>紐⑸줉2 遺�遺�</td>
								<td align=right>�궇吏� 遺�遺�</td>
							</tr>
							<tr>
								<td align=left>紐⑸줉3 遺�遺�</td>
								<td align=right>�궇吏� 遺�遺�</td>
							</tr>
							<tr>
								<td align=left>紐⑸줉4 遺�遺�</td>
								<td align=right>�궇吏� 遺�遺�</td>
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
							<td>沅곴툑�븯�떊 遺�遺꾩��<br>吏곸젒 吏덈Ц�빐 二쇱꽭�슂
							</td>
						</tr>
						<tr>
							<td><font size="" color="#3297ff"><strong>怨좉컼�꽱�꽣
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
							<td>�옄二� 臾삳뒗 吏덈Ц</td>
						</tr>
						<tr>
							<td><font size="" color="#3297ff"><strong>怨좉컼�꽱�꽣
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
							<td>�씪諛� �궗�슜�옄 硫붾돱�뼹</td>
						</tr>
						<tr>
							<td><font size="" color="#3297ff"><strong>�궗�슜�옄
										硫붾돱�뼹</strong></font></td>
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
							<td>怨듭씤 �씤利앹꽌 �궗�슜�옄 硫붾돱�뼹</td>
						</tr>
						<tr>
							<td><font size="" color="#3297ff"><strong>怨듭씤
										�씤利앹꽌 硫붾돱�뼹</strong></font></td>
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
							<td>怨쇰ぉ紐낆뿉 �뵲瑜� 異쒖젣 �쑀�삎</td>
						</tr>
						<tr>
							<td><font size="" color="#3297ff"><strong>異쒖젣湲곗��</strong></font></td>
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
>>>>>>> 75a0fe3b7960cff35f12d8cfb75ff5cfdd690508
