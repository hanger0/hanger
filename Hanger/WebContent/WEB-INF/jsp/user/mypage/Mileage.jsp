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
	<div class="container" style="width: 97%">
		<!-- �� �ۼ� ���� -->
			<font size="3"><b><p style="display: table;">���ϸ���</p></b></font>
		<div class="thumbnail">
			<br>
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
					style="width: 60%; display: table; margin-left: auto; margin-right: auto;">
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
