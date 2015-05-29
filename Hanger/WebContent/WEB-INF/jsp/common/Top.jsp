<%@ page contentType="text/html; charset=euc-kr"%>
<%
	String name="";
	if(session != null && session.getAttribute("loginYn")!=null && ((String)session.getAttribute("loginYn")).equals("Y"))
	{
		name = (String)session.getAttribute("name");
	}
%>

<header id ="header">
	<div style="width: 100%;" class="hidden-xs navbar navbar-default navbar-fixed-top unpa-navbar HOME" role="navigation">
      <div class="container">

         <div class="navbar-header">
            <a class="navbar-brand" href="/">
            	<img style="height: 32px; padding: 3px 0;" src="/images/hanger.png" id="brand-icon" alt="Hanger" />
            </a>
         </div>

         <form class="navbar-form navbar-left" role="search">
            <div class="form-group">
               <input type="text" class="form-control" placeholder="Search">
            </div>
            <button type="submit" class="btn btn-default">�˻�</button>
         </form>
         <!-- �⺻���������� �̰ź��� -->
         <div class="collapse navbar-collapse">
            <ul class="nav navbar-nav navbar-right unpa-navbar-right">
               <li>
                  <button class="compose-button sign-in-require-action">
                     <i class="unpacon-pencil"></i>
                  </button>
               </li>
               <li><a href="/login.hang" class="remove-border">�α���</a></li>
               <li><a href="/join.hang" class="remove-border">ȸ������</a></li>
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
   <!--  �⺻������ end -->
   <!-- ȭ�����۾����� ���̴������� -->
   <div
      class="visible-xs navbar navbar-default navbar-fixed-top unpa-navbar HOME"
      style="width: 100%; position: fixed; z-index: 1000; margin: 50px 0px 0px;">
      <div style="width: 50%; float: left; background: red;">
         <ul class="nav navbar-nav navbar-middle unpa-navbar-middle">
            <a href="#" style="margin-left:120px">SHOP</a>
            <a href="#">BRAND</a>
            <a href="#">SALE</a>
         </ul>
      </div>
      <div style="width: 50%; float: right; background: pink;">
         <ul class="nav navbar-nav navbar-middle unpa-navbar-middle">

            <span class="text-right"> <a class="unpa-xs-navbar-menu sign-in"
               href="/signin" style="margin-left: 70px;"> REVIEWS </a> <a
               class="unpa-xs-navbar-menu sign-in" href="/signin">TIPS </a> <a
               class="unpa-xs-navbar-menu sign-in" href="/signin">HANG OUT </a>
            </span>
         </ul>
      </div>
   </div>
   <div id="unpa-xs-navbar"
      class="visible-xs navbar navbar-default navbar-fixed-top unpa-navbar HOME"
      role="navigation">
      <div class="navbar-header">
         <a class="navbar-brand" href="/"> <img
            style="height: 32px; padding: 3px 0;"
            src="/images/hanger.png" id="brand-icon" alt="Hanger" />
         </a>
      </div>
      </span> <span class="right"> <a class="unpa-xs-navbar-menu sign-in"
         href="/signin"> �α��� </a>
      </span> <span class="right" style="margin-right: 80px;"> <a
         class="unpa-xs-navbar-menu sign-in" href="/signin"> ȸ������ </a>
      </span>
   </div>
   <!-- ȭ���������� ���̴� ������ END -->
</header>