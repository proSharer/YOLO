package com.yolo.daily.service;

import java.util.List;

import com.yolo.daily.vo.DailyVO;
import com.yolo.dailyMain.vo.DailyMainListVO;
import com.yolo.dailyMain.vo.DailyMainSearchVO;
import com.yolo.dailyMain.vo.DailyMainVO;

public interface DailyService {

	
	public boolean insertDailyPart(DailyVO dailyVO);
	
	public String getDailyId();
	
	public boolean addNewDailyMain(DailyMainVO dailyMainVO);
	
	public DailyMainListVO getAllDailyMain(DailyMainSearchVO dailyMainSearchVO); 
	
	public List<DailyVO> getDailyPartsByDLID(String dailyId);
	
	public DailyVO getOneDailyPart(String dailyPatyId);
	
	public boolean removeDailyMain(String dailyId);
}
