<%@ page contentType="text/html; charset=EUC-KR"%>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
</head>
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
	<div class="container" style="width: 100%; height: 100%">
		<!-- 팁 작성 시작 -->
		<div class="row hotitem">
			<h4>
				<b><p style="display: table; margin-left: 12px;">구매 상품</p></b>
			</h4>

			<%
				for (int i = 0; i < 7; i++) {
			%>
			<div class="col-sm-6 col-md-3">
				<div class="thumbnail"
					style="height: 50%; width: 98%; display: table; margin-left: auto; margin-right: auto">
					<div class="image">
						<img src="images/test.png" width="200px" height="150px"
							style="display: table; margin-left: auto; margin-right: auto;"
							class="hotimages">
					</div>
					<div class="caption">
						<P>
						<h6>
							<B>미샤</B>
						</h6>
						<p>
						<h4>
							<B>[M] 매직 쿠션 모이스처 SPF50+ PA+++ [21호]</B>
						</h4>
						<p>
							<font size="2"><b>가격</b>&nbsp;&nbsp;&nbsp;</font><font
								color="gray">16,000원</font>
						<hr style="margin-top: -1%; margin-bottom: -1%">
						<div class="like" align="center" style="margin-top: 5%">
							<input type="button" value="리뷰쓰기" class="btn btn-default" />
						</div>
					</div>
				</div>
			</div>
			<%
				}
			%>
		</div>
			<br>
		<div class="row hotitem">
			<h4>
				<b><p style="display: table; margin: 15px 0 0 12px;">MyReview</p></b>
			</h4>
			<!--  팁 작성 끝 -->

			<%
				for (int i = 0; i < 4; i++) {
			%>
			<div class="col-sm-6 col-md-3">
				<div class="thumbnail">
					<div class="image">
						<img src="images/test.png" width="200px" height="150px"
							style="display: table; margin-left: auto; margin-right: auto;"
							class="hotimages">
					</div>
					<div class="caption">
						<P>
						<h5>
							<B>브랜드 : 불가리 ★★★★★</B>
						</h5>
						</P>
						<P>
						<h4>
							<B>제목 : 옴니아 아메시스트</B>
						</h4>
						</P>
						</h5>

						<hr style="margin-bottom: 3px">
						<div class="Container-fluid" align="center">
							<span class="glyphicon glyphicon-heart" aria-hidden="true"></span><span
								class="badge">87</span>&nbsp;&nbsp;&nbsp;&nbsp; <span
								class="glyphicon glyphicon-pencil" aria-hidden="true"></span><span
								class="badge">20</span>&nbsp;&nbsp;&nbsp;&nbsp; <span
								class="glyphicon glyphicon-tag" aria-hidden="true"></span><span
								class="badge">30</span>
						</div>
					</div>
				</div>
			</div>
			<%
				}
			%>
		</div>
	</div>
</body>
