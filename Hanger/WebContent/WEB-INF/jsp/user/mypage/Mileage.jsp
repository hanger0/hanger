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
	<div class="container" style="width: 97%">
		<!-- 팁 작성 시작 -->
			<font size="3"><b><p style="display: table;">마일리지</p></b></font>
		<div class="thumbnail">
			<br>
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
					style="width: 60%; display: table; margin-left: auto; margin-right: auto;">
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
