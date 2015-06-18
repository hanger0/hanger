<%@ page contentType="text/html; charset=EUC-KR"%>

<body>
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
	<CENTER>
	<br>
			조회기간: <input type="text" id="datepicker1"> ~ <input type="text" id="datepicker2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			회원아이디: <input type="text" id=""> <input type="button" value="확인" />
	<br><Br><br>
		<TABLE class="table table-hover table-bordered" style = "background-color:white;width:1100px;">
			<TR bgcolor="#CFDDFA" align="center">
				<TD width="40"><B>No.</B></TD>
				<TD width="150"><B>아이디(이름)</B></TD>
				<TD width="150"><B>상품 이름</A></B></TD>
				<TD width="100"><B>구매방법</A></B></TD>
				<TD width="100"><B>가격</A></B></TD>
				<TD width="100"><B>적용 마일리지</A></B></TD>
			</TR>

			<%
				for (int i = 0; i < 8; i++) {
			%>

			<TR align="center">
				<TD><%= i+1 %></TD>
				<TD>id + 이름</TD>
				<TD>잭필드 3종세트</TD>
				<TD>카드</TD>
				<TD>39,900 원</TD>
				<TD>500</TD>
				<%
					}
				%>
		</TABLE>
	</CENTER>
</body>