<%@ page contentType="text/html; charset=euc-kr"%>
<%
	String myName="";
	if(session != null && session.getAttribute("loginYn")!=null && ((String)session.getAttribute("loginYn")).equals("Y")) {
		myName = (String)session.getAttribute("myUserName");
	}
%>
<header id ="header">
   <!--기본페이지에는 이거보임-->
   <div style="width: 100%;"
      class="hidden-xs navbar navbar-default navbar-fixed-top navbar HOME"
      role="navigation">
      <div class="navbar-header">
         <a class="navbar-brand" href="/"> <img style="height: 32px; padding: 3px 0;"
            src="images/hanger.png" id="brand-icon" alt="Hanger" />
         </a>
      </div>
      <form class="navbar-form navbar-left" role="search">
         <div class="form-group">
            <input type="text" class="form-control" placeholder="Search">
         </div>
         <button type="submit" class="btn btn-default">검색</button>
      </form>
      <div class="collapse navbar-collapse">
         <ul class="nav navbar-nav navbar-right unpa-navbar-right">
         <li></li>
<%
	if(session != null && session.getAttribute("loginYn")!=null && ((String)session.getAttribute("loginYn")).equals("Y")) {
%>
			<li><a href="/relationFollowingSearch.hang"><img src="images/icons/top/mypage.jpg" /></a></li>
			<li><a href="#"><img src="images/icons/top/friend.jpg" /></a></li>
			<li><a href="#"><img src="images/icons/top/cart.jpg" /></a></li>
			<li><a href="#"><img src="images/icons/top/ball.jpg" /></a></li>
			<li><a href="/logout.hang"><img src="images/icons/top/option.jpg" /></a></li>
<%
	} else {
%>
            <li><a href="/login.hang" class="remove-border">로그인</a></li>
            <li><a href="/join.hang" class="remove-border">회원가입</a></li>
<%
	}
%>
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
            <li><a href="#" style="margin-left: 150px">SHOP</a></li>
            <li><a href="#">BRAND</a></li>
            <li><a href="#">SALE</a></li>
         </ul>
      </div>
      <div style="width: 50%; float: right; margin-top: 50px">
         <ul class="nav nav-pills">
            <li><a href="#" style="margin-left: 100px;">REVIEWS</a></li>
            <li><a href="#">TIPS</a></li>
            <li><a href="#">HANG OUT</a></li>
         </ul>
      </div>
   </div>
   <!-- 기본페이지 END -->
   <!-- 작은페이지 start -->
   <div class="container">
      <div style="width: 100%;"
         class="visible-xs navbar navbar-default navbar-fixed-top navbar HOME"
         role="navigation">
         <div style="margin: 15px">
            <img src="images/hanger.png" style="float:left;"/>
            <input type="text" placeholder="search for.." style="float:left;">
            <button class="btn btn-default" style="float:left;">검색</button>
<%
	if(session != null && session.getAttribute("loginYn")!=null && ((String)session.getAttribute("loginYn")).equals("Y")) {
%>
			<button class="btn btn-default" style="float: right;">로그아웃</button>
<%
	} else {
%>
            <li><a href="/login.hang" class="remove-border" style="float: right;">로그인</a></li>
            <li><a href="/join.hang" class="remove-border" style="float: right;">회원가입</a></li>
<%
	}
%>
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
   <!-- 작은페이지 END -->
</header>