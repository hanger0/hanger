<%@ page contentType="text/html; charset=EUC-KR"%>
<%
	String myPageUrl = (String)request.getAttribute("myPageUrl");
%>
<STYLE>
.nav {
	text-align: center;
}

.circle {
	margin-left: auto;
	margin-right: auto;
	border-radius: 50%;
}

.circle-border {
	border: 5px solid white;
	background-color: white;
	width: 120px;
	height: 120px;
}

.circle-solid {
	background-color: whitesmoke;
}

.circle:before {
	content: "";
	display: block;
	padding-top: 100%;
}

.circle-inner {
	position: absolute;
	top: 0;
	left: 0;
	bottom: 0;
	right: 0;
	text-align: center;
}

.circle-img {
	width: 120px;
	height: 120px;
	background: url("images/yebin.jpg") no-repeat center;
	background-size: 100%;
	margin-top: 10px;
}

.score-text {
	margin: 50px;;
	top: 0;
	left: 0;
	bottom: 0;
	right: 0;
	height: 1em;
	line-height: 1em;
	font-size: 1em;
}

.headnav {
	background-color: white;
}

.head-cricle {
	width: 20px;
	height: 20px;
	display: table;
	margin-left: auto;
	margin-right: auto;
	background-color: red;
}

.headtext {
	margin-left: auto;
	margin-right: auto;
	width: 100px;
	height: 125px;
	text-align: center;
	color: black;
	font-weight: bolder;
}
</STYLE>

<body style="background-color: #EBEBEB">
	<div class="container" style="width: 80%">
		<div class="headtext"
			style="display: table; margin-left: auto; margin-right: auto;">
			<div class="circle circle-border circle-img">
				<div class="circle-inner">
					<div class="score-text">
						<BR>
					</div>
					<br><br><br><br><br><br>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;<a href="#"><span
						class="glyphicon glyphicon-cog"></span></a>
				</div>
			</div>
			<P>
			<P>
			<P>
			<P>
			<P>
				<font color="black">¿¹ºóÀÌ</font>
		</div>
		<!-- ÆÈ·Î¿ì ¸®ºä ÀÛ¼º ½ÃÀÛ -->
		<div class="thumbnail"
			style="display: table; margin-left: auto; margin-right: auto; width: 98%">
			<div class="menubar" style="width: 100%; height: 40px;">
				<ul class="nav nav-pills"
					style="display: table; margin-left: auto; margin-right: auto"
					align="center">
					<li role="presentation" class=""
						style="width: 120px; height: 40px;"><a href="MyReview.jsp">¸®ºä</a></li>
					<li role="presentation" class="" style="width: 120px; height: 40px">
						<a href="MyWrite.jsp">ÆÁ</a>
					</li>
					<li role="presentation" class="" style="width: 120px; height: 40px">
						<a href="#">°Ô½Ã¹°</a>
					</li>
					<li role="presentation" class="" style="width: 120px; height: 40px">
						<a href="Flow.jsp">ÆÈ·Î¿ì</a>
					</li>
					<li role="presentation" class="" style="width: 120px; height: 40px">
						<a href="OrderPage.jsp">¸ð´õ</a>
					</li>
					<li role="presentation" class="" style="width: 120px; height: 40px">
						<a href="#">¸¶ÀÏ¸®Áö</a>
					</li>
				</ul>
			</div>
		</div>
		<div id="content">
			<jsp:include page="<%= myPageUrl %>" flush="true" />
		</div>
	</div>
</body>
		<!-- ÆÈ·Î¿ì ¸®ºä ÀÛ¼º ³¡ -->