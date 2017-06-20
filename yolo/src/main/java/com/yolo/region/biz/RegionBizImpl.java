package com.yolo.region.biz;

import java.util.List;

import com.yolo.region.dao.RegionDao;
import com.yolo.region.vo.RegionVO;

public class RegionBizImpl implements RegionBiz{

	private RegionDao regionDao;
	
	public void setRegionDao(RegionDao regionDao) {
		this.regionDao = regionDao;
	}

	@Override
	public List<RegionVO> getAllRegion() {
		return regionDao.selectAllRegion();
	}
}
