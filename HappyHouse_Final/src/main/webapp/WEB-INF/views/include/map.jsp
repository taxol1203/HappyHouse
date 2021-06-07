<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" scope="session" />
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="shortcut icon" href="img/favicon.ico" />
<!-- bootstrap을 위한 js & css 등록 -->
<link rel="stylesheet"href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<style>
.apt-title {
    display: block;
    background: #0174DF;
    color: #fff;
    text-align: center;
    height: 24px;
    line-height:22px;
    border-radius:15px;
    padding:0px 10px;
}
.subway-title {
    display: block;
    background: #FF4000;
    color: #fff;
    text-align: center;
    height: 24px;
    line-height:22px;
    border-radius:15px;
    padding:0px 10px;
}
.school-title {
    display: block;
    background: #40FF00;
    color: #fff;
    text-align: center;
    height: 24px;
    line-height:22px;
    border-radius:15px;
    padding:0px 10px;
}
</style>

<!-- 지도가 표시될 div -->
<div id="map" style="width: 100%; height: 100%; margin: auto;"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=70637844898619529587eb45affbf54b&libraries=services,clusterer,drawing"></script>
<script src="//code.jquery.com/jquery-3.3.1.js"></script>
<script>

	var map;
	var lat;
	var lng;
	var urll;
	var houseMarker = [];
	var houseiw = [];
	
	var subwayMarker = [];
	var schoolMarker = [];
	var subwayiw = [];
	var schooliw = [];
	var circleArr = [];
	
	$( document ).ready(function(){
		if(${empty dongInfo}) {
			console.log("is Empty");
			urll = "${root}/house/dongList/" + "역삼동";
			lat = 37.5012743;
			lng = 127.039585;
		} else {
			lat = '<c:out value="${dongInfo.lat}"/>';
			lng = '<c:out value="${dongInfo.lng}"/>';
			urll = "${root}/house/dongList/" + '<c:out value="${dongInfo.dong}"/>'
		}
		
		map = new daum.maps.Map(document.getElementById('map'), { // 지도를 표시할 div
	        center : new daum.maps.LatLng(lat, lng), // 지도의 중심좌표 
	        level : 5 // 지도의 확대 레벨 
	    });
		
		// 마커 클러스터러를 생성합니다 
	    var clusterer = new daum.maps.MarkerClusterer({
	        map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
	        averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
	        minLevel: 5 // 클러스터 할 최소 지도 레벨 
	    });
		
		$.ajax({
			url : urll,
			type : "GET",
			data : "",
			dataType : "json",
			success : function(data) {//요청에 성공하면 DB에서 꺼낸 데이터를 json 형식으로 응답 받는다.

				//마커들을 저장할 변수
				var markers = $(data).map(
					function(i, position) {
						//마커를 하나 새로 만드는데, 위치값을 지정하고 클릭이 가능하게 설정함.
						var marker = new daum.maps.Marker({
							position : new daum.maps.LatLng(position.lat, position.lng),
							clickable : true
						});
						//띄울 인포윈도우 정의
						var iwContent = '<span class="apt-title">'
							+ position.aptName
							+ '</span>';// 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
						// 인포윈도우를 생성합니다
						var infowindow = new daum.maps.InfoWindow({
							content : iwContent,
						});
						// 마커 위에 인포윈도우를 표시합니다
						infowindow.open(map, marker);
						// 마커에 클릭이벤트를 등록합니다
						daum.maps.event.addListener(marker, 'click',
							function() {
								$('#selectApt').modal('show');
								getAptDist(position.aptName);
								getAptData(position.aptName);
							});
						//생성된 마커를 반환합니다.
						return marker;
					});
				// 인포윈도우 css 강제로 변경
				var aptTitle = document.querySelectorAll('.apt-title');
				aptTitle.forEach(function(e) {
				    var w = e.offsetWidth + 10;
				    var ml = w/2;
				    e.parentElement.style.top = "82px";
				    e.parentElement.style.left = "50%";
				    e.parentElement.style.marginLeft = -ml+"px";
				    e.parentElement.style.width = w+"px";
				    e.parentElement.previousSibling.style.display = "none";
				    e.parentElement.parentElement.style.border = "0px";
				    e.parentElement.parentElement.style.background = "unset";
				});
				// 마커 클러스터러에 클릭이벤트를 등록합니다
				// 마커 클러스터러를 생성할 때 disableClickZoom을 true로 설정하지 않은 경우
				// 이벤트 헨들러로 cluster 객체가 넘어오지 않을 수도 있습니다
				daum.maps.event.addListener(clusterer, 'clusterclick', function(
						cluster) {
					// 현재 지도 레벨에서 1레벨 확대한 레벨
					var level = map.getLevel() - 1;
					// 지도를 클릭된 클러스터의 마커의 위치를 기준으로 확대합니다
					map.setLevel(level, {
						anchor : cluster.getCenter()
					});
				});
				//클러스터에 마커들을 저장합니다.
				clusterer.addMarkers(markers);
			},
			error : function(xhr, status, error) {
				//요청에 실패하면 에러코드 출력  
				alert("에러코드 : " + xhr.status);
			}
		});
		
	});
	// 마커 이미지의 이미지 주소입니다
	var subwaySrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
	var schoolSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
    // 마커 이미지의 이미지 크기 입니다
    var subwayImageSize = new kakao.maps.Size(24, 35);
    var schoolImageSize = new kakao.maps.Size(24, 35);
    
    // 마커 이미지를 생성합니다
    var subwayMarkerImage = new kakao.maps.MarkerImage(subwaySrc, subwayImageSize); 
    var schoolMarkerImage = new kakao.maps.MarkerImage(schoolSrc, schoolImageSize); 
	// 장소 검색 객체를 생성합니다
	//var swps = new kakao.maps.services.Places(map);
	//var schps = new kakao.maps.services.Places(map);
	var swps;
	var schps;
	
	var swLat;
	var swLng;
	var schLat;
	var schLng;
	
	/* ====================================지하철 마커 시작==================================== */
	// 키워드 검색 완료 시 호출되는 콜백함수 입니다
	function placesSearchSubway (data, status, pagination) {
	    if (status === kakao.maps.services.Status.OK) {
	    	for(var i=0; i<circleArr.length; i++){
	    		circleArr[i].setMap(null);
	    	}
	    	
	    	for(var i=0; i<subwayMarker.length; i++){
	    		subwayMarker[i].setMap(null);
	    		subwayiw[i].close();
	    	}
	    	subwayMarker.length = 0;
	    	subwayMarker = [];
	    	subwayiw.length = 0;
	    	subwayiw = [];
	    	circleArr.length = 0;
	    	circleArr = [];
	    	
	        for (var i=0; i<data.length; i++) {
	        	swLat = data[i].y;
	        	swLng = data[i].x;
	        	var swpolyline=new daum.maps.Polyline({
	    			/* map:map, */
	    			path : [
	    			new daum.maps.LatLng(aptLat,aptLng),
	    			new daum.maps.LatLng(swLat,swLng)
	    			],
	    		 strokeWeight: 2,
	    		 strokeColor: '#FF00FF',
	    		 strokeOpacity: 0.8,
	    		 strokeStyle: 'dashed'
	    		});
	        	if(swpolyline.getLength() <= 500) {
	            	displaySubwayMarker(data[i]);
	            	// 근처 지하철의 거리와 이름을 넣는다.
	            	subwayName.push(data[i].place_name);
	            	subwayDis.push(swpolyline.getLength());
	        	}
	        }
	        subwayOb.name = subwayName;
			subwayOb.dis = subwayDis;
	    }
	}

	// 지도에 마커를 표시하는 함수입니다
	function displaySubwayMarker(place) {
	    // 마커를 생성하고 지도에 표시합니다
	    var marker = new kakao.maps.Marker({
	        map: map,
	        position: new kakao.maps.LatLng(place.y, place.x),
	    	image: subwayMarkerImage
	    });
	    subwayMarker.push(marker);

		//띄울 인포윈도우 정의
		var iwContent = '<span class="subway-title">'
				+ place.place_name
				+ '</span>'; // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
				
		// 인포윈도우를 생성합니다
		var infowindow = new daum.maps.InfoWindow({
			content : iwContent,
		});
		subwayiw.push(infowindow);
		
		// 마커 위에 인포윈도우를 표시합니다
		infowindow.open(map, marker);
		
     	// 지도에 표시할 원을 생성합니다
        var circle1 = new kakao.maps.Circle({
            center : new kakao.maps.LatLng(place.y, place.x),  // 원의 중심좌표 입니다 
            radius: 100, // 미터 단위의 원의 반지름입니다 
            strokeOpacity: 0.1, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
            fillColor: '#999999', // 채우기 색깔입니다
            fillOpacity: 0.4  // 채우기 불투명도 입니다   
        });
        var circle2 = new kakao.maps.Circle({
            center : new kakao.maps.LatLng(place.y, place.x),  // 원의 중심좌표 입니다 
            radius: 200, // 미터 단위의 원의 반지름입니다 
            strokeOpacity: 0.1, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
            fillColor: '#999999', // 채우기 색깔입니다
            fillOpacity: 0.4  // 채우기 불투명도 입니다   
        });
     	var circle3 = new kakao.maps.Circle({
            center : new kakao.maps.LatLng(place.y, place.x),  // 원의 중심좌표 입니다 
            radius: 300, // 미터 단위의 원의 반지름입니다 
            strokeOpacity: 0.1, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
            fillColor: '#999999', // 채우기 색깔입니다
            fillOpacity: 0.3  // 채우기 불투명도 입니다   
        });
     	var circle4 = new kakao.maps.Circle({
            center : new kakao.maps.LatLng(place.y, place.x),  // 원의 중심좌표 입니다 
            radius: 400, // 미터 단위의 원의 반지름입니다 
            strokeOpacity: 0.1, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
            fillColor: '#999999', // 채우기 색깔입니다
            fillOpacity: 0.2  // 채우기 불투명도 입니다   
        });
        var circle5 = new kakao.maps.Circle({
            center : new kakao.maps.LatLng(place.y, place.x),  // 원의 중심좌표 입니다 
            radius: 500, // 미터 단위의 원의 반지름입니다 
            strokeOpacity: 0.1, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
            fillColor: '#999999', // 채우기 색깔입니다
            fillOpacity: 0.1  // 채우기 불투명도 입니다   
        });
        
        circleArr.push(circle1);
     	circleArr.push(circle2);
     	circleArr.push(circle3);
     	circleArr.push(circle4);
     	circleArr.push(circle5);
     	
        circle1.setMap(map);
        circle2.setMap(map);
        circle3.setMap(map);
        circle4.setMap(map);
        circle5.setMap(map);
	 	// 인포윈도우 css 강제로 변경
		var subwayTitle = document.querySelectorAll('.subway-title');
		subwayTitle.forEach(function(e) {
		    var w = e.offsetWidth + 10;
		    var ml = w/2;
		    e.parentElement.style.top = "82px";
		    e.parentElement.style.left = "50%";
		    e.parentElement.style.marginLeft = -ml+"px";
		    e.parentElement.style.width = w+"px";
		    e.parentElement.previousSibling.style.display = "none";
		    e.parentElement.parentElement.style.border = "0px";
		    e.parentElement.parentElement.style.background = "unset";
		});
	}
	/* ====================================지하철 마커 끝==================================== */
	
	/* ====================================학교 마커 시작==================================== */
	// 키워드 검색 완료 시 호출되는 콜백함수 입니다
	function placesSearchSchool (data, status, pagination) {
	    if (status === kakao.maps.services.Status.OK) {
	    	for(var i=0; i<schoolMarker.length; i++){
	    		schoolMarker[i].setMap(null);
	    		schooliw[i].close();
	    	}
	    	schoolMarker.length = 0;
	    	schoolMarker = [];
	    	schooliw.length = 0;
	    	schooliw = [];
	    	
	    	for (var i=0; i<data.length; i++) {
	        	schLat = data[i].y;
	        	schLng = data[i].x;
	        	var schpolyline=new daum.maps.Polyline({
	    			/* map:map, */
	    			path : [
	    			new daum.maps.LatLng(aptLat,aptLng),
	    			new daum.maps.LatLng(schLat,schLng)
	    			],
	    		 strokeWeight: 2,
	    		 strokeColor: '#FF00FF',
	    		 strokeOpacity: 0.8,
	    		 strokeStyle: 'dashed'
	    		});
	        	if(schpolyline.getLength() <= 1000) {
	            	displaySchoolMarker(data[i]);
	            	schoolName.push(data[i].place_name);
	            	schoolDis.push(schpolyline.getLength());
	        	}
	        }
	        schoolOb.name = schoolName;
			schoolOb.dis = schoolDis;
	    }
	}

	// 지도에 마커를 표시하는 함수입니다
	function displaySchoolMarker(place) {
	    // 마커를 생성하고 지도에 표시합니다
	    var marker = new kakao.maps.Marker({
	        map: map,
	        position: new kakao.maps.LatLng(place.y, place.x),
	    	image: schoolMarkerImage
	    });
	    schoolMarker.push(marker);

		//띄울 인포윈도우 정의
		var iwContent = '<span class="school-title">'
				+ place.place_name
				+ '</span>'; // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
		
		// 인포윈도우를 생성합니다
		var infowindow = new daum.maps.InfoWindow({
			content : iwContent,
		});
		schooliw.push(infowindow);
				
		// 마커 위에 인포윈도우를 표시합니다
		infowindow.open(map, marker);
		
     	// 마커에 마우스클릭 이벤트를 등록합니다
	    kakao.maps.event.addListener(marker, 'click', function() {
	    	// 마커에 마우스클릭 이벤트가 발생하면 인포윈도우를 마커위에 표시합니다
	        infowindow.open(map, marker);
	    });
     	
	 	// 마커에 마우스 오른쪽클릭 이벤트를 등록합니다
	    kakao.maps.event.addListener(marker, 'rightclick', function() {
	    	// 마커를 미우스 오른쪽클릭하면 인포윈도우를 해제합니다.
	        infowindow.close();
	    });
	 	
	 	// 인포윈도우 css 강제로 변경
		var schoolTitle = document.querySelectorAll('.school-title');
		schoolTitle.forEach(function(e) {
		    var w = e.offsetWidth + 10;
		    var ml = w/2;
		    e.parentElement.style.top = "82px";
		    e.parentElement.style.left = "50%";
		    e.parentElement.style.marginLeft = -ml+"px";
		    e.parentElement.style.width = w+"px";
		    e.parentElement.previousSibling.style.display = "none";
		    e.parentElement.parentElement.style.border = "0px";
		    e.parentElement.parentElement.style.background = "unset";
		});
	}
	/* ====================================학교 마커 끝==================================== */
	
	var aptLat;
	var aptLng;
	
	function getAptDist(aptName){
		$.ajax({
			url : "${root}/house/aptList/" + aptName,
			type : "get",
			success : function(data) {
				aptLat = data[0].lat;
				aptLng = data[0].lng;
				
				map.center = new daum.maps.LatLng(data[0].lat, data[0].lng);
				map.setCenter(map.center);
				map.setLevel(4);
				
				swps = new kakao.maps.services.Places(map);
				schps = new kakao.maps.services.Places(map);
				// 카테고리로 지하철역을 검색합니다
				swps.categorySearch('SW8', placesSearchSubway, {useMapBounds:true});
				// 카테고리로 학교를 검색합니다
				schps.categorySearch('SC4', placesSearchSchool, {useMapBounds:true});
				
				
				var marker = new kakao.maps.Marker({
			        map: map,
			        position: new kakao.maps.LatLng(data[0].lat, data[0].lng)
			    });
				houseMarker.push(marker);
				
				//띄울 인포윈도우 정의
				var iwContent = '<span class="apt-title">'
						+ aptName
						+ '</span>'; // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
						
				// 인포윈도우를 생성합니다
				var infowindow = new daum.maps.InfoWindow({
					content : iwContent,
				});
				houseiw.push(content);
						
				infowindow.open(map, marker);
				// 인포윈도우 css 강제로 변경
				var subwayTitle = document.querySelectorAll('.apt-title');
				subwayTitle.forEach(function(e) {
				    var w = e.offsetWidth + 10;
				    var ml = w/2;
				    e.parentElement.style.top = "82px";
				    e.parentElement.style.left = "50%";
				    e.parentElement.style.marginLeft = -ml+"px";
				    e.parentElement.style.width = w+"px";
				    e.parentElement.previousSibling.style.display = "none";
				    e.parentElement.parentElement.style.border = "0px";
				    e.parentElement.parentElement.style.background = "unset";
				});
			},
			error : function(xhr,status,msg) {
				alert("요청 실패");
			}
		});
	}
</script>