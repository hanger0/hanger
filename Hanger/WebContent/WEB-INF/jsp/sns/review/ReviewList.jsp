<%@ page contentType="text/html; charset=EUC-KR"%>

<body style="background-color: #EBEBEB">
	<div class="container" style = "width:83%; background-color: #EBEBEB;display:table;margin-left:auto;margin-right:auto">
		<!-- �� �ۼ� ���� -->
		<div class="row" style = "background-color: #EBEBEB;">
			<h2>
				<b><p style="display: table; margin: 15px 0 0 12px;">My Review</p></b>
			</h2>
			<!--  �� �ۼ� �� -->

			<%
				for (int i = 0; i < 20; i++) {
			%>
			<div class="col-md-3" style = "height:65%">
			<a href="#modal" data-toggle="modal" data-target=".review-modal-lg">
				<div class="thumbnail" >
					<div class="image">
						<img src="images/14.jpg" width="100%" height="180px" style="display: table; margin-left: auto; margin-right: auto;" class="hotimages">
					</div>
					<div class="caption">
						<h6><B>�̻�</B></h6>
						<P>
						<h5><B>[M] ���� ��� ���̽�ó SPF50+ PA+++ [21ȣ]</B></h5></a>
						<hr style = "margin-top:-1%;"><p>
						<input type = "image" src = "" >
							<font size = "3"><b>�迹��</b></font>&nbsp;&nbsp
							<font size = "2">�Ǽ�</font>&nbsp;&nbsp
							<font size = "2">21ȣ</font>
						<hr>
						<div class="Container-fluid" align="center">
							<span class = "glyphicon glyphicon-heart">(20)</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<span class = "glyphicon glyphicon-pencil">(5)</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<span class = "glyphicon glyphicon-tag">(12)</span>
						</div>
					</div>
				</div>
			</div>
			<%
				}
			%>
	<!-- ��� ���� -->
			<div class="modal fade review-modal-lg" tabindex="-1"
				role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-lg">
					<div class="modal-content">
						<jsp:include page="/WEB-INF/jsp/sns/hangOut/HangOutList.jsp" flush="true"> 
     						<jsp:param name="param_name" value="param_value"/> 
						</jsp:include>
					</div>
				</div>
			</div>
			<!-- ��� ���� -->
</body>
