<%@ page contentType="text/html; charset=euc-kr"%>
<%
	String name="";
	if(session != null && session.getAttribute("loginYn")!=null && ((String)session.getAttribute("loginYn")).equals("Y"))
	{
		name = (String)session.getAttribute("name");
	}
%>

<header id ="header">
   <!--�⺻���������� �̰ź���-->
   <div style="width: 100%;"
      class="hidden-xs navbar navbar-default navbar-fixed-top navbar HOME"
      role="navigation">
      <div class="navbar-header">
         <a class="navbar-brand" href="/"> <img
            style="height: 32px; padding: 3px 0;"
            src="/assets/images/hanger.png" id="brand-icon" alt="Hanger" />
         </a>
      </div>
      <form class="navbar-form navbar-left" role="search">
         <div class="form-group">
            <input type="text" class="form-control" placeholder="Search">
         </div>
         <button type="submit" class="btn btn-default">�˻�</button>
      </form>
      <div class="collapse navbar-collapse">
         <ul class="nav navbar-nav navbar-right unpa-navbar-right">
            <li></li>
            <li><a href="/signin" class="remove-border">�α���</a></li>
            <li><a href="/signin" class="remove-border">ȸ������</a></li>
         </ul>
      </div>
   </div>
   </div>
   <div
      class="hidden-xs navbar navbar-default navbar-fixed-top unpa-navbar HOME"
      style="width: 100%; position: fixed; z-index: 1000;">
      <div
         style="width: 50%; float: left; background: red; margin-top: 50px">
         <ul class="nav nav-pills">
            <li><a href="#" style="margin-left: 150px">SHOP</a>
            <li><a href="#">BRAND</a>
            <li><a href="#">SALE</a>
         </ul>
      </div>
      <div style="width: 50%; float: right; margin-top: 50px">
         <ul class="nav nav-pills">
            <li><a href="#" style="margin-left: 100px;">REVIEWS</a>
            <li><a href="#">TIPS</a>
            <li><a href="#">HANG OUT</a>
         </ul>
      </div>
   </div>
   <!-- �⺻������ END -->
   <!-- ���������� start -->
   <div class="container">
      <div style="width: 100%;"
         class="visible-xs navbar navbar-default navbar-fixed-top navbar HOME"
         role="navigation">
         <div style="margin: 15px">
            <img src="images/test.png" style="float:left;"/>
            <button class="btn btn-default" style="float: right;">ȸ������</button>
            <button class="btn btn-default" style="float: right;">�α���</button>
            
            <input type="text" placeholder="search for.." style="float:left;">
            <button class="btn btn-default" style="float:left;">�˻�</button>
         
         </div>
      </div>
   </div>
   <div
      class="visible-xs navbar navbar-default navbar-fixed-top unpa-navbar HOME"
      style="width: 100%; position: relative; z-index: 1000;">
      <div
         style="width: 50%; float: left; background: red; margin-top: 50px">
         <ul class="nav nav-pills">
            <li><a href="#" style="margin-left: 100px">SHOP</a>
            <li><a href="#">BRAND</a>
            <li><a href="#">SALE</a>
         </ul>
      </div>
      <div style="width: 50%; float: right; margin-top: 50px">
         <ul class="nav nav-pills">
            <li><a href="#" style="margin-left: 50px;">REVIEWS</a>
            <li><a href="#">TIPS</a>
            <li><a href="#">HANG OUT</a>
         </ul>
      </div>
   </div>
   <!-- ���������� END -->
</header>