<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page import = "java.util.*" %>
<%@ page import = "com.hanger.posting.review.vo.ReviewVo" %>
<%
	ArrayList<ReviewVo> reviewList = (ArrayList<ReviewVo>)request.getAttribute("reviewList");
%>


<body>
	<div class="container" style="width:100%">
		<!-- ���� �ۼ� ���� -->
		<div class="row hotitem" style = "width:100%;display:table;margin-left:auto;margin-right:auto">
			<font size="4">
			<div class = "title" style = "width:97.7%;display:table;margin-left:auto;margin-right:auto">
				<b>MyReview</b>
				<div class = "reviewButton" style = "float:right">
					<span><input type = "button" value = "���侲��" style = "height:25px"></span>
				</div>
			</div>
			</font>
			<br>
			<!--  �� �ۼ� �� -->

			<%
        	if(reviewList!=null&&reviewList.size()>0){
            for (int i = 0; i < reviewList.size(); i++) {
            	ReviewVo review = (ReviewVo)reviewList.get(i);
            	
            	String postingCode = review.getPostingCode();
            	String postingLikeCount = review.getPostingLikeCount();

            	String itemName = review.getItemName();
            	String itemGroupCode = review.getItemGroupCode();
            	String itemPicPath = review.getItemPicPath();
            	String itemPicSaveName = review.getItemPicSaveName();

            	String userCode = review.getUserCode();
            	String userName = review.getUserName();
            	String userPicPath = review.getUserPicPath();
            	String userPicSaveName = review.getUserPicSaveName();
            	String userSkinTone = review.getUserSkinTone();
            	String featuer2Name = review.getFeatuer2Name();

            	String reviewMainPicPath = review.getReviewMainPicPath();
            	String reviewMainPicSaveName = review.getReviewMainPicSaveName();
            	String reviewScore = review.getReviewScore();
            	String reviewTitle = review.getReviewTitle(); 
            	String regDate = review.getRegDate();
            	String brandName = review.getBrandName();
            	String replyCount = review.getReplyCount();
            	String scrapCount = review.getScrapCount();
         %>
         <div class="col-md-3" style = "height:65%">
            <div class="thumbnail" >
               <div class="image">
                  <img src="<%=reviewMainPicPath %>/<%= reviewMainPicSaveName%>" width="100%" height="180px" style="display: table; margin-left: auto; margin-right: auto;" class="hotimages">
               </div>
               <div class="caption">
                  <a href = "/reviewShow.hang?reviewCode=<%=postingCode%>">
                  	<h6><B><%= reviewTitle %></B></h6>
                  	<P>
                  	<h5><B></B></h5>
                  </a>
                  <hr style = "margin-top:-1%;"><p>
                  <img src="<%=userPicPath %>/<%=userPicSaveName %>" width="40px" height="40px" class="img-circle" />
                     <font size = "3"><b><%=userName %></b></font>&nbsp;&nbsp;
                     <font size = "2"><%= featuer2Name%></font>&nbsp;&nbsp;
                     <font size = "2"><%=userSkinTone %></font><p>
                     <font size = "2"><%=reviewScore %></font>
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
     		<font size="30">���䰡 �����ϴ�.</font>
     <%
        }
	 %>
		</div>
	</div>
</body>
