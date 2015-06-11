<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page import="com.hanger.user.vo.UserVo" %>
<%
	String myPageUrl = (String)request.getAttribute("myPageUrl");
	UserVo user = (UserVo)request.getAttribute("user");
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
					&nbsp;&nbsp;&nbsp;<a href="/updateUser.hang"><span class="glyphicon glyphicon-cog"></span></a>
				</div>
			</div>
			<P><P><P><P><P>
			<font><%= user.getUserName() %></font>
		</div>
		<!-- �ȷο� ���� �ۼ� ���� -->
		<div class="thumbnail"
			style="display: table; margin-left: auto; margin-right: auto; width: 95%">
			<div class="menubar" style="width: 100%; height: 40px;">
				<ul class="nav nav-pills"
					style="display: table; margin-left: auto; margin-right: auto"
					align="center">
					<li role="presentation" style="width: 120px; height: 40px;">
						<a href="/myPage.hang">����</a>
					</li>
					<li role="presentation" style="width: 120px; height: 40px">
						<a href="/userTipPage.hang">��</a>
					</li>
					<li role="presentation" style="width: 120px; height: 40px">
						<a href="/userHangOutPage.hang">��ƿ�</a>
					</li>
					<li role="presentation" style="width: 120px; height: 40px">
						<a href="/relationFollowingSearch.hang">�ȷο�</a>
					</li>
					<li role="presentation" style="width: 120px; height: 40px">
						<a href="/userScrapPage.hang">��ũ��</a>
					</li>
					<li role="presentation" style="width: 120px; height: 40px">
						<a href="/userOrderPage.hang">����</a>
					</li>
					<li role="presentation" style="width: 120px; height: 40px">
						<a href="/userMileagePage.hang">���ϸ���</a>
					</li>
					<li role="presentation" style="width: 120px; height: 40px">
						<a href="/userMileagePage.hang">���̻���</a>
					</li>
				</ul>
			</div>
		</div>
		<div id="content" style = "background-color:#EBEBEB">
			<jsp:include page="<%= myPageUrl %>" flush="true" />
		</div>
	</div>
</body>
		<!-- �ȷο� ���� �ۼ� �� -->