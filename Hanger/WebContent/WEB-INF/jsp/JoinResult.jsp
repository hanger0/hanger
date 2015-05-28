<%@ page contentType="text/html;charset=euc-kr" %>

<%
String name = (String)request.getAttribute("name");
String userId = (String)request.getAttribute("userId");
%>

<!DOCTYPE html>
<HTML>
	<HEAD>
		<TITLE></TITLE>
		<META charset = "ecu-kr">
	</HEAD>
		<H2>E-mail : <%= name%></H2>
		<H2>¿Ã∏ß : <%= userId%></H2>
	<BODY>
		<CENTER>
			<H2></H2>
		</CENTER>
	</BODY>
</HTML>