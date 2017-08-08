package com.yolo.common.service;

import java.util.List;

import com.yolo.trip.vo.TripVO;
import com.yolo.user.vo.UserVO;

public interface MainService {
	
	public List<TripVO> selectAllNewestTrips();
	
	public List<TripVO> selectAllRecommendTrips(UserVO userVO);

}
