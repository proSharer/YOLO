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
	
	
	@RequestMapping(value ="/user/signIn", method = RequestMethod.GET) 
	public ModelAndView viewSignInPage() { 
		
		ModelAndView view = new ModelAndView();

		view.setViewName("user/signIn");

		return view; 
	}

	@RequestMapping(value = "/user/signIn", method = RequestMethod.POST)
	public void doSignInAction(UserVO userVO, HttpServletRequest request, HttpServletResponse response) {
		
		if (userVO.getUserId() == "" || userVO.getPassword() == "") {
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
		
		if (login != null) {
			try {
				HttpSession session = request.getSession();
				session.setAttribute("_USER_", login);
				login.setLoginType(UserVO.DEFAULT);
				
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
	public ModelAndView viewSignUpPage(HttpSession session) {
		ModelAndView view = new ModelAndView();
		
		UserVO user = (UserVO) session.getAttribute("_USER_"); 
		
		view.addObject("user", user);
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
			throw new RuntimeException("회원가입 에러", e);
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
		String passwordPolicy = "((?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[^a-zA-Z0-9媛�-�옡]).{8,})";
		Pattern pattern = Pattern.compile(passwordPolicy);
		Matcher matcher = pattern.matcher(password);
		return matcher.matches();
	}
}
