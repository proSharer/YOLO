package com.yolo.trip.vo;

import java.util.List;

import com.yolo.common.web.Pager;
import com.yolo.common.web.PagerFactory;

public class TripListVO {

	private List<TripVO> tripList;
	private Pager pager;
	
	public List<TripVO> getTripList() {
		return tripList;
	}
	public void setTripList(List<TripVO> tripList) {
		this.tripList = tripList;
	}
	public Pager getPager() {
		if( pager == null ){
			pager = PagerFactory.getPager(Pager.ORACLE);
		}
		return pager;
	}
	public void setPager(Pager pager) {
		this.pager = pager;
	}
	
	
}
