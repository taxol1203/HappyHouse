package com.ssafy.happyhouse.model.mapper;

import java.sql.SQLException;
import java.util.List;

import com.ssafy.happyhouse.model.House;
import com.ssafy.happyhouse.model.Interest;

public interface HouseMapper {
	public List<House> select() throws SQLException;	//전체 검색
	public House selectOne(int no) throws SQLException;	//조회
	public List<House> selectName(String name) throws SQLException;	//건물명 검색
	public List<House> searchName(String name) throws SQLException;	//건물명 검색
	public List<House> selectDong(String dong) throws SQLException;	//동명 검색
	public List<House> selectPrice(int price) throws SQLException;	//가격 검색
	public int insert(House house) throws SQLException;
	public int delete(String no) throws SQLException;
	public int update(House house) throws SQLException;
	
	// 관심 아파트
	List<House> selectInterApt(String userId) throws SQLException;
	void insertInterApt(Interest interest) throws SQLException;
	void deleteInterApt(Interest interest) throws SQLException;
}
