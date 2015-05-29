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
				alert("�˻�� �Է��ϼ���!");
				return false;
			}
			storeListForm.submit();
		
		});

		// �α���
		$('#loginImg').click(function(){
			location.href="/WEB/member/LoginDetail.jsp";
		});

		// �α׾ƿ�
		$('#logoutImg').click(function(){
			location.href="/myMemberServlet.mo?func=member_002";
		});

		// ȸ������
		$('#joinImg').click(function(){
			location.href = "/member/JoinSelect.jsp";
		});

		// ��ٱ���
		$('#cartImg').click(function(){
			location.href = "/cartServlet.mo?func=cart_view";
		});

		// �Ǹ��� ����������
		$('#sellerMyPage').click(function(){
			location.href = "/sellerManageServlet.mo?func=seller_012";
		});

		// ������ ����������
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
			<SPAN style="font-size:12px;"><SPAN style="color:#4291dc;"><%=name%></SPAN>�� ȯ���մϴ�. | </SPAN>
			<A id="logoutImg" style="cursor:pointer">�α׾ƿ�</A>
<%
	}
	else
	{
%>
			<A id="loginImg" style="cursor:pointer">�α���</A>
<%
	}
%>
<%
	if(session != null && session.getAttribute("loginYn")!=null && ((String)session.getAttribute("loginYn")).equals("Y"))
	{
		if (session.getAttribute("who")!=null && ((String)session.getAttribute("who")).equals("Buyer"))
		{
%>				
			 | <A id="cartImg" style="cursor:pointer">��ٱ���</A>
<%
		}
	}
	else
	{
%>
			 | <A id="joinImg" style="cursor:pointer">ȸ������</A>
<%
	}
	if(session != null && session.getAttribute("loginYn")!=null && ((String)session.getAttribute("loginYn")).equals("Y"))
	{
		if(((String)session.getAttribute("who")).equals("Buyer"))
		{
%>
			 | <A id="buyerMyPage" style="cursor:pointer">����������</A>

<%
		}
		else if(((String)session.getAttribute("who")).equals("Seller"))
		{
%>
			 | <A id="sellerMyPage" style="cursor:pointer">����������</A>
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
				<option value="location">����</option>
				<option value="storeName">��ü��</option>
				<option value="foodName">���ĸ�</option>
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


