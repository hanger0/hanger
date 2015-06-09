<%@ page contentType="text/html;charset=euc-kr" %>
 
<link href="css/Follow/follow.css" rel="stylesheet" />
<script type="text/javascript">
$(document).ready(function($){
   
   $('#mega-menu-3').dcMegaMenu({
      rowItems: '7',
      speed: 'fast',
      effect: 'fade'
   });
   $('#mega-menu-9').dcMegaMenu({
      rowItems: '3',
      speed: 'fast',
      effect: 'fade'
   });
});
</script>
<STYLE>
body
{
   background-color:#EBEBEB;
}
.container
{
   width:90%;
   background-color:#EBEBEB;
}
.advertise
{
   margin-top:20px;
   background-color:red;
   width:100%;
   height:200px;
}
.item
{
   width:100%;
   height:200px;
}
.adimg
{
   width:100%;
   height:200px;
}
.hotitem
{
   margin-top:20px;
}
.titles
{
   margin-left:20px;
}
.thumbnail
{
   height:350px;
}
.hotimages
{
   width:100%;
   height:165px;
}
.img-thumbnail
{
   width:100%;
   height:165px;
}
.rat
{
   margin-left:0px;
}
.rats
{
   height:250px;
}

.nomithumb
{
   height:200px;
}
.image
{
   width:100%;
   height:165px;
}
.caption
{
   margin-top:0px;
}
.peopleimage
{
   width:100%;
   height:165px;
}
.more{
	float:right;
	cursor:pointer;
}
</STYLE>
<body>

<!-- 광고 -->
<br><BR>
      <div class="advertise" style = "display:table;margin-left:auto;margin-right:auto;width:78%;">
         <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
            <!-- Indicators -->
            <ol class="carousel-indicators">
               <li data-target="#carousel-example-generic" data-slide-to="0"
                  class="active"></li>
               <li data-target="#carousel-example-generic" data-slide-to="1"></li>
               <li data-target="#carousel-example-generic" data-slide-to="2"></li>
            </ol>

            <!-- Wrapper for slides -->
            <div class="carousel-inner" role="listbox">
               <div class="item active">
                  <img src="images/wide1.jpg" class="adimg">
                  <div class="carousel-caption">wide1.jpg</div>
               </div>
               <div class="item">
                  <img src="images/wide2.jpg" class="adimg">
                  <div class="carousel-caption">wide2.jpg</div>
               </div>
               <div class="item">
                  <img src="images/wide3.jpg"  class="adimg">
                  <div class="carousel-caption">wide3.jpg</div>
               </div>
            </div>

            <!-- Controls -->
            <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev"> 
               <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
               <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
               <span class="sr-only">Next</span>
            </a>
         </div>
      </div>
<!-- 광고 끝 -->
<script>
   function productBuy() {
      location.href = "ProductBuy.jsp"
   }
</script>
   <div class="container" style = "width:80%;">
            <!-- 인기상품 -->
         <div class="row hotitem">
            <form class = "navbar-form">
               <div class = "row" style = "width:100%;margin-left:0%;">
                  <font size = "4" style="float:left;"><b>인기상품</b>Popluar</font>
                  <div class = "more"><a href="/shopList.hang">더 보기</a></div>
               </div>
            </form>
<%
for(int i=0; i<4; i++)
{
%>
               <div class="col-md-3">
                  <div class="thumbnail" style = "width:100%">
                     <div class="image">
                        <img src="images/omnia.jpg" class="hotimages" onClick = "productBuy()">
                     </div>
                     <div class="caption">
                        <font size = "3"><font color = "gray"><b>올리브 영</b></font></font><p><Br>
                        <font size = "4"><b>슈퍼 아쿠아 수분크림(80ml)</b></font><p><br>
                        <font size = "2"><b>가격&nbsp;&nbsp;&nbsp;</b><font color = "gray">19,000원</font></font>
                     </div>
                  </div>
               </div>
               <%
}
%>
            </div>
            <p><br>
            <!-- 인기상품 끝 -->
            <!-- 리뷰 -->

            <div class="row reviewAndTip">
               <div class="col-md-6 review">
                  <div class="row">
                     <div class = "row" style = "width:94%;margin-left:3%;">
	                     <font size = "4"><b>인기리뷰</b>&nbsp;&nbsp;Review</font>
	                     <div class = "more"><a href="/reviewList.hang">더 보기</a></div>
                     </div>
<script>
   function review() {
      location.href = "DetailReview.jsp";
   }
</script>
<% 
for(int i=0; i<2; i++)
{
%>
                     <div class="col-md-6 rat">
                        <div class="thumbnail">
                           <div class="image">
                              <img src="images/cristalyn.jpg" class="hotimages" onClick = "review()">
                           </div>
                           <div class="caption">
                              <P><h5><B>합리적인 가격에 강력한 워터프루프 아이라이너!</B></h5>
                              <br>
                              <font size = "2"><font color = "gray"><b>아이 메이크업 &nbsp;|&nbsp; 등록리뷰(20)</b></font></font>
                           </div>
                        </div>
                     </div>
<%
}
%>
                  </div>
               </div>
               <!-- 리뷰 끝  -->

               <!-- 팁 -->
               <div class="col-md-6 review">
                  <div class="row">
                     <div class = "row" style = "width:94%;margin-left:3%">
                        <font size = "4"><b>인기 팁</b>&nbsp;&nbsp;Tip</font>
                        <div class = "more"><a href="/tipList.hang">더 보기</a></div>
                     </div>
                     <script>
                        function tip() {
                           location.href = "TipPage.jsp"
                        }
                     </script>
<% 
for(int i=0; i<2; i++)
{
%>
                     <div class="col-md-6 rat">
                        <div class="thumbnail">
                           <div class="image">
                              <img src="images/hommesun.jpg" class="hotimages" onClick = "tip()">
                           </div>
                           <div class="caption">
                              <P>
                              <h5><B>청순하게 때론 섹시하게 그라데이션 하는 법!</B></h5>
                              <br>
                                 <font size = "2"><font color = "gray"><b>아이 메이크업 &nbsp;|&nbsp; 등록리뷰(10)</b></font></font>
                           </div>
                        </div>
                     </div>
<%
}
%>
                  </div>
               </div>
               <!-- 팁 끝 -->
            </div>
            <!-- 띄어쓰기 -->
            <p><br>
            <!-- 추천 사용자 -->
            <div class="row nominateuser">
            <h4 class="titles">
               <B>팔로잉 Following</b>
            </h4>
<% 
for(int i=0; i<6; i++)
{
%>   
               <div class="col-md-2">            
                     <div class="unpa-card user-card followable  followed">

                     <!-- 클릭시 사용자 정보로 이동 -->
                     <a href="#">
                        <div class="unpa-user-labels"></div>
                        <div class="user-image"
                           style='background-image: url("/images/juven.PNG");'></div>
                        <div class="user-nickname">동작구사랑방</div>
                        <div class="user-skin-info">
   
                           <!-- 피부 건성인지 지성인지 -->
                           <div class="empty">미입력</div>
                           <!-- 피부 몇호인지 ex 23호 -->
                           <div class="empty">미입력</div>
                        </div>
                        <div class="user-count-info">
                           <div>
                              <!--  팔로우 수 -->
                              <span class="glyphicon glyphicon-user" aria-hidden="true"></span>&nbsp3
                           </div>
                           <!--  글쓴 수 -->
                           <div>
                              <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>&nbsp1
                           </div>
                           <!-- 좋아요 받은 수  -->
                           <div>
                              <span class="glyphicon glyphicon-heart" aria-hidden="true"></span>&nbsp100
                           </div>
                        </div>
                     </a>
                     <button class="user-follow-button followed">
                        <i class="ion-checkmark-round"></i> 팔로우 중
                     </button>
                     <button class="user-follow-button">
                        <i class="unpacon-user"></i> 팔로우
                     </button>
                  </div>
               </div>
<%
}
%>
            </div>
         </div>
      </body>
