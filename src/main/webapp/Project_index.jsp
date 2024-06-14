<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>index ���� ������ (main)</title>
<style>
.center-table td {
    text-align: center;
}
.squareTop {
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
    position: relative;
    width: 300px;
    height: 100px;
    background-image: url("C:/Users/user/Desktop/����������/front-end/�������� �̹���.png");
    background-size: cover;
    background-repeat: no-repeat;
    display: flex;
    justify-content: center;
    align-items: center;
}
.noticeBlue {
    position: relative;
    width: 300px;
    height: 100px;
    background-image: url("C:/Users/user/Desktop/����������/front-end/�������� �̹���.png");
    background-size: cover;
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
</head>
<body>
<div style="display: flex; align-items: center; width: 100%;">
    <img src="C:/Users/user/Desktop/����������/front-end/�ΰ� �̹���.png" width="180" height="60" border="0" alt=""> 
    <span>���� ��</span>
    <div style="margin-left: auto;">
        <span style="margin-left: auto;">${userName}�� �ݰ����ϴ�!</span>
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
                    <p><font size="20" color="white"><strong>������Ʈ</strong></font></p>
                    <img src="C:/Users/user/Desktop/����������/front-end/�̹���.png" width="150" height="100" border="0" alt="">
                </center>
                <br>
                <table class="moved-table">
                    <tr>
                        <td colspan="2">
                            <font size="2" color="white"><strong>������Ʈ ����</strong></font>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <font size="1" color="white"><strong>�� ����</strong></font>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <font size="1" color="white"><strong>0/3</strong></font>
                        </td>
                        <td>
                            <font size="1" color="white"><strong>(7�� ����)</strong></font>
                        </td>
                    </tr>
                </table>
            </div>
        </td>
        <td rowspan="2">
            <div class="square2">
                <center>
                    <p><font size="20" color="white"><strong>��������</strong></font></p>
                    <img src="C:/Users/user/Desktop/����������/front-end/��������.png" width="115" height="115" border="0" alt="">
                </center>
                <table class="moved-table">
                    <tr>
                        <td colspan="2">
                            <font size="2" color="white"><strong>�������� ����</strong></font>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <font size="1" color="white"><strong>�� ����</strong></font>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <font size="1" color="white"><strong>0/3</strong></font>
                        </td>
                        <td>
                            <font size="1" color="white"><strong>(7�� ����)</strong></font>
                        </td>
                    </tr>
                </table>
            </div>
        </td>
        <td>
            <div class="noticeGreen">
                <table align="center">
                    <tr>
                        <td>��������</td>
                        <td><input type="button" value="����" onclick=""></td>
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
                        <td><input type="button" value="����" onclick=""></td>
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
            <img src="C:/Users/user/Desktop/����������/front-end/���� ȭ��ǥ.png" width="40" height="80" border="0" alt="">
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
                    <td>���� ���� ����<br>���⿡ �ۼ��մϴ�</td>
                </tr>
                <tr>
                    <td><font size="" color="#3297ff"><strong>���� ���� Q&A</strong></font></td>
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
                    <td>���� ���� ����<br>���⿡ �ۼ��մϴ�</td>
                </tr>
                <tr>
                    <td><font size="" color="#3297ff"><strong>���� ���� FAQ</strong></font></td>
                </tr>
            </table>
        </td>
        <td>
            <table class="center-table">
                <tr>
                    <th><img src="C:/Users/user/Desktop/����������/front-end/������.png" width="60" height="50" border="0" alt=""></th>
                </tr>
                <tr>
                    <td><hr></td>
                </tr>
                <tr>
                    <td>������ ����</td>
                </tr>
                <tr>
                    <td><font size="" color="#3297ff"><strong>������ ����</strong></font></td>
                </tr>
            </table>
        </td>
        <td>
            <table class="center-table">
                <tr>
                    <th><img src="C:/Users/user/Desktop/����������/front-end/certiManual.png" width="80" height="80" border="0" alt=""></th>
                </tr>
                <tr>
                    <td><hr></td>
                </tr>
                <tr>
                    <td>�Ŵ��� ����</td>
                </tr>
                <tr>
                    <td><font size="" color="#3297ff"><strong>�Ŵ��� ����</strong></font></td>
                </tr>
            </table>
        </td>
        <td>
            <table class="center-table">
                <tr>
                    <th><img src="C:/Users/user/Desktop/����������/front-end/butterfly.png" width="80" height="60" border="0" alt=""></th>
                </tr>
                <tr>
                    <td><hr></td>
                </tr>
                <tr>
                    <td>���� ���� ����<br>���⿡ �ۼ�
