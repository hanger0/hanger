package com.hanger.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserJoinZipCodeController {
	//
	@RequestMapping("/zipCode.hang")
	public String goZipCodeSearch(){
		return "user/ZipCodeSearch";
	}
}