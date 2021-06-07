package com.ssafy.happyhouse.model;

public class Environ {

	private String cname;	//업체명
	private String wname;	//업종명
	private String date;	//점검일자
	private String aans;	//점검결과
	
	//get set
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getWname() {
		return wname;
	}
	public void setWname(String wname) {
		this.wname = wname;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getAans() {
		return aans;
	}
	public void setAans(String aans) {
		this.aans = aans;
	}
	
	//생성자
	public Environ(String cname, String wname, String date, String aans) {
		super();
		this.cname = cname;
		this.wname = wname;
		this.date = date;
		this.aans = aans;
	}
	
}
