<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.util.*" %>
<%@ page import="com.hanger.user.vo.UserVo" %>
<%
		ArrayList userList = (ArrayList)request.getAttribute("userList");
		
		if(userList != null)
		{
			for(int i=0; i<userList.size(); i++)
			{
				UserVo user =(UserVo)userList.get(i);
				
				String userName =(String)user.getUserName();
%>
				<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#"><img src="images/test.png" /><%= userName %>
					<div class="message-and-time" style="float: right;">
						<div class="message">
								
						</div>
					</div>
					</a>
				</li>
<%				
			}
		} else {
%>
			검색되는 친구가 없습니다.
<%
		}
%>
