<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page import = "java.util.*" %>
<%@ page import = "com.hanger.manager.managerPage.vo.ManagerOrderListVo" %>
<%
		ArrayList<ManagerOrderListVo> orderListVo = (ArrayList<ManagerOrderListVo>)request.getAttribute("orderListAll");
		System.out.println("orderListVo" + orderListVo.size());
%>
<body>
<script>
	$(function() {
		$("#datepicker1, #datepicker2").datepicker(
				{
					dateFormat : 'yy-mm-dd',
					prevText : '���� ��',
					nextText : '���� ��',
					monthNames : [ '1��', '2��', '3��', '4��', '5��', '6��', '7��',
							'8��', '9��', '10��', '11��', '12��' ],
					monthNamesShort : [ '1��', '2��', '3��', '4��', '5��', '6��',
							'7��', '8��', '9��', '10��', '11��', '12��' ],
					dayNames : [ '��', '��', 'ȭ', '��', '��', '��', '��' ],
					dayNamesShort : [ '��', '��', 'ȭ', '��', '��', '��', '��' ],
					dayNamesMin : [ '��', '��', 'ȭ', '��', '��', '��', '��' ],
					showMonthAfterYear : true,
					yearSuffix : '��'
				});
	});
</script>
	<CENTER>
	<br>
			��ȸ�Ⱓ: <input type="text" id="datepicker1"> ~ <input type="text" id="datepicker2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			ȸ�����̵�: <input type="text" id=""> <input type="button" value="Ȯ��" />
	<br><Br><br>
		<TABLE class="table table-hover table-bordered" style = "background-color:white;width:1100px">
			<TR bgcolor="#CFDDFA" align="center">
				<TD><B><font size = "2">No.</font></B></TD>
				<TD><B><font size = "2">��¥</font></B></TD>
				<TD><B><font size = "2">���̵�</font></B></TD>
				<TD><B><font size = "2">�ֹ��ڵ�</font></B></TD>
				<TD><B><font size = "2">��ǰ �̸�</font></B></TD>
				<TD><B><font size = "2">�뷮(ml/g)</font></B></TD>
				<TD><B><font size = "2">�ֹ�����</font></B></TD>
				<TD><B><font size = "2">���԰���</font></B></TD>
				<TD><B><font size = "2">���尡��</font></B></TD>
				<TD><B><font size = "2">�ǸŰ���</font></B></TD>
			</TR>

			<%
				for(int i = 0 ; i <orderListVo.size(); i ++) {
					ManagerOrderListVo orderList = orderListVo.get(i);
					
					String regDate = orderList.getOrderRegDate();
					String userId = orderList.getUserId();
					String itemName = orderList.getItemName();
					String itemSize = orderList.getItemSize();
					String orderItemAmount = orderList.getOrderItemAmount();
					String orderState = orderList.getOrderState();
					String puchasePrice = orderList.getOrderItemPurchasePrice();
					String marketPrice = orderList.getOrderItemMarketPrice();
					String sellPrice = orderList.getOrderItemSellPrice();
					String orderCode = orderList.getOrderCode();
					
			%>
			<TR align="center">
				<TD><font size = "2"><%=i+1 %></font></TD>
				<TD><font size = "2"><%=regDate %></font></TD>
				<TD><font size = "2"><%= userId%></font></TD>
				<TD><font size = "2"><%= orderCode%></font></TD>
				<TD><font size = "2"><%= itemName %></font></TD>
				<TD><font size = "2"><%= itemSize%></font></TD>
				<TD><font size = "2"><%= orderState %></font></TD>
				<TD><font size = "2"><%= marketPrice%>��</font></TD>
				<TD><font size = "2"><%=puchasePrice %>��</font></TD>
				<TD><font size = "2"><%=sellPrice %>��</font></TD>
				<%
					}
				%>
		</TABLE>
	</CENTER>
</body>