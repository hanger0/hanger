<%@ page contentType="text/html; charset=EUC-KR"%>
<%
	String myName = "";
	if (session != null && session.getAttribute("loginYn") != null
			&& ((String) session.getAttribute("loginYn")).equals("Y")) {
		myName = (String) session.getAttribute("myUserName");
	}
%>
<script type="text/javascript">
	$(document).ready(function($) {

		$('#mega-menu-3').dcMegaMenu({
			rowItems : '7',
			speed : 'fast',
			effect : 'fade'
		});
		$('#mega-menu-9').dcMegaMenu({
			rowItems : '3',
			speed : 'fast',
			effect : 'fade'
		});
	});
</script>

<link href="css/skins/grey.css" rel="stylesheet" type="text/css" />
<link href="css/skins/white.css" rel="stylesheet" type="text/css" />
<script type='text/javascript' src='js/jquery.dcmegamenu.1.2.js'></script>
<script type='text/javascript' src='js/jquery.hoverIntent.minified.js'></script>

<style>
.headli {
	width: 50px;
	height: 40px;
}
.shadow {
	padding: 12px 38px 12px 25px;
	text-shadow: 1px 1px 1px #000;
	text-decoration: none;
	background: url(images/bg_grey.png);
}
</style>

<header id="header">
	<!--�⺻���������� �̰ź���-->
	<div style="width: 100%;"
		class="hidden-xs navbar navbar-default navbar-fixed-top navbar HOME"
		role="navigation">
		<div class="navbar-header" style="margin-left: 160px">
			<a class="navbar-brand" href="/"> <img
				style="height: 32px; padding: 3px 0;"
				src="/images/juven.png" id="brand-icon" alt="Hanger" />
			</a>
		</div>
		<form class="navbar-form navbar-left" role="search" method="get"
			action="/itemSearch.hang">
			<div class="form-group" style="margin-left: 65%; width: 100%">
				<input type="text" name="keyWord" class="form-control"
					placeholder="Search" style="width: 300px">
				<button type="submit" class="btn btn-default">�˻�</button>
			</div>
		</form>
		<div class="collapse navbar-collapse">
			<ul class="nav navbar-nav navbar-right unpa-navbar-right"
				style="margin-right: 6%">
				<li></li>
				<%
					if (session != null && session.getAttribute("loginYn") != null
							&& ((String) session.getAttribute("loginYn")).equals("Y")
							&& session.getAttribute("adminYn") != null
							&& ((String) session.getAttribute("adminYn")).equals("N")) {
				%>
				<li class="headli"><a href="/myPage.hang"><img
						src="images/icons/top/mypage.jpg" /></a></li>
				<li class="headli"><a href="#"><img
						src="images/icons/top/friend.jpg" /></a></li>
				<li class="headli"><a href="/cart.hang"><img
						src="images/icons/top/cart.jpg" /></a></li>
				<li class="headli"><a href="#"><img
						src="images/icons/top/ball.jpg" /></a></li>
				<li class="headli"><a href="/logout.hang"><img
						src="images/icons/top/option.jpg" /></a></li>
				<%
					} else if (session.getAttribute("adminYn") != null
							&& ((String) session.getAttribute("adminYn")).equals("Y")) {
				%>
				<li class="headli"><a href="/goManagerMainPage.hang"><img
						src="images/icons/top/mypage.jpg" /></a></li>
				<li class="headli"><a href="/logout.hang"><img
						src="images/icons/top/option.jpg" /></a></li>
				<%
					} else {
				%>
				<li><a href="/login.hang" class="remove-border">�α���</a></li>
				<li><a href="/join.hang" class="remove-border"
					style="margin-right: 165px">ȸ������</a></li>
				<%
					}
				%>
			</ul>
		</div>
	</div>
	<div
		class="hidden-xs navbar navbar-default navbar-fixed-top unpa-navbar HOME"
		style="width: 100%; position: fixed; z-index: 1000; height: 50px">
		<!-- ���� -->
		<p>
			<br>
		<p>
			<br>
		<p>
		<div class="demo-container"
			style="margin-top: -1%; float: left; width: 50%">
			<div class="grey">
				<ul id="mega-menu-3" class="mega-menu">
					<li class="shadow" style="margin-left: 23%"><A>&nbsp;</A></li>
					<li><a href="ItemList.jsp">SHOP</a>
						<ul>
							<li style="margin-left: 10%"><a href="#"><font size="4"><b>����ũ��</b></font></a>
								<ul style="background-color: white">
									<p>
										<br>
									<li><a href="#"><font size="2"><b>���̽� ����ũ��</b></font></a></li>
								</ul>
								<ul>
									<br>
									<li><a href="#"><font size="2"><b>���� ����ũ��</b></font></a>
								</ul>
								<ul>
									<br>
									<li><a href="#"><font size="2"><b>�� ����ũ��</b></font></a>
								</ul>
							<li><a href="#"><font size="4"><b>��Ų�ɾ�</b></font></a>
								<ul>
									<p>
										<br>
									<li><a href="#"><font size="2"><b>Ŭ��¡</b></font></a></li>
								</ul>
								<ul>
									<br>
									<li><a href="#"><font size="2"><b> ���̽���</b></font></a></li>
								</ul>
								<ul>
									<br>
									<li><a href="#"><font size="2"><b> �� & ��ġ</b></font></a></li>
								</ul>
								<ul>
									<br>
									<li><a href="#"><font size="2"><b> �� �ɾ�</b></font></a></li>
								</ul></li>
							<li><a href="#"><font size="4"><b>��� & �ٵ�</b></font></a>
								<ul>
									<br>
									<li><a href="#"><font size="2"><b> ���</b></font></a></li>
								</ul>
								<ul>
									<br>
									<li><a href="#"><font size="2"><b> �ٵ�</b></font></a></li>
								</ul>
								<ul>
									<br>
									<li><a href="#"><font size="2"><b> �ڵ� & ǲ</b></font></a></li>
								</ul>
								<ul>
									<br>
									<li><a href="#"><font size="2"><b> ���̾�Ʈ</b></font></a></li>
								</ul>
								<ul>
									<br>
									<li><a href="#"><font size="2"><b> ��Ȱ��Ƽ</b></font></a></li>
								</ul>
							<li><a href="#"><font size="4"><b>���</b></font></a>
								<ul>
									<br>
									<li><a href="#"><font size="2"><b> �������</b></font></a></li>
								</ul>
								<ul>
									<br>
									<li><a href="#"><font size="2"><b> �������</b></font></a></li>
								</ul>
								<ul>
									<br>
									<li><a href="#"><font size="2"><b> ĵ�� & ��ǻ��</b></font></a></li>
								</ul>
							<li><a href="#"><font size="4"><b>���� & ���</b></font></a>
								<ul>
									<br>
									<li><a href="#"><font size="2"><b> ��Ƽ���</b></font></a></li>
								</ul>
								<ul>
									<br>
									<li><a href="#"><font size="2"><b> �ٵ���</b></font></a></li>
								</ul>
								<ul>
									<br>
									<li><a href="#"><font size="2"><b> ����</b></font></a></li>
								</ul>
						</ul></li>
					<li><a href="/brand.hang">BRAND</a>
						<ul>
							<li style="margin-left: 10%"><a href="#"><font size="4"><b>���ĺ�
											��</b></font></a>
								<ul style="background-color: white">
									<p>
										<br>
									<li><a href="#"><font size="2"><b>A</b></font></a></li>
								</ul>
								<ul>
									<br>
									<li><a href="#"><font size="2"><b>B</b></font></a>
								</ul>
								<ul>
									<br>
									<li><a href="#"><font size="2"><b>C</b></font></a>
								</ul>
								<ul>
									<br>
									<li><a href="#"><font size="2"><b>D</b></font></a>
								</ul>
								<ul>
									<br>
									<li><a href="#"><font size="2"><b>E</b></font></a>
								</ul>
								<ul>
									<br>
									<li><a href="#"><font size="2"><b>F</b></font></a>
								</ul>
								<ul>
									<br>
									<li><a href="#"><font size="2"><b>G</b></font></a>
								</ul>
							<li style="margin-top: 20px">
								<ul>
									<p>
										<br>
									<li><a href="#"><font size="2"><b>H</b></font></a></li>
								</ul>
								<ul>
									<br>
									<li><a href="#"><font size="2"><b>I</b></font></a></li>
								</ul>
								<ul>
									<br>
									<li><a href="#"><font size="2"><b>J</b></font></a></li>
								</ul>
								<ul>
									<br>
									<li><a href="#"><font size="2"><b>K</b></font></a></li>
								</ul>
								<ul>
									<br>
									<li><a href="#"><font size="2"><b>L</b></font></a>
								</ul>
								<ul>
									<br>
									<li><a href="#"><font size="2"><b>M</b></font></a>
								</ul>
								<ul>
									<br>
									<li><a href="#"><font size="2"><b>N</b></font></a>
								</ul>
							</li>
							<li style="margin-top: 20px">
								<ul>
									<br>
									<li><a href="#"><font size="2"><b>O</b></font></a></li>
								</ul>
								<ul>
									<br>
									<li><a href="#"><font size="2"><b>P</b></font></a></li>
								</ul>
								<ul>
									<br>
									<li><a href="#"><font size="2"><b>Q</b></font></a></li>
								</ul>
								<ul>
									<br>
									<li><a href="#"><font size="2"><b>R</b></font></a></li>
								</ul>
								<ul>
									<br>
									<li><a href="#"><font size="2"><b>S</b></font></a></li>
								</ul>
								<ul>
									<br>
									<li><a href="#"><font size="2"><b>T</b></font></a>
								</ul>
								<ul>
									<br>
									<li><a href="#"><font size="2"><b>U</b></font></a>
								</ul>
							<li style="margin-top: 20px">
								<ul>
									<br>
									<li><a href="#"><font size="2"><b>V</b></font></a></li>
								</ul>
								<ul>
									<br>
									<li><a href="#"><font size="2"><b>W</b></font></a></li>
								</ul>
								<ul>
									<br>
									<li><a href="#"><font size="2"><b>X</b></font></a></li>
								</ul>
								<ul>
									<br>
									<li><a href="#"><font size="2"><b>Y</b></font></a>
								</ul>
								<ul>
									<br>
									<li><a href="#"><font size="2"><b>Z</b></font></a>
								</ul>
						</ul></li>
					<li><a href="/sale.hang">SALE</a></li>
				</ul>
			</div>
		</div>
		<div class="demo-container"
			style="margin-top: -1%; float: right; width: 50%">
			<div class="white">
				<ul id="mega-menu-3" class="mega-menu">
					<li style="margin-left: 12%"><a>&nbsp;</a></li>
					<li><a href="/reviewList.hang">REVIEW</a></li>
					<li><a href="/tipList.hang">TIPS</a></li>
					<li><a href="/hangOutList.hang">HANG OUT</a></li>
				</ul>
			</div>
		</div>
	</div>
</header>