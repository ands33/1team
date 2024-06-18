<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="EUC-KR">
    <title>���� ���� ī��</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            padding: 20px;
        }
        h2 {
            text-align: center;
        }
        .header-table, .main-table {
            width: 100%;
            border-collapse: collapse;
        }
        .header-table th, .header-table td, .main-table th, .main-table td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: center;
        }
        .header-table th, .main-table th {
            background-color: #f2f2f2;
        }
        .input-container {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
        }
        .input-container input {
            width: 48%;
            padding: 10px;
            box-sizing: border-box;
        }
        .button-container {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
        }
        .button-container button {
            padding: 10px;
            box-sizing: border-box;
        }
    </style>
</head>
<body>

<h2>���� ���� ī��</h2>

<div class="button-container">
    <input type="text" placeholder="�����Ⱓ: �� �� �� ~ �� �� ��">
    <button type="button" onclick="location.href='excel_export.jsp'">�����������</button>
</div>

<table class="header-table">
    <tr>
        <th colspan="5">��������</th>
        <th colspan="3">������ ����</th>
        <th>�������� ����</th>
    </tr>
    <tr>
        <th>�޼�</th>
        <th>����</th>
        <th>�����</th>
        <th>�������</th>
        <th>�����ڵ�</th>
        <th>ID</th>
        <th>PW</th>
        <th>A + B / A</th>
        <th>�̸�</th>
    </tr>
    <tr>
        <td>1��</td>
        <td>1����<br>[+�����߰�]</td>
        <td>����а���</td>
        <td>[����]</td>
        <td>11</td>
        <td>certi11A</td>
        <td>certi11B</td>
        <td>��</td>
        <td>certi11C</td>
    </tr>
    <tr>
        <td></td>
        <td></td>
        <td>��޻���̷а� ����</td>
        <td>[����]</td>
        <td>12</td>
        <td>certi12A</td>
        <td>certi12B</td>
        <td>��</td>
        <td>certi12C</td>
    </tr>
    <tr>
        <td></td>
        <td></td>
        <td>���ܻ�� ���α׷� ����</td>
        <td>[����]</td>
        <td>13</td>
        <td>certi13A</td>
        <td>certi13B</td>
        <td>��</td>
        <td>certi13C</td>
    </tr>
    <tr>
        <td></td>
        <td></td>
        <td>�ɸ��򰡿� ����</td>
        <td>[����]</td>
        <td>14</td>
        <td>certi14A</td>
        <td>certi14B</td>
        <td>��</td>
        <td>certi14C</td>
    </tr>
    <tr>
        <td>1��</td>
        <td>2����<br>[+�����߰�]</td>
        <td>����̷а� ����</td>
        <td>[����]</td>
        <td>21</td>
        <td>certi21A</td>
        <td>certi21B</td>
        <td>��</td>
        <td>certi21C</td>
    </tr>
    <tr>
        <td></td>
        <td></td>
        <td>���ܻ�� �̷а� ����</td>
        <td>[����]</td>
        <td>22</td>
        <td>certi22A</td>
        <td>certi22B</td>
        <td>��</td>
        <td>certi22C</td>
    </tr>
    <tr>
        <td></td>
        <td></td>
        <td>�������</td>
        <td>[����]</td>
        <td>23</td>
        <td>certi23A</td>
        <td>certi23B</td>
        <td>��</td>
        <td>certi23C</td>
    </tr>
</table>

</body>
</html>
