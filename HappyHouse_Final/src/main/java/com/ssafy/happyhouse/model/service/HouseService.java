package com.ssafy.happyhouse.model.service;

import java.sql.SQLException;
import java.util.List;

import com.ssafy.happyhouse.model.House;
import com.ssafy.happyhouse.model.Interest;

public interface HouseService {

	List<House> select() throws SQLException;	//전체 검색
	House selectOne(int no) throws SQLException;	//전체 검색
	List<House> selectName(String name) throws SQLException;	//건물명 검색
	List<House> searchName(String name) throws SQLException;	//건물명 검색
	List<House> selectDong(String dong) throws SQLException;	//동명 검색
	List<House> selectPrice(int price) throws SQLException;	//동명 검색
	int insert(House house) throws SQLException;
	int delete(String no) throws SQLException;
	int update(House house) throws SQLException;
	
	// 관심 아파트
	List<House> selectInterApt(String userId) throws SQLException;
	void insertInterApt(Interest interest) throws SQLException;
	void deleteInterApt(Interest interest) throws SQLException;
}
