package com.yolo.common.web;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

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
		
		int[] sizeArray = new int[hashTagList.size()];
		String[] contentArray = new String[hashTagList.size()];
		
		List<Integer> size = new ArrayList<>();
		List<String> content = new ArrayList<>();
		
		for (int i = 0; i < hashTagList.size(); i++) {
			if (hashTagList.get(i).getCount() >= 7) {
				//sizeArray[i] = 7;
				size.add(7);
			}
			else if (hashTagList.get(i).getCount() >= 6) {
				//sizeArray[i] = 6;
				size.add(6);
			}
			else if (hashTagList.get(i).getCount() >= 5) {
				//sizeArray[i] = 5;
				size.add(5);
			}
			else if (hashTagList.get(i).getCount() >= 4) {
				//sizeArray[i] = 4;
				size.add(4);
			}
			else if (hashTagList.get(i).getCount() >= 3) {
				//sizeArray[i] = 3;
				size.add(3);
			}
			else if (hashTagList.get(i).getCount() >= 2) {
				//sizeArray[i] = 2;
				size.add(2);
			}
			else {
				//sizeArray[i] = 1;
				size.add(1);
			}
			
			//contentArray[i] = hashTagList.get(i).getContent();
			content.add(hashTagList.get(i).getContent());
		}
		
		Set<TripVO> recommendList = mainService.selectAllRecommendTrips(user);
		
		if ( recommendList != null ){
			view.addObject("recommendList", recommendList);
		}
		
		view.addObject("user", user);
		view.addObject("tripList", tripList);
		view.addObject("sizeArray", size);
		view.addObject("contentArray", content);
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