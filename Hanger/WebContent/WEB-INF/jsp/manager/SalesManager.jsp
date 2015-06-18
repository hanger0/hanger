<%@ page contentType="text/html; charset=EUC-KR"%>

<!-- 날짜 입력 관련 START -->
<script>
	$(function() {
		$("#datepicker1, #datepicker2").datepicker(
				{
					dateFormat : 'yy-mm-dd',
					prevText : '이전 달',
					nextText : '다음 달',
					monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월',
							'8월', '9월', '10월', '11월', '12월' ],
					monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
							'7월', '8월', '9월', '10월', '11월', '12월' ],
					dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
					dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
					dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
					showMonthAfterYear : true,
					yearSuffix : '년'
				});
	});
</script>
<!-- 날짜 입력 관련 END -->

<body>
	<div class="container">
		<BR>
		<div class="thumbnail" style="width: 1090px;margin-left:1%">
			<div class="panel panel-default"
				 style="width: 900px; height: auto;border:0;display:table;margin-left:auto;margin-right:auto" align = "center" >
				<BR> <BR>
				<p>
					조회기간: <input type="text" id="datepicker1"> ~ <input type="text" id="datepicker2">
					<input type="button" value="확인" />
				<P>
				<P>
					<BR>
				<table style="width: 900px; table-layout: fixed">
				<tr>
						<td style="background-color: #747474"></td>
						<td colspan="8" style="background-color: #747474"><font
							color="white"> <b>일계:2015-05-05 총 판매금액 : 201,504,402원</b>
						</font></td>
					</tr>

					<tr align="center"
						style="background-color: #EAEAEA; border-top: 2px solid gray;">
						<td align="center"
							style="border-right: 1px solid gray; border-bottom: 2px solid gray; width: 100px"><B>날짜</B></td>
						<td colspan="4" align="center"
							style="border-right: 1px solid gray; border-bottom: 2px solid gray"><B>상품명</B></td>
						<td align="center"
							style="border-right: 1px solid gray; border-bottom: 2px solid gray"><B>입고금액</B></td>
						<td align="center"
							style="border-right: 1px solid gray; border-bottom: 2px solid gray"><b>상품금액</b></td>
						<td align="center"
							style="border-right: 1px solid gray; border-bottom: 2px solid gray"><B>수량</B></td>
						<td align="center" style="border-bottom: 2px solid gray"><B>합계</B></td>
					</tr>
					<%
						for (int i = 1; i < 20; i++) {
					%>
					<tr align="center" style = "height:30px">
						<td style="border-bottom: 1px solid gray; border-right: 1px solid gray; width: 10px" rowspan="2">
							<font size = "2">2015-05-05</font>
						</td>
						<td rowspan = "2" colspan = "4" style="border-right: 1px solid gray;border-bottom: 1px solid gray;">
							<font size="2"><b>올리브</b></font>
						</td>
						<td style="border-bottom: 1px solid gray; border-right: 1px solid gray;" rowspan="2"><font size="2">10,000원</font></td>
						<td style="border-bottom: 1px solid gray; border-right: 1px solid gray;" rowspan="2"><font size="2">22,000원</font></td>
						<td style="border-bottom: 1px solid gray; border-right: 1px solid gray;" rowspan="2"><font size="2">20</font></td>
						<td style="border-bottom: 1px solid gray;" rowspan="2"><font size="2">380,000 원</font></td>
					</tr>
					<tr>
					</tr>
					<%
						}
					%>
				</table>
			</div>
		</div>
	</div>
</body>
