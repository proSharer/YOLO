package com.yolo.trippart.biz;

import java.util.List;

import com.yolo.trippart.vo.TripPartVO;

public interface TripPartBiz {

	public boolean addOneTripPart(TripPartVO tripPartVO);

	public List<TripPartVO> selectTripPartByTripId(String tripId);
}
