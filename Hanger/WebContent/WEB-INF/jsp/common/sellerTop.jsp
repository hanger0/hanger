<%@ page contentType="text/html; charset=euc-kr" %>
<%
	String currentPage = (String)request.getAttribute("page");	
	String name="";
	if(session != null && session.getAttribute("loginYn")!=null && ((String)session.getAttribute("loginYn")).equals("Y"))
	{
		name = (String)session.getAttribute("name");
		System.out.println(name);
	}
%>
<Link href="/css/sellerTop.css" rel="stylesheet" type="text/css"/>
<SCRIPT src="/js/jquery-2.1.3.min.js"></SCRIPT>
<SCRIPT>
	$(function(){

		var page = '<%=currentPage%>'
		if(page=='foodManage')
		{
			$('#td1').css('background','#595252').css('color','#FFFFFF');	
		}
		else if(page=='couponManage')
		{
			$('#td2').css('background','#595252').css('color','#FFFFFF');	
		}
		else if(page=='storeInfoManage')
		{
			$('#td3').css('background','#595252').css('color','#FFFFFF');	
		}
		else if(page=='outLinePage')
		{
			$('#td4').css('background','#595252').css('color','#FFFFFF');	
		}




		$('#logo').click(function(){
			location.href="/";
		});

		$('#premiumBtn').click(function(){
			alert('프리미엄 등록');
		});
		// 로그아웃
		$('#logoutImg').click(function(){
			location.href="/myMemberServlet.mo?func=member_002";
		});
		// 판매자 마이페이지
		$('#sellerMyPage').click(function(){
			location.href = "/sellerManageServlet.mo?func=seller_001";
		});

		

		$('.sellerMenuClass').each(function(){
			$(this).click(function(){			
			var url = $(this).attr('url');
			location.href="/sellerMyPage"+url;
			});	
		});
	});

</SCRIPT>
<DIV>
	<TABLE width="1000px" bgcolor="#EAEAEA">
		<TR>
			<TD align="right" colspan="4"><H5><SPAN style="color:#4291dc"><%=name%></SPAN>님 환영합니다. | 
			<A id="logoutImg" style="cursor:pointer">로그아웃</A>
			 | <A id="sellerMyPage" style="cursor:pointer">마이페이지</A></H5>
			</TD>
		</TR>
		<TR>
			<TD id="title" height="70px" colspan="4"><B><a href="/"> <img src="/image/cookponlogo.png" style="cursor:pointer" id="logo" width="150"> </a></B></TD>
		</TR>
	</TABLE>
	<img src="/image/seller.jpg" width=1000px height=60px>
	<DIV id="menuDiv">
		<TABLE id="menuTable" border="0" cellspacing="0" cellpadding="2px" align="center" width="700px" height="60px" bgcolor="#FFFFFF" >
			<TR>
				<TD class="sellerMenuClass" id="td4" width="25%" align="center" url=".cookpon">
					개요
				</TD>
				<TD class="sellerMenuClass" id="td1" width="25%" align="center" url="/foodManage.cookpon">
					상품관리
				</TD>
				<TD class="sellerMenuClass" id="td2" width="25%" align="center" url="/couponManage.cookpon">
					쿠폰관리
				</TD>
				<TD class="sellerMenuClass" id="td3" width="25%" align="center" url="/storeInfoManage.cookpon">
					판매관리
				</TD>
			</TR>
		</TABLE>
	</DIV>
</DIV>

