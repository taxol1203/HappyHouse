package com.ssafy.happyhouse.model;

import java.util.Date;

public class Interest {
	int no;
	String aptName; 
	String dong;
	Date regtime;
	String userId;
	
	public Interest(String aptName, String userId) {
		super();
		this.aptName = aptName;
		this.userId = userId;
	}
	public Interest(String aptName, String dong, String userId) {
		super();
		this.aptName = aptName;
		this.dong = dong;
		this.userId = userId;
	}
	
	public Interest(int no, String aptName, String dong, Date regtime, String userId) {
		super();
		this.no = no;
		this.aptName = aptName;
		this.dong = dong;
		this.regtime = regtime;
		this.userId = userId;
	}
	public String getAptName() {
		return aptName;
	}
	public void setAptName(String aptName) {
		this.aptName = aptName;
	}
	public String getDong() {
		return dong;
	}
	public void setDong(String dong) {
		this.dong = dong;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public Date getRegtime() {
		return regtime;
	}
	public void setRegtime(Date regtime) {
		this.regtime = regtime;
	} 
	
	
}
