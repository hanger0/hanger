<%@ page contentType="text/html;charset=euc-kr" %>

<%
	String mainUrl = (String)request.getAttribute("mainUrl");
	String message = "";
	if(request.getAttribute("message")!=null && ((String)request.getAttribute("message")).length()>0)
	{
		message = (String)request.getAttribute("message");
	}
	boolean loginYn = false;
	if(session != null && session.getAttribute("loginYn")!=null && ((String)session.getAttribute("loginYn")).equals("Y"))
	{
		loginYn = true;
	}
%>
<HTML>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="/js/jquery-2.1.3.min.js" type="text/javascript"></script>
<script src="/js/common/common.js" type="text/javascript"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!-- JQuery 종료 -->
<<script type="text/javascript">
$(document).ready( function() {
	$('.dropdown-toggle').dropdown();
});
</script>
<STYLE>
#floating {
  position: fixed;
  right: 35px;
  bottom:1px;
  text-align:center;
  
}
#mainReviewBtn
{
	width:200px;
	height:35px;
	right:20px;
	border-radius:0;
	color:white;
	font-size:20px;
	-o-transition:color .0.5s ease-out, background 0.5s ease-in;
  	-ms-transition:color .0.5s ease-out, background 0.5s ease-in;
  	-moz-transition:color .0.5s ease-out, background 0.5s ease-in;
  	-webkit-transition:color .0.5s ease-out, background 0.5s ease-in;
  	/* ...and now override with proper CSS property */
  	transition:color .0.5s ease-out, background 0.5s ease-in;
}

#mainReviewBtn
{
	background:black;
}
#mainReviewBtn:hover, #mainReviewBtn:focus, #mainReviewBtn:active, #mainReviewBtn.active, .open > .dropdown-toggle#mainReviewBtn
{
	background:#FF2211;
}

#dropdown-menu
{
	width:200px;
	height:500px;
	overflow:auto;
}
.dropimg
{
	width:120px;
	height:80px;
}
</STYLE>
<%
	if(message.length()>0) {
%>
		<SCRIPT>window.alert("<%= message%>");</SCRIPT>
<%
	}
%>
	<BODY style="margin:0px" data-spy="scroll" data-target="#affix">
		<div id="wrap">
			<div id="header"> 
				<jsp:include page ="Top.jsp"/>
			</div>
			<div id="middle" style="background-color: #EBEBEB">
				<!-- 띄어쓰기 -->
				<p><br><p><br>
				<p><br>
				<div id="content">
					<jsp:include page="<%= mainUrl %>" flush="true" />
<%
					if(loginYn)
					{
%>
					<div id="floating">
    					<div class="containers">                                      
  							<div class="dropup">
    							<button class="btn btn-primary dropdown-toggle" id="mainReviewBtn" type="button" id="menu1" data-toggle="dropdown" aria-expanded="true">
    								<B>Write Review</B>
    								<span class="caret"></span>
    							</button>
    							<ul class="dropdown-menu" id="dropdown-menu"role="menu" aria-labelledby="menu1">
      								<li role="presentation"><a role="menuitem" tabindex="-1" href="#"><img src="images/yebin.jpg" class="dropimg"/><P>미샤 스킨&로션</P></a></li>
      								<li role="presentation" class="divider"></li>
      								<li role="presentation"><a role="menuitem" tabindex="-1" href="#"><img src="images/yebin.jpg" class="dropimg"/><P>페이스샵 아이크림</P></a></li>
      								<li role="presentation" class="divider"></li>
      								<li role="presentation"><a role="menuitem" tabindex="-1" href="#"><img src="images/yebin.jpg" class="dropimg"/><P>KOSTA 손세정제</P></a></li>
      								<li role="presentation" class="divider"></li>
      								<li role="presentation"><a role="menuitem" tabindex="-1" href="#"><img src="images/yebin.jpg" class="dropimg"/><P>이니스프리 폼 클렌징</P></a></li>
    							</ul>
  							</div>
						</div>
					</div>
<%
					}
%>
				</div>
				<!--
				<div id="sidebar"> 
					<jsp:include page="Right.jsp"/>
				</div>
				-->
			</div>
			<div id="footer"> 
				<jsp:include page ="Bottom.jsp"/>
			</div>
		</div>		
	</BODY>	
</HTML>
