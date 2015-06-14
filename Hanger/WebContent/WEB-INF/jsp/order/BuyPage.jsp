<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page import="com.hanger.user.vo.UserVo" %>
<%@ page import="java.util.*" %>
<%
	ArrayList cartList = (ArrayList)request.getAttribute("cartList");
	String mileageAmount = (String)request.getAttribute("mileageAmount");
	
	UserVo user = (UserVo)request.getAttribute("user");
	
	int maxSellPrice = 0;
	int sellPrice = 0;
%>
<script>
$(function(){
	var buyForm = $('#form');
	$("#buyBtn").click(function(){
		if(!$(".checkbox").is(":checked")){
    		alert("상품을 한개 이상 골라 주세요.");
    		return false;
    	}
		if($("input:text[name=userName]").val() == ""){
    		alert("수령인의 이름을 입력해주세요.");
    		return false;
    	}
		if($("input:text[name=userPhone]").val() == ""){
    		alert("수령인의 전화번호를 입력해주세요.");
    		return false;
    	}
		if($("input:text[name=zipCode1]").val() == ""){
    		alert("수령인의 주소를 입력해주세요.");
    		return false;
    	}
		if($("input:text[name=zipCode2]").val() == ""){
			alert("수령인의 주소를 입력해주세요.");
    		return false;
    	}
		if($("input:text[name=addr1]").val() == ""){
			alert("수령인의 주소를 입력해주세요.");
    		return false;
    	}
		if($("input:text[name=addr2]").val() == ""){
			alert("수령인의 주소를 입력해주세요.");
    		return false;
    	}
		if($("input:text[name=cardNum1]").val() == "" || $("input:text[name=cardNum1]").val().length <4 || !isNum($("input:text[name=cardNum1]").val())){
    		alert("카드번호를 확인해 주세요.");
    		return false;
    	}
		if($("input:text[name=cardNum2]").val() == "" || $("input:text[name=cardNum2]").val().length <4 || !isNum($("input:text[name=cardNum2]").val())){
			alert("카드번호를 확인해 주세요.");
    		return false;
    	}
		if($("input:text[name=cardNum3]").val() == "" || $("input:text[name=cardNum3]").val().length <4 || !isNum($("input:text[name=cardNum3]").val())){
			alert("카드번호를 확인해 주세요.");
    		return false;
    	}
		if($("input:text[name=cardNum4]").val() == "" || $("input:text[name=cardNum4]").val().length <4 || !isNum($("input:text[name=cardNum4]").val())){
			alert("카드번호를 확인해 주세요.");
    		return false;
    	}
		
		var checkList = $(":checkbox[name='checkList']:checked");
		
		var itemMarketPrice = [];
    	var itemPurchasePrice = [];
    	var itemSellPrice = [];
    	var cartItemRecom = [];
   		var itemCode = [];
   		var discountreasoncode = [];
   		var itemAmount = [];
   		
   		checkList.each(function(index){
	    	itemCode[index] = $(this).attr("itemCode");
			itemMarketPrice[index] = $(this).attr("itemMarketPrice");
	    	itemPurchasePrice[index] = $(this).attr("itemPurchasePrice");
	    	itemSellPrice[index] = $(this).attr("itemSellPrice");
	    	cartItemRecom[index] = $(this).attr("cartItemRecom");
	    	discountreasoncode[index] = $(this).attr("discountreasoncode");
	    	itemAmount[index] = $(this).attr("itemAmount");
    	});
	    var inputItemCode = $("input:hidden[name=itemCode]");
	    var inputItemMarketPrice = $('input:hidden[name=itemMarketPrice]');
    	var inputItemPurchasePrice = $('input:hidden[name=itemPurchasePrice]');
    	var inputItemSellPrice = $('input:hidden[name=itemSellPrice]');
    	var inputCartItemRecom = $('input:hidden[name=cartItemRecom]');
    	var inputDiscountreasoncode = $('input:hidden[name=discountreasoncode]');
    	var orderItemAmount = $('input:hidden[name=orderItemAmount]');
	    
		inputItemCode.val(itemCode);
		inputItemMarketPrice.val(itemMarketPrice);
		inputItemPurchasePrice.val(itemPurchasePrice);
		inputItemSellPrice.val(itemSellPrice);
		inputCartItemRecom.val(cartItemRecom);
		inputDiscountreasoncode.val(discountreasoncode);
		orderItemAmount.val(itemAmount);
		
		buyForm.submit();
	});
	$("#checkBox").click(function(){
    	if($("#checkBox").prop("checked")){
    		$(".checkbox").prop("checked", true);
    	} else {
    		$(".checkbox").prop("checked", false);
    	}
    });
	$("input:radio[name=tagbe]").click(function(){
		if($(this).val() == 2){
			$("input:text[name=addr1]").val("");
			$("input:text[name=addr2]").val("");
			$("input:text[name=zipCode1]").val("");
			$("input:text[name=zipCode2]").val("");
		} else if ($(this).val() == 1 || $(this).val() == 3){
			$("input:text[name=addr1]").val("<%= user.getUserAddr1() %>");
			$("input:text[name=addr2]").val("<%= user.getUserAddr2() %>");
			$("input:text[name=zipCode1]").val("<%= user.getUserPostCode1() %>");
			$("input:text[name=zipCode2]").val("<%= user.getUserPostCode2() %>");
		}
	});
	$(".zipCode").click(function(){
		window.open("/zipCode.hang", "zipSearchOpen", "toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=yes, resizable=no, width=420, height=500");
	});
	$("#mileageUseBtn").click(function(){
		var useMileage = $('input:text[name=usedMileage]').val();
		var mileage = $("#mileage");
		var sellPrice = $(".sellPrice");
		var maxSellPrice = $("#maxSellPrice").attr("maxSellPrice");
		var myMileage = $('input:hidden[name=myMileage]').val();
		
		if(parseInt(useMileage) > parseInt(myMileage)){
			alert("보유한 마일리지를 확인해 주세요.");
			return false;
		}
		if(parseInt(useMileage) > 5000){
			alert("5000원 이하의 마일리지만 사용 가능합니다.");
			return false;
		}
		if(parseInt(useMileage) > parseInt(maxSellPrice)){
			alert("총 금액보다 많은 마일리지는 사용할 수 없습니다.");
			return false;
		}
		
		mileage.text(parseInt(useMileage)+"원");
		sellPrice.text(parseInt(maxSellPrice)-parseInt(useMileage)+"원");
	});
});
</script>
<body style="background-color: #EBEBEB">
<form name="form" id="form" action="/orderBuy.hang" method="POST">
	<input type="hidden" name="itemCode" value=""/>
	<input type="hidden" name="itemSellPrice" value=""/>
	<input type="hidden" name="itemMarketPrice" value=""/>
	<input type="hidden" name="itemPurchasePrice" value=""/>
	<input type="hidden" name="orderItemRecom" value=""/>
	<input type="hidden" name="orderItemAmount" value=""/>
	<input type="hidden" name="discountreasoncode" value=""/>
	<input type="hidden" name="orderState" value="입금대기중"/>
	<input type="hidden" name="myMileage" value="<%= mileageAmount %>"/>
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
						<td align="center" style="border-right: 1px solid gray; border-bottom: 2px solid gray; width: 30px">
							<input id="checkBox" type="checkbox">
						</td>
						<td colspan="4" align="center" style="border-right: 1px solid gray; border-bottom: 2px solid gray"><B>상품명</B></td>
						<td align="center" style="border-right: 1px solid gray; border-bottom: 2px solid gray"><B>상품금액</B></td>
						<td align="center" style="border-right: 1px solid gray; border-bottom: 2px solid gray"><B>배송비</B></td>
						<td align="center" style="border-bottom: 2px solid gray"><b>수량</b></td>

					</tr>
<%
if(cartList != null) {
	for(int i = 0; i < cartList.size(); i++) {
		Hashtable table = (Hashtable)cartList.get(i);
		String itemCode = (String)table.get("itemCode");
		String cartItemRecom = (String)table.get("cartItemRecom");
		String itemPicPath = (String)table.get("itemPicPath");
		String itemPicSaveName = (String)table.get("itemPicSaveName");
		String itemName = (String)table.get("itemName");
		String itemMarketPrice = (String)table.get("itemMarketPrice");
		String itemPurchasePrice = (String)table.get("itemPurchasePrice");
		int itemSellPrice = Integer.parseInt((String)table.get("itemSellPrice"));
		int itemAmount = Integer.parseInt((String)table.get("itemAmount"));
		String itemDetailInfo = (String)table.get("itemDetailInfo");
		
		sellPrice = itemAmount * itemSellPrice;
		maxSellPrice = itemAmount * itemSellPrice;
		
		if(cartItemRecom != null && cartItemRecom.length() < 0){
%>
					<tr>
						<td style="background-color: #747474"></td>
						<td colspan="7" style="background-color: #747474">
							<font color="white"> 
								<b><%= cartItemRecom %></b>님을 통하여 구매하였습니다.
							</font>
						</td>
					</tr>
<%
		}
%>
					<tr align="center">
						<td style="border-bottom: 2px solid gray; border-right: 1px solid gray; width: 10px" rowspan="2">
							<input class="checkbox" name="checkList" type="checkbox" itemCode="<%= itemCode %>" itemMarketPrice="<%= itemMarketPrice %>" itemPurchasePrice="<%= itemPurchasePrice %>" itemSellPrice="<%= itemSellPrice %>" cartItemRecom="<%= cartItemRecom %>" itemAmount="<%= itemAmount %>">
						</td>
						<td style="border-bottom: 2px solid gray;" rowspan="2" width="120px">
							<img src="<%= itemPicPath %>/<%= itemPicSaveName %>" width="80px" height="80px" style="margin-left: -20px">
						</td>
						<td colspan="3" style="border-right: 1px solid gray;">
							<font size="3"><b><%= itemName %></b></font>
						</td>
						<td style="border-bottom: 2px solid gray; border-right: 1px solid gray;" rowspan="2"><%= itemSellPrice %>원</td>
						<td style="border-bottom: 2px solid gray; border-right: 1px solid gray;" rowspan="2">무료배송</td>
						<td style="border-bottom: 2px solid gray;" rowspan="2">
							<font size="3"><b><%= itemAmount %></b></font>
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
			</div>
			<!--띄어쓰기-->
			<p><br>
			<div class="poster" style="margin-left: 100px">
				<p>
					<font size="2"><b>· 포인트는 최소 0P~최대 5000P까지 사용가능 또는 구매금액의
							20%까지 사용 가능합니다. (두 가지 방법 중 택1)</b></font>
				<p>
					<font size="2"><b>· 배송비는 포인트 사용 불가능 합니다.</b></font>
				<p>
			</div>
			<div class="card-infotable" style="margin-left: 100px">
				<table style="width: 900px; height: 40px">
					<tr>
						<td style="background-color: #EAEAEA; width: 140px; border-top: 3px solid gray; border-bottom: 1px solid gray" align="center">
							<font size="3"><b>마일리지 사용</b></font>
						</td>
						<td style="border-top: 3px solid gray; border-bottom: 1px solid gray; padding-left: 10px">
							<input name="usedMileage" type="text" value="0">&nbsp; 
							<input id="mileageUseBtn" type="button" class="btn btn-default" value="사용하기">
							<b> (사용가능포인트 <%= mileageAmount %>P) (보유포인트 <%= mileageAmount %>P)</b>
						</td>
					</tr>
				</table>
			</div>

			<p>
			<p>
				<br>
			<div class="poster" align="center">
				<table style="width: 900px; table-layout: fixed">
					<tr style="height: 30px; background-color: #EAEAEA; border-top: 3px solid gray;" align="center">
						<td style="border-right: 1px solid white; text-align: center">
							<font size="3"><b>총 상품 금액</b></font>
						</td>
						<td style="border-right: 1px solid white; text-align: center">
							<font size="3"><b>마일리지</b></font>
						</td>
						<td style="border-right: 1px solid white; text-align: center">
							<font size="3"><b>배송비</b></font>
						</td>
						<td><font size="3"><b>결제 예정금액</b></font></td>
					</tr>

					<tr style="height: 60px; background-color: #F6F6F6" align="center">
						<td id="maxSellPrice" style="border-right: 1px solid white; border-bottom: 3px solid gray; text-align: center" maxSellPrice="<%= maxSellPrice %>"><%= maxSellPrice %>원</td>
						<td id="mileage" name="orderUsedMileage" style="border-right: 1px solid white; border-bottom: 3px solid gray; text-align: center">0원</td>
						<td style="border-right: 1px solid white; border-bottom: 3px solid gray; text-align: center">0원</td>
						<td class="sellPrice" style="border-bottom: 3px solid gray;"><%= sellPrice %>원</td>
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
						<td style="padding-left: 20px; border-top: 3px solid gray; border-bottom: 1px solid gray">
							<input type="radio" name="tagbe" value="1" checked>기본 배송지&nbsp;&nbsp;&nbsp; 
							<input type="radio" name="tagbe" value="2">새로운 배송지&nbsp;&nbsp;&nbsp; 
							<input type="radio" name="tagbe" value="3">최근 배송지
						</td>
					</tr>
					<tr>
						<td style="padding-left: 20px; background-color: #EAEAEA; border-bottom: 1px solid gray">
							<font size="3"><b>이름</b></font>
						</td>
						<td style="padding-left: 20px; border-bottom: 1px solid gray">
							<input type="text" name="userName" value="<%= user.getUserName() %>">
						</td>
					</tr>
					<tr>
						<td style="padding-left: 20px; background-color: #EAEAEA; border-bottom: 1px solid gray">
							<font size="3"><b>연락처</b></font>
						</td>
						<td style="padding-left: 20px; border-bottom: 1px solid gray">
							<input type="text" name="userPhone" size="20" value="<%= user.getUserPhone() %>">
						</td>
					</tr>
					<tr>
						<td style="padding-left: 20px; background-color: #EAEAEA; border-bottom: 1px solid gray">
							<font size="3"><b>주소</b></font></td>
						<td style="padding-left: 20px; border-bottom: 1px solid gray">
							<table>
								<tr>
									<td>
										<input class="zipcode" type="text" name="zipCode1" value="<%= user.getUserPostCode1() %>" readonly> - <input class="zipcode" type="text" name="zipCode2" value="<%= user.getUserPostCode2() %>" readonly>
										<input type="button" class="btn btn-default zipcode" value="우편번호 찾기">
										<a href="#">이 주소를 회원정보에 저장</a>
									</td>
								</tr>
								<tr height="5">
									<td></td>
								</tr>
								<tr>
									<td><input class="zipcode" type="text" name="addr1" style="width: 347px" value="<%= user.getUserAddr1() %>" readonly></td>
								</tr>
								<tr>
									<td><input type="text" name="addr2" style="width: 347px" value="<%= user.getUserAddr2() %>"></td>
								</tr>
							</table>

						</td>
					</tr>
					<tr>
						<td style="padding-left: 20px; background-color: #EAEAEA; border-bottom: 1px solid gray">
							<font size="3"><b>배송메모</b></font>
						</td>
						<td style="padding-left: 20px; border-bottom: 1px solid gray">
							<input type="text" name="userMemo" style="width: 680px">
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
			<p>
				<br>
			<p>
				<br>
			<div class="card-infomation" style="margin-left: 100px">
				<font size="4"><b>03. 카드 정보 입력</b></font>
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
						<td style="background-color: #EAEAEA; width: 140px; border-bottom: 1px solid gray" align="center">
							<font size="3"><b>카드번호</b></font>
						</td>
						<td style="border-bottom: 1px solid gray; padding-left: 10px">
							<input name="cardNum1" type="text" style="width: 100px" maxlength="4"> - 
							<input name="cardNum2" type="text" style="width: 100px" maxlength="4"> - 
							<input name="cardNum3" type="text" style="width: 100px" maxlength="4"> - 
							<input name="cardNum4" type="text" style="width: 100px" maxlength="4">
						</td>
					</tr>
				</table>
			</div>

			<!--띄어쓰기-->
			<p><br><br>
			<div class="buy-button" align="center">
				<span class="sellPrice">총 결제금액 : <%= sellPrice %>원</span>
				<input type="button" class="btn btn-default" id="buyBtn" value="결제하기"
					style="width: 220px; height: 80px">
			</div>
			<br><br>
		</div>
	</div>
</form>
</body>
