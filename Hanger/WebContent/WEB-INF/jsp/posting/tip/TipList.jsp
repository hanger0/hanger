<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page import = "java.util.*" %>

<body>
   <div class="container" style = "width:80%;display:table;margin-left:auto;margin-right:auto">
      <!-- �� �ۼ� ���� -->
      <div class="row" style = "background-color:#EBEBEB">
         <h2>
            <b><p style="display: table; margin: 15px 0 0 12px;">Tip</p></b>
         </h2>
         <!--  �� �ۼ� �� -->

         <%
            for (int i = 0; i < 20; i++) {
         %>
         <div class="col-md-3" style = "height:65%">
         <a href="mainReview.hang">
            <div class="thumbnail" >
               <div class="image">
                  <img src="images/14.jpg" width="100%" height="180px" style="display: table; margin-left: auto; margin-right: auto;" class="hotimages">
               </div>
               <div class="caption">
                  <h6><B>�̻�</B></h6>
                  <P>
                  <h5><B>[M] ���� ��� ���̽�ó SPF50+ PA+++ [21ȣ]</B></h5></a>
                  <hr style = "margin-top:-1%;"><p>
                  <img src="images/wonbin.PNG" width="40px" height="40px" class="img-circle" />
                     <font size = "3"><b>�迹��</b></font>&nbsp;&nbsp;
                     <font size = "2">�Ǽ�</font>&nbsp;&nbsp;
                     <font size = "2">21ȣ</font>
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
         %>
</body>