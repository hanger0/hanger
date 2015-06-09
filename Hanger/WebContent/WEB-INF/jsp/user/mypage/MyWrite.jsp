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
</style>

<body style="background-color: #EBEBEB">
	<div class="container">
		<!-- 팁 작성 시작 -->

		<div class="title">
			<font size="4"><b><p style="display: table; margin-left: 12px;">MyTip</p></b></font>
		</div>
		<%
			for (int i = 0; i < 10; i++) {
		%>
		<div class="col-md-3">
			<div class="thumbnail" >
				<div class="image">
					<img src="images/test.png" width="200px" height="150px"
						style="display: table; margin-left: auto; margin-right: auto;"
						class="hotimages">
				</div>
				<div class="caption">
					<P>
					<h5>
						<B>브랜드 : 불가리</B>
					</h5>
					</P>
					<P>
					<h4>
						<B>제목 : 옴니아 아메시스트</B>
					</h4>
					</P>
					</h5>
					<hr style="margin-bottom: 3px">
					<div class="like" align="center">
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
		<!--  팁 작성 끝 -->
	</div>
	</div>
</body>
