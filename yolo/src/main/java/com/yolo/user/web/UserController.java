package com.yolo.user.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.yolo.user.service.UserService;
import com.yolo.user.vo.UserVO;

@Controller()
public class UserController {

	// private Logger logger = LoggerFactory.getLogger(UserController.class);

	private UserService userService;

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	@RequestMapping("/user/login")
	public ModelAndView loginByNaver() {
		ModelAndView view = new ModelAndView();
		view.setViewName("user/login");

		return view;

	}
	
	// NAVER CALL BACK
	@RequestMapping("/callBack")
	public String callBack(@RequestParam String state, @RequestParam String code, HttpServletRequest request) 
			throws UnsupportedEncodingException{
		String storedState = (String) request.getSession().getAttribute("state"); // 세션에 저장된 토큰을 받아온다.
		if(!state.equals(storedState)) {	// 세션에 저장되 토큰과 인증을 요청해서 받은 토큰이 일치하는지 검증한다.
			System.out.println("401 unauthorized");	// 인증이 실패했을 때의 처리 부분.
			return "redirect:/";
		}
		
			// AccessToken 요청 및 파싱할 부분.
		return "redirect:/";
	}
	

	// 카카오톡
	@RequestMapping(value = "/user/loginByKakao", method = RequestMethod.GET)
	public ModelAndView viewSignInPageByKakao() {
		ModelAndView view = new ModelAndView();

		view.setViewName("user/loginByKakao");

		return view;
	}

	
	@RequestMapping(value ="/user/signIn", method = RequestMethod.GET) public
	ModelAndView viewSignInPage() { ModelAndView view = new ModelAndView();

		view.setViewName("user/signIn");

		return view; 
	}

	@RequestMapping(value = "/user/signIn", method = RequestMethod.POST)
	public void doSignInAction(UserVO userVO, HttpServletRequest request, HttpServletResponse response) {
		
		System.out.println("asdfasdfasdf");
		if (userVO.getUserId() == "" || userVO.getPassword() == "") {
			System.out.println("test2");
			try {
				PrintWriter write = response.getWriter();
				write.append("FAIL");
				write.flush();
				write.close();
			} catch (IOException e) {
				throw new RuntimeException(e.getMessage(), e);
			}
		}
		
		UserVO login = userService.selectOneUser(userVO);
		login.setLoginType(UserVO.DEFAULT);
		if (login != null) {
			try {
				HttpSession session = request.getSession();
				session.setAttribute("_USER_", login);
				
				PrintWriter write = response.getWriter();
				write.append("OK");
				write.flush();
				write.close();
				
			} catch (IOException e) {
				throw new RuntimeException(e.getMessage(), e);
			}
		} else {
			try {
				PrintWriter write = response.getWriter();
				write.append("FAIL");
				write.flush();
				write.close();
			} catch (IOException e) {
				throw new RuntimeException(e.getMessage(), e);
			}
		}
	}

	@RequestMapping(value = "/user/signUp", method = RequestMethod.GET)
	public ModelAndView viewSignUpPage() {
		ModelAndView view = new ModelAndView();

		view.setViewName("user/signUp");

		return view;
	}

	@RequestMapping(value = "/user/signUp", method = RequestMethod.POST)
	public void doSignUpPage(UserVO userVO, HttpServletResponse response) {

		try {
			boolean isValidPassword = verify(userVO.getPassword());
			if (isValidPassword) {
				try {
					userService.insertOneUser(userVO);
					PrintWriter writer = response.getWriter();
					writer.append("OK");
					writer.flush();
					writer.close();
				} catch (IOException e) {
					throw new RuntimeException(e.getMessage(), e);
				}

			} else {
				try {
					PrintWriter writer = response.getWriter();
					writer.append("FAIL");
					writer.flush();
					writer.close();
				} catch (IOException e) {
					throw new RuntimeException(e.getMessage(), e);
				}
			}
		} catch (RuntimeException e) {
			throw new RuntimeException("에러에러에러", e);
		}
	}

	@RequestMapping("/user/signOut")
	public String doSignOutAction(HttpSession session) {

		session.invalidate();
		
		return "redirect:/home";
	}
	
	@RequestMapping("/user/mypage")
	public ModelAndView viewMyPage(HttpSession session) {
		ModelAndView view = new ModelAndView();
		
		UserVO user = (UserVO)session.getAttribute("_USER_");
		
		view.addObject("user", user);
		view.setViewName("/user/myPage");
		
		return view;
	}
	
	@RequestMapping(value="/user/mypage/profile", method=RequestMethod.POST)
	public void doMyPage(UserVO userVO, HttpServletResponse response){
		
	String pw = userVO.getPassword();
			if (!pw.equals("")) {
				try {
					userService.modifyOneUser(userVO);
					PrintWriter writer = response.getWriter();
					writer.append("OK");
					writer.flush();
					writer.close();
				} catch (IOException e) {
					throw new RuntimeException(e.getMessage(), e);
				}

			} else {
				try {
					PrintWriter writer = response.getWriter();
					writer.append("FAIL");
					writer.flush();
					writer.close();
				} catch (IOException e) {
					throw new RuntimeException(e.getMessage(), e);
				}
			}
		
		
	}

	public boolean verify(String password) {
		String passwordPolicy = "((?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[^a-zA-Z0-9가-힣]).{8,})";
		Pattern pattern = Pattern.compile(passwordPolicy);
		Matcher matcher = pattern.matcher(password);
		return matcher.matches();
	}
}
