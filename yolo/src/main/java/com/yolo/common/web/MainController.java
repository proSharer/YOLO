package com.yolo.common.web;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.yolo.common.service.MainService;
import com.yolo.user.vo.UserVO;

@Controller
public class MainController {
	
	private MainService mainService;
	
	public void setMainService(MainService mainService) {
		this.mainService = mainService;
	}

	@RequestMapping(value="/home")
	public ModelAndView homeView(HttpSession session) {
		ModelAndView view = new ModelAndView();
		
		UserVO user = (UserVO)session.getAttribute("_USER_");
		
		view.addObject("user", user);
		view.setViewName("common/index");
		
		return view;
	}
	
}