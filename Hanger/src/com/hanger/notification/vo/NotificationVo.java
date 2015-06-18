package com.hanger.notification.vo;

public class NotificationVo {
	//
	private String notificationFromUserCode;
	private String notificationToUserCode;
	private String notificationMessage;
	private String notificationUrl;
	private String notificationReadYn;
	private String userPicPath;
	private String userPicSaveName;
	public String getUserPicPath() {
		return userPicPath;
	}
	public void setUserPicPath(String userPicPath) {
		this.userPicPath = userPicPath;
	}
	public String getUserPicSaveName() {
		return userPicSaveName;
	}
	public void setUserPicSaveName(String userPicSaveName) {
		this.userPicSaveName = userPicSaveName;
	}
	public String getNotificationFromUserCode() {
		return notificationFromUserCode;
	}
	public void setNotificationFromUserCode(String notificationFromUserCode) {
		this.notificationFromUserCode = notificationFromUserCode;
	}
	public String getNotificationToUserCode() {
		return notificationToUserCode;
	}
	public void setNotificationToUserCode(String notificationToUserCode) {
		this.notificationToUserCode = notificationToUserCode;
	}
	public String getNotificationMessage() {
		return notificationMessage;
	}
	public void setNotificationMessage(String notificationMessage) {
		this.notificationMessage = notificationMessage;
	}
	public String getNotificationUrl() {
		return notificationUrl;
	}
	public void setNotificationUrl(String notificationUrl) {
		this.notificationUrl = notificationUrl;
	}
	public String getNotificationReadYn() {
		return notificationReadYn;
	}
	public void setNotificationReadYn(String notificationReadYn) {
		this.notificationReadYn = notificationReadYn;
	}
}
