package com.ssafy.happyhouse.model.mapper;

import java.util.List;

import com.ssafy.happyhouse.model.Region;

public interface RegionMapper {
	List<String> selectGu(String city);
	List<Region> selectDong(String gu);
	Region selectOneDong(String dongName);
}
