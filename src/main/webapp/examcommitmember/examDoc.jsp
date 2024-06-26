<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>출제계획서</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
    // 같은 값이 있는 열을 병합하는 함수
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

    // 테이블 ID를 사용하여 열 병합
    $(function() {
        $('#testTable').rowspan(1); // 두 번째 열 병합
        $('#testTable').rowspan(2, true); // 세 번째 열 병합, 두 번째 열의 값과 일치할 때만 병합
    });
    
    // 라디오 버튼을 클릭하면 선택을 취소하는 함수
    function toggleRadio(radio) {
        if (radio.previousChecked) {
            radio.checked = false;
        }
        // 동일한 그룹의 다른 라디오 버튼 클릭 시 현재 라디오 버튼을 활성화
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
                <th colspan="10">출제계획서</th>
            </tr>
            <tr>
                <td colspan="10">과목명:
                	<select name="subject">
                		<option value="total">전체</option>
                			<c:forEach items="${ExamDocSubGroup}" var="examdocsub_group">
                        		<option value="${examdocsub_group.name}">${examdocsub_group.name}</option>
                        	</c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <td colspan="10">출제위원: (A)조성혁 (B)user B</td>
            </tr>
            <tr>
                <th colspan="4">출제영역</th>
                <th colspan="4">난이도별 문제수</th>
                <th colspan="2">출제위원</th>
            </tr>
            <tr>
                <th>분류번호</th>
                <th>대분류</th>
                <th>중분류</th>
                <th>소분류</th>
                <th>상</th>
                <th>중</th>
                <th>하</th>
                <th>합계</th>
                <th>A</th>
                <th>B</th>
            </tr>
            <c:forEach items="${ExamDocSub}" var="examdocsub" varStatus="status">
    			<tr>
        		<td>${examdocsub.categoryNumbers}</td>
        		<td>${examdocsub.category1}</td>
        		<td>${examdocsub.category2}</td>
        		<td>${examdocsub.category3}</td>
        		<td><input type="radio" name="category${status.index}" value="상" onclick="toggleRadio(this)"/></td>
        		<td><input type="radio" name="category${status.index}" value="중" onclick="toggleRadio(this)"/></td>
        		<td><input type="radio" name="category${status.index}" value="하" onclick="toggleRadio(this)"/></td>
        		<td>1</td>
        		<td><input type="radio" name="category${status.index}" value="A" onclick="toggleRadio(this)"/></td>
        		<td><input type="radio" name="category${status.index}" value="B" onclick="toggleRadio(this)"/></td>
    			</tr>
			</c:forEach>
            <tr>
                <th colspan="4" rowspan="2">합계</th>
                <td>2</td>
                <td>2</td>
                <td>1</td>
                <td>5</td>
                <td rowspan="2">3</td>
                <td rowspan="2">2</td>
            </tr>
            <tr>
                <td colspan="3">예상정답률</td>
                <td>40</td>
            </tr>
            <tr>
                <th colspan="10">[저장]</th>
            </tr>
            <tr>
                <td colspan="10">- 난이도의 분포도 확인</td>
            </tr>
            <tr>
                <td colspan="10">상 : 20%내외 (5-6문항)</td>
            </tr>
            <tr>
                <td colspan="10">중 : 50%내외 (13-15문항)</td>
            </tr>
            <tr>
                <td colspan="10">하 : 30%내외 (8-9문항)</td>
            </tr>
            <tr>
                <td colspan="10">-예상정답률 분포에 기초 [(상*0.5)+(중*0.75)+(하*1.0)]*4 공식을 적용하여 과목별 기대점수를 산출(기대점수는 70/100을 유지하도록 한다)</td>
            </tr>
        </table>
    </form>
</body>
</html>
