<%@ page contentType="text/html; charset=EUC-KR"%>

<body style="background-color: #EBEBEB">
	<div class="container">
		<div class="top" align="center">
			<BR> <BR>
			<div class="thumbnail" style="width: 310px; height: 160px">
				<div class="profile"
					style="width: 120px; height: 120px; float: left">
					<IMG src="assets/images/song.jpg" width="150px" height="150px">
				</div>
				<div class="profileInfo"
					style="width: 130px; height: 130px; float: right">
					<div class="myname" align="left">
						<font size="3">�̸� : <b>������</b></font>
					</div>
					<p>
					<div class="myage" align="left">
						<font size="3">���� : <b>23</b></font>
					</div>
					<p>
					<div class="mytype" align="left">
						<font size="3">�Ǻ� : <b>����</b></font>
					</div>
				</div>
			</div>
		</div>

		<!-- �ȷο� ���� �ۼ� ���� -->
		<div class="thumbnail" style="height: 90px">
			<BR>
			<div class="title" align="center">
				<ul class="nav nav-pills" style="float: center">
					<li role="presentation" class="active"
						style="width: 120px; height: 100px; margin-left: 180px"><a
						href="/userReviewPage.hang">����</a></li>
					<li role="presentation" class="active"
						style="width: 120px; height: 100px"><a
						href="/userTipPage.hang">��</a></li>
					<li role="presentation" class="active"
						style="width: 120px; height: 100px"><a
						href="/userHangOutPage.hang">�Խù�</a></li>
					<li role="presentation" class="active"
						style="width: 120px; height: 100px"><a
						href="/userScrapPage.hang">��ũ��</a></li>
					<li role="presentation" class="active"
						style="width: 120px; height: 100px"><a
						href="/relationFollowingSearch.hang">�ȷο�</a></li>
					<li role="presentation" class="active"
						style="width: 120px; height: 100px"><a
						href="/userOrderPage.hang">����</a></li>
					<li role="presentation" class="active"
						style="width: 120px; height: 100px"><a
						href="/userMileagePage.hang">���ϸ���</a></li>
				</ul>
			</div>
			<BR>
		</div>
		<!-- �ȷο� ���� �ۼ� �� -->


		<button class="btn btn-primary" style="margin-left: -912px">
			��� ���� <a href="#"> <span class="badge">42</span></a>
		</button>
		<button class="btn btn-default">
			��� �� <a href="#"><span class="badge">10</span></a>
		</button>
		</ul>

		<!-- �� �ۼ� ���� -->
		<div class="row hotitem">
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
							<B>�귣�� : �Ұ��� �ڡڡڡڡ�</B>
						</h5>
						</P>
						<P>
						<h4>
							<B>���� : �ȴϾ� �Ƹ޽ý�Ʈ</B>
						</h4>
						</P>
						</h5>

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
	</div>
</body>
