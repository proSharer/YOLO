package com.yolo.region.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.yolo.region.vo.RegionVO;

public class RegionDaoImpl extends SqlSessionDaoSupport implements RegionDao{

	@Override
	public List<RegionVO> selectAllRegion() {
		return getSqlSession().selectList("RegionDao.selectAllRegion");
	} 
}
