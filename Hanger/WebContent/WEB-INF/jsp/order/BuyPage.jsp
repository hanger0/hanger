<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page import="com.hanger.user.vo.UserVo" %>
<%
	String itemCode = (String)request.getAttribute("itemCode");
	String itemMarketPrice = (String)request.getAttribute("itemMarketPrice");
	String itemPurchasePrice = (String)request.getAttribute("itemPurchasePrice");
	String itemName = (String)request.getAttribute("itemName");
	String itemPicPath = (String)request.getAttribute("itemPicPath");
	String itemPicSaveName = (String)request.getAttribute("itemPicSaveName");
	String itemSellPrice = (String)request.getAttribute("itemSellPrice");
	String itemAmount = (String)request.getAttribute("itemAmount");
	String cartItemRecom = (String)request.getAttribute("cartItemRecom");
	String itemDetailInfo = (String)request.getAttribute("itemDetailInfo");
	UserVo user = (UserVo)request.getAttribute("user");
%>
<script>
$(function(){
	var buyForm = $('#buyForm');
	$(".buyBtn").click(function(){
		buyForm.submit();
	});
});
</script>
<body style="background-color: #EBEBEB">
<form name="buyForm" id="buyForm" action="/orderBuy.hang" method="POST">
	<input type="hidden" name="itemCode" value="<%= itemCode %>"/>
	<input type="hidden" name="itemSellPrice" value="<%= itemSellPrice %>"/>
	<input type="hidden" name="itemMarketPrice" value="<%= itemMarketPrice %>"/>
	<input type="hidden" name="itemPurchasePrice" value="<%= itemPurchasePrice %>"/>
	<input type="hidden" name="orderUsedMileage" value="0"/>
	<input type="hidden" name="orderItemRecom" value=""/>
	<input type="hidden" name="orderItemAmount" value="<%= itemAmount %>"/>
	<input type="hidden" name="orderState" value="입금대기중"/>
	<input type="hidden" name="discountreasoncode" value="001"/>
	<div class="container">
		<BR>
		<div class="brand">
			<font size="6"><b>상욱박스</b></font>
			<H5>
				<b>뷰티 트랜드를 바꾸다</b>
			</H5>
		</div>

		<div class="thumbnail" style="width: 97.7%;height:auto;display:table;margin-left:auto;margin-right:auto">
			<p><br><p><br><p><br>
			<div class="post-table" align="center">
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
							style="border-right: 1px solid gray; border-bottom: 2px solid gray"><B>배송비</B></td>
						<td align="center"><b>수량</b></td>

					</tr>
<%
		if(cartItemRecom != null){
%>
					<tr>
						<td style="background-color: #747474"></td>
						<td colspan="8" style="background-color: #747474">
							<font color="white"> 
								<b><%= cartItemRecom %></b>님을 통하여 구매하였습니다.
							</font>
						</td>
					</tr>
<%
		}
%>
					<tr align="center">
						<td style="border-bottom: 2px solid gray; border-right: 1px solid gray; width: 10px"
							rowspan="2"><input type="checkbox"></td>
						<td style="border-bottom: 2px solid gray;" rowspan="2" width="120px">
							<img src="<%= itemPicPath %>/<%= itemPicSaveName %>" width="80px" height="80px" style="margin-left: -20px">
						</td>
						<td colspan="3" style="border-right: 1px solid gray;">
							<font size="3"><b><%= itemName %></b></font>
						</td>
						<td style="border-bottom: 2px solid gray; border-right: 1px solid gray;"
							rowspan="2"><%= itemSellPrice %>원</td>
						<td style="border-bottom: 2px solid gray; border-right: 1px solid gray;"
							rowspan="2">무료배송</td>
						<td style="border-bottom: 2px solid gray;" rowspan="2"><font
							size="3"><b><%= itemAmount %></b></font></td>
					</tr>
					<tr>
						<td style="border-bottom: 2px solid gray;" colspan="3"><font
							size="2"><%= itemDetailInfo %></font></td>
					</tr>
				</table>
			</div>

			<!--띄어쓰기-->
			<br>
			<div class="card-table" align="center">
				<table style="width: 900px; table-layout: fixed">
					<tr
						style="height: 30px; background-color: #EAEAEA; border-top: 3px solid gray;"
						align="center">
						<td style="border-right: 1px solid white; text-align: center"><font
							size="3"><b>총 상품 금액</b></font></td>
						<td style="border-right: 1px solid white; text-align: center"><font
							size="3"><b>배송비</b></font></td>
						<td><font size="3"><b>결제 예정금액</b></font></td>
					</tr>

					<tr style="height: 60px; background-color: #F6F6F6" align="center">
						<td style="border-right: 1px solid white; border-bottom: 3px solid gray; text-align: center"><%= itemSellPrice %>원</td>
						<td style="border-right: 1px solid white; border-bottom: 3px solid gray; text-align: center">0원</td>
						<td style="border-bottom: 3px solid gray;"><%= itemSellPrice %>원</td>
					</tr>
				</table>
			</div>

			<!--띄어쓰기-->
			<p><br><p><br>
			<div class="product-info" style="margin-left: 100px">
				<font size="4"><b>01. 구매자 정보</b></font>
			</div>
			<p>
			<div class="product-infotable" align="center">
				<table style="width: 900px; height: 100px">
					<tr>
						<td width="140px" style="background-color: #EAEAEA; padding-left: 20px; border-bottom: 1px solid gray; border-top: 3px solid gray;">
							<font size="3"><b>이름</b></font>
						</td>
						<td style="padding-left: 20px; border-bottom: 1px solid gray; border-top: 3px solid gray;"><%= user.getUserName() %></td>
					</tr>
					<tr>
						<td style="background-color: #EAEAEA; padding-left: 20px; border-bottom: 1px solid gray"><font size="3"><b>휴대폰 번호</b></font></td>
						<td style="padding-left: 20px; border-bottom: 1px solid gray"><%= user.getUserPhone() %></td>
					</tr>
					<tr>
						<td style="background-color: #EAEAEA; padding-left: 20px; border-bottom: 1px solid gray"><font size="3"><b>이메일</b></font></td>
						<td style="padding-left: 20px; border-bottom: 1px solid gray"><%= user.getUserId() %></td>
					</tr>
				</table>
			</div>

			<!--띄어쓰기-->
			<p><br><p><br>
			<div class="send-info" style="margin-left: 100px">
				<font size="4"><b>02. 배송지 정보</b></font>
				<p>
			</div>
			<div class="send-infotable" align="center">
				<table style="width: 900px; height: 250px">
					<tr>
						<td width="140px"
							style="padding-left: 20px; background-color: #EAEAEA; border-top: 3px solid gray; border-bottom: 1px solid gray">
							<font size="3"><b>배송지 선택</b></font>
						</td>
						<td
							style="padding-left: 20px; border-top: 3px solid gray; border-bottom: 1px solid gray">
							<input type="radio" name="tagbe" checked>기본 배송지&nbsp;&nbsp;&nbsp; <input
							type="radio" name="tagbe">새로운 배송지&nbsp;&nbsp;&nbsp; <input
							type="radio" name="tagbe">최근 배송지
						</td>
					</tr>
					<tr>
						<td style="padding-left: 20px; background-color: #EAEAEA; border-bottom: 1px solid gray"><font
							size="3"><b>이름</b></font></td>
						<td style="padding-left: 20px; border-bottom: 1px solid gray">
						<input type="text" name="orderName" value="<%= user.getUserName() %>"></td>
					</tr>
					<tr>
						<td
							style="padding-left: 20px; background-color: #EAEAEA; border-bottom: 1px solid gray"><font
							size="3"><b>연락처</b></font></td>
						<td style="padding-left: 20px; border-bottom: 1px solid gray">
							<input type="text" name="orderPhone" size="20" value="<%= user.getUserPhone() %>">
						</td>
					</tr>
					<tr>
						<td style="padding-left: 20px; background-color: #EAEAEA; border-bottom: 1px solid gray">
							<font size="3"><b>주소</b></font></td>
						<td style="padding-left: 20px; border-bottom: 1px solid gray">
							<table>
								<tr>
									<td>
										<input type="text" name="orderPostCode1" value="<%= user.getUserPostCode1() %>"> - <input type="text" name="orderPostCode2" value="<%= user.getUserPostCode2() %>">
										<input type="button" class="btn btn-default" value="우편번호 찾기">
										<input type="checkbox">이 주소를 회원정보를 저장
									</td>
								</tr>
								<tr height="5">
									<td></td>
								</tr>
								<tr>
									<td><input type="text" name="orderAddr1" style="width: 347px" value="<%= user.getUserAddr1() %>"></td><BR>
								</tr>
								<tr>
									<td><input type="text" name="orderAddr2" style="width: 347px" value="<%= user.getUserAddr2() %>"></td>
								</tr>
							</table>

						</td>
					</tr>
					<tr>
						<td style="padding-left: 20px; background-color: #EAEAEA; border-bottom: 1px solid gray">
							<font size="3"><b>배송메모</b></font>
						</td>
						<td style="padding-left: 20px; border-bottom: 1px solid gray">
							<input type="text" name="orderMemo" style="width: 680px">
						</td>
					</tr>
				</table>
			</div>

			<p>
			<div class="poster" style="margin-left: 100px">
				<p>
					<font size="2" color="red"><b>
						· 정확한 주소를기재해주세요.
					</b></font>
				<p>
					<font size="2" color="red"><b>
						· 부정확한 정보 및 분실로 인한 재발송은 불가능하며, 상품이 반송될 경우 왕복배송비(5,000원) 고객부담입니다.
					</b></font>
			</div>
			<!--띄어쓰기-->
			<p><br><p><br>
			<div class="card-info" style="margin-left: 100px">
				<font size="4"><b>03. 결제 정보</b></font>
			</div>
			<p>
			<div class="poster" style="margin-left: 100px">
				<p>
					<font size="2"><b>· 포인트는 최소 0P~최대 5000P까지 사용가능 또는 구매금액의
							20%까지 사용 가능합니다. (두 가지 방법 중 택1)</b></font>
				<p>
					<font size="2"><b>· 배송비는 포인트 사용 불가능 합니다.</b></font>
				<p>
					<font size="2"><b>· 할인쿠폰 사용시 할인쿠폰 금액 이하 상품 적용 불가 / 각 쿠폰의
							최소 결제금액 확인 후 사용 부탁드립니다.</b></font>
				<p>
			</div>
			<div class="card-infotable" style="margin-left: 100px">
				<table style="width: 900px; height: 40px">
					<tr>
						<td
							style="background-color: #EAEAEA; width: 140px; border-top: 3px solid gray; border-bottom: 1px solid gray"
							align="center"><input type="checkbox"><font size="3"><b>마일리지
									사용</b></font></td>
						<td
							style="border-top: 3px solid gray; border-bottom: 1px solid gray; padding-left: 10px">
							<input type="text">&nbsp; <input type="button"
							class="btn btn-default" value="사용하기"><b> (사용가능포인트 0P)
								(보유포인트 0P)</b>
						</td>
					</tr>
				</table>
			</div>

			<p>
			<p>
				<br>
			<div class="poster" align="center">
				<table style="width: 900px; table-layout: fixed">
					<tr
						style="height: 30px; background-color: #EAEAEA; border-top: 3px solid gray;"
						align="center">
						<td style="border-right: 1px solid white; text-align: center"><font
							size="3"><b>총 상품 금액</b></font></td>
						<td style="border-right: 1px solid white; text-align: center"><font
							size="3"><b>마일리지</b></font></td>
						<td style="border-right: 1px solid white; text-align: center"><font
							size="3"><b>배송비</b></font></td>
						<td><font size="3"><b>결제 예정금액</b></font></td>
					</tr>

					<tr style="height: 60px; background-color: #F6F6F6" align="center">
						<td
							style="border-right: 1px solid white; border-bottom: 3px solid gray; text-align: center">0원</td>
						<td
							style="border-right: 1px solid white; border-bottom: 3px solid gray; text-align: center">0원</td>
						<td
							style="border-right: 1px solid white; border-bottom: 3px solid gray; text-align: center">0원</td>
						<td style="border-bottom: 3px solid gray;">0원</td>
					</tr>
				</table>
			</div>

			<!--띄어쓰기-->
			<p>
				<br>
			<p>
				<br>
			<div class="card-infomation" style="margin-left: 100px">
				<font size="4"><b>04. 카드 정보 입력</b></font>
			</div>
			<p>
			<div class="poster" style="margin-left: 100px">
				<p>
					<font size="2"><b>· 오후 2시 이전에 결제시 당일배송이 가능합니다.</b></font>
				<p>
					<font size="2"><b>· 00:00 ~ 00:30(최대 30분) 은 카드사의 관계로 결제가
							늦어질 수 있습니다.</b></font>
				<p>
					<font size="2"><b>· 고객센터 Tel.1544-8888</b></font>
				<p>
			</div>

			<div class="company" align="center">
				<table style="width: 900px; height: 80px">
					<tr>
						<td
							style="background-color: #EAEAEA; width: 140px; border-top: 3px solid gray; border-bottom: 1px solid gray"
							align="center"><font size="3"><b>카드사</b></font></td>
						<td
							style="border-top: 3px solid gray; border-bottom: 1px solid gray; padding-left: 10px">
							<select>
								<option value="신한">신한</option>
								<option value="농협">농협</option>
								<option value="국민">국민</option>
								<option value="IBK">IBK</option>
								<option value="우리">우리</option>
						</select>
						</td>
					</tr>
					<tr>
						<td
							style="background-color: #EAEAEA; width: 140px; border-bottom: 1px solid gray"
							align="center"><font size="3"><b>카드번호</b></font></td>
						<td style="border-bottom: 1px solid gray; padding-left: 10px">
							<input type="text" style="width: 100px"> - <input
							type="text" style="width: 100px"> - <input type="text"
							style="width: 100px"> - <input type="text"
							style="width: 100px">
						</td>
					</tr>
				</table>
			</div>

			<!--띄어쓰기-->
			<p>
				<br> <br>
			<div class="buy-button" align="center">
				<input type="button" class="btn btn-default buyBtn" value="결제하기"
					style="width: 220px; height: 80px">
			</div>
			<br><br>
		</div>
	</div>
</form>
</body>
