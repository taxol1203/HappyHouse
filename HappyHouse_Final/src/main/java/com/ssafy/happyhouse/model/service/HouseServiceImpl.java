package com.ssafy.happyhouse.model.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.House;
import com.ssafy.happyhouse.model.Interest;
import com.ssafy.happyhouse.model.mapper.HouseMapper;

@Service
public class HouseServiceImpl implements HouseService {
	
	@Autowired
	private HouseMapper mapper;
	
	public HouseMapper getMapper() {
		return mapper;
	}
//	@Autowired
//	public void setMapper(HouseMapper mapper) {
//		this.mapper = mapper;
//	}

	@Override
	public List<House> select() throws SQLException {
		return mapper.select();
	}

	@Override
	public House selectOne(int no) throws SQLException {
		return mapper.selectOne(no);
	}

	@Override
	public List<House> selectName(String name) throws SQLException {
		return mapper.selectName(name);
	}
	
	@Override
	public List<House> searchName(String name) throws SQLException {
		return mapper.searchName(name);
	}


	@Override
	public List<House> selectDong(String dong) throws SQLException {
		return mapper.selectDong(dong);
	}

	@Override
	public List<House> selectPrice(int price) throws SQLException {
		return mapper.selectPrice(price);
	}

	@Override
	public int insert(House house) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(String no) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(House house) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<House> selectInterApt(String userId) throws SQLException {
		// TODO Auto-generated method stub
		return mapper.selectInterApt(userId);
	}

	@Override
	public void insertInterApt(Interest interest) throws SQLException {
		mapper.insertInterApt(interest);
		
	}

	@Override
	public void deleteInterApt(Interest interest) throws SQLException {
		mapper.deleteInterApt(interest);
	}

}
