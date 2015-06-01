<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.util.*" %>

<%
	ArrayList idCheckList = (ArrayList)request.getAttribute("idCheckList");
	String id = (String)request.getAttribute("userId");
	if(idCheckList.size()==0)
	{
%>
			<%= "1^"+id+"^회원 가입이 가능합니다."%>
<%
	}
	else
	{
%>
			<%= "2^"+id+"^이미 회원인 ID 입니다."%>
<%
	}
%>