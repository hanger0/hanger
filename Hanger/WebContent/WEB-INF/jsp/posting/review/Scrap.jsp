<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.util.*" %>

<%
	ArrayList scrapList = (ArrayList)request.getAttribute("scrapList");
%>
		<%=scrapList.size() %>
