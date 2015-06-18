<%@ page contentType="text/html;charset=euc-kr"%>

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
					<p>(itemScore)
					<p>(itemTitle)
					<p>(itemPrice)
					<hr style="margin-bottom: 3px">
					<p>
					<div style="display: table; margin-left: auto; margin-right: auto;">
						<a href="#" class="btn btn-default" role="button" style = "width:100px;height:30px">수정</a>&nbsp;&nbsp;&nbsp;&nbsp;
						<a href="#" class="btn btn-default" role="button" style = "width:100px;height:30px">삭제</a>
					</div>
				</div>
			</div>
		</div>
<%
		}
%>
	</div>
	<!-- 상품 끝 -->
</body>
</html>