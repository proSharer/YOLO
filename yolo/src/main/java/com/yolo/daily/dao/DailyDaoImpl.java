package com.yolo.daily.dao;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.yolo.daily.vo.DailyVO;

public class DailyDaoImpl extends SqlSessionDaoSupport implements DailyDao{

	@Override
	public int insertDailyPart(DailyVO dailyVO) {
		
		return getSqlSession().insert("DailyDao.insertDailyPart", dailyVO);
	}

	
	
}
