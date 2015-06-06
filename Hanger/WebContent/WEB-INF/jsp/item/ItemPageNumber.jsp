<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.util.*"%>

<%
	String itemSort = (String)request.getAttribute("itemSort");
	String cateCode = (String)request.getAttribute("cateCode");
	String keyWord = (String)request.getAttribute("keyWord");
		
	int pageNum = (Integer)request.getAttribute("pageNum");//사용자가 선택한 페이지 번호
	
	int articleTotalNum = (Integer)request.getAttribute("articleTotalNum");
	int articleStartNum = (Integer)request.getAttribute("articleStartNum");
	int articleEndNum = (Integer)request.getAttribute("articleEndNum");
	int pageTotalNum = (Integer)request.getAttribute("pageTotalNum");// 전체 페이지 번호
	int pageStartNum = (Integer)request.getAttribute("pageStartNum");// 시작페이지 번호
	int pageEndNum = (Integer)request.getAttribute("pageEndNum");// 끝페이지 번호	
%>
<SCRIPT>
	$(function(){
		var itemPageForm = $('#itemPageForm');
		var itemPageNum = itemPageForm.find('input:hidden[name=pageNum]');

		// 페이지 글보기
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
			<A pageNumber="1" class="goPageClass" style="cursor:pointer"><FONT color="#7C0722"><B>처음페이지</B></FONT></A>&nbsp;&nbsp;
<%
		}
		else
		{
%>
			<FONT color="gray">처음페이지</FONT>&nbsp;&nbsp;
<%
		}
%>

<%
		if(pageStartNum > 1)
		{
%>
			<A pageNumber="<%= pageStartNum-1%>" class="goPageClass" style="cursor:pointer"><FONT color="#F32957"><B>이전</B></FONT></A>&nbsp;&nbsp;
<%
		}
		else
		{
%>
			<FONT color="gray">이전</FONT>&nbsp;&nbsp;
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
			<A pageNumber="<%= pageEndNum+1%>" class="goPageClass" style="cursor:pointer"><FONT color="#29BA43"><B>다음</B></FONT></A>&nbsp;&nbsp;
<%
		}
		else
		{
%>
			<FONT color="gray">다음</FONT>&nbsp;&nbsp;
<%
		}
%>

<%
		if(pageNum < pageTotalNum)
		{
%>
			<A pageNumber="<%= pageTotalNum%>" class="goPageClass" style="cursor:pointer"><FONT color="#3C6F4A"><B>끝페이지</B></FONT></A>
<%
		}
		else
		{
%>
			<FONT color="gray">끝페이지</FONT>
<%
		}
	}
%>
		</TD>
	</TR>
</TABLE>