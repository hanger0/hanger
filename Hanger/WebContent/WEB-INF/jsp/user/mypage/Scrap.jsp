<%@ page contentType="text/html; charset=EUC-KR"%>

<body>
	<div class="container" style="width: 97.7%">
		<!-- ��ũ�� -->
		<div class="row hotitem">
			<div class="title">
				<font size="3"><b><p
							style="display: table; margin-left: 1.8%;">��ũ��</p></b></font>
			</div>
			<%
				for (int i = 0; i < 6; i++) {
			%>
			<div class="col-md-3">
				<div class="thumbnail">
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
						<h6>
							<span><font color="gray">2015-06-03 07:30</font></span>
						</h6>

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

		<!-- ��ũ�� �� -->
	</div>
</body>
