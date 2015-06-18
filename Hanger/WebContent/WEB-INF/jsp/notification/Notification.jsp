<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.util.*" %>
<%@ page import="com.hanger.notification.vo.NotificationVo" %>
<%
	ArrayList notificationList = (ArrayList)request.getAttribute("notificationList");

	if(notificationList.size() > 0) {
		if(notificationList.size() > 5) {
			for(int i=0; i<5; i++) {// 5명까지만 목록에 나타내기
				NotificationVo notification =(NotificationVo)notificationList.get(i);
				
				String message = notification.getNotificationMessage();
				String path = notification.getUserPicPath();
				String picName = notification.getUserPicSaveName();
				String url = notification.getNotificationUrl();
				System.out.println(url);
%>
<script>
	$(function(){
		$('a').click(function(){
			
		});
	})
</script>
			<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="/<%= url %>">
				<img src="<%= path %>\\<%= picName %>" /><%= message %>
				<div class="message-and-time" style="float: right;">
					<div class="message">
						
					</div>
				</div>
				</a>
			</li>
<% 
			}
		} else if(notificationList.size() < 5) {
			for(int i=0; i<notificationList.size(); i++) {
				NotificationVo notification =(NotificationVo)notificationList.get(i);
				
				String message = notification.getNotificationMessage();
				String path = notification.getUserPicPath();
				String picName = notification.getUserPicSaveName();
				String url = notification.getNotificationUrl();
%>
				<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="/<%= url %>">
					<img src="<%= path %>/<%= picName %>" /><%= message %>
					<div class="message-and-time" style="float: right;">
						<div class="message">
								
						</div>
					</div>
					</a>
				</li>
<%				}
		
		}
%>

<%		
	} else {
%>
		알림이 없습니다.
<%
	}
%>