package com.yolo.dailyMain.service;

import com.yolo.dailyMain.biz.DailyMainBiz;
import com.yolo.dailyMain.vo.DailyMainVO;
import com.yolo.like.biz.LikeBiz;
import com.yolo.like.vo.LikeVO;


public class DailyMainServiceImpl implements DailyMainService{

	private DailyMainBiz dailyMainBiz;
	private LikeBiz likeBiz;
	
	public void setDailyMainBiz(DailyMainBiz dailyMainBiz) {
		this.dailyMainBiz = dailyMainBiz;
	}
	
	public void setLikeBiz(LikeBiz likeBiz) {
		this.likeBiz = likeBiz;
	}
	
	@Override
	public String getDailyId() {
		
		return dailyMainBiz.getDailyId();
	}

	@Override
	public boolean dailyMainLikeCountPlus(String dailyId, String userId) {
		LikeVO likeVO = new LikeVO();
		
		likeVO.setTripId("");
		likeVO.setUserId(userId);
		likeVO.setDailyId(dailyId);
		boolean isSuccess = likeBiz.addOneLike(likeVO);
		if ( isSuccess ){
			return dailyMainBiz.dailyMainLikeCountUpdatePlus(dailyId);
		}
		else {
			return false;
		}
	}

	@Override
	public boolean dailyMainCountMinus(String dailyId, String userId) {
		
		LikeVO likeVO = new LikeVO();
		
		likeVO.setTripId("");
		likeVO.setUserId(userId);
		likeVO.setDailyId(dailyId);

		
		
		boolean isSuccess = likeBiz.removeOneLikeByDailyId(likeVO);
		if ( isSuccess ){
			return dailyMainBiz.dailyMainLikeCountUpdateMinus(dailyId);
		}
		else {
			return false;
		}
	
	}

	@Override
	public DailyMainVO getOneDailyMain(String dailyId) {
	
		return dailyMainBiz.getOneDailyMain(dailyId);
		
	}

	@Override
	public boolean isLikeByDailyId(LikeVO likeVO) {
		
		
		LikeVO like = likeBiz.getOneLikeByDailyId(likeVO);
		
		if(like != null){
			return true;
		}
		
		else{
			return false;
		}
	}
	
	
}
