<%@ page contentType="text/html; charset=EUC-KR"%>

<body>
	<div class="container" style="width:97.7%">
		<!-- ���� �ۼ� ���� -->
			<font size = "3">
				<b><p style="display: table; margin-left: 5px;">���� ����</p></b>
			</font>
		<div class="thumbnail"><br>
			<div align="center">
				<table style="width: 900px; table-layout: fixed">
					<tr align="center" style="background-color: #EAEAEA; border-top: 2px solid gray;">
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
		for (int i = 0; i < 5; i++) {
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
							rowspan="2">4568121680<P>(�����)</td>
						<td style="border-bottom: 2px solid gray;" rowspan="2">
							<!-- ����Ȯ���� ������ AJAX�� ���侲��� ���� --> 
							<input type="button" value="���侲��" class="btn btn-default" />
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
