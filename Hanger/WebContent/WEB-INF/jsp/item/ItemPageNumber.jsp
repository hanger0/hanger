<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.util.*"%>

<%
	String itemSort = (String)request.getAttribute("itemSort");
	String cateCode = (String)request.getAttribute("cateCode");
	String keyWord = (String)request.getAttribute("keyWord");
		
	int pageNum = (Integer)request.getAttribute("pageNum");//����ڰ� ������ ������ ��ȣ
	
	int articleTotalNum = (Integer)request.getAttribute("articleTotalNum");
	int articleStartNum = (Integer)request.getAttribute("articleStartNum");
	int articleEndNum = (Integer)request.getAttribute("articleEndNum");
	int pageTotalNum = (Integer)request.getAttribute("pageTotalNum");// ��ü ������ ��ȣ
	int pageStartNum = (Integer)request.getAttribute("pageStartNum");// ���������� ��ȣ
	int pageEndNum = (Integer)request.getAttribute("pageEndNum");// �������� ��ȣ	
%>
<SCRIPT>
	$(function(){
		var itemPageForm = $('#itemPageForm');
		var itemPageNum = itemPageForm.find('input:hidden[name=pageNum]');

		// ������ �ۺ���
		$('.goPageClass').click(function(){
			var clickPage = $(this);
			itemPageNum.val(clickPage.attr('pageNumber'));
			itemPageForm.submit();
		});
	});
</SCRIPT>

<FORM name="goPageForm" id="itemPageForm" method="get" action="/itemSearch.hang">
	<INPUT type="hidden" name="pageNum">
	<INPUT type="hidden" name="cateCode" value="<%= cateCode%>">
	<INPUT type="hidden" name="itemSort" value="<%= itemSort%>">
	<INPUT type="hidden" name="keyWord" value="<%= keyWord%>">
</FORM>

<TABLE width="750" cellspacing="0" cellpadding="0" border="0">
	<TR valign="top">
		<TD align="center" width="750">
<%
	if(articleTotalNum>0)
	{
		if(pageNum > 1)
		{
%>
			<A pageNumber="1" class="goPageClass" style="cursor:pointer"><FONT color="#7C0722"><B>ó��������</B></FONT></A>&nbsp;&nbsp;
<%
		}
		else
		{
%>
			<FONT color="gray">ó��������</FONT>&nbsp;&nbsp;
<%
		}
%>

<%
		if(pageStartNum > 1)
		{
%>
			<A pageNumber="<%= pageStartNum-1%>" class="goPageClass" style="cursor:pointer"><FONT color="#F32957"><B>����</B></FONT></A>&nbsp;&nbsp;
<%
		}
		else
		{
%>
			<FONT color="gray">����</FONT>&nbsp;&nbsp;
<%
		}
%>

<%
		for(int i=pageStartNum; i<=pageEndNum; i++)
		{
			if(i==pageNum)
			{
%>
			<B><FONT color="blue"><%= i%></FONT></B>&nbsp;&nbsp;
<%
			}
			else
			{
%>
			<A pageNumber="<%= i%>" class="goPageClass" style="cursor:pointer"><%= i%></A>&nbsp;&nbsp;
<%
			}
		}
%>

<%
		if(pageTotalNum > pageEndNum)
		{
%>
			<A pageNumber="<%= pageEndNum+1%>" class="goPageClass" style="cursor:pointer"><FONT color="#29BA43"><B>����</B></FONT></A>&nbsp;&nbsp;
<%
		}
		else
		{
%>
			<FONT color="gray">����</FONT>&nbsp;&nbsp;
<%
		}
%>

<%
		if(pageNum < pageTotalNum)
		{
%>
			<A pageNumber="<%= pageTotalNum%>" class="goPageClass" style="cursor:pointer"><FONT color="#3C6F4A"><B>��������</B></FONT></A>
<%
		}
		else
		{
%>
			<FONT color="gray">��������</FONT>
<%
		}
	}
%>
		</TD>
	</TR>
</TABLE>