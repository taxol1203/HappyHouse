package com.ssafy.happyhouse.model;

public class Notice {	//공지사항
	private String num;	//공지사항 번호	
	private String title;	//공지명
	private String writer;	//작성자
	private String des;	//내용
	
	//생성자
	public Notice() {}
	public Notice(String num, String title, String writer, String des) {
		super();
		this.num = num;
		this.title = title;
		this.writer = writer;
		this.des = des;
	}
	//게터 세터
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getDes() {
		return des;
	}
	public void setDes(String des) {
		this.des = des;
	}
	
}
