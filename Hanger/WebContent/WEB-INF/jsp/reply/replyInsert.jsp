<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="com.hanger.reply.vo.ReplyVo" %>
<%@ page import="java.util.*" %>
<%
	ArrayList<ReplyVo> replyList = (ArrayList<ReplyVo>)request.getAttribute("replyListSet");
%>

<%
	if(replyList != null){
		for(int i=0;i<replyList.size();i++){
			ReplyVo reply = replyList.get(i);
			String replyContent = reply.getReplyContent();
			String replyName = reply.getUserName();
			String userPicPath = reply.getUserPicPath();
			String userPicSaveName = reply.getUserPicSaveName();
			String updDate = reply.getUpdDate();
%>
 		<div class = "review" style = "width:100%;height:100px;">
			<div class="replyimg col-sm-1">
				<img src="<%= userPicPath %>/<%= userPicSaveName %>" alt="¿¹ºóÂ¥ÀÀ" class="img-circle reimgs" style = "width:100px;height:100px">
			</div>
			<div class = "name" style = "width:400px;height:30px;float:left;margin-left:5%;">
				<font size = "3"><b><%=replyName %></b></font>
				<font size = "2" style = "margin-left:3%"><font color = "gray"><%= updDate %></font></font>
			</div>
			<br>
			<BR>
			<div class = "name" style = "width:700px;height:60px;float:left;margin-left:5%;">
				<font size = "2">
					<%= replyContent %>
				</font> 
			</div>
		</div>
		<hr>
<%
		}
	}
%>