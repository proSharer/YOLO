package com.yolo.daily.biz;

import java.util.List;

import com.yolo.daily.vo.DailyVO;

public interface DailyBiz {

	public boolean insertDailyPart(DailyVO dailyVO);
	public List<DailyVO> getDailyPartsByDLID(String dailyId);
	public DailyVO getOneDailyPart(String dailyPatyId);
}
