<%@ page contentType="text/html; charset=EUC-KR"%>

<div class="container">
	<CENTER>
		<span><h1>ȸ�����</h1></span> <br> <br>

		<center>
			<form class="navbar-form" role="search">
				<div class="form-group">
					<select >
					<option value = "���̵�">���̵�</option>
					<option value = "�̸�">�̸�</option>
					</select>
					<input type="text" class="form-control" placeholder="ȸ���˻�"
						style="width: 300px">

					<button type="submit" class="btn btn-default">�˻�</button>
				</div>
			</form>
		</center>

		<br> <br>
		<TABLE class="table table-hover table-bordered">
			<TR bgcolor="#CFDDFA" align="center">
				<TD width="40"><B>No.</B></TD>
				<TD width="85"><B><A
						href="/managerUserServlet.mo?func=managerUser_001&sort=ID">ID</A></B></TD>
				<TD width="85"><B>Pass</B></TD>
				<TD width="100"><B><A
						href="/managerUserServlet.mo?func=managerUser_001&sort=JUMIN">�ֹι�ȣ</A></B></TD>
				<TD width="70"><B><A
						href="/managerUserServlet.mo?func=managerUser_001&sort=NAME">�̸�</A></B></TD>
				<TD width="80"><B><A
						href="/managerUserServlet.mo?func=managerUser_001&sort=REG_DATE">������</A></B></TD>
				<TD width="70"><B><A
						href="/managerUserServlet.mo?func=managerUser_001&sort=USEYN">��뿩��</A></B></TD>
				<TD width="75"><B><A
						href="/managerUserServlet.mo?func=managerUser_001&sort=ADMINYN">ȸ������</A></B></TD>
				<TD width="100"><B>���</B></TD>
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
		<% for(int i=1; i<5; i++) 
		{
			%>
		
			<TR align="center">
				<TD>i+1</TD>
				<TD><A href="javascript:goDetailInfo('asdf')">id</A></TD>
				<TD>pass</TD>
				<TD>jumin</TD>
				<TD>name</TD>
				<TD>regDate</TD>
				<TD>useKor</TD>
				<TD>userType</TD>
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