<%@ page contentType="text/html; charset=EUC-KR"%>

<!-- ��¥ �Է� ���� START -->
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" media="all" />
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"
	type="text/javascript"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"
	type="text/javascript"></script>
<script>
	$(function() {
		$("#datepicker1, #datepicker2").datepicker(
				{
					dateFormat : 'yy-mm-dd',
					prevText : '���� ��',
					nextText : '���� ��',
					monthNames : [ '1��', '2��', '3��', '4��', '5��', '6��', '7��',
							'8��', '9��', '10��', '11��', '12��' ],
					monthNamesShort : [ '1��', '2��', '3��', '4��', '5��', '6��',
							'7��', '8��', '9��', '10��', '11��', '12��' ],
					dayNames : [ '��', '��', 'ȭ', '��', '��', '��', '��' ],
					dayNamesShort : [ '��', '��', 'ȭ', '��', '��', '��', '��' ],
					dayNamesMin : [ '��', '��', 'ȭ', '��', '��', '��', '��' ],
					showMonthAfterYear : true,
					yearSuffix : '��'
				});
	});
</script>
<!-- ��¥ �Է� ���� END -->

<body>
	<!-- 
	<div class="container">
		<BR>


		<div class="thumbnail"
			style="width: 1000px; display: table; margin-left: auto; margin-right: auto;">
			<div class="panel panel-default"
				style="width: 900px; height: auto; margin-left: 45px; margin-top: 45px">
				<BR>
				<BR>
				<p>
					��ȸ�Ⱓ: <input type="text" id="datepicker1"> ~ <input type="text" id="datepicker2">
					<input type="button" value="Ȯ��"/>
				</p>
				
				
				<P>
				<P>
					<BR>
				<table style="width: 900px; table-layout: fixed">

					<tr align="center"
						style="background-color: #EAEAEA; border-top: 2px solid gray;">
						<!-- <td align = "center" style = "border-right:1px solid gray;border-bottom:2px solid gray;width:30px"><input type = "checkbox"></td> -->
	<!-- 		<td align="center"
							style="border-right: 1px solid gray; border-bottom: 2px solid gray; width: 100px"><B>��¥</B></td>
						<td colspan="4" align="center"
							style="border-right: 1px solid gray; border-bottom: 2px solid gray"><B>��ǰ��</B></td>
						<td align="center"
							style="border-right: 1px solid gray; border-bottom: 2px solid gray"><B>��ǰ�ݾ�</B></td>
						<td align="center"
							style="border-right: 1px solid gray; border-bottom: 2px solid gray"><b>����</b></td>
						<td align="center"
							style="border-right: 1px solid gray; border-bottom: 2px solid gray"><B>�հ�</B></td>
						<td align="center" style="border-bottom: 2px solid gray"><B>��
								��</B></td>
					</tr>
					<%for (int i = 1; i < 20; i++) {%>
					<tr align="center">
						<td
							style="border-bottom: 2px solid gray; border-right: 1px solid gray; width: 10px"
							rowspan="2">2015-05-05</td>

						<td style="border-bottom: 2px solid gray;" rowspan="2"
							width="120px"><img src="/images/14.jpg" width="80px"
							height="80px" style="margin-left: -20px"></td>
						<td colspan="3" style="border-right: 1px solid gray;"><font
							size="3"><b>�ø��� �� ����� ���� ũ��</b></font></td>
						<td
							style="border-bottom: 2px solid gray; border-right: 1px solid gray;"
							rowspan="2">19,000��</td>
						<td
							style="border-bottom: 2px solid gray; border-right: 1px solid gray;"
							rowspan="2">20</td>
						<td
							style="border-bottom: 2px solid gray; border-right: 1px solid gray;"
							rowspan="2">380,000 ��</td>
						<td style="border-bottom: 2px solid gray;" rowspan="2">
					</tr>
					<tr>
						<td style="border-bottom: 2px solid gray;" colspan="3"><font
							size="2">1. AŸ��(�η����ĸ� �缾Ʈ ���� ��񿡼��� 01ȣ ���� ������+���������� ���潽
								���̶��̳�+�� �÷� ��ƽ)</font></td>
					</tr>
					<%}%>
					<tr>
						<td style="background-color: #747474"></td>
						<td colspan="8" style="background-color: #747474"><font
							color="white"> <b>�ϰ�:2015-05-05 �� �Ǹűݾ� : 201,504,402��</b>
						</font></td>
					</tr>

				</table>
			</div>
		</div>
	</div>
	 -->
	<div class="container">
		<BR>


		<div class="thumbnail"
			style="width: 1000px; display: table; margin-left: auto; margin-right: auto;">
			<div class="panel panel-default"
				style="width: 900px; height: auto; margin-left: 45px; margin-top: 45px">
				<BR> <BR>
				<p>
					��ȸ�Ⱓ: <input type="text" id="datepicker1"> ~ <input
						type="text" id="datepicker2"> <input type="button"
						value="Ȯ��" />
				</p>

				<P>
				<P>
					<BR>
				<table style="width: 900px; table-layout: fixed">

					<tr align="center"
						style="background-color: #EAEAEA; border-top: 2px solid gray;">
						<!-- <td align = "center" style = "border-right:1px solid gray;border-bottom:2px solid gray;width:30px"><input type = "checkbox"></td> -->
						<td align="center"
							style="border-right: 1px solid gray; border-bottom: 2px solid gray; width: 100px"><B>��¥</B></td>
						<td colspan="4" align="center"
							style="border-right: 1px solid gray; border-bottom: 2px solid gray"><B>��ǰ��</B></td>
						<td align="center"
							style="border-right: 1px solid gray; border-bottom: 2px solid gray"><B>��ǰ�ݾ�</B></td>
						<td align="center"
							style="border-right: 1px solid gray; border-bottom: 2px solid gray"><b>����</b></td>
						<td align="center"
							style="border-right: 1px solid gray; border-bottom: 2px solid gray"><B>�հ�</B></td>
						<td align="center" style="border-bottom: 2px solid gray"><B>��
								��</B></td>
					</tr>
					<%
						for (int i = 1; i < 20; i++) {
					%>
					<tr align="center">
						<td
							style="border-bottom: 2px solid gray; border-right: 1px solid gray; width: 10px"
							rowspan="2">2015-05-05</td>

						<td style="border-bottom: 2px solid gray;" rowspan="2"
							width="120px"><img src="/images/14.jpg" width="80px"
							height="80px" style="margin-left: -20px"></td>
						<td colspan="3" style="border-right: 1px solid gray;"><font
							size="3"><b>�ø��� �� ����� ���� ũ��</b></font></td>
						<td
							style="border-bottom: 2px solid gray; border-right: 1px solid gray;"
							rowspan="2">19,000��</td>
						<td
							style="border-bottom: 2px solid gray; border-right: 1px solid gray;"
							rowspan="2">20</td>
						<td
							style="border-bottom: 2px solid gray; border-right: 1px solid gray;"
							rowspan="2">380,000 ��</td>
						<td style="border-bottom: 2px solid gray;" rowspan="2">
					</tr>
					<tr>
						<td style="border-bottom: 2px solid gray;" colspan="3"><font
							size="2">1. AŸ��(�η����ĸ� �缾Ʈ ���� ��񿡼��� 01ȣ ���� ������+���������� ���潽
								���̶��̳�+�� �÷� ��ƽ)</font></td>
					</tr>
					<%
						}
					%>
					<tr>
						<td style="background-color: #747474"></td>
						<td colspan="8" style="background-color: #747474"><font
							color="white"> <b>�ϰ�:2015-05-05 �� �Ǹűݾ� : 201,504,402��</b>
						</font></td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</body>
