package com.yolo.userapi.web;

import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.yolo.user.vo.UserVO;
import com.yolo.userapi.service.UserApiService;
import com.yolo.userapi.vo.KakaoVO;

@Controller
public class KakaoController {
	
	private UserApiService userApiService;
	
	public void setUserApiService(UserApiService userApiService) {
		this.userApiService = userApiService;
	}

	private Logger logger = LoggerFactory.getLogger(KakaoController.class);

	@RequestMapping(value = "/user/kakao/signin", method = RequestMethod.POST)
	public void getToken(@RequestParam String id, @RequestParam String nickName, HttpServletResponse response) {
		String kakaoId = "KA-" + id;
		
		UserVO userVO = new UserVO();
		userVO.setUserKakaoApiId(kakaoId);
		userVO.setUserKakaoApiName(nickName);
		
		List<UserVO> userList = userApiService.selectAllUser("KAKAO");
		
		for( int i = 0; i < userList.size(); i++ ) {
			
			if ( userList.get(i).getUserKakaoApiId().equals(kakaoId) ) {
				return;
			}
			else {
				continue;
			}
			
		}
		userApiService.addUserApi(userVO);
		
	}
	
	@RequestMapping(value="/user/kakao/savetoken")
	public void saveToken(@RequestParam String accessToken, HttpSession session) {
		UserVO userVO = (UserVO) session.getAttribute("_USER_");
		
		if ( userVO == null ) {
			userVO = new KakaoVO();
		}
		
		userVO.setAccessToken(accessToken);
		userVO.setLoginType(UserVO.KAKAO);
		session.setAttribute("_USER_", userVO);
		
	}
	
	@RequestMapping(value="/user/kakao/signout", method=RequestMethod.GET)
	public String kakaoLogout(HttpSession session) {
		
		session.invalidate();
		
		return "redirect:/home";
	}



}
