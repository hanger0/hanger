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
	<input type="hidden" name="orderState" value="�Աݴ����"/>
	<input type="hidden" name="discountreasoncode" value="001"/>
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
						<td align="center"
							style="border-right: 1px solid gray; border-bottom: 2px solid gray; width: 30px"><input
							type="checkbox"></td>
						<td colspan="4" align="center"
							style="border-right: 1px solid gray; border-bottom: 2px solid gray"><B>��ǰ��</B></td>
						<td align="center"
							style="border-right: 1px solid gray; border-bottom: 2px solid gray"><B>��ǰ�ݾ�</B></td>
						<td align="center"
							style="border-right: 1px solid gray; border-bottom: 2px solid gray"><B>��ۺ�</B></td>
						<td align="center"><b>����</b></td>

					</tr>
<%
		if(cartItemRecom != null){
%>
					<tr>
						<td style="background-color: #747474"></td>
						<td colspan="8" style="background-color: #747474">
							<font color="white"> 
								<b><%= cartItemRecom %></b>���� ���Ͽ� �����Ͽ����ϴ�.
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
							rowspan="2"><%= itemSellPrice %>��</td>
						<td style="border-bottom: 2px solid gray; border-right: 1px solid gray;"
							rowspan="2">������</td>
						<td style="border-bottom: 2px solid gray;" rowspan="2"><font
							size="3"><b><%= itemAmount %></b></font></td>
					</tr>
					<tr>
						<td style="border-bottom: 2px solid gray;" colspan="3"><font
							size="2"><%= itemDetailInfo %></font></td>
					</tr>
				</table>
			</div>

			<!--����-->
			<br>
			<div class="card-table" align="center">
				<table style="width: 900px; table-layout: fixed">
					<tr
						style="height: 30px; background-color: #EAEAEA; border-top: 3px solid gray;"
						align="center">
						<td style="border-right: 1px solid white; text-align: center"><font
							size="3"><b>�� ��ǰ �ݾ�</b></font></td>
						<td style="border-right: 1px solid white; text-align: center"><font
							size="3"><b>��ۺ�</b></font></td>
						<td><font size="3"><b>���� �����ݾ�</b></font></td>
					</tr>

					<tr style="height: 60px; background-color: #F6F6F6" align="center">
						<td style="border-right: 1px solid white; border-bottom: 3px solid gray; text-align: center"><%= itemSellPrice %>��</td>
						<td style="border-right: 1px solid white; border-bottom: 3px solid gray; text-align: center">0��</td>
						<td style="border-bottom: 3px solid gray;"><%= itemSellPrice %>��</td>
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
						<td
							style="padding-left: 20px; border-top: 3px solid gray; border-bottom: 1px solid gray">
							<input type="radio" name="tagbe" checked>�⺻ �����&nbsp;&nbsp;&nbsp; <input
							type="radio" name="tagbe">���ο� �����&nbsp;&nbsp;&nbsp; <input
							type="radio" name="tagbe">�ֱ� �����
						</td>
					</tr>
					<tr>
						<td style="padding-left: 20px; background-color: #EAEAEA; border-bottom: 1px solid gray"><font
							size="3"><b>�̸�</b></font></td>
						<td style="padding-left: 20px; border-bottom: 1px solid gray">
						<input type="text" name="orderName" value="<%= user.getUserName() %>"></td>
					</tr>
					<tr>
						<td
							style="padding-left: 20px; background-color: #EAEAEA; border-bottom: 1px solid gray"><font
							size="3"><b>����ó</b></font></td>
						<td style="padding-left: 20px; border-bottom: 1px solid gray">
							<input type="text" name="orderPhone" size="20" value="<%= user.getUserPhone() %>">
						</td>
					</tr>
					<tr>
						<td style="padding-left: 20px; background-color: #EAEAEA; border-bottom: 1px solid gray">
							<font size="3"><b>�ּ�</b></font></td>
						<td style="padding-left: 20px; border-bottom: 1px solid gray">
							<table>
								<tr>
									<td>
										<input type="text" name="orderPostCode1" value="<%= user.getUserPostCode1() %>"> - <input type="text" name="orderPostCode2" value="<%= user.getUserPostCode2() %>">
										<input type="button" class="btn btn-default" value="�����ȣ ã��">
										<input type="checkbox">�� �ּҸ� ȸ�������� ����
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
							<font size="3"><b>��۸޸�</b></font>
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
						�� ��Ȯ�� �ּҸ��������ּ���.
					</b></font>
				<p>
					<font size="2" color="red"><b>
						�� ����Ȯ�� ���� �� �нǷ� ���� ��߼��� �Ұ����ϸ�, ��ǰ�� �ݼ۵� ��� �պ���ۺ�(5,000��) ���δ��Դϴ�.
					</b></font>
			</div>
			<!--����-->
			<p><br><p><br>
			<div class="card-info" style="margin-left: 100px">
				<font size="4"><b>03. ���� ����</b></font>
			</div>
			<p>
			<div class="poster" style="margin-left: 100px">
				<p>
					<font size="2"><b>�� ����Ʈ�� �ּ� 0P~�ִ� 5000P���� ��밡�� �Ǵ� ���űݾ���
							20%���� ��� �����մϴ�. (�� ���� ��� �� ��1)</b></font>
				<p>
					<font size="2"><b>�� ��ۺ�� ����Ʈ ��� �Ұ��� �մϴ�.</b></font>
				<p>
					<font size="2"><b>�� �������� ���� �������� �ݾ� ���� ��ǰ ���� �Ұ� / �� ������
							�ּ� �����ݾ� Ȯ�� �� ��� ��Ź�帳�ϴ�.</b></font>
				<p>
			</div>
			<div class="card-infotable" style="margin-left: 100px">
				<table style="width: 900px; height: 40px">
					<tr>
						<td
							style="background-color: #EAEAEA; width: 140px; border-top: 3px solid gray; border-bottom: 1px solid gray"
							align="center"><input type="checkbox"><font size="3"><b>���ϸ���
									���</b></font></td>
						<td
							style="border-top: 3px solid gray; border-bottom: 1px solid gray; padding-left: 10px">
							<input type="text">&nbsp; <input type="button"
							class="btn btn-default" value="����ϱ�"><b> (��밡������Ʈ 0P)
								(��������Ʈ 0P)</b>
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
							size="3"><b>�� ��ǰ �ݾ�</b></font></td>
						<td style="border-right: 1px solid white; text-align: center"><font
							size="3"><b>���ϸ���</b></font></td>
						<td style="border-right: 1px solid white; text-align: center"><font
							size="3"><b>��ۺ�</b></font></td>
						<td><font size="3"><b>���� �����ݾ�</b></font></td>
					</tr>

					<tr style="height: 60px; background-color: #F6F6F6" align="center">
						<td
							style="border-right: 1px solid white; border-bottom: 3px solid gray; text-align: center">0��</td>
						<td
							style="border-right: 1px solid white; border-bottom: 3px solid gray; text-align: center">0��</td>
						<td
							style="border-right: 1px solid white; border-bottom: 3px solid gray; text-align: center">0��</td>
						<td style="border-bottom: 3px solid gray;">0��</td>
					</tr>
				</table>
			</div>

			<!--����-->
			<p>
				<br>
			<p>
				<br>
			<div class="card-infomation" style="margin-left: 100px">
				<font size="4"><b>04. ī�� ���� �Է�</b></font>
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
						<td
							style="background-color: #EAEAEA; width: 140px; border-bottom: 1px solid gray"
							align="center"><font size="3"><b>ī���ȣ</b></font></td>
						<td style="border-bottom: 1px solid gray; padding-left: 10px">
							<input type="text" style="width: 100px"> - <input
							type="text" style="width: 100px"> - <input type="text"
							style="width: 100px"> - <input type="text"
							style="width: 100px">
						</td>
					</tr>
				</table>
			</div>

			<!--����-->
			<p>
				<br> <br>
			<div class="buy-button" align="center">
				<input type="button" class="btn btn-default buyBtn" value="�����ϱ�"
					style="width: 220px; height: 80px">
			</div>
			<br><br>
		</div>
	</div>
</form>
</body>
