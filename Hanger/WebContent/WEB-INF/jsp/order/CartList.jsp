<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page import="com.hanger.order.vo.CartVo" %>
<%@ page import="java.util.*" %>
<%
	ArrayList<CartVo> cartList = (ArrayList<CartVo>)request.getAttribute("cartList");
%>
<script>
$(function(){
    var orderBuyForm = $('#orderBuyForm');
    $('#goOrderBuyBtn').click(function(){
    	if(!$(".checkbox").is(":checked")){
    		alert("상품을 한개 이상 골라 주세요.");
    		return false;
    	}
    	var checkList = $(":checkbox[name='checkList']:checked");
    	
		var itemMarketPrice = [];
    	var itemPurchasePrice = [];
    	var itemName = [];
    	var itemPicPath = [];
    	var itemPicSaveName = [];
    	var itemSellPrice = [];
    	var cartItemRecom = [];
    	var itemDetailInfo = [];
   		var itemCode = [];
    	
    	checkList.each(function(index){
	    	itemCode[index] = $(this).attr("itemCode");
			itemMarketPrice[index] = $(this).attr("itemMarketPrice");
	    	itemPurchasePrice[index] = $(this).attr("itemPurchasePrice");
	    	itemName[index] = $(this).attr("itemName");
	    	itemPicPath[index] = $(this).attr("itemPicPath");
	    	itemPicSaveName[index] = $(this).attr("itemPicSaveName");
	    	itemSellPrice[index] = $(this).attr("itemSellPrice");
	    	cartItemRecom[index] = $(this).attr("cartItemRecom");
	    	itemDetailInfo[index] = $(this).attr("itemDetailInfo");
    	});
	    var inputItemCode = $("input:hidden[name=itemCode]");
	    var inputItemMarketPrice = $('input:hidden[name=itemMarketPrice]');
    	var inputItemPurchasePrice = $('input:hidden[name=itemPurchasePrice]');
    	var inputItemName = $('input:hidden[name=itemNames]');
    	var inputItemPicPath = $('input:hidden[name=itemPicPath]');
    	var inputItemPicSaveName = $('input:hidden[name=itemPicSaveName]');
    	var inputItemSellPrice = $('input:hidden[name=itemSellPrice]');
    	var inputItemDetailInfo = $('input:hidden[name=itemDetailInfo]');
    	var inputCartItemRecom = $('input:hidden[name=cartItemRecom]');
	    
		inputItemCode.val(itemCode);
		inputItemMarketPrice.val(itemMarketPrice);
		inputItemPurchasePrice.val(itemPurchasePrice);
		inputItemName.val(itemName);
		inputItemPicPath.val(itemPicPath);
		inputItemPicSaveName.val(itemPicSaveName);
		inputItemSellPrice.val(itemSellPrice);
		inputCartItemRecom.val(cartItemRecom);
		inputItemDetailInfo.val(itemDetailInfo);
		
		orderBuyForm.submit();
    });
    $(".deleteCartBtn").click(function(){
    	var itemCode = $(this).attr("itemCode");
    	$('input:hidden[name=deleteItemCode]').val(itemCode);
    	var deleteCartForm = $("#deleteCartForm");
    	deleteCartForm.submit();
    });
    $("#checkBox").click(function(){
    	if($("#checkBox").prop("checked")){
    		$(".checkbox").prop("checked", true);
    	} else {
    		$(".checkbox").prop("checked", false);
    	}
    });
    $(".amount").change(function(){
    	var value = $(this).val();
    	var amountCode = $(this).attr("itemCode");
    	$.ajax({
			type: "POST", 
			url: "/updateAmount.hang",
			dataType: "text",
			data: "value=" + value + "&itemCode=" + amountCode, 
			success: function(text){
			}
		});
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
	<INPUT type="hidden" name="itemNames" value="">
	<INPUT type="hidden" name="itemPicPath" value="">
	<INPUT type="hidden" name="itemPicSaveName" value="">
	<INPUT type="hidden" name="itemSellPrice" value="">
	<INPUT type="hidden" name="itemMarketPrice" value="">
	<INPUT type="hidden" name="itemPurchasePrice" value="">
	<INPUT type="hidden" name="cartItemRecom" value="">
	<INPUT type="hidden" name="itemDetailInfo" value="">
</FORM>
	<div class="container">
		<BR>
		<div class="brand" style="margin-left: 90px">
			<font size="6"><b>상욱박스</b></font>
			<H5><b>뷰티 트랜드를 바꾸다</b></H5>
		</div>

		<div class="thumbnail" style="width: 1000px; height: 630px; margin-left: 90px;">
			<div class="panel panel-default" style="width: 900px; height: 80px; margin-left: 45px; margin-top: 45px">
				<input type="image" src="/images/1.jpg" width="900px">
<!--                  띄어쓰기                           -->
				<P><P><BR>
				<table style="width: 900px; table-layout: fixed">
					<tr align="center" style="background-color: #EAEAEA; border-top: 2px solid gray;">
						<td align="center" style="border-right: 1px solid gray; border-bottom: 2px solid gray; width: 30px">
							<input id="checkBox" type="checkbox" value="off">
						</td>
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
	for(int i = 0; i < cartList.size(); i++){
		CartVo cart = cartList.get(i);
		String userCode = cart.getUserCode();
		String itemCode = cart.getItemCode();
		int cartItemAmount = Integer.parseInt(cart.getCartItemAmount());
		String cartItemRecom = cart.getCartItemRecom();
		int itemSellPrice = Integer.parseInt(cart.getItemSellPrice());
		String itemName = cart.getItemName();
		String itemPicPath = cart.getItemPicPath();
		String itemPicSaveName = cart.getItemPicSaveName();
		String itemDetailInfo = cart.getItemDetailInfo();
		String itemPurchasePrice = cart.getItemPurchasePrice();
		String itemMarketPrice = cart.getItemMarketPrice();
		int itemSellMaxNum = Integer.parseInt(cart.getItemSellMaxNum());
		int stockAmount = Integer.parseInt(cart.getStockAmount());
		String itemGroupCode = cart.getItemGroupCode();

		if(itemSellMaxNum > stockAmount){
			itemSellMaxNum = stockAmount;
		}
		
		if(cartItemAmount > itemSellMaxNum){
			cartItemAmount = itemSellMaxNum;
		}
		
		if(cartItemRecom != null && cartItemRecom.length() < 0){
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
						<td style="border-bottom: 2px solid gray; border-right: 1px solid gray; width: 10px" rowspan="2">
							<input class="checkbox" name="checkList" <% if(stockAmount <= 0){ %> disabled <% } %> type="checkbox" index="<%= i %>" itemName="<%= itemName %>" itemCode="<%=itemCode%>" cartItemRecom="<%= cartItemRecom %>" itemPicPath="<%=itemPicPath%>" itemPicSaveName="<%=itemPicSaveName%>" itemSellPrice="<%=itemSellPrice%>" itemMarketPrice="<%=itemMarketPrice%>" itemPurchasePrice="<%=itemPurchasePrice%>" itemAmount="<%=cartItemAmount%>" itemDetailInfo="<%= itemDetailInfo %>">
						</td>
						<td style="border-bottom: 2px solid gray;" rowspan="2"width="120px">
							<img src="<%= itemPicPath %>/<%= itemPicSaveName %>" width="80px"
							height="80px" style="margin-left: -20px">
						</td>
						<td colspan="3" style="border-right: 1px solid gray;"><font
							size="3"><b><%= itemName %></b></font></td>
						<td style="border-bottom: 2px solid gray; border-right: 1px solid gray;"
							rowspan="2"><%= itemSellPrice %>원</td>
						<td style="border-bottom: 2px solid gray; border-right: 1px solid gray;"
							rowspan="2">
						<select class="amount" itemCode="<%= itemCode %>">
<% 
		for(int k = 1; k <= itemSellMaxNum; k++){
%>
								<option value="<%= k %>" <% if(cartItemAmount == k){%>selected<%}%>><%= k %></option>
<%
		}
%>			
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
					<input type="button" value="구매하러 가기" class="btn btn-default" id="goOrderBuyBtn">
				</div>
			</div>
		</div>
	</div>
</body>
