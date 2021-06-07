package com.ssafy.happyhouse.model;

public class House {	//건물 정보 클래스
	private int no;				//번호
	private String dong;		//동
	private String aptName;		//건물명
	private String code;		//지역코드
	private String dealAmount;	//거래금액
	private String buildYear;	//건설년도
	private int dealYear;	//거래해
	private int dealMonth;	//거래월
	private int dealDay;		//거래일
	private String area;		//면적
	private String floor;		//층수
	private String jibun;		//지번
	
	private String lat;			//위도
	private String lng;			//경도
	private int count;			// 중복되는 아파트 개수
	
	//생성자
	public House() {}

	public House(int no, String dong, String aptName, String code, String dealAmount, String buildYear, int dealYear,
			int dealMonth, int dealDay, String area, String floor, String jibun, String lat, String lng, int count) {
		super();
		this.no = no;
		this.dong = dong;
		this.aptName = aptName;
		this.code = code;
		this.dealAmount = dealAmount;
		this.buildYear = buildYear;
		this.dealYear = dealYear;
		this.dealMonth = dealMonth;
		this.dealDay = dealDay;
		this.area = area;
		this.floor = floor;
		this.jibun = jibun;
		this.lat = lat;
		this.lng = lng;
		this.count = count;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getDong() {
		return dong;
	}

	public void setDong(String dong) {
		this.dong = dong;
	}

	public String getAptName() {
		return aptName;
	}

	public void setAptName(String aptName) {
		this.aptName = aptName;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getDealAmount() {
		return dealAmount;
	}

	public void setDealAmount(String dealAmount) {
		this.dealAmount = dealAmount;
	}

	public String getBuildYear() {
		return buildYear;
	}

	public void setBuildYear(String buildYear) {
		this.buildYear = buildYear;
	}

	public int getDealYear() {
		return dealYear;
	}

	public void setDealYear(int dealYear) {
		this.dealYear = dealYear;
	}

	public int getDealMonth() {
		return dealMonth;
	}

	public void setDealMonth(int dealMonth) {
		this.dealMonth = dealMonth;
	}

	public int getDealDay() {
		return dealDay;
	}

	public void setDealDay(int dealDay) {
		this.dealDay = dealDay;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}
	
	public String getFloor() {
		return floor;
	}
	
	public void setFloor(String floor) {
		this.floor = floor;
	}

	public String getJibun() {
		return jibun;
	}

	public void setJibun(String jibun) {
		this.jibun = jibun;
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

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("House [no=").append(no).append(", dong=").append(dong).append(", aptName=").append(aptName)
				.append(", code=").append(code).append(", dealAmount=").append(dealAmount).append(", buildYear=")
				.append(buildYear).append(", dealYear=").append(dealYear).append(", dealMonth=").append(dealMonth)
				.append(", dealDay=").append(dealDay).append(", area=").append(area).append(", jibun=").append(jibun)
				.append(", floor=").append(floor).append(", lat=").append(lat).append(", lng=").append(lng).append("]");
		return builder.toString();
	}
	
}
