<%@ page contentType="text/html;charset=euc-kr"%>
<%@ page import="java.util.*"%>

<SCRIPT src="/js/jquery-2.1.3.min.js"></SCRIPT>
<SCRIPT src="/js/common/common.js"></SCRIPT>

<%
	String title = (String)request.getAttribute("reviewTitle");
	String content = (String)request.getAttribute("reviewContent");
%>
<html>
	<head>
	</head>
	
	
	<body>
		Review Show<br>
		���� : <br>
		<%=title %><br><br>
		���� : <br>
		<%=content %>
	</body>
</html>