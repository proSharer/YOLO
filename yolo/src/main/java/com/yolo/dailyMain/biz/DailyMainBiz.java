package com.yolo.dailyMain.biz;

import com.yolo.dailyMain.vo.DailyMainListVO;
import com.yolo.dailyMain.vo.DailyMainSearchVO;
import com.yolo.dailyMain.vo.DailyMainVO;

public interface DailyMainBiz {

		public String getDailyId();
		
		public boolean addNewDailyMain(DailyMainVO dailyMainVO);
		
		public DailyMainListVO getAllDailyMain(DailyMainSearchVO dailyMainSearchVO);
		
		public boolean removeDailyMain(String dailyId);
		
		public boolean dailyMainLikeCountUpdatePlus(String dailyId);
		
		public boolean dailyMainLikeCountUpdateMinus(String dailyId);
		
		public DailyMainVO getOneDailyMain(String dailyId);
		
}
