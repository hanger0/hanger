<%@ page contentType="text/html; charset=EUC-KR"%>
<body>
	<CENTER>
	 <br>
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
		<TABLE class="table table-hover table-bordered" style = "background-color:white;width:1100px">
			<TR bgcolor="#CFDDFA" align="center">
				<TD><B>No.</B></TD>
				<TD><B>ID</A></B></TD>
				<TD><B>Pass</B></TD>
				<TD><B>�̸�</A></B></TD>
				<TD><B>������</A></B></TD>
				<TD><B>��뿩��</A></B></TD>
				<TD><B>ȸ������</A></B></TD>
				<TD><B>���</B></TD>
			</TR>

		<% for(int i=0; i<5; i++) 
		{
			%>
		
			<TR align="center">
				<TD><%= i+1 %></TD>
				<TD><A href="/managerUserInfo.hang?userCode=">id</A></TD>
				<TD>pass</TD>
				<TD><A href="/managerUserServlet.mo?func=managerUser_001&sort=NAME">name</A></TD>
				<TD><A href="/managerUserServlet.mo?func=managerUser_001&sort=REG_DATE">regDate</A></TD>
				<TD><A href="/managerUserServlet.mo?func=managerUser_001&sort=USEYN">useKor</A></TD>
				<TD>userType</TD>
				<TD><input type = "button" value = "����">&nbsp;&nbsp;&nbsp;<input type = "button" value = "����"></TD>
		<%
		}
		 %>
		</TABLE>
	</CENTER>
</body>