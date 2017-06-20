package com.yolo.dailyMain.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.yolo.dailyMain.vo.DailyMainSearchVO;
import com.yolo.dailyMain.vo.DailyMainVO;

public class DailyMainDaoImpl extends SqlSessionDaoSupport implements DailyMainDao{

	@Override
	public String selectDailyId() {
	
		return getSqlSession().selectOne("DailyMainDao.selectDailyId");
	}

	@Override
	public int insertDailyMain(DailyMainVO dailyMainVO) {

		return getSqlSession().insert("DailyMainDao.insertDailyMain", dailyMainVO);
	}

	@Override
	public List<DailyMainVO> selectAllDailyMain(DailyMainSearchVO dailyMainSearchVO) {
		
		return getSqlSession().selectList("DailyMainDao.selectAllDailyMain", dailyMainSearchVO);
	}

	@Override
	public int deleteDailyMain(String dailyId) {
		
		return getSqlSession().delete("DailyMainDao.deleteDailyMain", dailyId);
	}

	
	
	
	
}
