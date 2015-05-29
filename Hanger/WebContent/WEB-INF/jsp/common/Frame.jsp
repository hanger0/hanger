<%@ page contentType="text/html;charset=euc-kr" %>

<META charset="utf-8" />
<LINK rel="stylesheet" type="text/css" href="css/main.css" />
<SCRIPT src="js/jquery-2.1.3.min.js"></SCRIPT>

<HTML>
	<HEAD>
		<TITLE>hanger</TITLE>
	</HEAD>
	
	<BODY style="margin:0px">
	<center>
		<div id="wrap">
			<div id="header"> 
				<jsp:include page ="Top.jsp"/>
			</div>
			<div id="nav"> 
				<jsp:include page ="Nav.jsp"/>	
			</div>
			<div id="middle"> 
				<div id="content">
					<jsp:include page="Main.jsp" flush="true" />
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
	</center>	
	</BODY>

<HTML>

