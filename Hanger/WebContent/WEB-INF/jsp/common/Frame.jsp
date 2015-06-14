<%@ page contentType="text/html;charset=euc-kr" %>

<%
	String mainUrl = (String)request.getAttribute("mainUrl");
	String message = "";
	if(request.getAttribute("message")!=null && ((String)request.getAttribute("message")).length()>0)
	{
		message = (String)request.getAttribute("message");
	}
%>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="/js/jquery-2.1.3.min.js" type="text/javascript"></script>
<script src="/js/common/common.js" type="text/javascript"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!-- JQuery 종료 -->

<%
	if(message.length()>0) {
%>
		<SCRIPT>window.alert("<%= message%>");</SCRIPT>
<%
	}
%>

	<BODY style="margin:0px;background-color:#EBEBEB;">
		<div id="wrap">
			<div id="header"> 
				<jsp:include page ="Top.jsp"/>
			</div>
			<div id="middle" style="background-color: #EBEBEB">
				<!-- 띄어쓰기 -->
				<p><br><p><br>
				<p><br>
				<div id="content">
					<jsp:include page="<%= mainUrl %>" flush="true" />
				</div>
				<!--
				<div id="sidebar"> 
					<jsp:include page="Right.jsp"/>
				</div>
				-->
			</div>
			<div id="footer"> 
				<jsp:include page ="Bottom.jsp"/>
			</div>
		</div>
	</BODY>
<HTML>
