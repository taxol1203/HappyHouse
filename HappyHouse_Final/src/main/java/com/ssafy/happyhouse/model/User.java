package com.ssafy.happyhouse.model;

public class User {	//사용자 객체
	private String id;
	private String pass;
	private String name;
	private String addr;
	private String phone;
	
	public User() {
		this("","","","","");
	}

	public User(String id, String pass, String name, String addr, String phone) {
		super();
		this.id = id;
		this.pass = pass;
		this.name = name;
		this.addr = addr;
		this.phone = phone;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("User [id=").append(id).append(", pass=").append(pass).append(", name=").append(name)
				.append(", addr=").append(addr).append(", phone=").append(phone).append("]");
		return builder.toString();
	}
}