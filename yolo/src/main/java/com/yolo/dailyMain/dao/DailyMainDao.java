package com.yolo.dailyMain.dao;

import java.util.List;

import com.yolo.dailyMain.vo.DailyMainSearchVO;
import com.yolo.dailyMain.vo.DailyMainVO;

public interface DailyMainDao {

	public String selectDailyId();
	
	public int insertDailyMain(DailyMainVO dailyMainVO);
	
	public List<DailyMainVO> selectAllDailyMain(DailyMainSearchVO dailyMainSearchVO);
	
	public int deleteDailyMain(String dailyId);
	
}
