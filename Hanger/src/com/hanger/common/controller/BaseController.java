package com.hanger.common.controller;



public class BaseController {
	protected final String root = "/WEB-INF/jsp/";
	protected String mainUrl = "/WEB-INF/jsp/common/Main.jsp";
	protected String moveUrl = "common/Frame";
	protected String myPageUrl = "/WEB-INF/jsp/user/mypage/MyTop.jsp";
	protected String managerPageUrl = "/WEB-INF/jsp/manager/ManagerTop.jsp";
/*
	protected void log(String message) {
		BasicConfigurator.configure();
		SimpleLog.logger.info(message);
	}
	*/
}
