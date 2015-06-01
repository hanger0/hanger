<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String message = "";
	if(request.getAttribute("message")!=null && ((String)request.getAttribute("message")).length()>0)
	{
		message = (String)request.getAttribute("message");
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Login</title>
<link rel="stylesheet" media="screen" href="/assets/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style type="text/css">
body
{
	
	background:url(assets/images/LoginBg.jpg);
	background-color:#576767;
}
.form-group
{
	width:300px;
}
.login
{
	margin-top:170px;
	width:400px;
	height:300px;
	background-color:#f7f7f7;
}
</style>
<%
	if(message.length()>0) {
%>
		<SCRIPT>window.alert("<%= message%>");</SCRIPT>
<%
	}
%>
</head>
<body>
<div class="main">
<CENTER>
	<div class="login">
		<div class="col-md-12">
			<h1>Login</h1>
		</div>
		<form role="form" action="/login.hang" method="POST">
			<div class="form-group">
		        <label for="login-username"><i class="icon-user"></i> <b>Email</b></label>
				<input class="form-control" id="login-username" name="userId" type="text" placeholder="">				
		        <label for="login-password"><i class="icon-lock"></i> <b>Password</b></label>
				<input class="form-control" id="login-password" name="userPass" type="password" placeholder="">
				
				<a href="#" class="forgot-password">Forgot password?</a>
				<div class="not-member">
					<p>Not a member? <a href="/join.hang">Register here</a></p>
				</div>
				<button type="submit" class="btn pull-right">Login</button>
				</form>
				<div class="clearfix"></div>
			</div>
		</FORM>			
	</div>
</CENTER>
</div>
</body>
</html>