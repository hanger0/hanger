<%@ page contentType="text/html; charset=EUC-KR"%>

<body>
	<div class="container" style = "width:97.7%">
		<!-- �� �ۼ� ���� -->
		<div class="row" style="background-color: #EBEBEB;">
			<font size = "4">
				<b><p style="display: table;margin-left:1.5%">HangOut!!</p></b>
			</font>
			<!--  �� �ۼ� �� -->

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
								<B>���۽����Ѵ� �����...</B>
							</h5>
				</a>
				<hr style="margin-top: -1%;">
				<p>
					<img src="images/wonbin.PNG" width="30px" height="30px"
						class="img-circle" /> <font size="3"><b>�迹��</b></font>
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
	<!-- ��� ���� -->
	<div class="modal fade review-modal-lg" tabindex="-1" role="dialog"
		aria-labelledby="myLargeModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<jsp:include page="/WEB-INF/jsp/posting/hangOut/DetailHangOut.jsp" flush="true">
					<jsp:param name="param_name" value="param_value" />
				</jsp:include>
			</div>
		</div>
	</div>
	<!-- ��� ���� -->
</body>
