<%@ page contentType="text/html; charset=EUC-KR"%>

<body>
	<div class="row hotitem" style = "width:98%;display:table;margin-left:auto;margin-right:auto">
<%
		for (int i = 0; i < 6; i++) {
%>
		<div class="col-sm-6 col-md-3">
			<div class="thumbnail">
				<img src="images/wonbin.PNG" width="230px" height="150px">
				<div class="caption">
					<h3>(itemBrand)</h3>
					<p>(itemTitle)
					<p>(itemPrice)
					<p>(입고량) : <font>400</font>
					<hr style="margin-bottom: 3px">
					<p>
					<div style="display: table; margin-left: auto; margin-right: auto;">
						<font>재고량 : (200)</font>
					</div>
				</div>
			</div>
		</div>
<%
		}
%>
	</div>
</body>
