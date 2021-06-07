<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" scope="session" />
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="https://fonts.googleapis.com/css?family=Poppins:400,800" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/1.0.2/Chart.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<script src="//code.jquery.com/jquery-3.3.1.js"></script>

<!-- 카드 뷰 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

<%@ include file="/WEB-INF/views/in_right/header.jsp"%>

<style>
.area_select {
    position: relative;
    height: 51px;
    line-height: 51px;
    background: #f0f1ff;
    overflow: hidden;
    margin-top: 1em;
    margin-left: 1em; 
    margin-bottom: 1em; 
}
.modal-80size {
  width: 60%;
  height: 900px;
  margin: 0;
  padding: 0;
  overflow: auto;
}
.seeMore-modal{
position: absolute;

	height: 800px;	
	overflow: auto;
}

/* #seeMore_t { display: block; }

#seeMore_th { display: block; }

#seeMore_table {
    height: 800px;      
    overflow-y: auto;    
    overflow-x: hidden;  
}
 */
 
 /* 카드 뷰 */
 .card-box {
    position: relative;
    color: #fff;
    padding: 20px 10px 40px;
    margin: 20px 0px;
}
.card-box:hover {
    text-decoration: none;
    color: #f1f1f1;
}
.card-box:hover .icon i {
    font-size: 100px;
    transition: 1s;
    -webkit-transition: 1s;
}
.card-box .inner {
    padding: 5px 10px 0 10px;
}
.card-box h3 {
    font-size: 27px;
    font-weight: bold;
    margin: 0 0 8px 0;
    white-space: nowrap;
    padding: 0;
    text-align: left;
}
.card-box p {
    font-size: 15px;
}
.card-box .icon {
    position: absolute;
    top: auto;
    bottom: 5px;
    right: 5px;
    z-index: 0;
    font-size: 72px;
    color: rgba(0, 0, 0, 0.15);
}
.card-box .card-box-footer {
    position: absolute;
    left: 0px;
    bottom: 0px;
    text-align: center;
    padding: 3px 0;
    color: rgba(255, 255, 255, 0.8);
    background: rgba(0, 0, 0, 0.1);
    width: 100%;
    text-decoration: none;
}
.card-box:hover .card-box-footer {
    background: rgba(0, 0, 0, 0.3);
}
.bg-blue {
    background-color: #00c0ef !important;
}
.bg-green {
    background-color: #00a65a !important;
}
.bg-orange {
    background-color: #f39c12 !important;
}
.bg-red {
    background-color: #d9534f !important;
}
 
</style>

<div class= "area_select" id="area_sel" style="text-align:center">
	<span id="c" onclick="init()">시도</span> &nbsp > &nbsp<span id="g">시군구</span> &nbsp > &nbsp<span id="d">읍면동 선택</span>
</div>

<c:if test="${!empty dongInfo}">
	<div class="list-group" id="list-tab" role="tablist" style="margin-left: 1em">
		
	</div>
</c:if>
<c:if test="${empty dongInfo}">
	<div class="list-group" id="list-tab" role="tablist" style="margin-left: 1em">
		<a class="list-group-item list-group-item-action active" id="list-home-list" data-toggle="list" onclick="sel_city('서울특별시')" role="tab">서울시</a>
		<a class="list-group-item list-group-item-action" id="list-home-list" data-toggle="list" onclick="sel_city('')" role="tab">부산시</a>
		<a class="list-group-item list-group-item-action" id="list-home-list" data-toggle="list" onclick="sel_city('')" role="tab">경기도</a>
		<a class="list-group-item list-group-item-action" id="list-home-list" data-toggle="list" onclick="sel_city('')" role="tab">대구시</a>
		<a class="list-group-item list-group-item-action" id="list-home-list" data-toggle="list" onclick="sel_city('')" role="tab">인천시</a>
		<a class="list-group-item list-group-item-action" id="list-home-list" data-toggle="list" onclick="sel_city('')" role="tab">광주시</a>
		<a class="list-group-item list-group-item-action" id="list-home-list" data-toggle="list" onclick="sel_city('')" role="tab">대전시</a>
		<a class="list-group-item list-group-item-action" id="list-home-list" data-toggle="list" onclick="sel_city('')" role="tab">울산시</a>
		<a class="list-group-item list-group-item-action" id="list-home-list" data-toggle="list" onclick="sel_city('')" role="tab">세종시</a>
		<a class="list-group-item list-group-item-action" id="list-home-list" data-toggle="list" onclick="sel_city('')" role="tab">강원도</a>
		<a class="list-group-item list-group-item-action" id="list-home-list" data-toggle="list" onclick="sel_city('')" role="tab">충청도</a>
		<a class="list-group-item list-group-item-action" id="list-home-list" data-toggle="list" onclick="sel_city('')" role="tab">경상도</a>
		<a class="list-group-item list-group-item-action" id="list-home-list" data-toggle="list" onclick="sel_city('')" role="tab">전라도</a>
		<a class="list-group-item list-group-item-action" id="list-home-list" data-toggle="list" onclick="sel_city('')" role="tab">제주도</a>
	</div>
</c:if>

<!-- 아파트 상세 모달 -->
<div class="portfolio-modal modal fade" id="selectApt" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content modal-80size" style="width: 60%;">
            <div class="close-modal" data-bs-dismiss="modal">
            	<img src="${root}/resources/assets/img/close-icon.svg" alt="Close modal" />
            </div>
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-8">
                        <div class="modal-body">
                        	<!-- 모달 헤더 -->
							<!-- <nav class="fixed">
							    <div class="nav nav-tabs" id="nav-tab" role="tablist">
							      <a class="nav-item nav-link btn btn-danger active nav-link" id="nav-home-tab" data-toggle="tab" href="#details" role="tab" aria-controls="nav-home" aria-selected="true">All</a>
							      <a class="nav-item nav-link btn btn-danger active nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="true">Websites</a>
							      <a class="nav-item nav-link btn btn-danger active nav-link" id="nav-contact-tab" data-toggle="tab" href="#nav-contact" role="tab" aria-controls="nav-contact" aria-selected="true">Themes</a>
							    </div>
						  	</nav>
						  	
						  	<br> -->
						  	
						  	<section class="page-section" id="details">
            					<div class="container">
                            <!-- Project details-->
                            <h2 class="text-uppercase" id="modal_apt_name"></h2>
                            <p class="item-intro text-muted" id="modal_apt_recent_deal"></p>
                            <%-- <img class="img-fluid d-block mx-auto" src="${root}/resources/assets/img/apt_photo.jpg" alt="..." /> --%>
                            <div id="roadview" style="width:100%;height:300px;"></div>
                            
                            <!-- 아파트 상세 정보 -->
                            <table class="table table-hover">
							  <thead>
							    <tr>
							      <th scope="col">항목</th>
							      <th scope="col">정보</th>
							    </tr>
							  </thead>
							  <tbody>
							    <tr>
							      <th scope="row">아파트 이름</th>
							      <td id="table_aptName"></td>
							    </tr>
							    <tr>
							      <th scope="row">건설 년도</th>
							      <td id="table_buildYear"></td>
							    </tr>
							    <tr>
							      <th scope="row">주소</th>
							      <td id="table_addr"></td>
							    </tr>
							   <!--  <tr>
							      <th scope="row">지하 주차</th>
							      <td>1544대</td>
							    </tr>
							    <tr>
							      <th scope="row">총 동수</th>
							      <td>15동</td>
							    </tr> -->
							  </tbody>
							</table>
                            	</div>
                            </section>
                            <hr>
                            
                            <div style="text-align:left">
	                            <div style="font-size: 20px;">
	                            	<span style="color: blue;"><strong>총 거래 내역: </strong></span>
	                            	<span id="allTrade"></span>
	                            </div>
	                            <div>최근 거래</div>
	                            <div>
	                            	<span>매매 </span>
	                            	<span id="recentDeal"></span>
	                            	<span > / </span>
	                            	<span id="recentYear"></span>
	                            	<span>년 </span>
	                            	<span id="recentMonth"></span>
	                            </div>
                            </div>
                            
                            <canvas id="myChart"></canvas>
                            
                            <div style="text-align:right; font-size: 12px;">
                            	* 가격 단위는 10,000원 입니다. 
                            </div>
                            
                            <!-- 최근 거래 내역 표-->
                            <table class="table">
							  <thead class="thead-dark">
							    <tr>
							      <th scope="col">계약체결</th>
							      <th scope="col">일</th>
							      <th scope="col">체결가격</th>
							      <th scope="col">거래 층</th>
							      <th scope="col">면적</th>
							    </tr>
							  </thead>
							  <tbody id="detail_Table">
							  </tbody>
							</table>
                            
                            <span id="seeMoreInfo">
                            	
                            </span>
                            
                            <hr>
                            
                            <!-- 역세권, 학군 정보 -->
							<div class="row">
								<div class="col-lg-12 col-sm-6" style="text-align: left;">
					                <div class="card-box bg-green">
					                    <div class="inner">
					                        <h3> 교통 여건 </h3>
					                        <div id="nearSubway">
					                        	
					                        </div>
					                        
					                    </div>
					                    <div class="icon">
					                        <i class="fa fa-subway" aria-hidden="true"></i>
					                    </div>
					                </div>
					            </div>
								
								<div class="col-lg-12 col-sm-6"  style="text-align: left;">
					                <div class="card-box bg-blue">
					                    <div class="inner">
					                        <h3> 주변 학교 </h3>
					                        <div id="nearSchool">
					                        	
					                        </div>
					                    </div>
					                    <div class="icon">
					                        <i class="fa fa-graduation-cap" aria-hidden="true"></i>
					                    </div>
					                    <!-- <a href="#" class="card-box-footer">View More <i class="fa fa-arrow-circle-right"></i></a> -->
					                </div>
					            </div>
				            </div>
							
							
							<span id="placeDist">
							
							</span>
                            
                            <hr>
                            <!-- 평균 가격 계산 -->
                            <button class="btn btn-warning btn-xl text-uppercase" type="button" onclick="addInterest()">
                                <i class="far fa-save"></i>
                                	관심 주택으로 등록
                            </button>
                            <button class="btn btn-primary btn-xl text-uppercase" data-bs-dismiss="modal" type="button">
                                <i class="fas fa-times me-1"></i>
                                	닫기
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Modal: 자세히 보기 모달 -->
<div class="modal fade" id="modalCart" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
  aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content seeMore-modal">
      <!--Header-->
      <div class="modal-header">
        <h4 class="modal-title" id="myModalLabel">상세 거래 현황</h4>
        <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">×</span>
        </button>
      </div>
      <!--Body-->
      <div class="modal-body">

        <table class="table table-hover">
          <thead>
            <tr>
              <th scope="col">계약체결</th>
		      <th scope="col">일</th>
		      <th scope="col">체결가격</th>
		      <th scope="col">거래 층</th>
		      <th scope="col">면적</th>
            </tr>
          </thead>
          <tbody id="seeMore_table">
            
          </tbody>
        </table>

      </div>
      <!--Footer-->
      <div class="modal-footer">
        <button type="button" class="btn btn-outline-danger" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>


<script type="text/javascript">

	$( document ).ready(function(){
		// 동 정보를 선택 하였을 때
		if(${!empty dongInfo}){
			console.log('<c:out value="${dongInfo.dong}"/>');
			
			$.ajax({
				url : "${root}/house/dongList/" + '<c:out value="${dongInfo.dong}"/>',
				type : "get",
				success : function(data) {
					$("#list-tab").empty();
					$.each(data, function(idx, apt){
						$("#list-tab").append(
							`<div class="list-group-item list-group-item-action" data-toggle="list" role="tab" data-bs-toggle="modal" href="#selectApt" onclick="getAptDist('\${apt.aptName}'); getAptData('\${apt.aptName}');"">
								<p class="title">
									<span>\${apt.aptName}</span>
									<!-- <span> | 총 \${apt.count}개의 거래 내역</span> -->
								</p>
								<p class="info">
									<span>\${apt.buildYear}년 | </span>
									<span>\${apt.dong} </span>
									<span>\${apt.jibun}</span>
								</p>
							</div>
							`
						);
					});
				},
				error : function(xhr,status,msg) {
					alert("요청 실패");
				}
			});
		}
		
	});
	
	let cityName = "";
	
	// 도시 선택에 따라 구 불러오기
	function sel_city(city){
		cityName = city;
		$("#c").text(city)
		$.ajax({
			url : "${root}/region/Gu/" + city,
			type : "get",
			success : function(guStr) {
				$("#list-tab").empty();
				$.each(guStr, function(idx, gu){
					$("#list-tab").append(`<a class="list-group-item list-group-item-action" id="list-home-list" data-toggle="list" onclick="sel_Gu('\${gu}')" role="tab">\${gu}</a>`);
				});
			},
			error : function(xhr,status,msg) {
				alert("요청 실패");
			}
		});
	}
	
	function sel_Gu(gu){
		$("#g").text(gu)
		$.ajax({
			url : "${root}/region/Dong/" + gu,
			type : "get",
			success : function(dongs) {
				$("#list-tab").empty();
				$.each(dongs, function(idx, dong){
					$("#list-tab").append(`<a class="list-group-item list-group-item-action" id="list-home-list" data-toggle="list"`
							+ `onclick="sel_Dong('\${dong.dong}')" role="tab">\${dong.dong}</a>`);
				});
			},
			error : function(xhr,status,msg) {
				alert("요청 실패");
			}
		});
	}
	
	function sel_Dong(dong){
		$("#d").text(dong)
		console.log(dong);
		window.location.href = "${root}/selDong/"+ dong + "#about";
	}	
	
	// 장소 검색 객체를 생성합니다
	var swps = new kakao.maps.services.Places(map);
	var schps = new kakao.maps.services.Places(map);
	
	var aptLat;
	var aptLng;
	var swLat;
	var swLng;
	var schLat;
	var schLng;
	var InterAptName;
	var InterDong;
	 
	/* 모달창을 클릭했을 때 */
	function getAptData(aptName){
		$.ajax({
			url : "${root}/house/aptList/" + aptName,
			type : "get",
			success : function(data) {
				// 관심지역 등록을 위한 아파트 이름, 동
				InterAptName = data[0].aptName;
				InterDong = data[0].dong;
				
				// 아파트 이름을 통하여 데이터를 가져왔을 때
				$("#detail_Table").empty();
				$("#myChart").empty();
				$("#seeMoreInfo").empty();
				let aptName = data[0].aptName;
				let recentYear = data[0].dealYear;
				let recentMonth = data[0].dealMonth;
				let table_buildYear = data[0].buildYear;
				let table_addr = data[0].dong + " " + data[0].jibun;
				let count = 0;
				var date = [];
				var amount = [];
				var minN;
				var maxN;
				var maxCnt=0;
				// 표 만들기
				$.each(data, function(idx, apt){
					let area = Math.ceil(apt.area * 0.3025);
					$("#detail_Table").append(`
						<tr>
					      <th scope="row">\${apt.dealYear}.\${apt.dealMonth}</th>
					      <td>\${apt.dealDay}</td>
					      <td>\${apt.dealAmount}</td>
					      <td>\${apt.floor}층</td>
					      <td>\${area}평</td>
					    </tr>
				    `);
					
					maxCnt = maxCnt + 1;
					
					if(maxCnt == 10){
						$("#seeMoreInfo").append(`
								<button type="button" class="btn btn-primary btn-lg" onclick="seeMoreApt('\${aptName}')">더 많은 거래 정보 보기</button>
								`);
						return false;
					}
				});
				
				// 데이터 취합
				$.each(data, function(idx, apt){
					count = count + 1;
					date.push(apt.dealYear + "." + apt.dealMonth);
					amount.push(apt.dealAmount.replace(',',''));
				});
				
				var roadviewContainer = document.getElementById('roadview'); //로드뷰를 표시할 div
				var roadview = new kakao.maps.Roadview(roadviewContainer); //로드뷰 객체
				var roadviewClient = new kakao.maps.RoadviewClient(); //좌표로부터 로드뷰 파노ID를 가져올 로드뷰 helper객체

				var position = new kakao.maps.LatLng(data[0].lat, data[0].lng);

				// 특정 위치의 좌표와 가까운 로드뷰의 panoId를 추출하여 로드뷰를 띄운다.
				roadviewClient.getNearestPanoId(position, 50, function(panoId) {
				    roadview.setPanoId(panoId, position); //panoId와 중심좌표를 통해 로드뷰 실행
				});
				
				minN = Math.min.apply(null, amount);
				maxN = Math.max.apply(null, amount);
				
				date = date.reverse();
				amount = amount.reverse();
				
				minN = minN - 10000;
				maxN = maxN + 10000;
				
				$("#modal_apt_name").text(aptName);
				$("#modal_apt_recent_deal").text("최근 거래 일자 : " + recentYear + "년 " + recentMonth+ "월");
				$("#table_aptName").text(aptName);
				$("#table_buildYear").text(table_buildYear);
				$("#table_addr").text(table_addr);
				$("#table_buildYear").text(table_buildYear);
				$("#allTrade").text(count);
				$("#recentDeal").text(data[0].dealAmount);
				$("#recentYear").text(data[0].dealYear);
				$("#recentMonth").text(data[0].dealMonth + "월");
				
				var ctx = document.getElementById('myChart').getContext('2d'); 
				var chart = new Chart(ctx, { 
					// type : 'bar' = 막대차트를 의미합니다. 
					type: 'line', // 
					data: { 
						labels: date, 
						datasets: [{ 
							label: '날짜 별 거래',  
							borderColor: 'rgb(255, 99, 132)', 
							data: amount
						}] 
					},
					options: {
				        responsive: true,
				        title: {
				            display: true,
				            text: '최근 거래 내역'
				        },
				        tooltips: {
				            mode: 'index',
				            intersect: false,
				        },
				        hover: {
				            mode: 'nearest',
				            intersect: true
				        },
				        scales: {
				            xAxes: [{
				                display: true,
				                scaleLabel: {
				                    display: true,
				                    labelString: '년, 월'
				                }
				            }],
				            yAxes: [{
				                display: true,
				                ticks: {
				                	min: minN,
									max: maxN,
				                },
				                scaleLabel: {
				                    display: true,
				                    labelString: '금액'
				                }
				            }]
				        }
				    }
					}
				);
				$('#nearSubway').empty();
				let dis;
				for (step = 0; step < subwayName.length; step++) {
					dis = Math.round(subwayDis[step]);
					$('#nearSubway').append(`<div>지하철 : <strong>\${subwayName[step]}</strong>과 \${dis}m 만큼 떨어져 있습니다.</div>`);
				}
				
				$('#nearSchool').empty();
				for (step = 0; step < schoolDis.length; step++) {
					dis = Math.round(schoolDis[step]);
					$('#nearSchool').append(`<div>학교 : <strong>\${schoolName[step]}</strong>과 \${dis}m 만큼 떨어져 있습니다.</div>`);
				}
				subwayDis.length = 0;
				subwayName.length = 0;
				schoolDis.length = 0;
				schoolName.length = 0;

			},
			error : function(xhr,status,msg) {
				alert("요청 실패");
			}
		});
	}
	
	/* 모달창을 클릭했을 때 */
	function seeMoreApt(aptName){
		$('#modalCart').modal('show');
		$.ajax({
			url : "${root}/house/aptList/" + aptName,
			type : "get",
			success : function(data) {
				// 아파트 이름을 통하여 데이터를 가져왔을 때
				$("#seeMore_table").empty();
				
				// 표 만들기
				$.each(data, function(idx, apt){
					let area = Math.ceil(apt.area * 0.3025);
					$("#seeMore_table").append(`
						<tr>
					      <th scope="row">\${apt.dealYear}.\${apt.dealMonth}</th>
					      <td>\${apt.dealDay}</td>
					      <td>\${apt.dealAmount}</td>
					      <td>\${apt.floor}층</td>
					      <td>\${area}평</td>
					    </tr>
				    `);
				});
			},
			error : function(xhr,status,msg) {
				alert("요청 실패");
			}
		});
	}

	function addInterest(){
		$.ajax({
			url : "${root}/house/interest_ins/" + InterAptName + "/" + '${userinfo.id}' + "/" + InterDong,
			type : "get",
			success : function(data) {
				alert("관심지역 등록 성공");
			},
			error : function(xhr,status,msg) {
				alert("요청 실패");
			}
		});
	}
	
	function init(){
		$("#list-tab").empty();
		$("#list-tab").append(`
				<a class="list-group-item list-group-item-action active" id="list-home-list" data-toggle="list" onclick="sel_city('서울특별시')" role="tab">서울시</a>
				<a class="list-group-item list-group-item-action" id="list-home-list" data-toggle="list" onclick="sel_city('')" role="tab">부산시</a>
				<a class="list-group-item list-group-item-action" id="list-home-list" data-toggle="list" onclick="sel_city('')" role="tab">경기도</a>
				<a class="list-group-item list-group-item-action" id="list-home-list" data-toggle="list" onclick="sel_city('')" role="tab">대구시</a>
				<a class="list-group-item list-group-item-action" id="list-home-list" data-toggle="list" onclick="sel_city('')" role="tab">인천시</a>
				<a class="list-group-item list-group-item-action" id="list-home-list" data-toggle="list" onclick="sel_city('')" role="tab">광주시</a>
				<a class="list-group-item list-group-item-action" id="list-home-list" data-toggle="list" onclick="sel_city('')" role="tab">대전시</a>
				<a class="list-group-item list-group-item-action" id="list-home-list" data-toggle="list" onclick="sel_city('')" role="tab">울산시</a>
				<a class="list-group-item list-group-item-action" id="list-home-list" data-toggle="list" onclick="sel_city('')" role="tab">세종시</a>
				<a class="list-group-item list-group-item-action" id="list-home-list" data-toggle="list" onclick="sel_city('')" role="tab">강원도</a>
				<a class="list-group-item list-group-item-action" id="list-home-list" data-toggle="list" onclick="sel_city('')" role="tab">충청도</a>
				<a class="list-group-item list-group-item-action" id="list-home-list" data-toggle="list" onclick="sel_city('')" role="tab">경상도</a>
				<a class="list-group-item list-group-item-action" id="list-home-list" data-toggle="list" onclick="sel_city('')" role="tab">전라도</a>
				<a class="list-group-item list-group-item-action" id="list-home-list" data-toggle="list" onclick="sel_city('')" role="tab">제주도</a>				
				`);
		$("#area_sel").empty();
		$("#area_sel").append(`
		<span id="c" onclick="init()">시도</span> &nbsp > &nbsp<span id="g">시군구</span> &nbsp > &nbsp<span id="d">읍면동 선택</span>
		`);
	}
</script>

