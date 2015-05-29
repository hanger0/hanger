<%@ page contentType="text/html;charset=euc-kr" %>

<META charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- BootStrap 시작 -->
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!-- BootStrap 종료 -->
<!-- JQuery 시작 -->
<script src="/assets/javascripts/jquery-2.1.3.min.js"
   type="text/javascript"></script>
<!-- JQuery 종료 -->
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

