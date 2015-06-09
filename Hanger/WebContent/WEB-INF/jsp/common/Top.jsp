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
		$(".clickdrop").click(function() {

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
	<!--기본페이지에는 이거보임-->
	<div style="width: 100%;"
		class="hidden-xs navbar navbar-default navbar-fixed-top navbar HOME"
		role="navigation">
		<div class="navbar-header" style="margin-left: 160px">
			<a class="navbar-brand" href="/"> <img
				style="height: 32px; padding: 3px 0;" src="/images/juven.png"
				id="brand-icon" alt="Hanger" />
			</a>
		</div>
		<form class="navbar-form navbar-left" role="search" method="get"
			action="/itemSearch.hang">
			<div class="form-group" style="margin-left: 65%; width: 100%">
				<input type="text" name="keyWord" class="form-control"
					placeholder="Search" style="width: 300px">
				<button type="submit" class="btn btn-default">검색</button>
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
				<li class="headli clickdrop"><a href="#"><img
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
				<li><a href="/login.hang" class="remove-border">로그인</a></li>
				<li><a href="/join.hang" class="remove-border"
					style="margin-right: 165px">회원가입</a></li>
				<%
					}
				%>
			</ul>
		</div>
	</div>
	<div
		class="hidden-xs navbar navbar-default navbar-fixed-top unpa-navbar HOME"
		style="width: 100%; position: fixed; z-index: 1000; height: 50px">
		<!-- 띄어쓰기 -->
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
					<li><a href="/shopList.hang">SHOP</a>
						<ul>
							<li style="margin-left: 10%"><a href="#"><font size="4"><b>메이크업</b></font></a>
								<ul style="background-color: white">
									<p>
										<br>
									<li><a href="#"><font size="2"><b>페이스 메이크업</b></font></a></li>
								</ul>
								<ul>
									<br>
									<li><a href="#"><font size="2"><b>아이 메이크업</b></font></a>
								</ul>
								<ul>
									<br>
									<li><a href="#"><font size="2"><b>립 메이크업</b></font></a>
								</ul>
							<li><a href="#"><font size="4"><b>스킨케어</b></font></a>
								<ul>
									<p>
										<br>
									<li><a href="#"><font size="2"><b>클렌징</b></font></a></li>
								</ul>
								<ul>
									<br>
									<li><a href="#"><font size="2"><b> 모이스쳐</b></font></a></li>
								</ul>
								<ul>
									<br>
									<li><a href="#"><font size="2"><b> 팩 & 패치</b></font></a></li>
								</ul>
								<ul>
									<br>
									<li><a href="#"><font size="2"><b> 선 케어</b></font></a></li>
								</ul></li>
							<li><a href="#"><font size="4"><b>헤어 & 바디</b></font></a>
								<ul>
									<br>
									<li><a href="#"><font size="2"><b> 헤어</b></font></a></li>
								</ul>
								<ul>
									<br>
									<li><a href="#"><font size="2"><b> 바디</b></font></a></li>
								</ul>
								<ul>
									<br>
									<li><a href="#"><font size="2"><b> 핸드 & 풋</b></font></a></li>
								</ul>
								<ul>
									<br>
									<li><a href="#"><font size="2"><b> 다이어트</b></font></a></li>
								</ul>
								<ul>
									<br>
									<li><a href="#"><font size="2"><b> 생활뷰티</b></font></a></li>
								</ul>
							<li><a href="#"><font size="4"><b>향수</b></font></a>
								<ul>
									<br>
									<li><a href="#"><font size="2"><b> 여성향수</b></font></a></li>
								</ul>
								<ul>
									<br>
									<li><a href="#"><font size="2"><b> 남성향수</b></font></a></li>
								</ul>
								<ul>
									<br>
									<li><a href="#"><font size="2"><b> 캔들 & 디퓨저</b></font></a></li>
								</ul>
							<li><a href="#"><font size="4"><b>도구 & 기기</b></font></a>
								<ul>
									<br>
									<li><a href="#"><font size="2"><b> 뷰티기기</b></font></a></li>
								</ul>
								<ul>
									<br>
									<li><a href="#"><font size="2"><b> 바디기기</b></font></a></li>
								</ul>
								<ul>
									<br>
									<li><a href="#"><font size="2"><b> 도구</b></font></a></li>
								</ul>
						</ul></li>
					<li><a href="/brand.hang">BRAND</a>
						<ul>
							<li style="margin-left: 10%"><a href="#"><font size="4"><b>알파벳
											순</b></font></a>
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
	<ul class="nav navbar-right ">
		<li class="dropdown open">
			<a class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="true">
				<img src="images/test.png" /> <span class="count"></span>
			</a>
		</li>
		<li>
			<ul class="dropdown-menu" role="menu">
				<form class="navbar-form navbar-left" role="search">
					<div class="form-group">
						<input type="text" class="form-control" placeholder="Search" />
					</div>
					<button type="submit" class="btn btn-default">검색</button>
				</form>
				<%
					for (int i = 1; i < 4; i++) {
				%>
				<li><a href="#"> <img src="images/test.png" />
						<div class="message-and-time" style="float: right;" >
							<div class="message">
								<span class="user">로리콘박상욱</span>님이 회원님을 팔로우 했습니다.
							</div>
							<div class="time">2015년 5월 27일</div>
						</div>
				</a></li>
				<%
					}
				%>
			</ul>
		</li>
	</ul>
</header>