package com.yolo.trip.service;

import com.yolo.trip.biz.TripBiz;
import com.yolo.trip.vo.TripVO;
import com.yolo.trippart.biz.TripPartBiz;
import com.yolo.trippart.vo.TripPartListVO;
import com.yolo.trippart.vo.TripPartVO;

public class TripServiceImpl implements TripService{

	private TripBiz tripBiz;
	private TripPartBiz tripPartBiz;
	
	public void setTripBiz(TripBiz tripBiz) {
		this.tripBiz = tripBiz;
	}
	public void setTripPartBiz(TripPartBiz tripPartBiz) {
		this.tripPartBiz = tripPartBiz;
	}
	
	@Override
	public boolean addNewOneTrip(TripVO tripVO) {
		
		String tripId = tripBiz.addNewOneTrip(tripVO);
		
		TripPartListVO tripPartListVO = tripVO.getTripPartListVO();
		int size = tripPartListVO.getPlace().size();
		
		boolean isSuccess = false;
		
		for (int i = 0 ; i < size ; i++){
			TripPartVO tripPartVO = new TripPartVO();
			tripPartVO.setTripId(tripId);
			tripPartVO.setStartTime(tripPartListVO.getStartTime().get(i));
			tripPartVO.setEndTime(tripPartListVO.getEndTime().get(i));
			tripPartVO.setTimeControl(tripPartListVO.getTimeControl().get(i));
			tripPartVO.setPlace(tripPartListVO.getPlace().get(i));
			tripPartVO.setContent(tripPartListVO.getContent().get(i));
			tripPartVO.setMap(tripPartListVO.getMap().get(i));
			
			isSuccess = tripPartBiz.addOneTripPart(tripPartVO);
			
		}
		
		
		return isSuccess;
	}
}
