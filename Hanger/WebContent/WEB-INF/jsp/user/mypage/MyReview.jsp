<%@ page contentType="text/html; charset=EUC-KR"%>

<body>
	<div class="container" style="width:100%">
		<!-- 리뷰 작성 시작 -->
		<div class="row hotitem" style = "display:table;margin-left:auto;margin-right:auto">
			<font size = "2">
				<b><p style="display: table; margin-left: 12px;">구매 상품</p></b>
			</font>

			<%
				for (int i = 0; i < 8; i++) {
			%>
			<div class="col-md-3">
				<div class="thumbnail"
					style="margin-left:-5%;display: table; margin-left: auto; margin-right: auto">
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
						<font size = "3">
							<B>[M] 매직 쿠션 모이스처 SPF50+ PA+++ [21호]</B>
						</font>
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
		<div class="row hotitem" style = "width:100%;display:table;margin-left:auto;margin-right:auto">
			<font size="4">
				<b><p style="display: table; margin: 15px 0 0 12px;">MyReview</p></b>
			</font>
			<!--  팁 작성 끝 -->

			<%
				for (int i = 0; i < 6; i++) {
			%>
			<div class="col-sm-6 col-md-3">
				<div class="thumbnail" style="margin-left:-5%;display:table;margin-left:auto;margin-right:auto">
					<div class="image">
						<img src="images/test.png" width="200px" height="150px"
							style="display: table; margin-left: auto; margin-right: auto;"
							class="hotimages">
					</div>
					<div class="caption">
						<P>
						<font size = "2">
							불가리
						</font>
						</P>
						<P>
						<font size = "3">
							<B>옴니아 아메시스트</B>
						</font>
						</P>
						<font size = "2">
							<b>별점</b>&nbsp;&nbsp;&nbsp;★★★★★
						</font>

						<hr style="margin-bottom: 3px">
						<div class="Container-fluid" align="center">
							<span class="glyphicon glyphicon-heart">(20)</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<span class="glyphicon glyphicon-pencil">(5)</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<span class="glyphicon glyphicon-tag">(12)</span>
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
