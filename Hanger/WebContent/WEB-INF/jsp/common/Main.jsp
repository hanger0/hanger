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

<!-- ���� -->
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
<!-- ���� �� -->
<script>
   function productBuy() {
      location.href = "ProductBuy.jsp"
   }
</script>
   <div class="container" style = "width:80%;">
            <!-- �α��ǰ -->
         <div class="row hotitem">
            <form class = "navbar-form">
               <div class = "row" style = "width:100%;margin-left:0%;">
                  <font size = "4" style="float:left;"><b>�α��ǰ</b>Popluar</font>
                  <div class = "more"><a href="/shopList.hang">�� ����</a></div>
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
                        <font size = "3"><font color = "gray"><b>�ø��� ��</b></font></font><p><Br>
                        <font size = "4"><b>���� ����� ����ũ��(80ml)</b></font><p><br>
                        <font size = "2"><b>����&nbsp;&nbsp;&nbsp;</b><font color = "gray">19,000��</font></font>
                     </div>
                  </div>
               </div>
               <%
}
%>
            </div>
            <p><br>
            <!-- �α��ǰ �� -->
            <!-- ���� -->

            <div class="row reviewAndTip">
               <div class="col-md-6 review">
                  <div class="row">
                     <div class = "row" style = "width:94%;margin-left:3%;">
	                     <font size = "4"><b>�α⸮��</b>&nbsp;&nbsp;Review</font>
	                     <div class = "more"><a href="/reviewList.hang">�� ����</a></div>
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
                              <P><h5><B>�ո����� ���ݿ� ������ ���������� ���̶��̳�!</B></h5>
                              <br>
                              <font size = "2"><font color = "gray"><b>���� ����ũ�� &nbsp;|&nbsp; ��ϸ���(20)</b></font></font>
                           </div>
                        </div>
                     </div>
<%
}
%>
                  </div>
               </div>
               <!-- ���� ��  -->

               <!-- �� -->
               <div class="col-md-6 review">
                  <div class="row">
                     <div class = "row" style = "width:94%;margin-left:3%">
                        <font size = "4"><b>�α� ��</b>&nbsp;&nbsp;Tip</font>
                        <div class = "more"><a href="/tipList.hang">�� ����</a></div>
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
                              <h5><B>û���ϰ� ���� �����ϰ� �׶��̼� �ϴ� ��!</B></h5>
                              <br>
                                 <font size = "2"><font color = "gray"><b>���� ����ũ�� &nbsp;|&nbsp; ��ϸ���(10)</b></font></font>
                           </div>
                        </div>
                     </div>
<%
}
%>
                  </div>
               </div>
               <!-- �� �� -->
            </div>
            <!-- ���� -->
            <p><br>
            <!-- ��õ ����� -->
            <div class="row nominateuser">
            <h4 class="titles">
               <B>�ȷ��� Following</b>
            </h4>
<% 
for(int i=0; i<6; i++)
{
%>   
               <div class="col-md-2">            
                     <div class="unpa-card user-card followable  followed">

                     <!-- Ŭ���� ����� ������ �̵� -->
                     <a href="#">
                        <div class="unpa-user-labels"></div>
                        <div class="user-image"
                           style='background-image: url("/images/juven.PNG");'></div>
                        <div class="user-nickname">���۱������</div>
                        <div class="user-skin-info">
   
                           <!-- �Ǻ� �Ǽ����� �������� -->
                           <div class="empty">���Է�</div>
                           <!-- �Ǻ� ��ȣ���� ex 23ȣ -->
                           <div class="empty">���Է�</div>
                        </div>
                        <div class="user-count-info">
                           <div>
                              <!--  �ȷο� �� -->
                              <span class="glyphicon glyphicon-user" aria-hidden="true"></span>&nbsp3
                           </div>
                           <!--  �۾� �� -->
                           <div>
                              <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>&nbsp1
                           </div>
                           <!-- ���ƿ� ���� ��  -->
                           <div>
                              <span class="glyphicon glyphicon-heart" aria-hidden="true"></span>&nbsp100
                           </div>
                        </div>
                     </a>
                     <button class="user-follow-button followed">
                        <i class="ion-checkmark-round"></i> �ȷο� ��
                     </button>
                     <button class="user-follow-button">
                        <i class="unpacon-user"></i> �ȷο�
                     </button>
                  </div>
               </div>
<%
}
%>
            </div>
         </div>
      </body>
