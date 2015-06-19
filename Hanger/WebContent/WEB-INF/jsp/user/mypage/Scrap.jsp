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
		<!-- Ω∫≈©∑¶ -->
		<div class="row hotitem">
			<div class="title" style = "margin-left:1.5%">
				<font size="3"><b>Ω∫≈©∑¶</b></font>
			</div><p>
<% if(yourUserCode.equals("")){ %>
			<input type="button" value="∏Æ∫‰" class="btn btn-default" style = "width:60px;margin-left:1.5%" onClick = "scrapReview()"/>
			&nbsp;
			<input type="button" value="∆¡" class="btn btn-default" style = "width:60px;" onClick = "scrapTip()"/>
<% } else { %>
			<input type="button" value="∏Æ∫‰" class="btn btn-default" style = "width:60px;margin-left:1.5%" onClick = "yourScrapReview()"/>
			&nbsp;
			<input type="button" value="∆¡" class="btn btn-default" style = "width:60px;" onClick = "yourScrapTip()"/>
<% } %>
			<br>
			<%
			if(userScrapList != null && userScrapList.size() > 0) {
				for (int i = 0; i < userScrapList.size(); i++) {
					UserScrapVo scrapvo = (UserScrapVo)userScrapList.get(i);
					String userPicPath = scrapvo.getUserPicPath();
					String userPicSaveName = scrapvo.getUserPicSaveName();
					String postingCode = scrapvo.getPostingCode();
					String reviewTitle = scrapvo.getReviewTitle();
					String userName = scrapvo.getUserName();
					String featuer2Name = scrapvo.getFeature2Name();
					String userSkinTone = scrapvo.getUserSkinTone();
					String reviewScore = scrapvo.getReviewScore();
					String postingLikeCount = scrapvo.getPostingLikeCount();
					String replyCount = scrapvo.getReplyCount();
					String scrapCount = scrapvo.getScrapCount();
			%>
			<div class="col-md-3" style = "height:65%">
            <div class="thumbnail" >
               <div class="image">
                  <img src="<%=  userPicPath %>/<%= userPicSaveName%>" width="100%" height="180px" style="display: table; margin-left: auto; margin-right: auto;" class="hotimages">
               </div>
               <div class="caption">
                  <a href = "/reviewShow.hang?reviewCode=<%=postingCode%>">
                  	<h6><B><%= reviewTitle %></B></h6>
                  	<P>
                  	<h5><B></B></h5>
                  </a>
                  <hr style = "margin-top:-1%;"><p>
                  <img src="images/wonbin.PNG" width="40px" height="40px" class="img-circle" />
                     <font size = "3"><b><%=userName %></b></font>&nbsp;&nbsp;
                     <font size = "2"><%= featuer2Name%></font>&nbsp;&nbsp;
<% if(userSkinTone != null){ %>
                     <font size = "2"><%=userSkinTone %></font>
<% } %>
                     <p><font size = "2"><%=reviewScore %></font>
                  <hr>
                  <div class="Container-fluid" align="center">
                     <span class = "glyphicon glyphicon-heart">(<%=postingLikeCount %>)</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     <span class = "glyphicon glyphicon-pencil">(<%=replyCount %>)</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     <span class = "glyphicon glyphicon-tag">(<%=scrapCount %>)</span>
                  </div>
               </div>
            </div>
         </div>
			<%
				}
			} else {
%>
				<H1>µ•¿Ã≈Õ∞° æ¯Ω¿¥œ¥Ÿ.</H1>
<%
			}
%>
		</div>

		<!-- Ω∫≈©∑¶ ≥° -->
	</div>
</body>
