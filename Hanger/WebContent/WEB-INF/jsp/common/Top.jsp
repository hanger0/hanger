<%@ page contentType="text/html; charset=euc-kr"%>
<LINK rel="stylesheet" type="text/css" href="css/top.css" />
<SCRIPT src="js/jquery-2.1.3.min.js"></SCRIPT>
<%
	String name="";
	if(session != null && session.getAttribute("loginYn")!=null && ((String)session.getAttribute("loginYn")).equals("Y"))
	{
		name = (String)session.getAttribute("name");
		System.out.println(name);
	}
%>

<SCRIPT>
	$(function(){
		$('#searchimg').click(function(){
			var keyword=$('input:text[name=keyWord]').val();
			if(keyword==""){
				alert("검색어를 입력하세요!");
				return false;
			}
			storeListForm.submit();
		
		});

		// 로그인
		$('#loginImg').click(function(){
			location.href="/WEB/member/LoginDetail.jsp";
		});

		// 로그아웃
		$('#logoutImg').click(function(){
			location.href="/myMemberServlet.mo?func=member_002";
		});

		// 회원가입
		$('#joinImg').click(function(){
			location.href = "/member/JoinSelect.jsp";
		});

		// 장바구니
		$('#cartImg').click(function(){
			location.href = "/cartServlet.mo?func=cart_view";
		});

		// 판매자 마이페이지
		$('#sellerMyPage').click(function(){
			location.href = "/sellerManageServlet.mo?func=seller_012";
		});

		// 구매자 마이페이지
		$('#buyerMyPage').click(function(){
			location.href = "/myPageServlet.mo?func=buyer_mypage_all";
		});
	});
	
</SCRIPT>


<header id ="header">
	<div style="width: 100%;"
      class="hidden-xs navbar navbar-default navbar-fixed-top unpa-navbar HOME"
      role="navigation">
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
            <button type="submit" class="btn btn-default">검색</button>
         </form>
         <!-- 기본페이지에는 이거보임 -->
         <div class="collapse navbar-collapse">
            <ul class="nav navbar-nav navbar-right unpa-navbar-right">
               <li>
                  <button class="compose-button sign-in-require-action">
                     <i class="unpacon-pencil"></i>
                  </button>
               </li>
               <li><a href="/signin" class="remove-border">로그인</a></li>
               <li><a href="/signin" class="remove-border">회원가입</a></li>
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
   <!--  기본페이지 end -->
   <!-- 화면이작아지면 보이는페이지 -->
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
         href="/signin"> 로그인 </a>
      </span> <span class="right" style="margin-right: 80px;"> <a
         class="unpa-xs-navbar-menu sign-in" href="/signin"> 회원가입 </a>
      </span>
   </div>
   <!-- 화면이작으면 보이는 페이지 END -->
</header>


