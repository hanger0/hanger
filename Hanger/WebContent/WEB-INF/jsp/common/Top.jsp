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
	<nav id="nav1">
		<ul>
			<li>
				<H5>
<%
	if(session != null && session.getAttribute("loginYn")!=null && ((String)session.getAttribute("loginYn")).equals("Y"))
	{
%>
			<SPAN style="font-size:12px;"><SPAN style="color:#4291dc;"><%=name%></SPAN>님 환영합니다. | </SPAN>
			<A id="logoutImg" style="cursor:pointer">로그아웃</A>
<%
	}
	else
	{
%>
			<A id="loginImg" style="cursor:pointer">로그인</A>
<%
	}
%>
<%
	if(session != null && session.getAttribute("loginYn")!=null && ((String)session.getAttribute("loginYn")).equals("Y"))
	{
		if (session.getAttribute("who")!=null && ((String)session.getAttribute("who")).equals("Buyer"))
		{
%>				
			 | <A id="cartImg" style="cursor:pointer">장바구니</A>
<%
		}
	}
	else
	{
%>
			 | <A id="joinImg" style="cursor:pointer">회원가입</A>
<%
	}
	if(session != null && session.getAttribute("loginYn")!=null && ((String)session.getAttribute("loginYn")).equals("Y"))
	{
		if(((String)session.getAttribute("who")).equals("Buyer"))
		{
%>
			 | <A id="buyerMyPage" style="cursor:pointer">마이페이지</A>

<%
		}
		else if(((String)session.getAttribute("who")).equals("Seller"))
		{
%>
			 | <A id="sellerMyPage" style="cursor:pointer">마이페이지</A>
<%
		}
	}
%>
				</H5>
			</li>
		</ul>

	</nav>
	
	<FORM id="storeListForm" action="/storeList.cookpon" method="post">	
		<nav id="nav2">
			<ul>
				<li>
				<a href="/"> <img src="image/cookponlogo.png" width="150" id="logo" style="cursor:pointer" valign="bottom"> </a>		
				</li>
			</ul>
			<select id="select" name="keyType">
				<option value="location">지역</option>
				<option value="storeName">업체명</option>
				<option value="foodName">음식명</option>
			</select>
			<ul>
				<li>
					<input type="text" name="keyWord" id="search">
					<img src="image/search.JPG" style="cursor:pointer" id="searchimg">
				</li>
			</ul>

		</nav>
	</FORM>

</header>


