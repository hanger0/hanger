<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import = "com.hanger.posting.review.vo.ReviewShowVo" %>

<%
   ReviewShowVo review = (ReviewShowVo)request.getAttribute("review");
   
   //review
   String reviewTitle = review.getReviewTitle();
   String reviewContent = review.getReviewContent();
   String reviewScore = review.getReviewScore();
   String reviewDate = review.getReviewRegDate();
   String reviewLikeCnt = review.getReviewLikeCnt();
   String reviewReplyCnt = review.getReviewReplyCnt();
   String reviewScrapCnt = review.getReviewScrapCnt();
   
   //item
   String itemGroupCode = review.getItemGroupCode();
   String itemBrandName = review.getItemBrandName();
   String itemName = review.getItemName();
   String itemSummaryInfo = review.getItemSummaryInfo();
   String itemPicPath = review.getItemPicPath();
   String itemPicSaveName = review.getItemPicSaveName();
   int maxPrice = review.getItemMaxPrice();
   int minPrice = review.getItemMinPrice();
   
   //writer
   String writerUserCode = review.getWriterCode();
   String writerName = review.getWriterName();
   String writerSkinType = review.getWriterSkinType();
   String writerSkinTone = review.getWriterSkinTone();
   String writerPicPath = review.getWriterPicPath();
   String writerPicSaveName = review.getWriterPicSaveName();
   String writerFollowerCnt = "" + (Integer.parseInt(review.getWriterFollowerCnt()) - 1);
   String writerPostingCnt = review.getWriterPostingCnt();
   String writerPostingLikeCnt = review.getWriterPostingLikeCnt();
%>    
        
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/Follow/follow.css" />
<style>
.myicon
{
   font-size:30px;
   color:gray;
}
.col1
{
   width:9%;
   padding-top:7px;
   padding-left:30px;
   
}
.rebtn
{
   font-size:30px;
}
</style>

<body style = "background-color:#EBEBEB">
<br><BR><br>   
   <!-- ������ ���� -->
        <div class="container" style = "width:100%;">
    <!-- left menu -->
   <div class ="thumbnail" style = "width:16%;float:left;margin-left:3%;" align = "center" >
      <div class="unpa-card user-card followable followed">
                     <!-- Ŭ���� ����� ������ �̵� -->
                     <a href="#">
                        <div class="unpa-user-labels"></div>
                        <div class="user-image"
                           style='background-image: url("<%=writerPicPath %>/<%=writerPicSaveName %>");'></div><br>
                        <div class="user-nickname"><%=writerName %></div>
                        <div class="user-skin-info">
   
                           <!-- �Ǻ� �Ǽ����� �������� -->
                           <div class="empty"><%=writerSkinType %></div>
                           <!-- �Ǻ� ��ȣ���� ex 23ȣ -->
                           <div class="empty"><%=writerSkinTone %></div>
                        </div><p><p><p>
                        <div class="user-count-info">
                           <div>
                              <!--  �ȷο� �� -->
                              <span class="glyphicon glyphicon-user" aria-hidden="true"></span>&nbsp<%=writerFollowerCnt %>
                           </div>
                           <!--  �۾� �� -->
                           <div>
                              <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>&nbsp<%=writerPostingCnt %>
                           </div>
                           <!-- ���ƿ� ���� ��  -->
                           <div>
                              <span class="glyphicon glyphicon-heart" aria-hidden="true"></span>&nbsp<%=writerPostingLikeCnt %>
                           </div>
                        </div>
                     </a>
                     <button class="user-follow-button followed">
                        <span class="glyphicon glyphicon-user"></span> �ȷο� ��
                     </button>
                     <button class="user-follow-button">
                        <i class="unpacon-user"></i> �ȷο�
                     </button>
                  </div>
   </div>
   <!-- left menu �� -->
   
    <!-- ���� �ۼ� ���� -->
        <div class="thumbnail" style = "width:75%;float:right;margin-right:4%;"><br>
           <div class = "select" style = "margin-top:10px" align = "center"><p>
            <div class = "top" style ="width:930px;height:50px">
               <span class = "glyphicon glyphicon-heart myicon" style = "margin-right:150px">
                  <font size = "6" color="black">���ƿ�(<%=reviewLikeCnt %>)</font>
               </span>
               <span class = "glyphicon glyphicon-pencil myicon" >
                  <font size = "6"color="black">���(<%=reviewReplyCnt %>)</font>
               </span>
               <span class = "glyphicon glyphicon-tag myicon" style = "margin-left:150px">
                  <font size = "6"color="black">��ũ��(<%=reviewLikeCnt %>)</font>
               </span>
               <br>      
            </div>
           </div>
         <!-- ���� -->
         <hr>
            <div class = "info" style = "width:94%;margin-left:3%;margin-top:10px;" align = "center">
               
               <div class ="reviewTitle">
               	<font size = "5"><b><%= reviewTitle %></b></font>
               </div>
               <hr>
               <div class = "brandInfo" style = "width:100%;">
                  <div class = "brand">
                     <font size = "4"><%=itemBrandName %></font>
                     <br><br>
                  </div>
                  <div class="images">
                  	<img src="<%=itemPicPath %>/<%=itemPicSaveName %>" style="background-color:white;width:360px;height:180px">
                  </div>
                  <br>
                  <div class = "itemInfo">
                     <font size = "5">
                     	<a href="/itemView.hang?itemGroupCode=<%=itemGroupCode%>" style="color:black">
                     		<%=itemName %>
                     	</a>
                     </font>
                  </div>
                  	<br>
	               <div class = "product" style = "width:100%;height:30px;" >
	                  <font color = "gray" size = "2" style = "margin-right:15px">
	                  	����
	                  </font>
	                  <font size = "3" style = "margin-right:15px">
	                     <%
	                              if(minPrice == maxPrice){
	                        %>
	                              <%=maxPrice %>��
	                        <%
	                              } else {
	                         %>
	                                 <%=minPrice %>�� ~ <%=maxPrice %>��
	                         <%
	                              }
	                         %>
	                  </font>
	                 
	               </div>
	               
               </div>
                <br>
               <hr>
            <!--
               <div class = "like" style = "width:100%;height:auto;" align = "left">
                  <font size = "4" style = "margin-left:12px">�̷��в� ��õ�� �����!</font><br><Br>
                  <div class = "title" style = "height:auto;width:100%;">
                     <div class= "row" style="height:auto;">
                        <div class="col-sm-1 col1">
                           <center>
                              <font size = "4"><font color = "orange">��õ</font></font>
                              </center>
                        </div>
                        <div class="col-sm-11"style="width:90%;margin-top:8px">
                           �Լ��� �����ϰ� �ָ��� �����źе鲲 ��õ! �� ���� �Ӹ����� �߳����� ���Ѱ� �ְ��� �����ο� �θ� �嶯�̴ٶ�� �е鲴 ����õ.
                        </div>
                     </div>
                  </div>
                  <hr>
               </div>
            -->
            </div>
         <!-- �α��ǰ -->
            <div class="row hotitem" style = "margin-left:3%;margin-top:10px;width:94%;" align = "center">
               <div class = "userinfo">
                  <%=reviewContent %>
               </div>
            </div>
            <br><br>
            <hr>
            <div class ="review" style = "margin-left:3%;margin-top:10px;width:94%;">
<%
       for(int i = 0; i < 6; i++) {
 %>      
       <div class = "review" style = "width:100%;height:100px;">
         <div class="replyimg col-sm-1">
            <img src="images/yebin.jpg" alt="����¥��" class="img-circle reimgs" style = "width:100px;height:100px">
         </div>
         <div class = "name" style = "width:400px;height:30px;float:left;margin-left:5%;">
            <font size = "3"><b>���۱� �����</b></font>
            <font size = "2" style = "margin-left:3%"><font color = "gray">2015�� 6�� 8��</font></font>
         </div>
         <br>
         <BR>
         <div class = "name" style = "width:700px;height:60px;float:left;margin-left:5%;">
            <font size = "2">
               ddzzzzzz
            </font> 
         </div>
      </div>
      <hr>
<%
       }
%>   
            </div>
           </div>
            <div class="thumbnail" style = "width:75%;float:right;margin-right:4%;">
              <div class="replywrite" style = "margin-left:2%" >
               <div class="replyimg col-sm-1" style = "width:20%;">
                  <img src="images/yebin.jpg" alt="" class="img-circle rewriteimg" style = "width:80px;height:80px;">
               </div>
               <div class="replyinsert col-sm-10" style = "width:77%;margin-left:-10%;margin-top:1.5%">
                  <input type="text" class="form-control insert" rows="1" style="resize:none;width:100%;height:50px"/>
               </div>
               <div class="replybtn col-sm-1" style = "width:10%;margin-left:-2.3%;margin-top:1.5%">
                  <button style = "width:100px;height:50px">
                     <span class="glyphicon glyphicon-pencil rebtn" aria-hidden="true"></span>
                  </button>
               </div>
            </div>      
           </div>
        </div>
    </body>