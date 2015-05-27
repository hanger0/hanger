package model.member.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Controller
public class MemberJoinForm{
	
	@RequestMapping(value="/result.do", method=RequestMethod.POST)
	public ModelAndView memberJoinForm2(
			HttpServletRequest request
			) throws IOException {
		File dayFile = new File("F:\\hanger");
		String savePath = dayFile.getAbsolutePath();
		int sizeLimit = 1000 * 1024 * 1024;
		MultipartRequest mul = new MultipartRequest(request, savePath, sizeLimit, "KSC5601", new DefaultFileRenamePolicy());
		String userId = mul.getParameter("joinId");
		String name = mul.getParameter("name");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("JoinResult");
		mav.addObject("name", name);
		mav.addObject("userId", userId);
		
		System.out.println("memberJoinForm2 ½ÇÇà....");
		return mav;
	}
}