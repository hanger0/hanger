<%@ page contentType="text/html; charset=EUC-KR"%>

<body style="background-color: #EBEBEB">
	<div class="container" style="width: 80%">
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


		<!-- 스크랩 -->

		<div class="row hotitem" style="height: 100%;">
			<div class="title">
				<font size="3"><b><p
							style="display: table; margin-left: 1.8%;">스크랩</p></b></font>
			</div>
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
						<br>
						<h6>

							<span><font color="gray">2015-06-03 07:30</font></span>
						</h6>

						<hr style="margin-bottom: 3px">
						<div class="Container-fluid" align="center">
							<span class="glyphicon glyphicon-user" aria-hidden="true"></span><span
								class="badge">87</span>&nbsp;&nbsp;&nbsp;&nbsp; <span
								class="glyphicon glyphicon-pencil" aria-hidden="true"></span><span
								class="badge">20</span>&nbsp;&nbsp;&nbsp;&nbsp; <span
								class="glyphicon glyphicon-heart" aria-hidden="true"></span><span
								class="badge">30</span>
						</div>
					</div>
				</div>
			</div>
			<%
				}
			%>
		</div>

		<!-- 스크랩 끝 -->
	</div>
</body>
