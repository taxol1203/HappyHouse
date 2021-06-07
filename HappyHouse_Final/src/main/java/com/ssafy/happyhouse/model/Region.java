package com.ssafy.happyhouse.model;

public class Region {
	private String dongcode;
	private String city;
	private String gugun;
	private String dong;
	private String lat;
	private String lng;
	
	public Region(String dongcode, String city, String gugun, String dong, String lat, String lng) {
		super();
		this.dongcode = dongcode;
		this.city = city;
		this.gugun = gugun;
		this.dong = dong;
		this.lat = lat;
		this.lng = lng;
	}

	public String getDongcode() {
		return dongcode;
	}

	public void setDongcode(String dongcode) {
		this.dongcode = dongcode;
	}

	public String getLat() {
		return lat;
	}

	public void setLat(String lat) {
		this.lat = lat;
	}

	public String getLng() {
		return lng;
	}

	public void setLng(String lng) {
		this.lng = lng;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getGugun() {
		return gugun;
	}

	public void setGugun(String gugun) {
		this.gugun = gugun;
	}

	public String getDong() {
		return dong;
	}

	public void setDong(String dong) {
		this.dong = dong;
	}

	@Override
	public String toString() {
		return "Region [dongcode=" + dongcode + ", city=" + city + ", gugun=" + gugun + ", dong=" + dong + ", lat="
				+ lat + ", lng=" + lng + "]";
	}
}
