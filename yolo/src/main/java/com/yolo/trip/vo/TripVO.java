package com.yolo.trip.vo;


import java.util.List;

import com.yolo.trippart.vo.TripPartListVO;
import com.yolo.trippart.vo.TripPartVO;

public class TripVO {
	
	private String tripId;
	private String title;
	private String createDate;
	private String updateDate;
	private String userId;
	private int likeCount;
	private String overAll;
	private List<TripPartVO> tripPartVO;
	private String regionId;
	private String hashTag;
	
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
	public String getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
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
	public List<TripPartVO> getTripPartVO() {
		return tripPartVO;
	}
	public void setTripPartVO(List<TripPartVO> tripPartVO) {
		this.tripPartVO = tripPartVO;
	}
	public String getRegionId() {
		return regionId;
	}
	public void setRegionId(String regionId) {
		this.regionId = regionId;
	}
	public String getHashTag() {
		return hashTag;
	}
	public void setHashTag(String hashTag) {
		this.hashTag = hashTag;
	}

}
