<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page import = "java.util.*" %>
<%@ page import = "com.hanger.scrap.vo.UserScrapVo" %>
<%
	ArrayList<UserScrapVo> userScrapList = (ArrayList<UserScrapVo>)request.getAttribute("userScrapList");
	String yourUserCode = "";
	if ((String)request.getAttribute("yourUserCode") != null
			&& ((String)request.getAttribute("yourUserCode")).length() > 0) {
		yourUserCode = (String)request.getAttribute("yourUserCode");
	}
%>
<script>
	function scrapReview() {
		location.href = "/userScrapReview.hang";
	}
	function scrapTip() {
		location.href = "/scrapTip.hang";
	}
	function yourScrapReview() {
		location.href = "/userScrapReview.hang?yourUserCode=<%= yourUserCode %>";
	}
	function yourScrapTip() {
		location.href = "/scrapTip.hang?yourUserCode=<%= yourUserCode %>";
	}
</script>
<body>
	<div class="container" style="width: 97.7%">
		<!-- ½ºÅ©·¦ -->
		<div class="row hotitem">
			<div class="title" style = "margin-left:1.5%">
				<font size="3"><b>½ºÅ©·¦</b></font>
			</div><p>
<% if(yourUserCode.equals("")){ %>
			<input type="button" value="¸®ºä" class="btn btn-default" style = "width:60px;margin-left:1.5%" onClick = "scrapReview()"/>
			&nbsp;
			<input type="button" value="ÆÁ" class="btn btn-default" style = "width:60px;" onClick = "scrapTip()"/>
<% } else { %>
			<input type="button" value="¸®ºä" class="btn btn-default" style = "width:60px;margin-left:1.5%" onClick = "yourScrapReview()"/>
			&nbsp;
			<input type="button" value="ÆÁ" class="btn btn-default" style = "width:60px;" onClick = "yourScrapTip()"/>
<% } %>
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
							ºÒ°¡¸®
						</font>
						</P>
						<P>
						<font size = "3">
							<B>¿È´Ï¾Æ ¾Æ¸Þ½Ã½ºÆ®</B>
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
				<H1>µ¥ÀÌÅÍ°¡ ¾ø½À´Ï´Ù.</H1>
<%
			}
%>
		</div>

		<!-- ½ºÅ©·¦ ³¡ -->
	</div>
</body>
