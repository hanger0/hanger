<%@ page contentType="text/html; charset=EUC-KR"%>

<body style="background-color: #EBEBEB">
	<div class="container" style="width: 80%; background-color: #EBEBEB;">
		<!-- 팁 작성 시작 -->
		<div class="row" style="background-color: #EBEBEB;">
			<h2>
				<b><p style="display: table; margin: 15px 0 0 12px;">HangOut!!</p></b>
			</h2>
			<!--  팁 작성 끝 -->

			<%
				for (int i = 0; i < 12; i++) {
			%>
			<div class="col-md-3" style="height: 60%">
				<a href="#modal" data-toggle="modal" data-target=".review-modal-lg">
					<div class="thumbnail">
						<div class="image">
							<img src="images/14.jpg" width="100%" height="180px"
								style="display: table; margin-left: auto; margin-right: auto;"
								class="hotimages">
						</div>
						<div class="caption">

							<h5>
								<B>뻘글시작한당 힘듭니...</B>
							</h5>
				</a>
				<hr style="margin-top: -1%;">
				<p>
					<img src="images/wonbin.PNG" width="30px" height="30px"
						class="img-circle" /> <font size="3"><b>김예림</b></font>
				<hr>
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
	<!-- 모달 시작 -->
	<div class="modal fade review-modal-lg" tabindex="-1" role="dialog"
		aria-labelledby="myLargeModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<jsp:include page="DetailHangOut.jsp" flush="true">
					<jsp:param name="param_name" value="param_value" />
				</jsp:include>
			</div>
		</div>
	</div>
	<!-- 모달 종료 -->
</body>
