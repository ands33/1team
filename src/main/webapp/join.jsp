<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="EUC-KR">
<title>회원 가입</title>
<link rel="stylesheet" href="resources/user_style.css">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script>
    function kakaopost() {
      new daum.Postcode({
        oncomplete: function (data) {
          document.querySelector("#zipcode").value = data.zonecode;
          document.querySelector("#address").value = data.address
        }
      }).open();
    }
  </script>

</head>

<body>
	<center>
		<form method="post" action="memberInput.do" target="_self" enctype="multipart/form-data">
			<table border="0" width="650">
				<tr>
					<th colspan="2">
						<h1>회원가입</h1>
					</th>
				</tr>

				<tr>
					<td align="center" width="150">이름</td>
					<td><input type="text" name="u_name" size="10"></td>
				</tr>
				<tr>
					<td align="center">성별</td>
					<td><input type="radio" name="u_gender" value="남" checked>남
						<input type="radio" name="u_gender" value="여">여</td>
				</tr>
				<tr>
					<td align="center">아이디</td>
					<td><input type="text" name="u_id" size="10" max="20"> <input
						type="button" value="중복확인" name="idconfirm" onclick=""></td>
				</tr>
				<tr>
					<td align="center">비밀번호</td>
					<td><input type="password" name="u_pw" size="10" max="20"></td>
				</tr>
				<tr>
					<td align="center">비밀번호 확인</td>
					<td><input type="password" name="u_pwc" size="10" max="20"></td>
				</tr>
				<tr>
					<td align="center">우편번호</td>
					<td><input type="text" id="zipcode" name="u_zipcode" size="5" readonly>
						<input type="button" value="우편번호찾기" onclick="kakaopost()">
					</td>
				</tr>
				
				<tr>
					<td align="center">주 소</td>
					<td>
					<input type="text" id="address" name="u_addr" size="50" max="100">
					</td>
				</tr>
				
				<tr>
					<td align="center">이메일</td>
					<td><input type="text" name="u_email" size="10" max="20">@
						<input type="text" name="u_emailAddr" size="15" max="20">
						<select name="emailAddrSelect">
							<option value="" selected>직접입력
							<option value="naver.com">naver.com
							<option value="daum.net">daum.net
							<option value="gmail.com">gmail.com
							<option value="nate.com">nate.com
							<option value="yahoo.com">yahoo.com
					</select></td>
				</tr>
				<tr>
					<td align="center">전화번호</td>
					<td><input type="text" name="u_phone" size="14" max="14">
						<br> 예시 : 010-1234-5678</td>
				</tr>
				<tr>
					<td align="center">취미</td>
					<td><input type="checkbox" name="u_hobby" value="여행" checked>여행
						<input type="checkbox" name="u_hobby" value="쇼핑">쇼핑 
						<input type="checkbox" name="u_hobby" value="게임">게임 
						<input type="checkbox" name="u_hobby" value="축구">축구 
						<input type="checkbox" name="u_hobby" value="음악듣기">음악듣기 
						<input type="checkbox" name="u_hobby" value="드라이브">드라이브 
						<input type="checkbox" name="u_hobby" value="기타">기타</td>
				</tr>
				<tr>
					<td align="center">자기소개</td>
					<td><textarea name="u_introduce" rows="10" cols="60"></textarea>
					</td>
				</tr>
				<tr>
					<td align="center">사진첨부</td>
					<td align="left"><input type ="file" name="u_pic" size="30"/></td>
				</tr>
				<tr>
					<th colspan="2">
					<input type="submit" value="가입하기"> 
					<input type="reset" value="다시작성"></th>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>