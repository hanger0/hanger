<%@ page contentType="text/html; charset=EUC-KR"%>

<div class="container">
	<CENTER>
		<span><h1>�Խ��Ǹ��</h1></span> <br> <br> <br> <br>
		<TABLE class="table table-hover table-bordered">
			<TR bgcolor="#CFDDFA" align="center">
				<TD width="40"><B>No.</B></TD>
				<TD width="150"><B><A
						href="/managerUserServlet.mo?func=managerUser_001&sort=ID">�Խ����̸�</A></B></TD>
				<TD width="60"><B><A
						href="/managerUserServlet.mo?func=managerUser_001&sort=JUMIN">�Խ���
							��� ����</A></B></TD>
				<TD width="100"><B><A
						href="/managerUserServlet.mo?func=managerUser_001&sort=USEYN">��뿩��</A></B></TD>
			</TR>

			<!--  	for(int i=0; i<userList.size(); i++)
    	{
		Hashtable userTable = (Hashtable)userList.get(i);
		String id = (String)userTable.get("ID");
		String pass = (String)userTable.get("PASS");
		String name = (String)userTable.get("NAME");
		String jumin = (String)userTable.get("JUMIN");
		String regDate = (String)userTable.get("REG_DATE");
		String useYn = (String)userTable.get("USEYN");
		String adminYn = (String)userTable.get("ADMINYN");

		String bgcolor = "#FFFFFF";
		String useKor = "�����";
		if(useYn.equals("N"))
		{
			bgcolor = "#E0E0E0";
			useKor = "����";
		}

		String userType = "�Ϲ�ȸ��";
		if(adminYn.equals("Y"))
		{
			bgcolor = "#C9E7F8";
			userType = "������";
		} 
-->
			<%
				for (int i = 1; i < 5; i++) {
			%>

			<TR align="center">
				<TD>i+1</TD>
				<TD><A href="javascript:goDetailInfo('asdf')">id</A></TD>
				<TD><SELECT>
						<option value="�մ�">�մ�</option>
						<option value="��ȸ��">��ȸ��</option>
						<option value="��ȸ��">��ȸ��</option>
				</SELECT></TD>

				<TD>����,����</TD>
				<%
					}
				%>
				<!-- 
			<TD>
				<IMG src="/images/button/sbut_update.gif" class="userUpdateClass" align="absmiddle" border="0" style="cursor:pointer" alt="">

				<IMG src="/images/button/sbut_delete.gif" class="useYnClass" align="absmiddle" border="0" style="cursor:pointer" alt="" title="N">

				<IMG src="/images/button/sbut_use.gif" class="useYnClass" align="absmiddle" border="0" style="cursor:pointer" alt="" title="Y">
		</TD>
		</TR>
 -->
		</TABLE>

	</CENTER>
</div>