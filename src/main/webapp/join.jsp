<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="EUC-KR">
<title>ȸ�� ����</title>
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
						<h1>ȸ������</h1>
					</th>
				</tr>

				<tr>
					<td align="center" width="150">�̸�</td>
					<td><input type="text" name="u_name" size="10"></td>
				</tr>
				<tr>
					<td align="center">����</td>
					<td><input type="radio" name="u_gender" value="��" checked>��
						<input type="radio" name="u_gender" value="��">��</td>
				</tr>
				<tr>
					<td align="center">���̵�</td>
					<td><input type="text" name="u_id" size="10" max="20"> <input
						type="button" value="�ߺ�Ȯ��" name="idconfirm" onclick=""></td>
				</tr>
				<tr>
					<td align="center">��й�ȣ</td>
					<td><input type="password" name="u_pw" size="10" max="20"></td>
				</tr>
				<tr>
					<td align="center">��й�ȣ Ȯ��</td>
					<td><input type="password" name="u_pwc" size="10" max="20"></td>
				</tr>
				<tr>
					<td align="center">�����ȣ</td>
					<td><input type="text" id="zipcode" name="u_zipcode" size="5" readonly>
						<input type="button" value="�����ȣã��" onclick="kakaopost()">
					</td>
				</tr>
				
				<tr>
					<td align="center">�� ��</td>
					<td>
					<input type="text" id="address" name="u_addr" size="50" max="100">
					</td>
				</tr>
				
				<tr>
					<td align="center">�̸���</td>
					<td><input type="text" name="u_email" size="10" max="20">@
						<input type="text" name="u_emailAddr" size="15" max="20">
						<select name="emailAddrSelect">
							<option value="" selected>�����Է�
							<option value="naver.com">naver.com
							<option value="daum.net">daum.net
							<option value="gmail.com">gmail.com
							<option value="nate.com">nate.com
							<option value="yahoo.com">yahoo.com
					</select></td>
				</tr>
				<tr>
					<td align="center">��ȭ��ȣ</td>
					<td><input type="text" name="u_phone" size="14" max="14">
						<br> ���� : 010-1234-5678</td>
				</tr>
				<tr>
					<td align="center">���</td>
					<td><input type="checkbox" name="u_hobby" value="����" checked>����
						<input type="checkbox" name="u_hobby" value="����">���� 
						<input type="checkbox" name="u_hobby" value="����">���� 
						<input type="checkbox" name="u_hobby" value="�౸">�౸ 
						<input type="checkbox" name="u_hobby" value="���ǵ��">���ǵ�� 
						<input type="checkbox" name="u_hobby" value="����̺�">����̺� 
						<input type="checkbox" name="u_hobby" value="��Ÿ">��Ÿ</td>
				</tr>
				<tr>
					<td align="center">�ڱ�Ұ�</td>
					<td><textarea name="u_introduce" rows="10" cols="60"></textarea>
					</td>
				</tr>
				<tr>
					<td align="center">����÷��</td>
					<td align="left"><input type ="file" name="u_pic" size="30"/></td>
				</tr>
				<tr>
					<th colspan="2">
					<input type="submit" value="�����ϱ�"> 
					<input type="reset" value="�ٽ��ۼ�"></th>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>