<%@ page contentType="text/html; charset=euc-kr"%>
<%@ page import="java.util.*" %>
<%@ page import="com.hanger.user.vo.UserVo" %>

<%
	ArrayList userList = (ArrayList)request.getAttribute("userList");
%>
<HTML>
	<HEAD>
		<TITLE>hanger</TITLE>
		<META http-equiv="Content-Type" content="text/html; charset=euc-kr">
	</HEAD>
		<BODY>
<%
	for(int i = 0; i < userList.size(); i++){
		UserVo user = (UserVo)userList.get(i);
%>
		<%= user.getUserName() %><BR>
		<%= user.getUserPhone() %><BR>
		<%= user.getUserPicSaveName() %>
	<Form action="/relationInsert.hang" method="post">
		<input type="hidden" name="userCode" value="<%= user.getUserCode() %>" />
		<input type="submit" />
	</Form>
<%
	}
%>
		</BODY>
</HTML>