<%@ page contentType="text/html;charset=euc-kr"%>

<body>
	<div class="container">
		<div class="thumbnail" style="height: 90px">
			<BR>
			<div class="title" align="center">
				<ul class="nav nav-pills" style="float: center">
					<li role="presentation" class=""
						style="width: 120px; height: 100px; margin-left: 180px"><a
						href="#">��ǰ����</a></li>
					<li role="presentation" class=""
						style="width: 120px; height: 100px"><a href="#">������</a></li>
					<li role="presentation" class=""
						style="width: 120px; height: 100px"><a href="#">ȸ������</a></li>
					<li role="presentation" class=""
						style="width: 120px; height: 100px"><a href="#">�Խ��ǰ���</a></li>
					<li role="presentation" class=""
						style="width: 120px; height: 100px"><a href="#">�������</a></li>
					<li role="presentation" class=""
						style="width: 120px; height: 100px"><a href="#">���ų�������</a></li>
				</ul>
			</div>
			<BR>
		</div>

		<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->

		<div class="btn-group" style="margin-left: -890px;">
			<button type="button" class="btn btn-default">����</button>
			<button type="button" class="btn btn-default dropdown-toggle"
				data-toggle="dropdown" aria-expanded="false">
				<span class="caret"></span> <span class="sr-only">Toggle
					Dropdown</span>
			</button>
			<ul class="dropdown-menu " role="menu">
				<li><a class="active" href="#">��Ų</a></li>
				<li><a href="#">��</a></li>
				<li><a href="#">���̽�</a></li>
				<li><a href="#">����</a></li>
				<li><a href="#">��Ų</a></li>
				<li><a href="#">Ŭ��¡</a></li>
				<li><a href="#">�ٵ����</a></li>
				<li><a href="#">����</a></li>
				<li><a href="#">���</a></li>
				<li><a href="#">ȭ���ǰ</a></li>
			</ul>
		</div>
		<!--��ǰ-->

		<div class="row hotitem">

			<div class="row"
				style="display: table; margin-left: 20px; margin-right: auto;">
				<%
					for (int i = 0; i < 4; i++) {
				%>
				<div class="col-sm-6 col-md-3">
					<div class="thumbnail">
						<img src="images/wonbin.PNG" alt="..." width="200px"
							height="150px">
						<div class="caption">
							<h3>Power overwhemling</h3>
							<p>���� : �ڡڡڡڡ�
							<p>
							<p>Show me the money</p>
							<p>Price : 277000</p>
							<p>
							<hr style="margin-bottom: 3px">
							<div
								style="display: table; margin-left: auto; margin-right: auto;">
								<a href="#" class="btn btn-default" role="button">�����ϱ�</a> <a
									href="#" class="btn btn-default" role="button">����</a>
							</div>
							</p>
						</div>
					</div>
				</div>
				<%
					}
				%>
			</div>
		</div>
	</div>
	<!-- ��ǰ �� -->
</body>
</html>