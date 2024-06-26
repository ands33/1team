<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>������ȹ��</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
    // ���� ���� �ִ� ���� �����ϴ� �Լ�
    $.fn.rowspan = function(colIdx, isStats) {
        return this.each(function() {
            var that;
            $('tr', this).each(function(row) {
                $('td:eq(' + colIdx + ')', this).filter(':visible').each(function(col) {
                    if (that != null && $(this).html() == $(that).html() &&
                        (!isStats || (isStats && $(this).prev().html() == $(that).prev().html()))
                    ) {
                        var rowspan = $(that).attr("rowspan") || 1;
                        rowspan = Number(rowspan) + 1;
                        $(that).attr("rowspan", rowspan);
                        $(this).hide();
                    } else {
                        that = this;
                    }
                    that = (that == null) ? this : that;
                });
            });
        });
    };

    // ���̺� ID�� ����Ͽ� �� ����
    $(function() {
        $('#testTable').rowspan(1); // �� ��° �� ����
        $('#testTable').rowspan(2, true); // �� ��° �� ����, �� ��° ���� ���� ��ġ�� ���� ����
    });
    
    // ���� ��ư�� Ŭ���ϸ� ������ ����ϴ� �Լ�
    function toggleRadio(radio) {
        if (radio.previousChecked) {
            radio.checked = false;
        }
        // ������ �׷��� �ٸ� ���� ��ư Ŭ�� �� ���� ���� ��ư�� Ȱ��ȭ
        $('input[name="' + radio.name + '"]').each(function() {
            this.previousChecked = this.checked;
        });
    }
</script>
</head>
<body>
    <form action="getexamDocList.do" method="post">
        <table id="testTable" align="center" border="1">
            <tr>
                <th colspan="10">������ȹ��</th>
            </tr>
            <tr>
                <td colspan="10">�����:
                	<select name="subject">
                		<option value="total">��ü</option>
                			<c:forEach items="${ExamDocSubGroup}" var="examdocsub_group">
                        		<option value="${examdocsub_group.name}">${examdocsub_group.name}</option>
                        	</c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <td colspan="10">��������: (A)������ (B)user B</td>
            </tr>
            <tr>
                <th colspan="4">��������</th>
                <th colspan="4">���̵��� ������</th>
                <th colspan="2">��������</th>
            </tr>
            <tr>
                <th>�з���ȣ</th>
                <th>��з�</th>
                <th>�ߺз�</th>
                <th>�Һз�</th>
                <th>��</th>
                <th>��</th>
                <th>��</th>
                <th>�հ�</th>
                <th>A</th>
                <th>B</th>
            </tr>
            <c:forEach items="${ExamDocSub}" var="examdocsub" varStatus="status">
    			<tr>
        		<td>${examdocsub.categoryNumbers}</td>
        		<td>${examdocsub.category1}</td>
        		<td>${examdocsub.category2}</td>
        		<td>${examdocsub.category3}</td>
        		<td><input type="radio" name="category${status.index}" value="��" onclick="toggleRadio(this)"/></td>
        		<td><input type="radio" name="category${status.index}" value="��" onclick="toggleRadio(this)"/></td>
        		<td><input type="radio" name="category${status.index}" value="��" onclick="toggleRadio(this)"/></td>
        		<td>1</td>
        		<td><input type="radio" name="category${status.index}" value="A" onclick="toggleRadio(this)"/></td>
        		<td><input type="radio" name="category${status.index}" value="B" onclick="toggleRadio(this)"/></td>
    			</tr>
			</c:forEach>
            <tr>
                <th colspan="4" rowspan="2">�հ�</th>
                <td>2</td>
                <td>2</td>
                <td>1</td>
                <td>5</td>
                <td rowspan="2">3</td>
                <td rowspan="2">2</td>
            </tr>
            <tr>
                <td colspan="3">���������</td>
                <td>40</td>
            </tr>
            <tr>
                <th colspan="10">[����]</th>
            </tr>
            <tr>
                <td colspan="10">- ���̵��� ������ Ȯ��</td>
            </tr>
            <tr>
                <td colspan="10">�� : 20%���� (5-6����)</td>
            </tr>
            <tr>
                <td colspan="10">�� : 50%���� (13-15����)</td>
            </tr>
            <tr>
                <td colspan="10">�� : 30%���� (8-9����)</td>
            </tr>
            <tr>
                <td colspan="10">-��������� ������ ���� [(��*0.5)+(��*0.75)+(��*1.0)]*4 ������ �����Ͽ� ���� ��������� ����(��������� 70/100�� �����ϵ��� �Ѵ�)</td>
            </tr>
        </table>
    </form>
</body>
</html>
