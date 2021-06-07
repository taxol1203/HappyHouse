package com.ssafy.happyhouse.model.service;

import com.ssafy.happyhouse.model.User;

public interface UserService {

	public User userSelect(String id);
	public int userRegister(User user);
	public int userModify(User user);
	public int userDelete(String id);
}
