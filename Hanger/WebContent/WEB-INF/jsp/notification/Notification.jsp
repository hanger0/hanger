<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.util.*" %>
<%@ page import="com.hanger.notification.vo.NotificationVo" %>
<%
	ArrayList notificationList = (ArrayList)request.getAttribute("notificationList");
%>
<script>
	$(function(){
		$(".notificationBtn").click(function(){
			var url = $(this).attr("url");
			var fromUserCode = $(this).attr("fromUserCode");
			$.ajax({
				type : "POST",
				url : "/updateNotification.hang",
				dataType : "text",
				data : "url=" + url + "&fromUserCode=" + fromUserCode,
				success : function(text){
				}
			});
			
			$(location).attr('href',url);
		});
	});
</script>
<%
	if(notificationList.size() > 0) {
		if(notificationList.size() > 5) {
			for(int i=0; i<5; i++) {// 5명까지만 목록에 나타내기
				NotificationVo notification =(NotificationVo)notificationList.get(i);
				
				String message = notification.getNotificationMessage();
				String path = notification.getUserPicPath();
				String picName = notification.getUserPicSaveName();
				String url = notification.getNotificationUrl();
				String yn = notification.getNotificationReadYn();
				String fromUserCode = notification.getNotificationFromUserCode();
%>
			<li <% if(yn.equals("Y")){%> style="background: #F9F9F9;"<%} %>>
				<div class="notificationBtn" url="<%= url %>" fromUserCode="<%= fromUserCode %>" style="cursor:pointer;">
					<img src="<%= path %>\\<%= picName %>" width="40px;" height="40px" /><%= message %>
					<div class="message-and-time" style="float: right;background-color:yellow">
						<div class="message">
						</div>
					</div>
				</div>
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
				String yn = notification.getNotificationReadYn();
				String fromUserCode = notification.getNotificationFromUserCode();
%>
				<li <% if(yn.equals("Y")){%> style="background: #F9F9F9;"<%} %>>
					<div class="notificationBtn" url="<%= url %>" fromUserCode="<%= fromUserCode %>" style="cursor:hand;">
						<img src="<%= path %>/<%= picName %>" width="40px;" height="40px"/><%= message %>
						<div class="message-and-time" style="float: right;">
							<div class="message">
							</div>
						</div>
					</div>
				</li>
<%			
			}
		}
	} else {
%>
		알림이 없습니다.
<%
	}
%>