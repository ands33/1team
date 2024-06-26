<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="icon" href="./img/favicon-32x32.png">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>����ȭ��</title>
<style>
#header {
   width: 100%;
   padding: 20px 10px;
   background: #fff;
   z-index: 1;
}

body, table, th, td, input, select, textarea, div, a, p, span, strong, b,
   i, ul, ol, li, button {
   font-family: "Montserrat", "Noto Sans KR", sans-serif;
   font-size: 15px;
   letter-spacing: -0.05em;
   line-height: 1.6em;
   list-style: none;
   color: #333;
}

/* header-link�� ���� ���� */
.header-links a {
   text-decoration: none;
   color: #000;
}

/* �ΰ� ������ �����ȸ �� ��Ʈ�� �۾� ȣ�� */
.header-links a:hover {
   color: #D8402A;
}

.header-left img {
   width: 250px;
   height: auto;
   padding-top: 20px;
   margin-left: 100px;
}

.nav-item:hover {
   color: #6B6D70;
}

/* Flexbox container for centering */
.flex-container {
   display: flex;
   justify-content: center;
   gap: 20px;
   margin-top: 20px; /* Adjust margin as needed */
}

/* Styling for each link and image */
.flex-container a {
   display: block; /* Ensure each link occupies full width of container */
   text-align: center; /* Center text horizontally within link */
}

.flex-container img {
   max-width: 100%;
   height: auto;
   max-height: 200px; /* Example: limit image height */
}
</style>
<link
   href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
   rel="stylesheet">
</head>
<body>
   <div id="header" class="header-container d-flex align-items-center p-3">
      <div class="header-left">
         <a href=""><img src="./img/kcalogo.png" alt="KCA Logo"></a>
      </div>
      <div class="header-links ml-3">
         <a href="https://counselors.or.kr/">�ѱ������ȸ</a> <span> �� </span> <a
            href="https://counselors.or.kr/"><img src="./img/kca_house.png"
            alt="KCA Logo">��Ʈ��</a>
      </div>
      <div class="header-links ml-auto d-flex align-items-center">
         <div>
            <a>${member.member_name}�� �ȳ��ϼ���.</a>
         </div>
         <span class="mx-2"></span> <a href="${pageContext.request.contextPath}/login/login.jsp">�α׾ƿ�</a> <span class="mx-2"></span>
         <a href="#">����������</a>
      </div>
   </div>
   <br>
   <br>
   <div class="flex-container">
      <div>
         <a href="../../../biz/IndexMemberList.do"><img src="./img/��.png"
            alt="����"></a>
      </div>
      <div>
         <a href="../../../biz/getMembersBySubjectAndType.do"><img
            src="./img/��.png" alt="�����԰���"></a>
      </div>
   </div>
   <br>
   <!-- commitvdddddddddddddddddddddd -->
   <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
   <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
   <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
   <script src="scripts.js"></script>
</body>
</html>