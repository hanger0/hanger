package com.hanger.common.controller;

import org.apache.log4j.BasicConfigurator;


public class BaseController {
	protected final String root = "/WEB-INF/jsp/";
	protected String mainUrl = "/WEB-INF/jsp/common/Main.jsp";
	protected String moveUrl = "common/Frame";
	protected String myPageUrl = "/WEB-INF/jsp/user/mypage/MyTop.jsp";

	protected void log(String message) {
		BasicConfigurator.configure();
		SimpleLog.logger.info(message);
	}
}
