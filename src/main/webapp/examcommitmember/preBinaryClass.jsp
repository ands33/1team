<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="EUC-KR">
<title>이원분류표(선제)</title>
<style>
body {
	background: #F8F9FB;
	font-family: 'Roboto', sans-serif;
	margin: 0;
	padding: 200px;
}

table {
	width: 100%;
	border-collapse: collapse;
	table-layout: fixed;
	margin-bottom: 20px;
}

th {
	white-space: nowrap; /* 넘침 처리 방지 */
	padding: 10px; /* 셀 안 여백 */
	font-size: 15px; /* 글씨 크기 */
	font-weight: bold;
	background-color: #f2f2f2;
}

th, td {
	border: 1px solid black;
	text-align: left;
	padding: 8px;
	text-align: center;
	word-wrap: break-word;
}

.narrow {
    width: 60px; /* 원하는 너비로 설정 */
    height: 50px;
}

.row-header {
	background-color: #f2f2f2;
}

.header {
	background-color: #f2f2f2;
	font-size: 24px;
}

.sub-header {
	background-color: #f2f2f2;
}

.highlight {
	background-color: #f2f2f2;
}

.rotate {
	writing-mode: vertical-rl;
	transform: rotate(180deg);
	white-space: nowrap;
}

.bottom-table {
	width: auto;
	border: none;
	margin-top: 10px;
}

.bottom-table th, .bottom-table td {
	border: 1px solid black;
}

.tc {
	text-align: center;
}
</style>
</head>
<body>
	<form>
		<h1 style="text-align: center">이원분류표 (선제)</h1>
		<table>
			<tr>
				<th colspan="9">급수</th>
				<td colspan="15">1급</td>
			</tr>
			<tr>
				<th colspan="9" class="sub-header">과목명</th>
				<td colspan="15">고급상담이론과 실제</td>
			</tr>
		</table>
		<table>
			<tr>
				<th class="narrow" rowspan="2" colspan="2">최종문항<br>번호</th>
				<th class="narrow" rowspan="2" colspan="2">정답</th>
				<th class="narrow" rowspan="2" colspan="2">출제영역</th>
				<th class="narrow" rowspan="2" colspan="4">출처</th>
				<th colspan="2">출제위원</th>
				<th colspan="2">출제방법</th>
				<th colspan="3">난이도</th>
				<th colspan="3">행동영역</th>
				<th colspan="4">문항검토의견<br>(문항 오류의 사유 및 출처)
				</th>
			</tr>


			<tr>
				<td>홍길동</td>
				<td>김복순</td>
				<td>문항제작</td>
				<td>기출문제</td>
				<td>상</td>
				<td>중</td>
				<td>하</td>
				<td>지식</td>
				<td>이해</td>
				<td>적용</td>
				<td colspan="4"></td>
			</tr>

			<tr>
				<td colspan="2">1</td>
				<td colspan="2">①</td>
				<td colspan="2">1-0-0</td>
				<td colspan="4">심리상담과 치료의 이론과 실제</td>
				<td>ㅇ</td>
				<td></td>
				<td>제작</td>
				<td></td>
				<td></td>
				<td></td>
				<td>ㅇ</td>
				<td></td>
				<td></td>
				<td>ㅇ</td>
				<td colspan="4"></td>
			</tr>

			<tr>
				<td colspan="2">2</td>
				<td colspan="2">③</td>
				<td colspan="2">1-0-1</td>
				<td colspan="4">현대심리치료와 상담이론</td>
				<td></td>
				<td>ㅇ</td>
				<td></td>
				<td>2019</td>
				<td></td>
				<td>ㅇ</td>
				<td></td>
				<td></td>
				<td>ㅇ</td>
				<td></td>
				<td colspan="4"></td>
			</tr>

			<tr>
				<td colspan="2">3</td>
				<td colspan="2">③</td>
				<td colspan="2">1-0-2</td>
				<td colspan="4"></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td colspan="4"></td>
			</tr>

			<tr>
				<td colspan="2">4</td>
				<td colspan="2">②</td>
				<td colspan="2">1-0-0</td>
				<td colspan="4"></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td colspan="4"></td>
			</tr>

			<tr>
				<td colspan="2">5</td>
				<td colspan="2">③</td>
				<td colspan="2">1-0-1</td>
				<td colspan="4"></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td colspan="4"></td>
			</tr>

			<tr>
				<td colspan="2">6</td>
				<td colspan="2"></td>
				<td colspan="2"></td>
				<td colspan="4"></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td colspan="4"></td>
			</tr>
			<tr>
				<td colspan="2">7</td>
				<td colspan="2"></td>
				<td colspan="2"></td>
				<td colspan="4"></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td colspan="4"></td>
			</tr>

			<tr>
				<td colspan="2">8</td>
				<td colspan="2"></td>
				<td colspan="2"></td>
				<td colspan="4"></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td colspan="4"></td>
			</tr>

			<tr>
				<td colspan="2">9</td>
				<td colspan="2"></td>
				<td colspan="2"></td>
				<td colspan="4"></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td colspan="4"></td>
			</tr>

			<tr>
				<td colspan="2">10</td>
				<td colspan="2"></td>
				<td colspan="2"></td>
				<td colspan="4"></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td colspan="4"></td>
			</tr>

			<tr>
				<td colspan="2">11</td>
				<td colspan="2"></td>
				<td colspan="2"></td>
				<td colspan="4"></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td colspan="4"></td>
			</tr>

			<tr>
				<td colspan="2">12</td>
				<td colspan="2"></td>
				<td colspan="2"></td>
				<td colspan="4"></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td colspan="4"></td>
			</tr>

			<tr>
				<td colspan="2">13</td>
				<td colspan="2"></td>
				<td colspan="2"></td>
				<td colspan="4"></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td colspan="4"></td>
			</tr>

			<tr>
				<td colspan="2">14</td>
				<td colspan="2"></td>
				<td colspan="2"></td>
				<td colspan="4"></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td colspan="4"></td>
			</tr>

			<tr>
				<td colspan="2">15</td>
				<td colspan="2"></td>
				<td colspan="2"></td>
				<td colspan="4"></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td colspan="4"></td>
			</tr>

			<tr>
				<td colspan="2">16</td>
				<td colspan="2"></td>
				<td colspan="2"></td>
				<td colspan="4"></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td colspan="4"></td>
			</tr>

			<tr>
				<td colspan="2">17</td>
				<td colspan="2"></td>
				<td colspan="2"></td>
				<td colspan="4"></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td colspan="4"></td>
			</tr>

			<tr>
				<td colspan="2">18</td>
				<td colspan="2"></td>
				<td colspan="2"></td>
				<td colspan="4"></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td colspan="4"></td>
			</tr>

			<tr>
				<td colspan="2">19</td>
				<td colspan="2"></td>
				<td colspan="2"></td>
				<td colspan="4"></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td colspan="4"></td>
			</tr>

			<tr>
				<td colspan="2">20</td>
				<td colspan="2"></td>
				<td colspan="2"></td>
				<td colspan="4"></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td colspan="4"></td>
			</tr>

			<tr>
				<td colspan="2">21</td>
				<td colspan="2"></td>
				<td colspan="2"></td>
				<td colspan="4"></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td colspan="4"></td>
			</tr>

			<tr>
				<td colspan="2">22</td>
				<td colspan="2"></td>
				<td colspan="2"></td>
				<td colspan="4"></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td colspan="4"></td>
			</tr>

			<tr>
				<td colspan="2">23</td>
				<td colspan="2"></td>
				<td colspan="2"></td>
				<td colspan="4"></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td colspan="4"></td>
			</tr>

			<tr>
				<td colspan="2">24</td>
				<td colspan="2"></td>
				<td colspan="2"></td>
				<td colspan="4"></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td colspan="4"></td>
			</tr>

			<tr>
				<td colspan="2">25</td>
				<td colspan="2"></td>
				<td colspan="2"></td>
				<td colspan="4"></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td colspan="4" rowspan="2"></td>
			</tr>


			<tr>
				<td colspan="10">합계</td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td colspan="4"></td>
			</tr>
		</table>

		<br>
		<h3>◎ 정답지 분포</h3>
		<br>
		<table>
			<tr>
				<th style="text-align: center" colspan="3" class="highlight">답지</th>
				<th style="text-align: center" colspan="3" class="highlight">①</th>
				<th style="text-align: center" colspan="3" class="highlight">②</th>
				<th style="text-align: center" colspan="3" class="highlight">③</th>
				<th style="text-align: center" colspan="3" class="highlight">④</th>
				<th style="text-align: center" colspan="3" class="highlight">⑤</th>
			</tr>
			<tr>
				<th style="text-align: center" colspan="3" class="highlight">빈도</th>
				<td class="tc" colspan="3">3</td>
				<td class="tc" colspan="3">6</td>
				<td class="tc" colspan="3">5</td>
				<td class="tc" colspan="3">8</td>
				<td class="tc" colspan="3">5</td>
			</tr>
		</table>

		<br>
		<h3>◎ 예상정답률 분포 및 기대 점수</h3>
		<table>
			<tr>
				<th style="text-align: center" colspan="3" class="highlight">난이도</th>
				<td style="text-align: center" colspan="3" class="highlight">상</td>
				<td style="text-align: center" colspan="3" class="highlight">중</td>
				<td style="text-align: center" colspan="3" class="highlight">하</td>
				<td style="text-align: center" colspan="3" class="highlight">기대
					점수</td>
			</tr>
			<tr>
				<th style="text-align: center" colspan="3" class="highlight">빈도</th>
				<td class="tc" colspan="3">5</td>
				<td class="tc" colspan="3">12</td>
				<td class="tc" colspan="3">8</td>
				<td class="tc" colspan="3">( 70 ) / 100</td>
			</tr>
		</table>
		<li>예상정답률 분포에 기초 [(상×0.5)+(중×0.75)+(하×1.0)] 공식을 적용하여 과목별 기대점수를 산출 </li><br>
		<br> <br> <br>
		<h3>◎ 세부영역별 문항분포</h3>
		<br>
		<table>
			<tr>
				<th style="text-align: center" colspan="3" class="highlight">세부영역</th>
				<th style="text-align: center" colspan="3" class="highlight">문항
					수</th>
				<th style="text-align: center" colspan="3" class="highlight">문항번호</th>
			</tr>
			<tr>
				<td class="tc" colspan="3">1-0-0</td>
				<td class="tc" colspan="3">2</td>
				<td class="tc" colspan="3">1, 3</td>
			</tr>
			<tr>
				<td class="tc" colspan="3">1-0-1</td>
				<td class="tc" colspan="3">0</td>
				<td class="tc" colspan="3"></td>
			</tr>
			<tr>
				<td class="tc" colspan="3">1-0-2</td>
				<td class="tc" colspan="3">2</td>
				<td class="tc" colspan="3">11, 14</td>
			</tr>
			<tr>
				<td class="tc" colspan="3">1-1-0</td>
				<td class="tc" colspan="3">1</td>
				<td class="tc" colspan="3">4</td>
			</tr>
			<tr>
				<td class="tc" colspan="3">1-1-1</td>
				<td class="tc" colspan="3">1</td>
				<td class="tc" colspan="3">16</td>
			</tr>
			<tr>
				<td class="tc" colspan="3">1-1-2</td>
				<td class="tc" colspan="3">1</td>
				<td class="tc" colspan="3">13</td>
			</tr>
			<tr>
				<td class="tc" colspan="3">1-2-0</td>
				<td class="tc" colspan="3">1</td>
				<td class="tc" colspan="3">21</td>
			</tr>
			<tr>
				<td class="tc" colspan="3">1-2-1</td>
				<td class="tc" colspan="3">2</td>
				<td class="tc" colspan="3">18, 24</td>
			</tr>
			<tr>
				<td class="tc" colspan="3">1-3-0</td>
				<td class="tc" colspan="3">1</td>
				<td class="tc" colspan="3">7</td>
			</tr>
			<tr>
				<td class="tc" colspan="3">1-3-1</td>
				<td class="tc" colspan="3">1</td>
				<td class="tc" colspan="3">25</td>
			</tr>
			<tr>
				<td class="tc" colspan="3">1-3-2</td>
				<td class="tc" colspan="3">1</td>
				<td class="tc" colspan="3">5</td>
			</tr>
			<tr>
				<td class="tc" colspan="3">1-3-3</td>
				<td class="tc" colspan="3">1</td>
				<td class="tc" colspan="3">9</td>
			</tr>
			<tr>
				<td class="tc" colspan="3">1-3-4</td>
				<td class="tc" colspan="3">1</td>
				<td class="tc" colspan="3">10</td>
			</tr>
			<tr>
				<td class="tc" colspan="3">1-3-5</td>
				<td class="tc" colspan="3">1</td>
				<td class="tc" colspan="3">8</td>
			</tr>
			<tr>
				<td class="tc" colspan="3">1-3-6</td>
				<td class="tc" colspan="3">2</td>
				<td class="tc" colspan="3">12, 20</td>
			</tr>
			<tr>
				<td class="tc" colspan="3">2-0-0</td>
				<td class="tc" colspan="3">1</td>
				<td class="tc" colspan="3">17</td>
			</tr>
			<tr>
				<td class="tc" colspan="3">2-0-1</td>
				<td class="tc" colspan="3">1</td>
				<td class="tc" colspan="3">19</td>
			</tr>
			<tr>
				<td class="tc" colspan="3">2-0-2</td>
				<td class="tc" colspan="3">1</td>
				<td class="tc" colspan="3">6</td>
			</tr>
			<tr>
				<td class="tc" colspan="3">2-0-3</td>
				<td class="tc" colspan="3">0</td>
				<td class="tc" colspan="3"></td>
			</tr>
			<tr>
				<td class="tc" colspan="3">2-1-0</td>
				<td class="tc" colspan="3">1</td>
				<td class="tc" colspan="3">23</td>
			</tr>
			<tr>
				<td class="tc" colspan="3">2-1-1</td>
				<td class="tc" colspan="3">1</td>
				<td class="tc" colspan="3">22</td>
			</tr>
			<tr>
				<td class="tc" colspan="3">2-1-2</td>
				<td class="tc" colspan="3">0</td>
				<td class="tc" colspan="3"></td>
			</tr>
			<tr>
				<td class="tc" colspan="3">2-1-3</td>
				<td class="tc" colspan="3">1</td>
				<td class="tc" colspan="3">15</td>
			</tr>
			<tr>
				<td class="tc" colspan="3">계</td>
				<td class="tc" colspan="3">25</td>
				<td class="tc" colspan="3"></td>
			</tr>
		</table>
		<p style="text-align: center">[선제완료]</p>
	</form>
</body>
</html>