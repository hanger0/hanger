<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page import="com.hanger.order.vo.CartVo" %>
<%@ page import="java.util.*" %>
<%
	ArrayList<CartVo> cartList = (ArrayList<CartVo>)request.getAttribute("cartList");
%>
<script>
$(function(){
	function home() {
		location.href = "/main.hang";
	}
    var orderBuyForm = $('#orderBuyForm');
    $('.goOrderBuyBtn').click(function(){
    	var itemCode = $(".checkbox").attr("itemCode");
    	var itemMarketPrice = $(".checkbox").attr("itemMarketPrice");
    	var itemPurchasePrice = $(".checkbox").attr("itemPurchasePrice");
    	var itemName = $(".checkbox").attr("itemName");
    	var itemPicPath = $(".checkbox").attr("itemPicPath");
    	var itemPicSaveName = $(".checkbox").attr("itemPicSaveName");
    	var itemSellPrice = $(".checkbox").attr("itemSellPrice");
    	var itemAmount = $(".checkbox").attr("itemAmount");
    	var cartItemRecom = $(".checkbox").attr("cartItemRecom");
    	var itemDetailInfo = $(".checkbox").attr("itemDetailInfo");
    	
    	$('input:hidden[name=itemCode]').val(itemCode);
    	$('input:hidden[name=itemMarketPrice]').val(itemMarketPrice);
    	$('input:hidden[name=itemPurchasePrice]').val(itemPurchasePrice);
    	$('input:hidden[name=itemName]').val(itemName);
    	$('input:hidden[name=itemPicPath]').val(itemPicPath);
    	$('input:hidden[name=itemPicSaveName]').val(itemPicSaveName);
    	$('input:hidden[name=itemSellPrice]').val(itemSellPrice);
    	$('input:hidden[name=itemAmount]').val(itemAmount);
    	$('input:hidden[name=cartItemRecom]').val(cartItemRecom);
    	$('input:hidden[name=itemDetailInfo]').val(itemDetailInfo);
    	
    	orderBuyForm.submit();
    });
    $(".deleteCartBtn").click(function(){
    	var itemCode = $(this).attr("itemCode");
    	$('input:hidden[name=deleteItemCode]').val(itemCode);
    	var deleteCartForm = $("#deleteCartForm");
    	deleteCartForm.submit();
    });
});
</script>
<body style="background-color: #EBEBEB">
<form name="deleteCartForm" id="deleteCartForm" action="/deleteCart.hang" method="post">
	<input type="hidden" name="deleteItemCode">
</form>
<FORM name="orderBuyForm" id="orderBuyForm" action="/goOrderBuyPage.hang" method="post">	
	<INPUT type="hidden" name="itemCode" value="">
	<INPUT type="hidden" name="itemGroupCode" value="">
	<INPUT type="hidden" name="stockCode" value="">
	<INPUT type="hidden" name="itemName" value="">
	<INPUT type="hidden" name="itemPicPath" value="">
	<INPUT type="hidden" name="itemPicSaveName" value="">
	<INPUT type="hidden" name="itemSellPrice" value="">
	<INPUT type="hidden" name="itemMarketPrice" value="">
	<INPUT type="hidden" name="itemPurchasePrice" value="">
	<INPUT type="hidden" name="itemAmount" value="">
	<INPUT type="hidden" name="cartItemRecom" value="">
	<INPUT type="hidden" name="itemDetailInfo" value="">
</FORM>
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
<%
if(cartList != null){
	int sumPrice = 0;
	for(int i = 0; i < cartList.size(); i++){
		CartVo cart = cartList.get(0);
		String userCode = cart.getUserCode();
		String itemCode = cart.getItemCode();
		String cartItemAmount = cart.getCartItemAmount();
		String cartItemRecom = cart.getCartItemRecom();
		int itemSellPrice = Integer.parseInt(cart.getItemSellPrice());
		String itemName = cart.getItemName();
		String itemPicPath = cart.getItemPicPath();
		String itemPicSaveName = cart.getItemPicSaveName();
		String itemDetailInfo = cart.getItemDetailInfo();
		String itemPurchasePrice = cart.getItemPurchasePrice();
		String itemMarketPrice = cart.getItemMarketPrice();

		sumPrice += itemSellPrice;
		
		if(cartItemRecom != null){
%>
					<tr>
						<td style="background-color: #747474"></td>
						<td colspan="8" style="background-color: #747474"><font
							color="white"> <b><%= cartItemRecom %></b>님을 통하여 구매하였습니다.
						</font></td>
					</tr>
<%
		}
%>
					<tr align="center">
						<td style="border-bottom: 2px solid gray; border-right: 1px solid gray; width: 10px"
							rowspan="2"><input class="checkbox" type="checkbox" itemName="<%= itemName %>" itemCode="<%=itemCode%>" cartItemRecom="<%= cartItemRecom %>" itemPicPath="<%=itemPicPath%>" itemPicSaveName="<%=itemPicSaveName%>" itemSellPrice="<%=itemSellPrice%>" itemMarketPrice="<%=itemMarketPrice%>" itemPurchasePrice="<%=itemPurchasePrice%>" itemAmount="<%=cartItemAmount%>" itemDetailInfo="<%= itemDetailInfo %>"></td>
						<td style="border-bottom: 2px solid gray;" rowspan="2"
							width="120px"><img src="<%= itemPicPath %>/<%= itemPicSaveName %>" width="80px"
							height="80px" style="margin-left: -20px"></td>
						<td colspan="3" style="border-right: 1px solid gray;"><font
							size="3"><b><%= itemName %></b></font></td>
						<td style="border-bottom: 2px solid gray; border-right: 1px solid gray;"
							rowspan="2"><%= itemSellPrice %>원</td>
						<td
							style="border-bottom: 2px solid gray; border-right: 1px solid gray;"
							rowspan="2"><select>
								<option value="1" <% if(cartItemAmount.equals("1")){%>selected<%}%>>1</option>
								<option value="2" <% if(cartItemAmount.equals("2")){%>selected<%}%>>2</option>
								<option value="3" <% if(cartItemAmount.equals("3")){%>selected<%}%>>3</option>
								<option value="4" <% if(cartItemAmount.equals("4")){%>selected<%}%>>4</option>
								<option value="5" <% if(cartItemAmount.equals("5")){%>selected<%}%>>5</option>
								<option value="6" <% if(cartItemAmount.equals("6")){%>selected<%}%>>6</option>
								<option value="7" <% if(cartItemAmount.equals("7")){%>selected<%}%>>7</option>
								<option value="8" <% if(cartItemAmount.equals("8")){%>selected<%}%>>8</option>
								<option value="9" <% if(cartItemAmount.equals("9")){%>selected<%}%>>9</option>
								<option value="10" <% if(cartItemAmount.equals("10")){%>selected<%}%>>10</option>
								<option value="11" <% if(cartItemAmount.equals("11")){%>selected<%}%>>11</option>
								<option value="12" <% if(cartItemAmount.equals("12")){%>selected<%}%>>12</option>
								<option value="13" <% if(cartItemAmount.equals("13")){%>selected<%}%>>13</option>
								<option value="14" <% if(cartItemAmount.equals("14")){%>selected<%}%>>14</option>
								<option value="15" <% if(cartItemAmount.equals("15")){%>selected<%}%>>15</option>
								<option value="16" <% if(cartItemAmount.equals("16")){%>selected<%}%>>16</option>
								<option value="17" <% if(cartItemAmount.equals("17")){%>selected<%}%>>17</option>
								<option value="18" <% if(cartItemAmount.equals("18")){%>selected<%}%>>18</option>
								<option value="19" <% if(cartItemAmount.equals("19")){%>selected<%}%>>19</option>
								<option value="20" <% if(cartItemAmount.equals("20")){%>selected<%}%>>20</option>
						</select></td>
						<td
							style="border-bottom: 2px solid gray; border-right: 1px solid gray;"
							rowspan="2">무료배송</td>
						<td style="border-bottom: 2px solid gray;" rowspan="2">
							<input type="button" value="삭제하기" class="btn btn-default deleteCartBtn" style="width: 80px; height: 30px" itemCode='<%= itemCode %>'>
						</td>
					</tr>
					<tr>
						<td style="border-bottom: 2px solid gray;" colspan="3"><font
							size="2"><%= itemDetailInfo %></font></td>
					</tr>
<%
	}
}
%>
				</table>
				<div class="button" align="center">
					<input type="button" value="계속 쇼핑" class="btn btn-default"
						onClick="home()"> <input type="button" value="즉시 구매"
						class="btn btn-default goOrderBuyBtn">
				</div>
			</div>
		</div>
	</div>
</body>
