package com.yolo.user.web;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yolo.common.utilities.NaverUtil;

@Controller
public class NaverController {
	
	private static final String MYDOMAIN ="http%3A%2F%2Flocalhost%3A8080%2Fyolo%2Fuser%2Fcallback";
	private static final String CLIENTID ="IEluBACvScugzJTBCPW1";
	private static final String CLIENTSECRET ="1rLHuqbIOF";
	private static final String REQUESTURL ="https://nid.naver.com/oauth2.0/authorize?client_id="
											 + CLIENTID 
											 + "&response_type=code&redirect_uri="
											 + MYDOMAIN 
											 + "&state=";

;
	
	
	@RequestMapping("/user/loginNaver")
	public String NaverLogin(HttpSession session) {

		// 상태 토큰으로 사용할 랜덤 문자열 생성
		String state = NaverUtil.generateState();

		// 세션 또는 별도의 저장 공간에 상태 토큰을 저장
		session.setAttribute("state", state);

		return "redirect:"+ REQUESTURL +state;

	}

}
