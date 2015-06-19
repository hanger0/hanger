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
					prevText : '이전 달',
					nextText : '다음 달',
					monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월',
							'8월', '9월', '10월', '11월', '12월' ],
					monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
							'7월', '8월', '9월', '10월', '11월', '12월' ],
					dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
					dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
					dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
					showMonthAfterYear : true,
					yearSuffix : '년'
				});
	});
</script>
	<CENTER>
	<br>
			조회기간: <input type="text" id="datepicker1"> ~ <input type="text" id="datepicker2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			회원아이디: <input type="text" id=""> <input type="button" value="확인" />
	<br><Br><br>
		<TABLE class="table table-hover table-bordered" style = "background-color:white;width:1100px">
			<TR bgcolor="#CFDDFA" align="center">
				<TD><B><font size = "2">No.</font></B></TD>
				<TD><B><font size = "2">날짜</font></B></TD>
				<TD><B><font size = "2">아이디</font></B></TD>
				<TD><B><font size = "2">주문코드</font></B></TD>
				<TD><B><font size = "2">상품 이름</font></B></TD>
				<TD><B><font size = "2">용량(ml/g)</font></B></TD>
				<TD><B><font size = "2">주문상태</font></B></TD>
				<TD><B><font size = "2">매입가격</font></B></TD>
				<TD><B><font size = "2">시장가격</font></B></TD>
				<TD><B><font size = "2">판매가격</font></B></TD>
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
				<TD><font size = "2"><%= marketPrice%>원</font></TD>
				<TD><font size = "2"><%=puchasePrice %>원</font></TD>
				<TD><font size = "2"><%=sellPrice %>원</font></TD>
				<%
					}
				%>
		</TABLE>
	</CENTER>
</body>