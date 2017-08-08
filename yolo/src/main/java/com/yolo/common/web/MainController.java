package com.yolo.common.web;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.yolo.common.service.MainService;
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
		List<TripVO> recommendList = mainService.selectAllRecommendTrips(user);
		
		view.addObject("user", user);
		view.addObject("tripList", tripList);
		if ( recommendList != null ){
			view.addObject("recommendList", recommendList);
		}
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