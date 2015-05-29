<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.util.*" %>
<%@ page import="com.hanger.user.vo.ZipCode" %>

<%
	String qt = (String)request.getAttribute("qt");
	ArrayList zipCodeList = (ArrayList)request.getAttribute("zipCodeList");

	if(qt==null || qt.equals("null"))
	{
		qt = "";
	}
%>
<SCRIPT type="text/JavaScript" src="/js/common/common.js"></SCRIPT>
<SCRIPT>
	function zipCodeSelectAction(code1, code2, addr)
	{
		opener.joinForm.zipCode1.value = code1;
		opener.joinForm.zipCode2.value = code2;
		opener.joinForm.addr1.value = addr;
		opener.joinForm.addr2.select();

		window.self.close();
	}

	// �����ȣ �˻�
	function zipCodeSearchAction()
	{
		var f = document.zipCodeSearchForm;

		// id�� üũ
		if(trim(f.qt.value)=="")
		{
			window.alert("�˻�� �Է��ϼ���.");
			f.qt.select();
			return false;
		}
		f.qt.value = trim(f.qt.value);

		f.submit();
	}
</SCRIPT>

<TABLE cellspacing="0" cellpadding="0">
	<TR><TD height="10"></TD></TR>
</TABLE>
<TABLE width="380">
	<TR>
		<TD align="center">
			<TABLE width="200" cellspacing="1" cellpadding="5" bgcolor="#7682EB">
				<TR><TD bgcolor="#F2FBFD" align="center"><B><FONT size="2">�����ȣ �˻�</FONT></B></TD></TR>
			</TABLE>
		</TD>
	</TR>
	<TR><TD height="10"></TD></TR>
	<FORM name="zipCodeSearchForm" action="/zipCodeSearch.hang" method="post" onSubmit="return false;">
		<INPUT type="hidden" name="func" value="common_002">
		<TR>
			<TD align="center">
				<INPUT type="text" size="20" name="qt" value="<%= qt%>" onkeydown="if(event.keyCode == 13){zipCodeSearchAction();}">
				<INPUT type="button" value="�˻�" onclick="zipCodeSearchAction();" style="cursor:pointer">
			</TD>
		</TR>
	</FORM>
	<TR>
		<TD align="center">
			<TABLE width="360" cellspacing="1" cellpadding="3" bgcolor="#7682EB">
				<TR>
					<TD width="70" align="center" bgcolor="#F2FBFD"><B>�����ȣ</B></TD>
					<TD width="290" align="center" bgcolor="#F2FBFD"><B>�ּ�</B></TD>
				</TR>
<%
	if(zipCodeList != null)
	{
		if(zipCodeList.size()>0)
		{
			for(int i=0; i<zipCodeList.size(); i++)
			{
				ZipCode zipCode = (ZipCode)zipCodeList.get(i);
				String code = (String)zipCode.getCode();
				String code1 = code.substring(0, 3);
				String code2 = code.substring(4, 7);
				String addr = (String)zipCode.getAddr();
%>
				<TR>
					<TD width="70" align="center" bgcolor="#FFFFFF"><%= code%></TD>
					<TD width="290" bgcolor="#FFFFFF">
						<A HREF="javascript:zipCodeSelectAction('<%= code1%>', '<%= code2%>', '<%= addr%>')"><%= addr%></A>
					</TD>
				</TR>
<%
			}
		}
		else
		{
%>
				<TR><TD align="center" bgcolor="#FFFFFF" colspan="2">�ش� �ּҰ� �������� �ʽ��ϴ�.</TD></TR>
<%
		}
	}
	else
	{
%>
				<TR><TD align="center" bgcolor="#FFFFFF" colspan="2">�˻��� ������ �Է��ϼ���.</TD></TR>
<%
	}
%>
			</TABLE>
		</TD>
	</TR>
	<TR><TD height="5"></TD></TR>
	<TR>
		<TD align="center">
			<INPUT type="button" value="�ݱ�" onclick="window.self.close();" style="cursor:pointer">
		</TD>
	</TR>
</TABLE>