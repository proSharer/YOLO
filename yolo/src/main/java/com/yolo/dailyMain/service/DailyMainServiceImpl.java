package com.yolo.dailyMain.service;

import com.yolo.dailyMain.biz.DailyMainBiz;

public class DailyMainServiceImpl implements DailyMainService{

	private DailyMainBiz dailyMainBiz;
	
	public void setDailyMainBiz(DailyMainBiz dailyMainBiz) {
		this.dailyMainBiz = dailyMainBiz;
	}
	
	@Override
	public String getDailyId() {
		// TODO Auto-generated method stub
		return dailyMainBiz.getDailyId();
	}

	
}
