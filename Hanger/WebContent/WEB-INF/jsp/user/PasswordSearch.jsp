<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%
		String userPwd = "";
		if(request.getAttribute("userPwd")!=null && ((String)request.getAttribute("userPwd")).length()>0)
		{
			userPwd = (String)request.getAttribute("userPwd");
		}
		String message = "";
		if(request.getAttribute("message")!=null && ((String)request.getAttribute("message")).length()>0)
		{
			message = (String)request.getAttribute("message");
		}
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>PasswordSearch</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style type="text/css">
body {
	background: url(assets/images/LoginBg.jpg);
	background-color: #576767;
}

.form-group {
	width: 300px;
}

.login {
	margin-top: 170px;
	width: 400px;
	height: 300px;
	background-color: #f7f7f7;
}
</style>

</head>
<%
	if(message.length()>0) {
%>
		<SCRIPT>window.alert("<%= message%>");</SCRIPT>
<%
	}
%>
<script>
	function find() {
		var f = document.a;

		//ID확인
		if (f.userId.value == "") {
			window.alert("ID를 입력하세요.");
			f.userId.focus();
			return false ;
		}
		if(f.userId.length < 4 || f.userId.length > 20) {
			window.alert("ID는 4자 이상 20자 이하입니다.");
			f.userId.select();
			return false ;
		}
	}
</script>
<body>
	<div class="main">
		<CENTER>
<%
	if(userPwd.equals("")){
%>
			<div class="login">
				<div class="col-md-12">
					<h1>Login</h1>
				</div>
				<form id="a" name="a" action="/findPassword.hang" method="POST">
					<div class="form-group">
						<label for="login-username"><i class="icon-user"></i> <b>Email : </b></label>
							<input class="form-control" id="login-username" name="myUserId" type="text" placeholder="">
							
						<label for="login-password"><i class="icon-lock"></i> <b>Question : </b></label> 
							<input class="form-control" id="login-password" name="userQusetion" type="text" placeholder="">
							
						<label for="login-password"><i class="icon-lock"></i> <b>Answer : </b></label> 
							<input class="form-control" id="login-password" name="userAnswer" type="password" placeholder="">
						
						<button type="submit" class="btn pull-right"  style = "margin-top:3%" onClick="find()">Find</button>
					</div>
				</form>
				<div class="clearfix"></div>
			</div>
<%
	} else {
%>
		<label for="login-username"><b>페스워드는 <%= userPwd %> 입니다.</b></label>
<%
	}
%>
		</CENTER>
	</div>
</body>
</html>