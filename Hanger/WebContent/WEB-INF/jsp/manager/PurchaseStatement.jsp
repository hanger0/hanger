<%@ page contentType="text/html; charset=EUC-KR"%>

<body>
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
	<CENTER>
	<br>
			��ȸ�Ⱓ: <input type="text" id="datepicker1"> ~ <input type="text" id="datepicker2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			ȸ�����̵�: <input type="text" id=""> <input type="button" value="Ȯ��" />
	<br><Br><br>
		<TABLE class="table table-hover table-bordered" style = "background-color:white;width:1100px;">
			<TR bgcolor="#CFDDFA" align="center">
				<TD width="40"><B>No.</B></TD>
				<TD width="150"><B>���̵�(�̸�)</B></TD>
				<TD width="150"><B>��ǰ �̸�</A></B></TD>
				<TD width="100"><B>���Ź��</A></B></TD>
				<TD width="100"><B>����</A></B></TD>
				<TD width="100"><B>���� ���ϸ���</A></B></TD>
			</TR>

			<%
				for (int i = 0; i < 8; i++) {
			%>

			<TR align="center">
				<TD><%= i+1 %></TD>
				<TD>id + �̸�</TD>
				<TD>���ʵ� 3����Ʈ</TD>
				<TD>ī��</TD>
				<TD>39,900 ��</TD>
				<TD>500</TD>
				<%
					}
				%>
		</TABLE>
	</CENTER>
</body>