<%@ page contentType="text/html; charset=EUC-KR"%>

<style>
.row {
	width: 100%;
	background-color: white;
	display: table;
	margin-left: auto;
	margin-right: auto;
	margin-top: 3px;
}

.thumbnail {
	width: 100%;
}

.millige {
	width: 80%;
	height: 50px;
	display: table;
	margin-left: auto;
	margin-right: auto;
}
</style>

<body style="background-color: #EBEBEB">
	<div class="container" style="width: 80%">
		<br>
		<div class="thumbnail"
			style="width: 100%; background-color: white; display: table; margin-left: auto; margin-right: auto">
			<div class="col-sm-4 infos" style="width: 15%; margin-left: 5%">
				<img src="images/yebin.jpg" alt="예빈짜응" class="img-circle"
					style="width: 100px; height: 100px;">
			</div>
			<div class="col-sm-4 infos"
				style="width: 13%; height: 100px; background-color: yellow">
				이름 : 예빈이 <BR>날짜 : 2015.6.3 <BR>피부타입 : 건성
			</div>
			<div class="col-sm-4 infos"
				style="width: 50%; background-color: orange">
				<div style="width: 100%;">
					<h5>
						네이처리퍼블릭
						</h3>
						<h3>존나 좋은 모공제거 코팩이다 헤헤헤헤</h3>
				</div>
			</div>
		</div>
		<!-- 팔로우 리뷰 작성 시작 -->
		<div class="thumbnail">
			<div class="menubar" style="width: 100%; height: 40px;">
				<ul class="nav nav-pills"
					style="display: table; margin-left: auto; margin-right: auto"
					align="center">
					<li role="presentation" class=""
						style="width: 120px; height: 40px;"><a href="MyReview.jsp">리뷰</a></li>
					<li role="presentation" class="" style="width: 120px; height: 40px">
						<a href="MyWrite.jsp">팁</a>
					</li>
					<li role="presentation" class="" style="width: 120px; height: 40px">
						<a href="#">게시물</a>
					</li>
					<li role="presentation" class="" style="width: 120px; height: 40px">
						<a href="Flow.jsp">팔로우</a>
					</li>
					<li role="presentation" class="" style="width: 120px; height: 40px">
						<a href="OrderPage.jsp">모더</a>
					</li>
					<li role="presentation" class="" style="width: 120px; height: 40px">
						<a href="#">마일리지</a>
					</li>
				</ul>
			</div>
		</div>
		<!-- 팔로우 리뷰 작성 끝 -->

		<!-- 팁 작성 시작 -->
		<div class="thumbnail" style="height: 100%;">
			<br>
			<div class="title">
				<font size="3"><b><p
							style="display: table; margin-left: 12px;">마일리지</p></b></font>
			</div>
			<div class="millige">
				<div class="thumbnail" align="center"
					style="background-color: #EBEBEB">
					<font size="4"><font color="red"><b>총 마일리지 : </b></font></font>AJAX&nbsp;&nbsp;
					<font size="4"><font color="red"><b>사용 마일리지 : </b></font></font>AJAX&nbsp;&nbsp;
					<font size="4"><font color="red"><b>남은 마일리지 : </b></font></font>AJAX&nbsp;&nbsp;
				</div>
				<%
					for (int i = 0; i < 3; i++) {
				%>
				<div class="thumbnail"
					style="width: 50%; display: table; margin-left: auto; margin-right: auto;">
					&nbsp;&nbsp;2015 / 5 / 15 <font size="2">(올리브 영 슈퍼 아쿠아 수분크림)</font><br>
					&nbsp;&nbsp;"<b>동작구사랑방</b>"님을 통해 구매하여 적립되었습니다.&nbsp;&nbsp; <font
						size="4"><b>500원</b></font>
				</div>
				<hr>
				<%
					}
				%>

			</div>
			<!--  팁 작성 끝 -->
		</div>
	</div>
</body>
