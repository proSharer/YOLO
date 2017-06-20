package com.yolo.tripreply.vo;

import com.yolo.trip.vo.TripVO;
import com.yolo.user.vo.UserVO;

public class TripReplyVO {
	
	private int level;
	private String tripReplyId;
	private String tripId;
	private String content;
	private String createDate;
	private String userId;
	private int recommendCount;
	private String parentReplyId;
	
	private TripVO tripVO;
	private UserVO userVO;
	private TripReplyVO parentReplyVO;
	
	
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public String getTripReplyId() {
		return tripReplyId;
	}
	public void setTripReplyId(String tripReplyId) {
		this.tripReplyId = tripReplyId;
	}
	public String getTripId() {
		return tripId;
	}
	public void setTripId(String tripId) {
		this.tripId = tripId;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
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
	public int getRecommendCount() {
		return recommendCount;
	}
	public void setRecommendCount(int recommendCount) {
		this.recommendCount = recommendCount;
	}
	public String getParentReplyId() {
		return parentReplyId;
	}
	public void setParentReplyId(String parentReplyId) {
		this.parentReplyId = parentReplyId;
	}
	public TripVO getTripVO() {
		return tripVO;
	}
	public void setTripVO(TripVO tripVO) {
		this.tripVO = tripVO;
	}
	public UserVO getUserVO() {
		return userVO;
	}
	public void setUserVO(UserVO userVO) {
		this.userVO = userVO;
	}
	public TripReplyVO getParentReplyVO() {
		return parentReplyVO;
	}
	public void setParentReplyVO(TripReplyVO parentReplyVO) {
		this.parentReplyVO = parentReplyVO;
	}
	
}
