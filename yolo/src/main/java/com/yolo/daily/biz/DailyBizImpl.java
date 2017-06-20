package com.yolo.daily.biz;

import java.util.List;

import com.yolo.daily.dao.DailyDao;

import com.yolo.daily.vo.DailyVO;

public class DailyBizImpl implements DailyBiz{

	private DailyDao dailyDao;
	
	public void setDailyDao(DailyDao dailyDao) {
		this.dailyDao = dailyDao;
	}
	
	@Override
	public boolean insertDailyPart(DailyVO dailyVO) {
		
		return dailyDao.insertDailyPart(dailyVO) > 0;
	}

	@Override
	public List<DailyVO> getDailyPartsByDLID(String dailyId) {
		
		return dailyDao.getDailyPartsByDLID(dailyId);
	}

	@Override
	public DailyVO getOneDailyPart(String dailyPatyId) {
	
		return dailyDao.getOneDailyPart(dailyPatyId);
	}

	
	
	
}
