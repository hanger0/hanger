<%@ page contentType="text/html; charset=EUC-KR"%>

<style>
.row {
	width: 100%;
	background-color: white;
	display: table;
	margin-left: auto;
	margin-right: auto;
	margin-top: 3px;
}

.thumbnail {
	width: 100%;
}

.millige {
	width: 80%;
	height: 50px;
	display: table;
	margin-left: auto;
	margin-right: auto;
}
</style>

<body style="background-color: #EBEBEB">
	<div class="container" style="width: 80%">
		<br>
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
						style="width: 120px; height: 40px;"><a href="MyReview.jsp">����</a></li>
					<li role="presentation" class="" style="width: 120px; height: 40px">
						<a href="MyWrite.jsp">��</a>
					</li>
					<li role="presentation" class="" style="width: 120px; height: 40px">
						<a href="#">�Խù�</a>
					</li>
					<li role="presentation" class="" style="width: 120px; height: 40px">
						<a href="Flow.jsp">�ȷο�</a>
					</li>
					<li role="presentation" class="" style="width: 120px; height: 40px">
						<a href="OrderPage.jsp">���</a>
					</li>
					<li role="presentation" class="" style="width: 120px; height: 40px">
						<a href="#">���ϸ���</a>
					</li>
				</ul>
			</div>
		</div>
		<!-- �ȷο� ���� �ۼ� �� -->

		<!-- �� �ۼ� ���� -->
		<div class="thumbnail" style="height: 100%;">
			<br>
			<div class="title">
				<font size="3"><b><p
							style="display: table; margin-left: 12px;">���ϸ���</p></b></font>
			</div>
			<div class="millige">
				<div class="thumbnail" align="center"
					style="background-color: #EBEBEB">
					<font size="4"><font color="red"><b>�� ���ϸ��� : </b></font></font>AJAX&nbsp;&nbsp;
					<font size="4"><font color="red"><b>��� ���ϸ��� : </b></font></font>AJAX&nbsp;&nbsp;
					<font size="4"><font color="red"><b>���� ���ϸ��� : </b></font></font>AJAX&nbsp;&nbsp;
				</div>
				<%
					for (int i = 0; i < 3; i++) {
				%>
				<div class="thumbnail"
					style="width: 50%; display: table; margin-left: auto; margin-right: auto;">
					&nbsp;&nbsp;2015 / 5 / 15 <font size="2">(�ø��� �� ���� ����� ����ũ��)</font><br>
					&nbsp;&nbsp;"<b>���۱������</b>"���� ���� �����Ͽ� �����Ǿ����ϴ�.&nbsp;&nbsp; <font
						size="4"><b>500��</b></font>
				</div>
				<hr>
				<%
					}
				%>

			</div>
			<!--  �� �ۼ� �� -->
		</div>
	</div>
</body>
