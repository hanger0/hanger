<%@ page contentType="text/html;charset=euc-kr" %>

<%
	String mainUrl = "/common/Progress.jsp";
	if(request.getAttribute("mainUrl") != null && ((String)request.getAttribute("mainUrl")).length() > 0)
	{
		System.out.println("full.jsp: "+mainUrl);
		mainUrl = (String)request.getAttribute("mainUrl");
		System.out.println("full.jsp: "+mainUrl);
	}

	String message = "";
	if(request.getAttribute("message")!=null && ((String)request.getAttribute("message")).length()>0)
	{
		message = (String)request.getAttribute("message");
	}
	if(session.getAttribute("message")!=null && ((String)session.getAttribute("message")).length()>0)
	{
		message = (String)session.getAttribute("message");
		session.setAttribute("message", null);
	}

	if(message.length()>0)
	{
%>
<SCRIPT>window.alert("<%= message%>");</SCRIPT>
<%
	}
%>

<HTML>
	<HEAD>
		<TITLE>ฝฮฐิ ธิดย ธภมýฤํฦ๙ CookPon!</TITLE>
		<Link href="/css/common.css" rel="stylesheet" type="text/css"/>
		<SCRIPT type="text/JavaScript" src="/js/jquery-2.1.3.min.js"></SCRIPT>
	</HEAD>

<BODY bgcolor="#ebebeb">
	<CENTER>
		<DIV id="header">
				<jsp:include page ="/WEB-INF/jsp/common/sellerTop.jsp"/>
		</DIV>
		<DIV style="height:800px; width:1000px; border:1px ">
			<DIV style="500; width:1000px; border:1px ">
				<jsp:include page="<%= mainUrl%>" flush="true"/>
			</DIV>
		</DIV>
		
	</CENTER>
</BODY>
</HTML>