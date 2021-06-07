package com.ssafy.happyhouse.model.mapper;

import com.ssafy.happyhouse.model.User;

public interface UserMapper {

	public User userSelect(String id);
	public int userRegister(User user);
	public int userModify(User user);
	public int userDelete(String id);
}
