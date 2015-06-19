<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="com.hanger.reply.vo.ReplyVo" %>
<%@ page import="java.util.*" %>
<%
	ArrayList<ReplyVo> replyList = (ArrayList<ReplyVo>)request.getAttribute("replyList");
	System.out.println("replyList11111 : " + replyList);
%>

<%

	if(replyList != null){
		for(int i=0;i<replyList.size();i++){
			ReplyVo reply = replyList.get(i);
			String replyContent = reply.getReplyContent();
			String replyName = reply.getUserName();
			String replyCode = reply.getReplyCode();
			String userPicPath = reply.getUserPicPath();
			String userPicSaveName = reply.getUserPicSaveName();
			String updDate = reply.getUpdDate();
			System.out.println("replyContent : "+ replyContent);
%>
 		<div class = "review replyUdtClass" style = "width:100%;height:100px;">
			<div class="replyimg col-sm-1">
				<img src="<%= userPicPath %>/<%= userPicSaveName %>" alt="예빈짜응" class="img-circle reimgs" style = "width:100px;height:100px">
			</div>
			<div class = "name" style = "width:400px;height:30px;float:left;margin-left:5%;">
				<font size = "3"><b><%=replyName %></b></font>
				<font size = "2" style = "margin-left:3%"><font color = "gray"><%= updDate %></font></font>
			</div>
			<div class="updateDelete" style="float:right;">
					<a class="replyUpdateBtn"><span class="glyphicon glyphicon-wrench" aria-hidden="true"></span></a>
					<a class="replyDeleteBtn" replyCode="<%= replyCode%>"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></a>
			</div>	
			<br>
			<BR>
			<div class = "name replyCont" style = "width:700px;height:60px;float:left;margin-left:5%;">
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