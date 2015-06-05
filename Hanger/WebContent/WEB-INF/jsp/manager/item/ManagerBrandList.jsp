<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.util.*" %>
<%@ page import="com.hanger.manager.item.vo.ManagerBrandVo;" %>

<SCRIPT src="/js/jquery-2.1.3.min.js"></SCRIPT>
<SCRIPT src="/js/common/common.js"></SCRIPT>
<script src="/js/manager/item/managerBrand.js" type="text/javascript"></script>

<%
	List<ManagerBrandVo> brandList = (List<ManagerBrandVo>)request.getAttribute("brandList");

	if(brandList.size()==0)
	{
%>
			<%= "검색 결과가 없습니다."%>
<%
	}
	else
	{
		for(int i = 0; i < brandList.size(); i++){
%>
			<a href="javascript:brandSelectAction('<%=brandList.get(i).getBrandCode()%>', '<%=brandList.get(i).getBrandName()%>')" style="cursor: pointer">
			<%=brandList.get(i).getBrandCode()%> - <%=brandList.get(i).getBrandName() %></a>
			<BR>
<%
		}
	}
%>