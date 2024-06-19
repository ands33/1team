<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="EUC-KR">
    <title>���� ī�� - 1�� ��޻���̷а� ����</title>
    <style>
       bn{
            border: none; /* �׵θ� ���� */
            padding: 8px;
        }
        body {
            font-family: Arial, sans-serif;
        }
        .container {
            width: 1000px;
            margin: auto;
            padding: 20px;
            border: 1px solid #000;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        th, td {
            border: 1px solid #000;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f4f4f4;
        }
        .title {
            text-align: center;
            font-weight: bold;
            background-color: #f4f4f4;
        }
        .subtitle {

           text-align: left;
            background-color: #f4f4f4;
            padding: 5px;
            border: 1px solid #ddd;
            margin-bottom: auto;
            width: 50%; /* ���� �ʺ� 50%�� ���� */
          margin-left: auto; /* ��� ������ ���� �߰� */
          margin-right: auto; /* ��� ������ ���� �߰� */
        }
        .answer {
            text-align: center;
            font-weight: bold;
        }
    </style>
</head>
<%@ include file="header.jsp"%>
<body>
<div class="container">
    <div class="details">
        <h2 class="title">�ѱ������ȸ ���� ���蹮��</h2>
        <table>
        <tr>
           <td style="border: none;"></td>
           <td style="border: none;"></td>
            <th colspan="2">������ȣ</th>
            <td colspan="4"><!-- ���⿡ ������ȣ�� �Է��� �ּ���. ��������ϴ� --></td>
        </tr>
        <tr>
            <th>�ڰ�</th>
            <td>${test.grade}�� ��������</td>
            <th>����</th>
            <td>����</td>
            <th>���̵�</th>
            <td style="text-align: center;">${test.diff}</td>
        </tr>
        <tr>
            <th>�����</th>
            <td colspan="3">${test.name}</td>
            <th>��������</th>
            <td style="text-align: center;" colspan="5">${test.categoryNumbers}</td>
        </tr>
    </table>
    <table>
        <tr>
        <td colspan="6">
            [�� ��] 2019-1. &lt;����&gt;���� �����ϰ� �ִ� ������ ������?<br><br>
            
                <div class="subtitle">
                    <p><strong>&lt;����&gt;</strong></p>
                    <p>- ������ �����ϰ� ��ġ���� �浹�� �����.</p>
                    <p>- ��ȸ�� ������ ���� ������ ���� �����Ѵ�.</p>
                    <p>- �λ��� �ǹ̿� ������ ���� �������� �̾߱��Ѵ�.</p>
                </div>
                <br>
                
                <ol>
                    <li>��ȭ(sublimation)</li>
                    <li>ġȯ(displacement)</li>
                    <li>�ݵ�����(reaction formation)</li>
                    <li>����ȭ(intellectualization)</li>
                    <li>�ո�ȭ(rationalization)</li>
                </ol>
            </td>
        </tr>
    </table>
    
    <table>
        <tr>
            <th colspan="1" class="answer">����</th>
            <td style="text-align: center;" colspan="5">��</td>
        </tr>
        <tr>
            <th colspan="1" class="answer">�����ؼ�</th>
            <td colspan="5">82.52%</td>
        </tr>
        <tr>
            <th colspan="1" class="answer">�������</th>
            <td colspan="5">������ ������ ����� Ư¡�� ���� �����ϰ� �ִ����� ����.<br>
               �з�: ${test.category1} - ${test.category2} - ${test.category3}</td>
        </tr>
        <tr>
            <th rowspan="5" colspan="1" class="answer">��������/���ǻ�</th>
            <td rowspan="5" colspan="1">-����а���/������, ����� �̷а� ����(2��)/������, ������Ѽ�: ����̷а� ����/������, �ɸ�ġ��� ����̷�: ���� �� ���(5��)/������������</td>
           <th rowspan="5" colspan="1" class="answer">���ڸ�/���ǿ���</th>
           <td rowspan="5" colspan="1">-����� ��/2011, ����� ��/2016, ���� ��/2013, õ���� �� ����/2014</td>
           <th rowspan="5" colspan="1" class="answer">PAGE</th>
           <td rowspan="5" colspan="1">-184, 89, 66, 39-40</td>          
        </tr>
    </table>
    
    <table>
        <tr>
            <td class="answer">����</td>
            <td class="answer">����</td>
            <td class="answer">�Ҽ�</td>
            <td class="answer">����</td>
            <td class="answer">����</td>
         </tr>
         <tr>
            <td class="answer">������</td>
            <td>2019-09-06</td>
            <td style="text-align: center;color: red;">�Ҽ�</td>
            <td style="text-align: center;">${test.writtenName}</td>
            <td></td>
        </tr>
    </table>
</div>
</div>
</body>
</html>
