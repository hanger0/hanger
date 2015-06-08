<%@ page contentType="text/html; charset=EUC-KR"%>
<body style="background-color: #EBEBEB">
	<div class="container">
		<BR>
		<div class="brand" style="margin-left: 90px">
			<font size="6"><b>상욱박스</b></font>
			<H5>
				<b>뷰티 트랜드를 바꾸다</b>
			</H5>
		</div>

		<div class="thumbnail"
			style="width: 1000px; height: 630px; margin-left: 90px;">
			<div class="panel panel-default"
				style="width: 900px; height: 80px; margin-left: 45px; margin-top: 45px">

				<input type="image" src="/images/1.jpg" width="900px">

				<!-- 띄어쓰기 -->
				<P>
				<P>
					<BR>
				<table style="width: 900px; table-layout: fixed">
					<tr align="center"
						style="background-color: #EAEAEA; border-top: 2px solid gray;">
						<td align="center"
							style="border-right: 1px solid gray; border-bottom: 2px solid gray; width: 30px"><input
							type="checkbox"></td>
						<td colspan="4" align="center"
							style="border-right: 1px solid gray; border-bottom: 2px solid gray"><B>상품명</B></td>
						<td align="center"
							style="border-right: 1px solid gray; border-bottom: 2px solid gray"><B>상품금액</B></td>
						<td align="center"
							style="border-right: 1px solid gray; border-bottom: 2px solid gray"><b>수량</b></td>
						<td align="center"
							style="border-right: 1px solid gray; border-bottom: 2px solid gray"><B>배송비</B></td>
						<td align="center" style="border-bottom: 2px solid gray"><B>주문하기</B></td>
					</tr>
					<tr>
						<td style="background-color: #747474"></td>
						<td colspan="8" style="background-color: #747474"><font
							color="white"> <b>"동작구사랑방"</b>님을 통하여 구매하였습니다.
						</font></td>
					</tr>

					<tr align="center">
						<td
							style="border-bottom: 2px solid gray; border-right: 1px solid gray; width: 10px"
							rowspan="2"><input type="checkbox"></td>
						<td style="border-bottom: 2px solid gray;" rowspan="2"
							width="120px"><img src="/images/14.jpg" width="80px"
							height="80px" style="margin-left: -20px"></td>
						<td colspan="3" style="border-right: 1px solid gray;"><font
							size="3"><b>올리브 영 아쿠아 수분 크림</b></font></td>
						<td
							style="border-bottom: 2px solid gray; border-right: 1px solid gray;"
							rowspan="2">19,000원</td>
						<td
							style="border-bottom: 2px solid gray; border-right: 1px solid gray;"
							rowspan="2"><select>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
								<option value="6">6</option>
								<option value="7">7</option>
								<option value="8">8</option>
								<option value="9">9</option>
								<option value="10">10</option>
								<option value="11">11</option>
								<option value="12">12</option>
								<option value="13">13</option>
								<option value="14">14</option>
								<option value="15">15</option>
								<option value="16">16</option>
								<option value="17">17</option>
								<option value="18">18</option>
								<option value="19">19</option>
								<option value="20">20</option>
						</select></td>
						<td
							style="border-bottom: 2px solid gray; border-right: 1px solid gray;"
							rowspan="2">무료배송</td>
						<td style="border-bottom: 2px solid gray;" rowspan="2"><input
							type="button" value="삭제하기" class="btn btn-default"
							style="width: 80px; height: 30px"></td>
					</tr>
					<tr>
						<td style="border-bottom: 2px solid gray;" colspan="3"><font
							size="2">1. A타입(로레알파리 루센트 매직 비비에센스 01호 내츄럴 베이지+워터프루프 젤펜슬
								아이라이너+립 컬러 스틱)</font></td>
					</tr>

				</table>
				<!-- 띄어쓰기 -->
				<P>
				<P>
					<BR>
				<table style="width: 900px; table-layout: fixed"">
					<tr
						style="height: 30px; background-color: #EAEAEA; border-top: 2px solid gray;"
						align="center">
						<td style="border-right: 1px solid white; text-align: center"><font
							size="3"><b>총 상품 금액</b></font></td>
						<td style="border-right: 1px solid white; text-align: center"><font
							size="3"><b>배송비</b></font></td>
						<td><font size="3"><b>결제 예정금액</b></font></td>
					</tr>

					<tr style="height: 60px; background-color: #F6F6F6" align="center">
						<td
							style="border-right: 1px solid white; border-bottom: 2px solid gray; text-align: center">0원</td>
						<td
							style="border-right: 1px solid white; border-bottom: 2px solid gray; text-align: center"">0원</td>
						<td style="border-bottom: 2px solid gray;">0원</td>
					</tr>
				</table>

				<P>
				<h6>· 같은 브랜드 제품을 1개 이상 구매 시 배송료는 한 번만 결제됩니다.</h6>
				</p>
				<P>
				<h6>· [업체배송] 상품 구매 시 각각 업체에서 따로 배송됩니다.</h6>
				</p>
				<P>
				<h6>· 판매종료, 품절 상품은 자동 삭제됩니다.</h6>
				</p>
				<script>
					function home() {
						location.href = "index.jsp"
					}
					function BuyPage() {
						location.href = "/buyOrder.hang"
					}
				</script>
				<div class="button" align="center">
					<input type="button" value="계속 쇼핑" class="btn btn-default"
						onClick="home()"> <input type="button" value="즉시 구매"
						class="btn btn-default" onClick="BuyPage()">
				</div>
			</div>
		</div>
	</div>
</body>
