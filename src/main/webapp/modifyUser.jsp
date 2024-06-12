<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="EUC-KR">
<title>회원 가입</title>
<link rel="stylesheet" href="resources/user_style.css">
</head>
<body>
	<center>
		<form method="post" action="updateUser.do" target="_self">
		<input name="u_id" type="hidden" value="${user.u_id}" >
			<table border="0" width="650">
				<tr>
				<th colspan="2">
						<a href="deleteUser.do?u_id=${user.u_id }">삭제하기</a>&nbsp;&nbsp;&nbsp;
						<a href="getUserList.do">목록보기</a>&nbsp;&nbsp;&nbsp;
						<a href="updateUser.do">수정하기</a>
					</th>
				</tr>
				<tr>
					<th colspan="2">
						<h1>회원 정보 수정</h1>
					</th>
				</tr>

				<tr>
					<td align="center" width="150">이름</td>
					<td>${user.u_name}</td>
				</tr>
				<tr>
					<td align="center">성별</td>
					<td>${user.u_gender}</td>
				</tr>
				<tr>
					<td align="center">아이디</td>
					<td>
					${user.u_id}
					</td>
				</tr>
				<tr>
					<td align="center">비밀번호</td>
					<td><input type="password" name="u_pw" value = "${user.u_pw}" size="10" max="20"></td>
				</tr>
				<tr>
					<td align="center">비밀번호 확인</td>
					<td><input type="password" name="u_pwc" value = "${user.u_pw}" size="10" max="20"></td>
				</tr>
				<tr>
					<td align="center">주소</td>
					<td><input type="text" name="u_addr" value = "${user.u_addr}"size="50" max="100">
						<input type="button" name="addrSearch" value="주소찾기" onclick="">
					</td>
				</tr>
				<tr>
					<td align="center">이메일</td>
					<td><input type="text" name="u_email" value = "${user.u_email}"  size="10" max="20">@
						<input type="text" name="u_emailAddr" value = "${user.u_emailAddr}" size="15" max="20">
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
					<td><input type="text" name="u_phone" value = "${user.u_phone}" size="12" max="12">
						<br> 예시 : 01012345678</td>
				</tr>
				<tr>
					<td align="center">취미</td>
					<td><input type="checkbox" name="u_hobby" value="여행" checked>여행
						<input type="checkbox" name="u_hobby" value="쇼핑">쇼핑 <input
						type="checkbox" name="u_hobby" value="게임">게임 <input
						type="checkbox" name="u_hobby" value="축구">축구 <input
						type="checkbox" name="u_hobby" value="음악듣기">음악듣기 <input
						type="checkbox" name="u_hobby" value="드라이브">드라이브 <input
						type="checkbox" name="u_hobby" value="기타">기타</td>
				</tr>
				<tr>
					<td align="center">자기소개</td>
					<td><textarea name="u_introduce"  value = "${user.u_introduce}" rows="10" cols="60"></textarea>

					</td>
				</tr>
				<tr>
					<th colspan="2">
					<input type="submit" value="수정 하기"> 
					<input type="reset" value="다시 작성"></th>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>