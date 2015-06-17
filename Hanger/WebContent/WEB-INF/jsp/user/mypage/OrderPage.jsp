<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page import="java.util.*" %>
<%@ page import="com.hanger.order.vo.OrderVo" %>
<%
	ArrayList<OrderVo> orderList = (ArrayList<OrderVo>)request.getAttribute("orderList");
%>

<script>
$(function(){
	$("#decideBtn").click(function(){
		var orderInfoCode = $(this).attr("orderInfoCode");
		$("input:hidden[name=orderInfoCode]").val(orderInfoCode);
		$("#decideForm").submit();
	});
});
</script>
<body>
	<div class="container" style="width:97.7%">
		<!-- ���� �ۼ� ���� -->
			<font size = "3">
				<b><p style="display: table; margin-left: 5px;">���� ����</p></b>
			</font>
		<div class="thumbnail"><br>
			<div align="center">
				<table style="width: 900px; table-layout: fixed">
					<tr align="center" style="background-color: #EAEAEA; border-top: 2px solid gray;">
						<td align="center"
							style="border-right: 1px solid gray; border-bottom: 2px solid gray; padding-top: 10px"><b>��������
								<p>(�ֹ���¥)
								<p>
						</b></td>
						<td colspan="4" align="center"
							style="border-right: 1px solid gray; border-bottom: 2px solid gray"><B>��ǰ��/�ɼ�/��ǰ�ݾ�</B></td>
						<td align="center"
							style="border-right: 1px solid gray; border-bottom: 2px solid gray"><B>����</B></td>
						<td align="center"
							style="border-right: 1px solid gray; border-bottom: 2px solid gray"><b>��õ��</b></td>
						<td align="center"
							style="border-right: 1px solid gray; border-bottom: 2px solid gray"><B>����ڵ�</B></td>
						<td align="center" style="border-bottom: 2px solid gray"><B>����Ȯ��</B></td>
					</tr>
	<%
	if(orderList != null && orderList.size() > 0)
		for (int i = 0; i < orderList.size(); i++) {
			OrderVo order = orderList.get(i);
	%>
					<tr align="center">
						<td style="border-bottom: 2px solid gray; border-right: 1px solid gray; width: 10px"
							rowspan="2">
							<%= order.getRegDate() %>
						</td>
						<td style="border-bottom: 2px solid gray;" rowspan="2"
							width="120px" height="100px"><img src="<%= order.getItemPicPath() %>/<%= order.getItemPicSaveName() %>"
							width="80px" height="80px" style="margin-left: 10px"></td>
						<td colspan="3" style="border-right: 1px solid gray;"><font
							size="3"><b><%= order.getItemName() %></b></font></td>
						<td style="border-bottom: 2px solid gray; border-right: 1px solid gray;"
							rowspan="2"><%= order.getOrderItemAmount() %></td>
						<td style="border-bottom: 2px solid gray; border-right: 1px solid gray;"
							rowspan="2">���۱������</td>
						<td style="border-bottom: 2px solid gray; border-right: 1px solid gray;"
							rowspan="2"><P><%= order.getOrderState() %></td>
						<td style="border-bottom: 2px solid gray;" rowspan="2">
				<%
					if(order.getOrderItemVerify().equals("Y")){
				%>
							<a href="#"><input type="button" value="���侲��" class="btn btn-default" /></a>
				<%
					} else if(false){
				%>
							<a href="#"><input type="button" value="���亸��" class="btn btn-default" /></a>
				<%					
					}else{
				%>
						<form id="decideForm" action="/orderDecide.hang" method="POST">
							<input name="orderInfoCode" type="hidden" />
							<input id="decideBtn" type="button" value="����Ȯ��" class="btn btn-default" orderInfoCode="<%= order.getOrderInfoCode() %>" />
						</form>
				<%
					}
				%>
						</td>
					</tr>
					<tr>
						<td style="border-bottom: 2px solid gray; border-right: 1px solid gray; padding-right: 15px" colspan="3">
							<font size="2"><%= order.getItemDetailInfo() %> / <%= Integer.parseInt(order.getOrderItemAmount()) * Integer.parseInt(order.getOrderItemSellPrice()) %>�� </font>
						</td>
					</tr>
					<%
			}
%>
				</table>
				<br>
			</div>
			<!--  ���� �ۼ� �� -->
		</div>
	</div>
</body>
