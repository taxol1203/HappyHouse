package com.ssafy.happyhouse.model.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.Region;
import com.ssafy.happyhouse.model.mapper.RegionMapper;

@Service
public class RegionServiceImpl implements RegionService {

	@Autowired
	RegionMapper regionMapper;
		
	@Override
	public List<String> selectGu(String city) throws SQLException{
		return regionMapper.selectGu(city);
	}

	@Override
	public List<Region> selectDong(String gu) throws SQLException {
		return regionMapper.selectDong(gu);
	}

	@Override
	public Region selectOneDong(String dong) throws SQLException {
		return regionMapper.selectOneDong(dong);
	}
	
}
