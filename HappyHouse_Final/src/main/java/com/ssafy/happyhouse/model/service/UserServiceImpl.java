package com.ssafy.happyhouse.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.User;
import com.ssafy.happyhouse.model.mapper.UserMapper;

@Service
public class UserServiceImpl implements UserService {
	private UserMapper uMapper;
	
	@Autowired
	public UserServiceImpl(UserMapper uMapper) {
		this.uMapper=uMapper;
	}

	@Override
	public User userSelect(String id) {
		return uMapper.userSelect(id);
	}

	@Override
	public int userRegister(User user) {
		return uMapper.userRegister(user);
	}

	@Override
	public int userModify(User user) {
		return uMapper.userModify(user);
	}

	@Override
	public int userDelete(String id) {
		return uMapper.userDelete(id);
	}
}