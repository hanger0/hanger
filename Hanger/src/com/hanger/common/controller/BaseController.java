package com.hanger.common.controller;

import javax.servlet.http.HttpSession;

public class BaseController {
	protected String mainUrl = "/WEB-INF/jsp/common/Main.jsp";
	protected String moveUrl = "common/Frame";
	protected HttpSession session;
}
