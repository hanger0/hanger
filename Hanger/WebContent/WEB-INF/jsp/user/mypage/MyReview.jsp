<%@ page contentType="text/html; charset=EUC-KR"%>

<body style="background-color: #EBEBEB">
	<div class="container" style="width: 80%; height: 100%">
		<div class="thumbnail"
			style="width: 100%; background-color: white; display: table; margin-left: auto; margin-right: auto">
			<div class="col-sm-4 infos" style="width: 15%; margin-left: 5%">
				<img src="images/yebin.jpg" alt="����¥��" class="img-circle"
					style="width: 100px; height: 100px;">
			</div>
			<div class="col-sm-4 infos"
				style="width: 13%; height: 100px; background-color: yellow">
				�̸� : ������ <BR>��¥ : 2015.6.3 <BR>�Ǻ�Ÿ�� : �Ǽ�
			</div>
			<div class="col-sm-4 infos"
				style="width: 50%; background-color: orange">
				<div style="width: 100%;">
					<h5>
						����ó���ۺ�
						</h3>
						<h3>���� ���� ������� �����̴� ��������</h3>
				</div>
			</div>
		</div>

		<!-- �ȷο� ���� �ۼ� ���� -->
		<div class="thumbnail">
			<div class="menubar" style="width: 100%; height: 40px;">
				<ul class="nav nav-pills"
					style="display: table; margin-left: auto; margin-right: auto"
					align="center">
					<li role="presentation" class=""
						style="width: 120px; height: 100px;"><a href="MyReview.jsp">����</a></li>
					<li role="presentation" class=""
						style="width: 120px; height: 100px"><a href="MyWrite.jsp">��</a></li>
					<li role="presentation" class=""
						style="width: 120px; height: 100px"><a href="#">�Խù�</a></li>
					<li role="presentation" class=""
						style="width: 120px; height: 100px"><a href="Flow.jsp">�ȷο�</a></li>
					<li role="presentation" class=""
						style="width: 120px; height: 100px"><a href="OrderPage.jsp">����</a></li>
					<li role="presentation" class=""
						style="width: 120px; height: 100px"><a href="#">���ϸ���</a></li>
				</ul>
			</div>
		</div>
		<!-- �ȷο� ���� �ۼ� �� -->

		<!-- �� �ۼ� ���� -->
		<div class="row hotitem">
			<h4>
				<b><p style="display: table; margin-left: 12px;">���� ��ǰ</p></b>
			</h4>

			<%
				for (int i = 0; i < 4; i++) {
			%>
			<div class="col-sm-6 col-md-3">
				<div class="thumbnail" height="200px">
					<div class="image">
						<img src="images/test.png" width="200px" height="150px"
							style="display: table; margin-left: auto; margin-right: auto;"
							class="hotimages">
					</div>
					<div class="caption">
						<P>
						<h6>
							<B>�̻�</B>
						</h6>
						<p>
						<h4>
							<B>[M] ���� ��� ���̽�ó SPF50+ PA+++ [21ȣ]</B>
						</h4>
						<p>
							<font size="2"><b>����</b>&nbsp;&nbsp;&nbsp;</font><font
								color="gray">16,000��</font>
						<hr style="margin-top: -1%; margin-bottom: -1%">
						<div class="like" align="center" style="margin-top: 5%">
							<input type="button" value="���侲��" class="btn btn-default" />
						</div>
					</div>
				</div>
			</div>
			<%
				}
			%>
			<br> <br> <br>
			<h4>
				<b><p style="display: table;">MyReview</p></b>
			</h4>
			<!--  �� �ۼ� �� -->

			<%
				for (int i = 0; i < 4; i++) {
			%>
			<div class="col-sm-6 col-md-3">
				<div class="thumbnail">
					<div class="image">
						<img src="images/test.png" width="200px" height="150px"
							style="display: table; margin-left: auto; margin-right: auto;"
							class="hotimages">
					</div>
					<div class="caption">
						<P>
						<h5>
							<B>�귣�� : �Ұ��� �ڡڡڡڡ�</B>
						</h5>
						</P>
						<P>
						<h4>
							<B>���� : �ȴϾ� �Ƹ޽ý�Ʈ</B>
						</h4>
						</P>
						</h5>

						<hr style="margin-bottom: 3px">
						<div class="Container-fluid" align="center">
							<span class="glyphicon glyphicon-heart" aria-hidden="true"></span><span
								class="badge">87</span>&nbsp;&nbsp;&nbsp;&nbsp; <span
								class="glyphicon glyphicon-pencil" aria-hidden="true"></span><span
								class="badge">20</span>&nbsp;&nbsp;&nbsp;&nbsp; <span
								class="glyphicon glyphicon-tag" aria-hidden="true"></span><span
								class="badge">30</span>
						</div>
					</div>
				</div>
			</div>
			<%
				}
			%>
		</div>
	</div>
</body>
