<%@ page contentType="text/html;charset=euc-kr" %>

<META charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<link rel="shortcut icon" type="image/webp" href="/images/unpa-logo.png">
<link rel="stylesheet" media="screen" href="/css/stylesheets/normalize.css">
<link rel="stylesheet" media="screen" href="/css/semantic/semantic.min.css">
<link rel="stylesheet" media="screen" href="/css/bootstrap/bootstrap.css">
<link rel="stylesheet" media="screen" href="/css/ionicons/ionicons.min.css">
<link rel="stylesheet" media="screen" href="/css/stylesheets/animate.css">
<link rel="stylesheet" media="screen" href="/css/fontello/fontello.css">
<link rel="stylesheet" media="screen" href="/css/raty/jquery.raty.css" />
<link rel="stylesheet" media="screen" href="/css/stylesheets/b72b7e9e95b2e0b8be8d51f9b65b96e0-unpa.min.css">
<link rel="stylesheet" type="text/css" href="css/main.css" />

<script src="/js/javascripts/jquery-1.11.3.min.js" type="text/javascript"></script>
<script src="/js/javascripts/modernizr.custom.js" type="text/javascript"></script>
<script src="/js/raty/jquery.raty.js" type="text/javascript"></script>
<script src="/js/semantic/semantic.min.js" type="text/javascript"></script>
<script src="/js/bootstrap/bootstrap.min.js" type="text/javascript"></script>
<script src="/js/javascripts/history.js" type="text/javascript"></script>
<script src="/js/javascripts/jquery.cookie.js" type="text/javascript"></script>
<script src="/js/javascripts/typeahead.bundle.js" type="text/javascript"></script>
<script src="/js/javascripts/main.js" type="text/javascript"></script>

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

