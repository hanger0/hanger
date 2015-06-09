<%@ page contentType="text/html; charset=EUC-KR"%>

<body>
	<div class="container" style="width:97.7%">
		<!-- 오더 작성 시작 -->
			<font size = "3">
				<b><p style="display: table; margin-left: 5px;">구매 내역</p></b>
			</font>
		<div class="thumbnail"><br>
			<div align="center">
				<table style="width: 900px; table-layout: fixed">
					<tr align="center" style="background-color: #EAEAEA; border-top: 2px solid gray;">
						<td align="center"
							style="border-right: 1px solid gray; border-bottom: 2px solid gray; padding-top: 10px"><b>오더내역
								<p>(주문날짜)
								<p>
						</b></td>
						<td colspan="4" align="center"
							style="border-right: 1px solid gray; border-bottom: 2px solid gray"><B>상품명/옵션/상품금액</B></td>
						<td align="center"
							style="border-right: 1px solid gray; border-bottom: 2px solid gray"><B>개수</B></td>
						<td align="center"
							style="border-right: 1px solid gray; border-bottom: 2px solid gray"><b>추천인</b></td>
						<td align="center"
							style="border-right: 1px solid gray; border-bottom: 2px solid gray"><B>배송코드</B></td>
						<td align="center" style="border-bottom: 2px solid gray"><B>구매확정</B></td>
					</tr>
	<%
		for (int i = 0; i < 5; i++) {
	%>
					<tr>
						<td style="background-color: #747474"></td>
						<td colspan="8" style="background-color: #747474"><font
							color="white"> <b>"동작구사랑방"</b>님을 통하여 구매하였습니다.
						</font></td>
					</tr>

					<tr align="center">
						<td
							style="border-bottom: 2px solid gray; border-right: 1px solid gray; width: 10px"
							rowspan="2">1234567890
							<p>(2015/05/15)
						</td>
						<td style="border-bottom: 2px solid gray;" rowspan="2"
							width="120px" height="100px"><img src="/images/14.jpg"
							width="80px" height="80px" style="margin-left: 10px"></td>
						<td colspan="3" style="border-right: 1px solid gray;"><font
							size="3"><b>올리브 영 아쿠아 수분 크림 / </b></font></td>
						<td
							style="border-bottom: 2px solid gray; border-right: 1px solid gray;"
							rowspan="2">1</td>
						<td
							style="border-bottom: 2px solid gray; border-right: 1px solid gray;"
							rowspan="2">동작구사랑방</td>
						<td
							style="border-bottom: 2px solid gray; border-right: 1px solid gray;"
							rowspan="2">4568121680<P>(배송중)</td>
						<td style="border-bottom: 2px solid gray;" rowspan="2">
							<!-- 구매확정을 누르면 AJAX로 리뷰쓰기로 변함 --> 
							<input type="button" value="리뷰쓰기" class="btn btn-default" />
						</td>
					</tr>
					<tr>
						<td
							style="border-bottom: 2px solid gray; border-right: 1px solid gray; padding-right: 15px"
							colspan="3"><font size="2">1. A타입(로레알파리 루센트 매직 비비에센스
								01호 내츄럴 베이지+워터프루프 젤펜슬 아이라이너+립 컬러 스틱) / 19,000원 </font></td>
					</tr>
					<%
			}
%>
				</table>
				<br>
			</div>
			<!--  리뷰 작성 끝 -->
		</div>
	</div>
</body>
