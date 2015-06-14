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
    		alert("��ǰ�� �Ѱ� �̻� ��� �ּ���.");
    		return false;
    	}
		if($("input:text[name=userName]").val() == ""){
    		alert("�������� �̸��� �Է����ּ���.");
    		return false;
    	}
		if($("input:text[name=userPhone]").val() == ""){
    		alert("�������� ��ȭ��ȣ�� �Է����ּ���.");
    		return false;
    	}
		if($("input:text[name=zipCode1]").val() == ""){
    		alert("�������� �ּҸ� �Է����ּ���.");
    		return false;
    	}
		if($("input:text[name=zipCode2]").val() == ""){
			alert("�������� �ּҸ� �Է����ּ���.");
    		return false;
    	}
		if($("input:text[name=addr1]").val() == ""){
			alert("�������� �ּҸ� �Է����ּ���.");
    		return false;
    	}
		if($("input:text[name=addr2]").val() == ""){
			alert("�������� �ּҸ� �Է����ּ���.");
    		return false;
    	}
		if($("input:text[name=cardNum1]").val() == "" || $("input:text[name=cardNum1]").val().length <4 || !isNum($("input:text[name=cardNum1]").val())){
    		alert("ī���ȣ�� Ȯ���� �ּ���.");
    		return false;
    	}
		if($("input:text[name=cardNum2]").val() == "" || $("input:text[name=cardNum2]").val().length <4 || !isNum($("input:text[name=cardNum2]").val())){
			alert("ī���ȣ�� Ȯ���� �ּ���.");
    		return false;
    	}
		if($("input:text[name=cardNum3]").val() == "" || $("input:text[name=cardNum3]").val().length <4 || !isNum($("input:text[name=cardNum3]").val())){
			alert("ī���ȣ�� Ȯ���� �ּ���.");
    		return false;
    	}
		if($("input:text[name=cardNum4]").val() == "" || $("input:text[name=cardNum4]").val().length <4 || !isNum($("input:text[name=cardNum4]").val())){
			alert("ī���ȣ�� Ȯ���� �ּ���.");
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
			alert("������ ���ϸ����� Ȯ���� �ּ���.");
			return false;
		}
		if(parseInt(useMileage) > 5000){
			alert("5000�� ������ ���ϸ����� ��� �����մϴ�.");
			return false;
		}
		if(parseInt(useMileage) > parseInt(maxSellPrice)){
			alert("�� �ݾ׺��� ���� ���ϸ����� ����� �� �����ϴ�.");
			return false;
		}
		
		mileage.text(parseInt(useMileage)+"��");
		sellPrice.text(parseInt(maxSellPrice)-parseInt(useMileage)+"��");
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
	<input type="hidden" name="orderState" value="�Աݴ����"/>
	<input type="hidden" name="myMileage" value="<%= mileageAmount %>"/>
	<div class="container">
		<BR>
		<div class="brand">
			<font size="6"><b>���ڽ�</b></font>
			<H5>
				<b>��Ƽ Ʈ���带 �ٲٴ�</b>
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
						<td colspan="4" align="center" style="border-right: 1px solid gray; border-bottom: 2px solid gray"><B>��ǰ��</B></td>
						<td align="center" style="border-right: 1px solid gray; border-bottom: 2px solid gray"><B>��ǰ�ݾ�</B></td>
						<td align="center" style="border-right: 1px solid gray; border-bottom: 2px solid gray"><B>��ۺ�</B></td>
						<td align="center" style="border-bottom: 2px solid gray"><b>����</b></td>

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
								<b><%= cartItemRecom %></b>���� ���Ͽ� �����Ͽ����ϴ�.
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
						<td style="border-bottom: 2px solid gray; border-right: 1px solid gray;" rowspan="2"><%= itemSellPrice %>��</td>
						<td style="border-bottom: 2px solid gray; border-right: 1px solid gray;" rowspan="2">������</td>
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
			<!--����-->
			<p><br>
			<div class="poster" style="margin-left: 100px">
				<p>
					<font size="2"><b>�� ����Ʈ�� �ּ� 0P~�ִ� 5000P���� ��밡�� �Ǵ� ���űݾ���
							20%���� ��� �����մϴ�. (�� ���� ��� �� ��1)</b></font>
				<p>
					<font size="2"><b>�� ��ۺ�� ����Ʈ ��� �Ұ��� �մϴ�.</b></font>
				<p>
			</div>
			<div class="card-infotable" style="margin-left: 100px">
				<table style="width: 900px; height: 40px">
					<tr>
						<td style="background-color: #EAEAEA; width: 140px; border-top: 3px solid gray; border-bottom: 1px solid gray" align="center">
							<font size="3"><b>���ϸ��� ���</b></font>
						</td>
						<td style="border-top: 3px solid gray; border-bottom: 1px solid gray; padding-left: 10px">
							<input name="usedMileage" type="text" value="0">&nbsp; 
							<input id="mileageUseBtn" type="button" class="btn btn-default" value="����ϱ�">
							<b> (��밡������Ʈ <%= mileageAmount %>P) (��������Ʈ <%= mileageAmount %>P)</b>
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
							<font size="3"><b>�� ��ǰ �ݾ�</b></font>
						</td>
						<td style="border-right: 1px solid white; text-align: center">
							<font size="3"><b>���ϸ���</b></font>
						</td>
						<td style="border-right: 1px solid white; text-align: center">
							<font size="3"><b>��ۺ�</b></font>
						</td>
						<td><font size="3"><b>���� �����ݾ�</b></font></td>
					</tr>

					<tr style="height: 60px; background-color: #F6F6F6" align="center">
						<td id="maxSellPrice" style="border-right: 1px solid white; border-bottom: 3px solid gray; text-align: center" maxSellPrice="<%= maxSellPrice %>"><%= maxSellPrice %>��</td>
						<td id="mileage" name="orderUsedMileage" style="border-right: 1px solid white; border-bottom: 3px solid gray; text-align: center">0��</td>
						<td style="border-right: 1px solid white; border-bottom: 3px solid gray; text-align: center">0��</td>
						<td class="sellPrice" style="border-bottom: 3px solid gray;"><%= sellPrice %>��</td>
					</tr>
				</table>
			</div>
			<!--����-->
			<p><br><p><br>
			<div class="product-info" style="margin-left: 100px">
				<font size="4"><b>01. ������ ����</b></font>
			</div>
			<p>
			<div class="product-infotable" align="center">
				<table style="width: 900px; height: 100px">
					<tr>
						<td width="140px" style="background-color: #EAEAEA; padding-left: 20px; border-bottom: 1px solid gray; border-top: 3px solid gray;">
							<font size="3"><b>�̸�</b></font>
						</td>
						<td style="padding-left: 20px; border-bottom: 1px solid gray; border-top: 3px solid gray;"><%= user.getUserName() %></td>
					</tr>
					<tr>
						<td style="background-color: #EAEAEA; padding-left: 20px; border-bottom: 1px solid gray"><font size="3"><b>�޴��� ��ȣ</b></font></td>
						<td style="padding-left: 20px; border-bottom: 1px solid gray"><%= user.getUserPhone() %></td>
					</tr>
					<tr>
						<td style="background-color: #EAEAEA; padding-left: 20px; border-bottom: 1px solid gray"><font size="3"><b>�̸���</b></font></td>
						<td style="padding-left: 20px; border-bottom: 1px solid gray"><%= user.getUserId() %></td>
					</tr>
				</table>
			</div>
			<!--����-->
			<p><br><p><br>
			<div class="send-info" style="margin-left: 100px">
				<font size="4"><b>02. ����� ����</b></font>
				<p>
			</div>
			<div class="send-infotable" align="center">
				<table style="width: 900px; height: 250px">
					<tr>
						<td width="140px"
							style="padding-left: 20px; background-color: #EAEAEA; border-top: 3px solid gray; border-bottom: 1px solid gray">
							<font size="3"><b>����� ����</b></font>
						</td>
						<td style="padding-left: 20px; border-top: 3px solid gray; border-bottom: 1px solid gray">
							<input type="radio" name="tagbe" value="1" checked>�⺻ �����&nbsp;&nbsp;&nbsp; 
							<input type="radio" name="tagbe" value="2">���ο� �����&nbsp;&nbsp;&nbsp; 
							<input type="radio" name="tagbe" value="3">�ֱ� �����
						</td>
					</tr>
					<tr>
						<td style="padding-left: 20px; background-color: #EAEAEA; border-bottom: 1px solid gray">
							<font size="3"><b>�̸�</b></font>
						</td>
						<td style="padding-left: 20px; border-bottom: 1px solid gray">
							<input type="text" name="userName" value="<%= user.getUserName() %>">
						</td>
					</tr>
					<tr>
						<td style="padding-left: 20px; background-color: #EAEAEA; border-bottom: 1px solid gray">
							<font size="3"><b>����ó</b></font>
						</td>
						<td style="padding-left: 20px; border-bottom: 1px solid gray">
							<input type="text" name="userPhone" size="20" value="<%= user.getUserPhone() %>">
						</td>
					</tr>
					<tr>
						<td style="padding-left: 20px; background-color: #EAEAEA; border-bottom: 1px solid gray">
							<font size="3"><b>�ּ�</b></font></td>
						<td style="padding-left: 20px; border-bottom: 1px solid gray">
							<table>
								<tr>
									<td>
										<input class="zipcode" type="text" name="zipCode1" value="<%= user.getUserPostCode1() %>" readonly> - <input class="zipcode" type="text" name="zipCode2" value="<%= user.getUserPostCode2() %>" readonly>
										<input type="button" class="btn btn-default zipcode" value="�����ȣ ã��">
										<a href="#">�� �ּҸ� ȸ�������� ����</a>
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
							<font size="3"><b>��۸޸�</b></font>
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
						�� ��Ȯ�� �ּҸ��������ּ���.
					</b></font>
				<p>
					<font size="2" color="red"><b>
						�� ����Ȯ�� ���� �� �нǷ� ���� ��߼��� �Ұ����ϸ�, ��ǰ�� �ݼ۵� ��� �պ���ۺ�(5,000��) ���δ��Դϴ�.
					</b></font>
			</div>
			<!--����-->
			<p>
				<br>
			<p>
				<br>
			<div class="card-infomation" style="margin-left: 100px">
				<font size="4"><b>03. ī�� ���� �Է�</b></font>
			</div>
			<p>
			<div class="poster" style="margin-left: 100px">
				<p>
					<font size="2"><b>�� ���� 2�� ������ ������ ���Ϲ���� �����մϴ�.</b></font>
				<p>
					<font size="2"><b>�� 00:00 ~ 00:30(�ִ� 30��) �� ī����� ����� ������
							�ʾ��� �� �ֽ��ϴ�.</b></font>
				<p>
					<font size="2"><b>�� ������ Tel.1544-8888</b></font>
				<p>
			</div>

			<div class="company" align="center">
				<table style="width: 900px; height: 80px">
					<tr>
						<td
							style="background-color: #EAEAEA; width: 140px; border-top: 3px solid gray; border-bottom: 1px solid gray"
							align="center"><font size="3"><b>ī���</b></font></td>
						<td
							style="border-top: 3px solid gray; border-bottom: 1px solid gray; padding-left: 10px">
							<select>
								<option value="����">����</option>
								<option value="����">����</option>
								<option value="����">����</option>
								<option value="IBK">IBK</option>
								<option value="�츮">�츮</option>
						</select>
						</td>
					</tr>
					<tr>
						<td style="background-color: #EAEAEA; width: 140px; border-bottom: 1px solid gray" align="center">
							<font size="3"><b>ī���ȣ</b></font>
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

			<!--����-->
			<p><br><br>
			<div class="buy-button" align="center">
				<span class="sellPrice">�� �����ݾ� : <%= sellPrice %>��</span>
				<input type="button" class="btn btn-default" id="buyBtn" value="�����ϱ�"
					style="width: 220px; height: 80px">
			</div>
			<br><br>
		</div>
	</div>
</form>
</body>
