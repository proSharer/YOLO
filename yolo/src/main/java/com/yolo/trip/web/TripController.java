package com.yolo.trip.web;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.yolo.trip.service.TripService;
import com.yolo.trip.vo.TripVO;

@Controller
public class TripController {
	//private Logger logger = LoggerFactory.getLogger(TripController.class);
	private TripService tripService;
	
	public void setTripService(TripService tripService) {
		this.tripService = tripService;
	}
	
	@RequestMapping(value="/trip/write",method=RequestMethod.GET)
	public String viewWritePage(){
		
		return "trip/write";
		
	}
	@RequestMapping(value="/trip/write",method=RequestMethod.POST)
	public String insertNewTripPart(TripVO tripVO){
		
		boolean isSuccess = tripService.addNewOneTrip(tripVO);
		System.out.println(isSuccess);
		return "trip/list";
		
	}
}
