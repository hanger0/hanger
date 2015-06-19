<%@ page contentType="text/html; charset=EUC-KR"%>
<%
	String managerPageUrl = (String)request.getAttribute("managerPageUrl");
%>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" media="all" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js" type="text/javascript"></script>

<body>
<div class="container">
	<div class="thumbnail" style="width:96%;display:table;margin-left:auto;margin-right:auto">
			<BR>
			<div class="menubar" style="width: 100%; height: 40px;" >
				<ul class="nav nav-pills" align = "center" style = "display:table;margin-left:auto;margin-right:auto">
					<li role="presentation" style="width: 120px; height: 30px;">
						<a href="/managerAddItem.hang">惑前殿废</a>
					</li>
					<li role="presentation" style="width: 120px; height: 30px">
						<a href="/managerStock.hang">犁绊包府</a>
					</li>
					<li role="presentation" style="width: 120px; height: 30px">
						<a href="/managerUserList.hang">雀盔包府</a>
					</li>
					<li role="presentation" style="width: 120px; height: 30px">
						<a href="/managerSales.hang">概免包府</a>
					</li>
					<li role="presentation" style="width: 120px; height: 30px">
						<a href="/managerOrderList.hang">备概郴开包府</a>
					</li>
				</ul>
			</div>
			<BR>
		</div>
		<div id="content" style = "background-color:#EBEBEB">
			<jsp:include page="<%= managerPageUrl %>" flush="true" />
		</div>
	</div>
</body>
</html>