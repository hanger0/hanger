<%@ page contentType="text/html; charset=EUC-KR"%>

<!-- ��¥ �Է� ���� START -->
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
	<div class="container">
		<BR>
		<div class="thumbnail" style="width: 1090px;margin-left:1%">
			<div class="panel panel-default"
				 style="width: 900px; height: auto;border:0;display:table;margin-left:auto;margin-right:auto" align = "center" >
				<BR> <BR>
				<p>
					��ȸ�Ⱓ: <input type="text" id="datepicker1"> ~ <input type="text" id="datepicker2">
					<input type="button" value="Ȯ��" />
				<P>
				<P>
					<BR>
				<table style="width: 900px; table-layout: fixed">
				<tr>
						<td style="background-color: #747474"></td>
						<td colspan="8" style="background-color: #747474"><font
							color="white"> <b>�ϰ�:2015-05-05 �� �Ǹűݾ� : 201,504,402��</b>
						</font></td>
					</tr>

					<tr align="center"
						style="background-color: #EAEAEA; border-top: 2px solid gray;">
						<td align="center"
							style="border-right: 1px solid gray; border-bottom: 2px solid gray; width: 100px"><B>��¥</B></td>
						<td colspan="4" align="center"
							style="border-right: 1px solid gray; border-bottom: 2px solid gray"><B>��ǰ��</B></td>
						<td align="center"
							style="border-right: 1px solid gray; border-bottom: 2px solid gray"><B>�԰�ݾ�</B></td>
						<td align="center"
							style="border-right: 1px solid gray; border-bottom: 2px solid gray"><b>��ǰ�ݾ�</b></td>
						<td align="center"
							style="border-right: 1px solid gray; border-bottom: 2px solid gray"><B>����</B></td>
						<td align="center" style="border-bottom: 2px solid gray"><B>�հ�</B></td>
					</tr>
					<%
						for (int i = 1; i < 20; i++) {
					%>
					<tr align="center" style = "height:30px">
						<td style="border-bottom: 1px solid gray; border-right: 1px solid gray; width: 10px" rowspan="2">
							<font size = "2">2015-05-05</font>
						</td>
						<td rowspan = "2" colspan = "4" style="border-right: 1px solid gray;border-bottom: 1px solid gray;">
							<font size="2"><b>�ø���</b></font>
						</td>
						<td style="border-bottom: 1px solid gray; border-right: 1px solid gray;" rowspan="2"><font size="2">10,000��</font></td>
						<td style="border-bottom: 1px solid gray; border-right: 1px solid gray;" rowspan="2"><font size="2">22,000��</font></td>
						<td style="border-bottom: 1px solid gray; border-right: 1px solid gray;" rowspan="2"><font size="2">20</font></td>
						<td style="border-bottom: 1px solid gray;" rowspan="2"><font size="2">380,000 ��</font></td>
					</tr>
					<tr>
					</tr>
					<%
						}
					%>
				</table>
			</div>
		</div>
	</div>
</body>
