<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="com.hanger.reply.vo.ReplyVo" %>
<%@ page import="java.util.*" %>
<%
	ArrayList<ReplyVo> replyOne = (ArrayList<ReplyVo>)request.getAttribute("replyOne");

	if(replyOne != null&&replyOne.size()>0){
		
			ReplyVo rv = replyOne.get(0);
%>
			<div class="review" style="width: 100%; height: 60px; padding: 0px;">
				<a href="/myPage.hang?yourUserCode=<%=rv.getUserCode()%>">
				<div class="replyimg col-sm-1" style="height: 100%; padding: 0px;">
					<img src="<%=rv.getUserPicPath()%>/<%=rv.getUserPicSaveName() %>" class="img-circle reimgs" style="width: 60px; height: 60px">
				</div>
				
				<div class="name"	style="width: 600px; height:20px; float: left; margin-left:10px;margin-bottom:2px;">
					<font size="2"><b><%=rv.getUserName() %></b></font> 
					<font size="1"	style="margin-left: 5px"><font color="gray"><%=rv.getUpdDate() %> </font></font>
				</div>
				</a>
				
				<div class="updateDelete" style="float:right;">
					<a class="replyUpdateBtn" replyCode="<%=rv.getReplyCode()%>" checkReply ="Update"><span class="glyphicon glyphicon-wrench" aria-hidden="true"></span></a>
					<a class="replyDeleteBtn" replyCode="<%=rv.getReplyCode()%>" checkReply ="Delete"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></a>	
				</div>

				<div class="name"	style="width: 685px; height: 38px; float: left; margin-left:10px;">
					<font size="2"> <%=rv.getReplyContent() %> </font>
				</div>
				
			</div>
			
			<hr style = "margin-top:10px;margin-bottom:10px">
<%
	}
	
%>