<%@ page contentType="text/html; charset=EUC-KR"%>

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
		<div class="thumbnail" style="height: 90px">
			<BR>
			<div class="title" align="center">
				<ul class="nav nav-pills" style="float: center">
					<li role="presentation" class=""
						style="width: 120px; height: 100px; margin-left: 180px"><a
						href="#">����</a></li>
					<li role="presentation" class=""
						style="width: 120px; height: 100px"><a href="#">��</a></li>
					<li role="presentation" class=""
						style="width: 120px; height: 100px"><a href="#">�Խù�</a></li>
					<li role="presentation" class=""
						style="width: 120px; height: 100px"><a href="#">�ȷο�</a></li>
					<li role="presentation" class=""
						style="width: 120px; height: 100px"><a href="#">����</a></li>
					<li role="presentation" class=""
						style="width: 120px; height: 100px"><a href="#">���ϸ���</a></li>
				</ul>
			</div>
			<BR>
		</div>
		<!-- �ȷο� ���� �ۼ� �� -->

		<!-- ���� �ۼ� ���� -->
		<div class="thumbnail" style="height: 100%">
			<div class="title" style="margin-left: 20px; margin-top: 10px">
				<font size="4"><B>���ų���</B></font>
			</div>
			<BR>

			<div class="card-table" align="center">

				<table style="width: 900px; table-layout: fixed">
					<tr align="center"
						style="background-color: #EAEAEA; border-top: 2px solid gray;">
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
						for (int i = 0; i < 2; i++) {
					%>
					<tr>
						<td style="background-color: #747474"></td>
						<td colspan="8" style="background-color: #747474"><font
							color="white"> <b>"���۱������"</b>���� ���Ͽ� �����Ͽ����ϴ�.
						</font></td>
					</tr>

					<tr align="center">
						<td
							style="border-bottom: 2px solid gray; border-right: 1px solid gray; width: 10px"
							rowspan="2">1234567890
							<p>(2015/05/15)
						</td>
						<td style="border-bottom: 2px solid gray;" rowspan="2"
							width="120px" height="100px"><img src="/images/14.jpg"
							width="80px" height="80px" style="margin-left: 10px"></td>
						<td colspan="3" style="border-right: 1px solid gray;"><font
							size="3"><b>�ø��� �� ����� ���� ũ�� / </b></font></td>
						<td
							style="border-bottom: 2px solid gray; border-right: 1px solid gray;"
							rowspan="2">1</td>
						<td
							style="border-bottom: 2px solid gray; border-right: 1px solid gray;"
							rowspan="2">���۱������</td>
						<td
							style="border-bottom: 2px solid gray; border-right: 1px solid gray;"
							rowspan="2">4568121680</td>
						<td style="border-bottom: 2px solid gray;" rowspan="2">
							<!-- ����Ȯ���� ������ AJAX�� ���侲��� ���� --> <input type="button"
							value="����Ȯ��" class="btn btn-default"
							style="width: 80px; height: 30px">
						</td>
					</tr>
					<tr>
						<td
							style="border-bottom: 2px solid gray; border-right: 1px solid gray; padding-right: 15px"
							colspan="3"><font size="2">1. AŸ��(�η����ĸ� �缾Ʈ ���� ��񿡼���
								01ȣ ���� ������+���������� ���潽 ���̶��̳�+�� �÷� ��ƽ) / 19,000�� </font></td>
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
