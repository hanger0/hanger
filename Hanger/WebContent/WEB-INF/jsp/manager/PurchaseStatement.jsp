<%@ page contentType="text/html; charset=EUC-KR"%>

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
<div class="container">
	<CENTER>
		<span><h1>ȸ�� ���ų���</h1></span> <br> <br> <br> <br>
		<p>
			��ȸ�Ⱓ: <input type="text" id="datepicker1"> ~ <input
				type="text" id="datepicker2"> 
			ȸ�����̵�: <input type="text" id=""> <input type="button"
				value="Ȯ��" />
		</p>
		<TABLE class="table table-hover table-bordered">
			<TR bgcolor="#CFDDFA" align="center">
				<TD width="40"><B>No.</B></TD>
				<TD width="150"><B><A
						href="/managerUserServlet.mo?func=managerUser_001&sort=ID">���̵�(�̸�)</A></B></TD>
				<TD width="150"><B><A
						href="/managerUserServlet.mo?func=managerUser_001&sort=JUMIN">��ǰ �̸�</A></B></TD>
				<TD width="100"><B><A
						href="/managerUserServlet.mo?func=managerUser_001&sort=USEYN">���Ź��</A></B></TD>
				<TD width="100"><B><A
						href="/managerUserServlet.mo?func=managerUser_001&sort=USEYN">����</A></B></TD>
				<TD width="100"><B><A
						href="/managerUserServlet.mo?func=managerUser_001&sort=USEYN">���� ���ϸ���</A></B></TD>
			</TR>

			<%
				for (int i = 1; i < 5; i++) {
			%>

			<TR align="center">
				<TD>i+1</TD>
				<TD><A href="javascript:goDetailInfo('asdf')">id + �̸�</A></TD>
				<TD>���ʵ� 3����Ʈ</TD>
				<TD>ī��</TD>
				<TD>39,900 ��</TD>
				<TD>500</TD>
				<%
					}
				%>
			
		</TABLE>

	</CENTER>
</div>