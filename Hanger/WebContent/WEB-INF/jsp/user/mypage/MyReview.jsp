<%@ page contentType="text/html; charset=EUC-KR"%>

<body>
	<div class="container" style="width:100%">
		<!-- ���� �ۼ� ���� -->
		<div class="row hotitem" style = "display:table;margin-left:auto;margin-right:auto">
			<font size = "2">
				<b><p style="display: table; margin-left: 12px;">���� ��ǰ</p></b>
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
							<B>�̻�</B>
						</h6>
						<p>
						<font size = "3">
							<B>[M] ���� ��� ���̽�ó SPF50+ PA+++ [21ȣ]</B>
						</font>
						<p>
							<font size="2"><b>����</b>&nbsp;&nbsp;&nbsp;</font><font
								color="gray">16,000��</font>
						<hr style="margin-top: -1%; margin-bottom: -1%">
						<div class="like" align="center" style="margin-top: 5%">
							<input type="button" value="���侲��" class="btn btn-default" />
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
			<!--  �� �ۼ� �� -->

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
							�Ұ���
						</font>
						</P>
						<P>
						<font size = "3">
							<B>�ȴϾ� �Ƹ޽ý�Ʈ</B>
						</font>
						</P>
						<font size = "2">
							<b>����</b>&nbsp;&nbsp;&nbsp;�ڡڡڡڡ�
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
