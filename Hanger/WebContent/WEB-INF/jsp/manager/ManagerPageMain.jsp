<%@ page contentType="text/html;charset=euc-kr"%>

<body>
	<div class="container">
		<div class="thumbnail" style="height: 90px">
			<BR>
			<div class="title" align="center">
				<ul class="nav nav-pills" style="float: center">
					<li role="presentation" class=""
						style="width: 120px; height: 100px; margin-left: 180px"><a
						href="#">상품관리</a></li>
					<li role="presentation" class=""
						style="width: 120px; height: 100px"><a href="#">재고관리</a></li>
					<li role="presentation" class=""
						style="width: 120px; height: 100px"><a href="#">회원관리</a></li>
					<li role="presentation" class=""
						style="width: 120px; height: 100px"><a href="#">게시판관리</a></li>
					<li role="presentation" class=""
						style="width: 120px; height: 100px"><a href="#">매출관리</a></li>
					<li role="presentation" class=""
						style="width: 120px; height: 100px"><a href="#">구매내역관리</a></li>
				</ul>
			</div>
			<BR>
		</div>

		<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->

		<div class="btn-group" style="margin-left: -890px;">
			<button type="button" class="btn btn-default">아이</button>
			<button type="button" class="btn btn-default dropdown-toggle"
				data-toggle="dropdown" aria-expanded="false">
				<span class="caret"></span> <span class="sr-only">Toggle
					Dropdown</span>
			</button>
			<ul class="dropdown-menu " role="menu">
				<li><a class="active" href="#">스킨</a></li>
				<li><a href="#">립</a></li>
				<li><a href="#">페이스</a></li>
				<li><a href="#">네일</a></li>
				<li><a href="#">스킨</a></li>
				<li><a href="#">클렌징</a></li>
				<li><a href="#">바디헤어</a></li>
				<li><a href="#">남성</a></li>
				<li><a href="#">향수</a></li>
				<li><a href="#">화장소품</a></li>
			</ul>
		</div>
		<!--상품-->

		<div class="row hotitem">

			<div class="row"
				style="display: table; margin-left: 20px; margin-right: auto;">
				<%
					for (int i = 0; i < 4; i++) {
				%>
				<div class="col-sm-6 col-md-3">
					<div class="thumbnail">
						<img src="images/wonbin.PNG" alt="..." width="200px"
							height="150px">
						<div class="caption">
							<h3>Power overwhemling</h3>
							<p>평점 : ★★★★★
							<p>
							<p>Show me the money</p>
							<p>Price : 277000</p>
							<p>
							<hr style="margin-bottom: 3px">
							<div
								style="display: table; margin-left: auto; margin-right: auto;">
								<a href="#" class="btn btn-default" role="button">수정하기</a> <a
									href="#" class="btn btn-default" role="button">삭제</a>
							</div>
							</p>
						</div>
					</div>
				</div>
				<%
					}
				%>
			</div>
		</div>
	</div>
	<!-- 상품 끝 -->
</body>
</html>