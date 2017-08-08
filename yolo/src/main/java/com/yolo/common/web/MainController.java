package com.yolo.common.web;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.yolo.common.service.MainService;
import com.yolo.hashtag.vo.PopularHashTagVO;
import com.yolo.trip.vo.TripVO;
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
		List<TripVO> tripList = mainService.selectAllNewestTrips();
		List<PopularHashTagVO> hashTagList= mainService.getPopularHashTagListByTripId();
		
		view.addObject("user", user);
		view.addObject("tripList", tripList);
		view.addObject("hashTagList", hashTagList);
		view.setViewName("common/index");
		
		return view;
	}
	
	@RequestMapping(value="/chat")
	public ModelAndView chatView(HttpSession session) {
		ModelAndView view = new ModelAndView();
		
		UserVO user = (UserVO)session.getAttribute("_USER_");
		
		view.addObject("user", user);
		view.setViewName("chat/chat");
		
		return view;
	}
	
}