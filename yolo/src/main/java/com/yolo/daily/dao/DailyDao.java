package com.yolo.daily.dao;

import java.util.List;

import com.yolo.daily.vo.DailyVO;

public interface DailyDao  {

	
	public int insertDailyPart(DailyVO dailyVO);
	public List<DailyVO> getDailyPartsByDLID(String dailyId);
	public DailyVO getOneDailyPart(String dailyPatyId);
	
}
