<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page import = "java.util.*" %>
<%@ page import = "com.hanger.scrap.vo.UserScrapVo" %>
<%
	ArrayList<UserScrapVo> userScrapList = (ArrayList<UserScrapVo>)request.getAttribute("userScrapList");
%>
<script>
	function scrapReview() {
		location.href = "/userScrapReview.hang";
	}
	function scrapTip() {
		location.href = "/scrapTip.hang"
	}
</script>
<body>
	<div class="container" style="width: 97.7%">
		<!-- ��ũ�� -->
		<div class="row hotitem">
			<div class="title" style = "margin-left:1.5%">
				<font size="3"><b>��ũ��</b></font>
			</div><p>
			<input type="button" value="����" class="btn btn-default" style = "width:60px;margin-left:1.5%" onClick = "scrapReview()"/>
			&nbsp;
			<input type="button" value="��" class="btn btn-default" style = "width:60px;" onClick = "scrapTip()"/>
			<br>
			<%
			if(userScrapList != null && userScrapList.size() > 0) {
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
			} else {
%>
				<H1>�����Ͱ� �����ϴ�.</H1>
<%
			}
%>
		</div>

		<!-- ��ũ�� �� -->
	</div>
</body>
