<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page import = "java.util.*" %>
<%@ page import = "com.hanger.posting.review.vo.ReviewVo" %>
<%
	ArrayList<ReviewVo> myReviewList = (ArrayList<ReviewVo>)request.getAttribute("reviewList");
%>


<body>
	<div class="container" style="width:100%">
		<!-- 府轰 累己 矫累 -->
		<div class="row hotitem" style = "width:100%;display:table;margin-left:auto;margin-right:auto">
			<font size="4">
			<div class = "title" style = "width:97.7%;display:table;margin-left:auto;margin-right:auto">
				<b>MyReview</b>
			</div>
			</font>
			<br>
			<!--  屏 累己 场 -->

			<%
				for (int i = 0; i < myReviewList.size(); i++) {
					ReviewVo reviewList = myReviewList.get(i);
					
					String userPicPath = reviewList.getUserPicPath();
					String brandName = reviewList.getBrandName();
					String reviewTitle = reviewList.getReviewTitle();
			%>
			
			<div class="col-sm-6 col-md-3">
				<div class="thumbnail" style="margin-left: -5%; display: table; margin-left: auto; margin-right: auto">
					<div class="image">
						<img src="images/test.png" width="200px" height="150px" style="display: table; margin-left: auto; margin-right: auto;"
							class="hotimages">
					</div>
					<div class="caption">
						<P>
						<font size = "2">
							brand
						</font>
						</P>
						<P>
						<font size = "3">
							<B>content</B>
						</font>
						</P>
						reviewScore,regDate
						<hr style="margin-bottom: 3px">
						<div class="Container-fluid" align="center">
							<span class="glyphicon glyphicon-heart">(likeCount)</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<span class="glyphicon glyphicon-pencil">(replyCount)</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<span class="glyphicon glyphicon-tag">(scrapCount)</span>
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
