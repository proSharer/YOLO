package com.yolo.daily.service;

import java.util.List;

import com.yolo.daily.biz.DailyBiz;
import com.yolo.daily.vo.DailyVO;
import com.yolo.dailyMain.biz.DailyMainBiz;
import com.yolo.dailyMain.vo.DailyMainListVO;
import com.yolo.dailyMain.vo.DailyMainSearchVO;
import com.yolo.dailyMain.vo.DailyMainVO;

public class DailyServiceImpl implements DailyService {

	private DailyBiz dailyBiz;
	private DailyMainBiz dailyMainBiz;
	
	public void setDailyMainBiz(DailyMainBiz dailyMainBiz) {
		this.dailyMainBiz = dailyMainBiz;
	}
	
	public void setDailyBiz(DailyBiz dailyBiz) {
		this.dailyBiz = dailyBiz;
	}
	
	@Override
	public boolean insertDailyPart(DailyVO dailyVO) {
	
		return dailyBiz.insertDailyPart(dailyVO);
	}

	@Override
	public String getDailyId() {
	
		return dailyMainBiz.getDailyId();
	}

	@Override
	public boolean addNewDailyMain(DailyMainVO dailyMainVO) {
		
		return dailyMainBiz.addNewDailyMain(dailyMainVO);
	}

	@Override
	public DailyMainListVO getAllDailyMain(DailyMainSearchVO dailyMainSearchVO) {
	
		return dailyMainBiz.getAllDailyMain(dailyMainSearchVO);
	}

	@Override
	public List<DailyVO> getDailyPartsByDLID(String dailyId) {
		
		return dailyBiz.getDailyPartsByDLID(dailyId);
	}

	@Override
	public DailyVO getOneDailyPart(String dailyPatyId) {
		
		return dailyBiz.getOneDailyPart(dailyPatyId);
		
	}

	@Override
	public boolean removeDailyMain(String dailyId) {
		
		return dailyMainBiz.removeDailyMain(dailyId);
	}

}
