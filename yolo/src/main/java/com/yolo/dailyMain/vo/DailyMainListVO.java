package com.yolo.dailyMain.vo;

import java.util.List;

import com.yolo.common.web.Pager;
import com.yolo.common.web.PagerFactory;



public class DailyMainListVO {

	private List<DailyMainVO> dailyMainVOs;
	private Pager pager;
	
	public List<DailyMainVO> getDailyMainVOs() {
		return dailyMainVOs;
	}
	public void setDailyMainVOs(List<DailyMainVO> dailyMainVOs) {
		this.dailyMainVOs = dailyMainVOs;
	}
	
	public void setPager(Pager pager) {
		this.pager = pager;
	}
	
	public Pager getPager() {
		if(pager == null){
			pager= PagerFactory.getPager(pager.ORACLE);
		}
		
		return pager;
	}
	
	
	
	
	
}
