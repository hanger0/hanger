<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>

<%
	String mainUrl = (String)request.getAttribute("mainUrl");
	String message = "";
	if(request.getAttribute("message")!=null && ((String)request.getAttribute("message")).length()>0)
	{
		message = (String)request.getAttribute("message");
	}
%>

<html>
<head>
<title>브랜드 등록</title>

<%
	if(message.length()>0) {
%>
		<SCRIPT>window.alert("<%= message%>");</SCRIPT>
<%
	}
%>

<SCRIPT src="/js/jquery-2.1.3.min.js"></SCRIPT>
<SCRIPT src="/js/common/common.js"></SCRIPT>
<script src="/js/manager/item/managerBrand.js" type="text/javascript"></script>

</head>

<BODY>
	<CENTER>
		<form role="form" id="brandForm" name="brandForm" method="post"
			action="managerAddBrand.hang">
			
			<div>
				<label for="brandName">brand : </label>
				<div>
					<input type="text" id="brandName" name="brandName" size="20">
					<INPUT type="button" value="add" onclick="addBrand()" />
				</div>
			</div>

			<div>
				<label for="brandList">result</label>
				</dt>
				<div>
					<B><SPAN id="brandList"></SPAN></B>
				</div>
			</div>
		</form>
	</CENTER>
</BODY>
</html>