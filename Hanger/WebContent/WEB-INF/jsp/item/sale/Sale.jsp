<%@ page contentType="text/html; charset=EUC-KR"%>

<script>
	//# 남은 시간(초) 구하기
	function showCountdown(TimeSecond) {
		day = Math.floor(TimeSecond / (3600 * 24));
		mod = TimeSecond % (24 * 3600);
		hour = Math.floor(mod / 3600);
		mod = mod % 3600;
		min = Math.floor(mod / 60);
		sec = mod % 60;
		count = (day > 0) ? day + "일 " : "";
		count = count + hour + "시간 " + min + "분 " + sec + "초";
		window.document.all.countdown.value = count;

		//# 남은 시간 소모 완료
		if (!TimeSecond) {
			alert('시간완료');
		} else {
			TimeSecond2 = TimeSecond - 1; // -1초씩 표현
			setTimeout("showCountdown(TimeSecond2)", 1000); // 타임아웃 속도
		}

	}
</scRIPT>

<body style="background-color: #EBEBEB">
	<div class="container">
		<!-- 팔로우 리뷰 작성 시작 -->
		<br>
		<div class="salecontainer"
			style="width: 87%; height: 600px; display: table; margin-left: auto; margin-right: auto">
			<div class="thumbnail" style="width: 100%; height: 200px;">
				<div class="timer">
					<input id=countdown
						style="BORDER-RIGHT: 0px; BORDER-TOP: 0px; FONT-SIZE: 20pt; BORDER-LEFT: 0px; COLOR: red; BORDER-BOTTOM: 0px"
						readOnly value="" name="InputTime" />
					<script>
						showCountdown(60000);
					</script>
					광고
				</div>
			</div>
			<%
				for (int i = 1; i < 8; i++) {
			%>
			<div class="col-sm-6 col-md-3">
				<div class="thumbnail" style="width: 100%;">
					<div class="image">
						<img src="images/test.png" width="180px" height="150px"
							style="display: table; margin-left: auto; margin-right: auto;"
							class="hotimages">
					</div>
					<div class="caption">
						<font size="2">올리브 영</font>
						<p>
							<font size="3"><b>슈퍼 아쿠아 수분크림(80ml)</b></font>
						<p>
							<font size="2">오늘부터~6/30</font>
						<p>
						<div class="info"
							style="display: table; margin-left: auto; margin-right: auto">
							<font size="4"><font color="red">67%</font></font>&nbsp;&nbsp;<font
								size="2">18,000원</font>&nbsp;&nbsp;★★★★★
						</div>
					</div>
				</div>
			</div>
			<%
				}
			%>
		</div>
	</div>
	<!-- 팔로우 리뷰 작성 끝 -->
</body>
