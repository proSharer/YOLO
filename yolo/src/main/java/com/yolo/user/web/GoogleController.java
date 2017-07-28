package com.yolo.user.web;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.social.connect.Connection;
import org.springframework.social.google.api.Google;
import org.springframework.social.google.api.impl.GoogleTemplate;
import org.springframework.social.google.api.plus.Person;
import org.springframework.social.google.api.plus.PlusOperations;
import org.springframework.social.google.connect.GoogleConnectionFactory;
import org.springframework.social.oauth2.AccessGrant;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.yolo.user.vo.GoogleVO;
import com.yolo.user.vo.UserVO;


@Controller
public class GoogleController {

	private Logger logger = LoggerFactory.getLogger(UserController.class);
	
	private GoogleConnectionFactory googleConnectionFactory;
	
	public void setGoogleConnectionFactory(GoogleConnectionFactory googleConnectionFactory) {
		this.googleConnectionFactory = googleConnectionFactory;
	}
	
	private OAuth2Parameters googleOAuth2Parameters;
	
	public void setGoogleOAuth2Parameters(OAuth2Parameters googleOAuth2Parameters) {
		this.googleOAuth2Parameters = googleOAuth2Parameters;
	}
	
	@RequestMapping("/user/google")
	public String googleLoginPage() {
		
		OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations();
		String url = oauthOperations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE, googleOAuth2Parameters);
		
		return "redirect:" + url;
	}
	
	@RequestMapping("/user/google/account")
	public String getGoogleAccount(@RequestParam String code, HttpSession session) {
		
		Person person = getGooglePerson(code);
		
		GoogleVO userVO = (GoogleVO) session.getAttribute("_USER_");
		if ( userVO == null ) {
			userVO = new GoogleVO();
		}
		
		userVO.setLoginType(UserVO.GOOGLE);
		userVO.setPerson(person);
		session.setAttribute("_USER_", userVO);
		
		return "redirect:/home";
	}
	
	@RequestMapping(value="/user/google/signout", method=RequestMethod.GET)
	public String actionGoogleSignOut(HttpServletRequest request, HttpSession session){
		
		session = request.getSession();
		session.invalidate();
		
		return "redirect:https://www.google.com/accounts/Logout?continue=https://appengine.google.com/_ah/logout?continue=http://localhost:8080/yolo/home";
	}
	
	//구글에서 로그인한 아이디의 정보추출
	private Person getGooglePerson(String code) {

		OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations();
		AccessGrant accessGrant = oauthOperations.exchangeForAccess(code, googleOAuth2Parameters.getRedirectUri(), null);

		String accessToken = accessGrant.getAccessToken();
		Long expireTime = accessGrant.getExpireTime();

		if (expireTime != null && expireTime < System.currentTimeMillis()) {
			accessToken = accessGrant.getRefreshToken();
			logger.info("accessToken is expired. refresh token = {}", accessToken);
		}

		Connection<Google> connection = googleConnectionFactory.createConnection(accessGrant);
		Google google = connection == null ? new GoogleTemplate(accessToken) : connection.getApi();

		PlusOperations plusOperations = google.plusOperations();
		Person person = plusOperations.getGoogleProfile();
		
		return person;
		
	}
	
}