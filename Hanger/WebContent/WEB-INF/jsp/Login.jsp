<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page language="java" %>

<HTML>
	<HEAD>
		<TITLE>Login</TITLE>
<%
	if(request.getAttribute("message") != null)
	{
%>
		<SCRIPT language="JavaScript">window.alert("<%= request.getAttribute("message")%>");</SCRIPT>
<%
	}
%>
		<SCRIPT language="JavaScript">
				function loginAction()
				{
					var f = document.form;
					if(f.id.value == "")
					{
						window.alert("ID�� �ݵ�� �Է��ؾ� �մϴ�.");
						f.id.focus();
						return false;
					}
					if(f.id.value.length < 4 || f.id.value.length > 20)
					{
						window.alert("ID�� 4�� �̻� 20�� ���� �Դϴ�.");
						f.id.select();
						return false;
					}

					if(f.pass.value == "")
					{
						window.alert("��й�ȣ�� �ݵ�� �Է��ؾ� �մϴ�.");
						f.pass.focus();
						return false;
					}
					if(f.pass.value.length < 4 || f.pass.value.length > 20)
					{
						window.alert("��й�ȣ�� 4�� �̻� 20�� ���� �Դϴ�.");
						f.pass.select();
						return false;
					}

					f.submit();
				}

				function logoutAction()
				{
					location.href="logout.do";
				}
		</SCRIPT>
	</HEAD>

	<BODY>
		<CENTER>
			<FONT size="4" color="blue"><B>Login Html</B></FONT><BR>
			<HR>
<%
	if(session.getAttribute("LoginYn") != null && ((String)session.getAttribute("LoginYn")).length()>0 && ((String)session.getAttribute("LoginYn")).equals("Y"))
	{
		String id = (String)session.getAttribute("ID");
%>
			<TABLE border=0>
				<TR>
					<TD>
						�ݰ����ϴ�. <%= id%> ��!
						<BR>
						�����Ϸ� �Ǽ���~~!
					</TD>
				</TR>
					<TR>
						<TD align="center">
							<INPUT type="button" value="Logout" onclick="logoutAction();" style="cursor:hand">
						</TD>
					</TR>
			</TABLE>
<%
	}
	else
	{
%>
			<TABLE border=0>
				<FORM name="form" action="login.do" method="post">
					<TR><TD>User ID : </td><td><input type="text" name="id"></TD></TR>
					<TR>
						<TD>User Password : </TD>
						<TD><INPUT type="password" name="pass"></TD>
					</TR>
					<TR>
						<TD colspan="2" align="center">
							<INPUT type="button" value="Submit" onclick="loginAction();">
							<INPUT type="reset" value="Reset" >
						</TD>
					</TR>
				</FORM>
			</TABLE>
<%
	}
%>
			<HR>
		</CENTER>
	</BODY>
</HTML>