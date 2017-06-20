package com.yolo.region.dao;

import java.util.List;

import com.yolo.region.vo.RegionVO;

public interface RegionDao {

	public List<RegionVO> selectAllRegion();
	
}
