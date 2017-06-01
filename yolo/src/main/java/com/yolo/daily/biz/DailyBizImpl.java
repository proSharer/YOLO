package com.yolo.daily.biz;

import com.yolo.daily.dao.DailyDao;

import com.yolo.daily.vo.DailyVO;

public class DailyBizImpl implements DailyBiz{

	private DailyDao dailyDao;
	
	public void setDailyDao(DailyDao dailyDao) {
		this.dailyDao = dailyDao;
	}
	
	@Override
	public boolean insertDailyPart(DailyVO dailyVO) {
		
		return dailyDao.insertDailyPart(dailyVO) >0;
	}

	
	
	
}
