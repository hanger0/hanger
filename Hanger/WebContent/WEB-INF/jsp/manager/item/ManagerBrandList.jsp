<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.util.*" %>
<%@ page import="com.hanger.manager.item.vo.ManagerBrandVo;" %>

<%
	List<ManagerBrandVo> brandList = (List<ManagerBrandVo>)request.getAttribute("brandList");
	String brandResult = "";
	if(brandList.size()==0)
	{
%>
			<%= "�˻� ����� �����ϴ�."%>
<%
	}
	else
	{
		for(int i = 0; i < brandList.size(); i++){
			brandResult += (String)(brandList.get(i).getBrandName()) + "<BR>";
		}
%>
			<%= brandResult%>
<%
	}
%>