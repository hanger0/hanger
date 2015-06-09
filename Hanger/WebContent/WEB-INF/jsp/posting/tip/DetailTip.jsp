<%@ page contentType="text/html; charset=EUC-KR"%>

<STYLE>
.container {
	width: 100%;
}

.row {
	margin-top: 5px;
	margin-bottom: 5px;
}

.reviewhead2 {
	margin-top: 3px;
}

.reviewmain {
	margin-top: 5px;
}

.userimg {
	margin-top: 10px;
	margin-bottom: 10px;
	margin-left: -10px;
	margin-right: 10px;
	width: 80px;
	height: 80px;
}

.infos {
	margin: 3px 5px 3px;
}

.menus {
	width: 100px;
}

.main {
	margin-left: 5px;
	margin-right: 5px;
}

.mainimg {
	width: 70%;
	height: 250px;
}

.reimgs {
	margin-right: 10px;
	width: 70px;
	height: 70px;
}

.replymain {
	height: 80px;
	padding: 3px;
}

.replylist {
	width: 100%;
	height: 90px;
}

.replywrite {
	margin-top: 3px;
	width: 100%;
	height: 90px;
}

.replybutton {
	width: 100%;
	height: 70px;
}

.rewriteimg {
	width: 70px;
	height: 70px;
	margin-top: 10px;
}

.replybutton {
	margin-top: 10px;
}

.recomment {
	margin-left: 20px;
	margin-right: 10px;
}

.reheadname {
	margin-left: 20px;
	margin-right: 10px;
}
</STYLE>

<body>
	<div class="container">

		<div class="row">
			<div class="reviewhead1 col-sm-6">
				<div class="col-sm-4 infos" style="width: 20%;">
					<img src="images/yebin.jpg" alt="예빈짜응" class="img-circle userimg">

				</div>
				<div class="col-sm-4 infos" style="width: 30%;">
					<BR> 예빈이<BR> 2015.6.3<BR> 건성피부
				</div>
				<div class="col-sm-4 infos" style="width: 40%;">
					<div style="width: 100%;">
						<BR> 네이처 리퍼블릭<BR> <B>개쩌는 모공 제거 코팩 사용 Tip!</B><BR>
					</div>
				</div>
			</div>
			<div class="reviewhead2 col-sm-6" role="group"">
				<CENTER>
					<button type="button" class="btn btn-info menus">
						<span class="glyphicon glyphicon-star" aria-hidden="true">팔로우하기</span>
					</button>
					<button type="button" class="btn btn-info menus">
						<span class="glyphicon glyphicon-star" aria-hidden="true">구매하기</span>
					</button>
					<button type="button" class="btn btn-info menus">
						<span class="glyphicon glyphicon-star" aria-hidden="true">좋아요(10)</span>
					</button>
					<button type="button" class="btn btn-info menus">
						<span class="glyphicon glyphicon-star" aria-hidden="true">스크랩</span>
					</button>
				</CENTER>
			</div>
		</div>

		<div class="row">
			<div class="main">
				<h2>네이처 리퍼블릭 코팩 Tip~</h2>
				<h5>팁을 시작하지</h5>
				<HR>
				<CENTER>
					<img src="images/yebin.jpg" alt="예빈짜응" class="img-rounded mainimg">
				</CENTER>
				<HR>
				<h5>
					안녕하세요^^ 처음 파워리뷰를 쓰는...! 우연히 네이처리퍼블릭에 들렸다가 3-step 코팩이 있길래 구매 해봤어요~ <BR>
					미팩토리 코팩도 있는데 그건 후기가 많이 올라와있길래 이 제품 먼저 사용해 보았답니다 ㅎㅎ 사용후에는 코가 맨질맨질
					해지고 코 옆쪽의 블랙헤드가 가장 신경 쓰였는데<BR> 싹 뽑혔더라구요 XDXD 블랙헤드가 뽑 힌 사진을
					징그러워서 패쓰...ㅎ 그리고 사용하고 나서 화장도 잘 먹어서 너무 좋았던 :
				</h5>
			</div>
		</div>
		<div class="row">
			<div class="replyhead">
				<div class="reheadcon" style="margin: auto; padding: 1px;">
					<BR> <span class="glyphicon glyphicon-comment"
						aria-hidden="true" style="font-size: 20px;"><B><font
							size="5">댓글(4)</font></B></span>
					<HR>
				</div>
			</div>
			<%
				for (int i = 0; i < 4; i++) {
			%>
			<div class="replylist">
				<div class="replyimg col-sm-1">

					<img src="images/yebin.jpg" alt="예빈짜응" class="img-circle reimgs">

				</div>
				<div class="replymain col-sm-10">
					<div class="reheadname">
						<B>박상욱</B> <font size="1">2015년 6월 3일</font>
					</div>
					<div class="recomment">저도 이 제품 평이 좋아서 써봤는데 한 통 거의 다 쓸 때까지도 그닥
						큰 효과는 보지 못했어요.. 재구입은 안 할 생각이에요! ㅇ러ㅏ노마ㅓ로저도 이 제품 평이 좋아서 써봤는데 한 통 거의
						다 쓸 때까지도 그닥 큰 효과는 보지 못했어요.. 재구입은 안 할 생각이에요!
						ㅇㄴ라ㅓㅇㄴㅁ로dsfdsfdsafdsfadsdfsakkkkkkkkkkkkkkkkkkasddddddddddddddd</div>
				</div>
				<div class="col-sm-1"></div>
			</div>

			<%
				}
			%>
		</div>

		<div class="row">
			<div class="replywrite">
				<div class="replyimg col-sm-1">
					<CENTER>
						<img src="images/wonbin.PNG" alt="예빈짜응"
							class="img-circle rewriteimg">
					</CENTER>
				</div>
				<div class="replyinsert col-sm-10">
					<textarea class="insert" rows="2"
						style="resize: none;"></textarea>
				</div>
				<div class="replybtn col-sm-1">
					<button type="button" class="btn btn-default replybutton">
						<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
					</button>
				</div>
			</div>
		</div>
		<!-- container 종료 시점-->
	</div>
</body>
