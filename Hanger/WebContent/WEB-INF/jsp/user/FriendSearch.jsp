<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.util.*" %>
<%@ page import="com.hanger.user.vo.UserVo" %>
<%
		ArrayList userList = (ArrayList)request.getAttribute("userList");	
		String qt = (String)request.getAttribute("qt");
%>
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
      <!-- �ΰ����� �׸� -->
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
      <!-- �������� �ּ�ȭ�� �ֽ� �ڹٽ�ũ��Ʈ -->
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
      <script src="/js/javascripts/jquery-1.11.3.min.js" type="text/javascript"></script>
<SCRIPT>
	function searchLoock() {
		location.href = "/userSearch.hang?qt=<%=qt%>";
	}
</SCRIPT>

<%
		if(userList.size() > 0)
		{
			if(userList.size() > 5)
			{
				for(int i=0; i<5; i++) // 5������� ��Ͽ� ��Ÿ����
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
			}
			else if(userList.size() < 5)
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
<%				}
			
			}
%>

<%		}
		else
		{
%>
			�˻��Ǵ� ģ���� �����ϴ�.
<%
		}
%>
