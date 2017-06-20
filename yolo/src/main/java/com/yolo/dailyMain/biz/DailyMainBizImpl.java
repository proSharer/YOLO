package com.yolo.dailyMain.biz;

import com.yolo.dailyMain.dao.DailyMainDao;
import com.yolo.dailyMain.vo.DailyMainListVO;
import com.yolo.dailyMain.vo.DailyMainSearchVO;
import com.yolo.dailyMain.vo.DailyMainVO;

public class DailyMainBizImpl implements DailyMainBiz{

	private DailyMainDao dailyMainDao;
	
	public void setDailyMainDao(DailyMainDao dailyMainDao) {
		this.dailyMainDao = dailyMainDao;
	}
	
	@Override
	public String getDailyId() {
		// TODO Auto-generated method stub
		return dailyMainDao.selectDailyId();
	}

	@Override
	public boolean addNewDailyMain(DailyMainVO dailyMainVO) {
	
		return dailyMainDao.insertDailyMain(dailyMainVO) > 0;
	}

	@Override
	public DailyMainListVO getAllDailyMain(DailyMainSearchVO dailyMainSearchVO) {
		
		
		DailyMainListVO dailyMainListVO = new DailyMainListVO();
		dailyMainListVO.setDailyMainVOs(dailyMainDao.selectAllDailyMain(dailyMainSearchVO));
		
		return dailyMainListVO;
	}

	@Override
	public boolean removeDailyMain(String dailyId) {
		
		return dailyMainDao.deleteDailyMain(dailyId) > 0;
	}

}
