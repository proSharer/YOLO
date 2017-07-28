package com.yolo.user.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.yolo.user.vo.KakaoVO;
import com.yolo.user.vo.UserVO;

@Controller
public class KakaoController {

	private Logger logger = LoggerFactory.getLogger(KakaoController.class);

	@RequestMapping(value = "/user/kakao/signin", method = RequestMethod.POST)
	public void getToken(@RequestParam String id, @RequestParam String nickName, @RequestParam String email, HttpServletResponse response) {
		
		logger.info("id : " + id);
		logger.info("nickName : " + nickName);
		logger.info("email : " + email);
		
		try {
			PrintWriter write = response.getWriter();
			write.write("ok");
			write.flush();
			write.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	@RequestMapping(value="/user/kakao/savetoken")
	public void saveToken(@RequestParam String accessToken, HttpSession session) {
		KakaoVO kakaoVO = (KakaoVO) session.getAttribute("_USER_");
		
		if ( kakaoVO == null ) {
			kakaoVO = new KakaoVO();
		}
		
		kakaoVO.setAccessToken(accessToken);
		kakaoVO.setLoginType(UserVO.KAKAO);
		session.setAttribute("_USER_", kakaoVO);
		
		
	}
	
	@RequestMapping(value="/user/kakao/signout", method=RequestMethod.GET)
	public String kakaoLogout(HttpSession session) {
		
		session.invalidate();
		
		return "redirect:/home";
	}



}
