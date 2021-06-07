package com.ssafy.happyhouse.model.service;

import java.sql.SQLException;
import java.util.List;

import com.ssafy.happyhouse.model.Region;

public interface RegionService {
	List<String> selectGu(String city) throws SQLException;
	List<Region> selectDong(String gu) throws SQLException;
	Region selectOneDong(String dong) throws SQLException;
}
