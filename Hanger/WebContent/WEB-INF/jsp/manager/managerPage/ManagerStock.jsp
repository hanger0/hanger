<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page import="com.hanger.manager.managerPage.vo.ManagerStockVo"%>
<%@ page import="java.util.*"%>

<%
	ArrayList<ManagerStockVo> stockList = (ArrayList<ManagerStockVo>) request.getAttribute("stockList");
%>
<CENTER>
	<br> 재고검색: <input type="text" id="">&nbsp;<input
		type="button" value="확인" /> <br> <Br> <br>
	<TABLE class="table table-hover table-bordered"
		style="background-color: white; width: 1100px;">
		<TR bgcolor="#CFDDFA" align="center">
			<TD><B>No.</B></TD>
			<TD><B>IG코드</B></TD>
			<TD><B>IT코드</B></TD>
			<TD><B>상품명</B></TD>
			<TD><B>상품용량</B></TD>
			<TD><B>입고수량</B></TD>
			<TD><B>재고수량</B></TD>
			<TD><B>매입가</B></TD>
			<TD><B>시장가</B></TD>
			<TD><B>판매가</B></TD>
			<TD><B>할인율</B></TD>
			<TD><B>할인사유</B></TD>
			<TD><B>판매상태</B></TD>
			<TD><B>상품상태</B></TD>
			<TD><B>날짜</B></TD>
		</TR>

		<%
			int itemCntPerGroup = 0;
			int itemCntPerSize = 0;
			for (int i = 0; i < stockList.size(); i++) {
				itemCntPerGroup = Integer.parseInt(stockList.get(i).getItemCntPerGroup());
		%>
			  <TR align="center">
				<TD><%=i + 1%></TD>
				
				<TD><%=stockList.get(i).getItemGroupCode() %></TD>
				<TD><%=stockList.get(i).getItemCode() %></TD>
				<TD><%=stockList.get(i).getItemName() %></TD>
				<TD><%=stockList.get(i).getItemSize() %></TD>
				<TD><%=stockList.get(i).getStockAmount() %></TD>
				<TD><%=stockList.get(i).getStockAmountTotal() %></TD>
				<TD><%=stockList.get(i).getStockPurchasePrice() %></TD>
				<TD><%=stockList.get(i).getStockMarketPrice() %></TD>
				<TD><%=stockList.get(i).getStockSellPrice() %></TD>
				<TD><%=String.format("%.2f" , 100-((Double.parseDouble(stockList.get(i).getStockSellPrice())
						/Double.parseDouble(stockList.get(i).getStockMarketPrice())))*100) %></TD>
			<% 
				if(stockList.get(i).getDiscountReasonName() == null){
			%>
				<TD></TD>
			<%
				} else {
			%>
				<TD><%=stockList.get(i).getDiscountReasonName() %></TD>
			<%
				}
			%>
				<TD><%=stockList.get(i).getItemUseYn() %></TD>
				<TD><%=stockList.get(i).getItemStatus() %></TD>
				<TD><%=stockList.get(i).getStockRegDate() %></TD>
			  </TR>
			<%
				}
			%>
		
	</TABLE>
</CENTER>