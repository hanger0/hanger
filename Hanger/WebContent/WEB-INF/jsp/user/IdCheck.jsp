<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.util.*" %>

<%
	ArrayList idCheckList = (ArrayList)request.getAttribute("idCheckList");
	String id = (String)request.getAttribute("userId");
	if(idCheckList.size()==0)
	{
%>
			<%= "1^"+id+"^ȸ�� ������ �����մϴ�."%>
<%
	}
	else
	{
%>
			<%= "2^"+id+"^�̹� ȸ���� ID �Դϴ�."%>
<%
	}
%>