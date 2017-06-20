package com.yolo.daily.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.yolo.daily.vo.DailyVO;

public class DailyDaoImpl extends SqlSessionDaoSupport implements DailyDao{

	@Override
	public int insertDailyPart(DailyVO dailyVO) {
		
		return getSqlSession().insert("DailyDao.insertDailyPart", dailyVO);
	}

	@Override
	public List<DailyVO> getDailyPartsByDLID(String dailyId) {
	
		return getSqlSession().selectList("DailyDao.getDailyPartsByDLID", dailyId);
	}

	@Override
	public DailyVO getOneDailyPart(String dailyPatyId) {
		
		return getSqlSession().selectOne("DailyDao.getOneDailyPart", dailyPatyId);
	}

	
	
}
