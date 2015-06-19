<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page import="com.hanger.user.vo.UserVo" %>
<%
	String myPageUrl = (String)request.getAttribute("myPageUrl");
	UserVo user = (UserVo)request.getAttribute("user");
	String yourUserCode = "";
	if ((String)request.getAttribute("yourUserCode") != null
			&& ((String)request.getAttribute("yourUserCode")).length() > 0) {
		yourUserCode = (String)request.getAttribute("yourUserCode");
	}
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

.circle-inner {
	position: absolute;
	text-align: center;
}

.circle-img {
	width: 120px;
	height: 120px;
	background: url("<%= user.getUserPicPath() %>/<%= user.getUserPicSaveName() %>") no-repeat center;
	background-size: 100%;
	margin-top: 10px;
}

.headtext {
	margin-left: auto;
	margin-right: auto;
	text-align: center;
	font-weight: bolder;
}
</STYLE>

<body>
	<div class="container" style="width: 80%">
		<div class="headtext" style="display: table; margin-left: auto; margin-right: auto;">
			<div class="circle circle-border circle-img">
				<div class="circle-inner">
					<p><br><p><br><p><br><br>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;
<% if(yourUserCode.equals("")){ %>
					<a href="/updateUser.hang"><span class="glyphicon glyphicon-cog"></span></a>
<% } %>
				</div>
			</div>
			<P><P><P><P><P>
			<font><%= user.getUserName() %></font>
		</div>
		<!-- ÆÈ·Î¿ì ¸®ºä ÀÛ¼º ½ÃÀÛ -->
		<div class="thumbnail"
			style="display: table; margin-left: auto; margin-right: auto; width: 95%">
			<div class="menubar" style="width: 100%; height: 40px;">
				<ul class="nav nav-pills"
					style="display: table; margin-left: auto; margin-right: auto"
					align="center">
<% if(yourUserCode.equals("")){ %>
					<li role="presentation" style="width: 120px; height: 40px;">
						<a href="/myPage.hang">¸®ºä</a>
					</li>
					<li role="presentation" style="width: 120px; height: 40px">
						<a href="/userTipPage.hang">ÆÁ</a>
					</li>
					<li role="presentation" style="width: 120px; height: 40px">
						<a href="/userHangOutPage.hang">Çà¾Æ¿ô</a>
					</li>
					<li role="presentation" style="width: 120px; height: 40px">
						<a href="/relationFollowingSearch.hang">ÆÈ·Î¿ì</a>
					</li>
					<li role="presentation" style="width: 120px; height: 40px">
						<a href="/userScrapPage.hang">½ºÅ©·¦</a>
					</li>
					<li role="presentation" style="width: 120px; height: 40px">
						<a href="/userOrderPage.hang">¿À´õ</a>
					</li>
					<li role="presentation" style="width: 120px; height: 40px">
						<a href="/userMileagePage.hang">¸¶ÀÏ¸®Áö</a>
					</li>
					<li role="presentation" style="width: 120px; height: 40px">
						<a href="/userMileagePage.hang">¸¶ÀÌ»ùÇÃ</a>
					</li>
<% } else { %>
					<li role="presentation" style="width: 120px; height: 40px;">
						<a href="/myPage.hang?yourUserCode=<%= yourUserCode %>">¸®ºä</a>
					</li>
					<li role="presentation" style="width: 120px; height: 40px">
						<a href="/userTipPage.hang?yourUserCode=<%= yourUserCode %>">ÆÁ</a>
					</li>
					<li role="presentation" style="width: 120px; height: 40px">
						<a href="/userHangOutPage.hang?yourUserCode=<%= yourUserCode %>">Çà¾Æ¿ô</a>
					</li>
					<li role="presentation" style="width: 120px; height: 40px">
						<a href="/relationFollowingSearch.hang?yourUserCode=<%= yourUserCode %>">ÆÈ·Î¿ì</a>
					</li>
					<li role="presentation" style="width: 120px; height: 40px">
						<a href="/userScrapPage.hang?yourUserCode=<%= yourUserCode %>">½ºÅ©·¦</a>
					</li>
<% } %>
				</ul>
			</div>
		</div>
		<div id="content" style = "background-color:#EBEBEB">
			<jsp:include page="<%= myPageUrl %>" flush="true" />
		</div>
	</div>
</body>
		<!-- ÆÈ·Î¿ì ¸®ºä ÀÛ¼º ³¡ -->