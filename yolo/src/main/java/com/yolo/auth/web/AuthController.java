package com.yolo.auth.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.yolo.auth.service.AuthService;
import com.yolo.auth.vo.AuthVO;

import ch.qos.logback.classic.Logger;

@Controller
public class AuthController {

	private AuthService authService;

	public void setAuthService(AuthService authService) {
		this.authService = authService;
	}

	@RequestMapping(value = "/auth/home", method = RequestMethod.GET)
	public ModelAndView viewAuthList() {

		ModelAndView view = new ModelAndView();

		view.setViewName("auth/home");

		return view;
	}

	@RequestMapping(value = "/auth/adminSignUp", method = RequestMethod.POST)
	public void doAuthLogin(HttpSession httpSession, AuthVO authVO, HttpServletResponse httpServletResponse) {
		
		System.out.println("가입 이름" + authVO.getAuthNm().toString());
		System.out.println("가입 비번" +authVO.getAuthPw().toString());
		
		
		try {
			boolean isValidPassword = verify(authVO.getAuthPw());
			if (isValidPassword) {
				try {
					authService.insertOneAuth(authVO);
					PrintWriter writer = httpServletResponse.getWriter();
					writer.append("OK");
					writer.flush();
					writer.close();
				} catch (IOException e) {
					throw new RuntimeException(e.getMessage(), e);
				}
			} else {
				try {
					PrintWriter writer = httpServletResponse.getWriter();
					writer.append("FAIL");
					writer.flush();
					writer.close();
				} catch (IOException e) {
					throw new RuntimeException(e.getMessage(), e);
				}
			}
		} catch (RuntimeException e) {
			throw new RuntimeException("가입 오류", e);
		}
	}
	
	@RequestMapping(value="/auth/adminSignIn", method = RequestMethod.POST)
	public void doSignInAction(AuthVO authVO, HttpServletRequest request, HttpServletResponse reponse){
		
		if(authVO.getAuthNm() == "" || authVO.getAuthPw() == ""){
			try {
				PrintWriter write = reponse.getWriter();
				write.append("FAIL_1");
				write.flush();
				write.close();
			} catch (IOException e) {
				throw new RuntimeException(e.getMessage(), e);
			}
		}
		
		AuthVO login = authService.selectOneAuth(authVO);
		
		if(login != null){
			HttpSession session = request.getSession();
			session.setAttribute("_ADMIN_", login);
			
			try {
				PrintWriter write= reponse.getWriter();
				write.append("OK");
				write.flush();
				write.close();
				
			} catch (IOException e) {
				throw new RuntimeException(e.getMessage(), e);
			}
		} else {
			try {
				PrintWriter write = reponse.getWriter();
				write.append("FAIL_2");
				write.flush();
				write.close();
			} catch (IOException e) {
				throw new RuntimeException(e.getMessage(), e);
			}
			
		}
		
	}
	
	@RequestMapping("/auth/signOut")
	public String doSignOutAction(HttpSession session){
		
		session.invalidate();
		
		return "rediect:/auth/home";
		
	}

	public boolean verify(String password) {
		String passwordPolicy = "((?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[^a-zA-Z0-9가-힣]).{8,})";
		Pattern pattern = Pattern.compile(passwordPolicy);
		Matcher matcher = pattern.matcher(password);
		return matcher.matches();
	}
}
