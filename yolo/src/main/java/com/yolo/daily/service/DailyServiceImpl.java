package com.yolo.daily.service;

import com.yolo.daily.biz.DailyBiz;
import com.yolo.daily.vo.DailyVO;

public class DailyServiceImpl implements DailyService {

	private DailyBiz dailyBiz;
	
	public void setDailyBiz(DailyBiz dailyBiz) {
		this.dailyBiz = dailyBiz;
	}
	
	@Override
	public boolean insertDailyPart(DailyVO dailyVO) {
		// TODO Auto-generated method stub
		return dailyBiz.insertDailyPart(dailyVO);
	}

}
