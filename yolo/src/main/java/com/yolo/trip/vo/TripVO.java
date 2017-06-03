package com.yolo.trip.vo;


import com.yolo.trippart.vo.TripPartListVO;

public class TripVO {
	
	private String tripId;
	private String title;
	private String createDate;
	private String userId;
	private int likeCount;
	private String overAll;
	private TripPartListVO tripPartListVO;
	
	public String getTripId() {
		return tripId;
	}
	public void setTripId(String tripId) {
		this.tripId = tripId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getLikeCount() {
		return likeCount;
	}
	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}
	public String getOverAll() {
		return overAll;
	}
	public void setOverAll(String overAll) {
		this.overAll = overAll;
	}
	public TripPartListVO getTripPartListVO() {
		return tripPartListVO;
	}
	public void setTripPartListVO(TripPartListVO tripPartListVO) {
		this.tripPartListVO = tripPartListVO;
	}



}
