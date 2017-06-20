package com.yolo.dailyMain.vo;

import java.util.List;

import com.yolo.daily.vo.DailyVO;

public class DailyMainVO {

	private String dailyId;
	private String title;
	private String createDate;
	private String userId;
	private int likeCount;
	private String overAll;
	
	private List<DailyVO> dailyVOs;
	private String dailyPic; //사진 여기다 넣으려고 
	
	
	public String getDailyPic() {
		return dailyPic;
	}
	public void setDailyPic(String dailyPic) {
		this.dailyPic = dailyPic;
	}
	public List<DailyVO> getDailyVOs() {
		return dailyVOs;
	}
	public void setDailyVOs(List<DailyVO> dailyVOs) {
		this.dailyVOs = dailyVOs;
	}
	public String getDailyId() {
		return dailyId;
	}
	public void setDailyId(String dailyId) {
		this.dailyId = dailyId;
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
	
	
	
	
	
}
