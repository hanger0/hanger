<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page import="com.hanger.posting.review.vo.ReviewListVo" %>
<%@ page import = "java.util.*" %>
<%
		ArrayList reviewList = (ArrayList)request.getAttribute("reviewList");
%>

<body>
   <div class="container" style = "width:80%;display:table;margin-left:auto;margin-right:auto">
      <!-- 팁 작성 시작 -->
      <div class="row" style="background-color:#EBEBEB;">
         <h2>
            <b><p style="display: table; margin: 15px 0 0 12px;">My Review</p></b>
         </h2>
         <!--  팁 작성 끝 -->

         <%
        if(reviewList != null && reviewList.size() > 0){
            for (int i = 0; i < reviewList.size(); i++) {
            	ReviewListVo review = (ReviewListVo)reviewList.get(i);
            	String title = review.getReviewTitle();
            	String postingCode = review.getPostingCode();
         %>
         <div class="col-md-3" style = "height:65%">
            <div class="thumbnail" >
               <div class="image">
                  <img src="images/14.jpg" width="100%" height="180px" style="display: table; margin-left: auto; margin-right: auto;" class="hotimages">
               </div>
               <div class="caption">
                  <a href = "/mainReview.hang?postingCode=<%=postingCode%>">
                  	<h6><B><%= postingCode %></B></h6>
                  	<P>
                  	<h5><B><%= title %></B></h5>
                  </a>
                  <hr style = "margin-top:-1%;"><p>
                  <img src="images/wonbin.PNG" width="40px" height="40px" class="img-circle" />
                     <font size = "3"><b>김예림</b></font>&nbsp;&nbsp;
                     <font size = "2">건성</font>&nbsp;&nbsp;
                     <font size = "2">21호</font>
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

        } else {
     %>
     		<font size="30">리뷰가 없습니다.</font>
     <%
        }
	 %>
		</div>
	</div>
</body>