<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>


<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=25731966bd6475ae2f7635d90222da92&libraries=services,clusterer,drawing"></script>
</head>
<body>
<%@ include file="petmedic_navbar.jsp"%>
<div id="map" style="width:100%;height:350px;"></div>
<form onsubmit="event.preventDefault(); searchPlaces(); return false;">
		<select id="searchCondition" name="searchCondition">
			<option value="star">별점순</option>
			<option value="review">리뷰순</option>
			<option value="pop">인기순</option>
			<option value="price">가격순</option>
<!-- 			<option id="timeOption">즉시예약가능순</option> -->
<!-- 			<option value="distance">거리순</option> -->
		</select>	
	<input id="mapKeyword" placeholder="검색어를 입력해주세요">
	<button type="submit">검색</button>
<!-- 		<div>전문진료동물</div> -->
<!-- 		<div class=""> -->
<!-- 						<div class="custom-control custom-checkbox"> -->
<!-- 							<label><input type="checkbox" name="hos_cate" value="강아지">강아지</label> -->
<!-- 						</div> -->
<!-- 						<div class="custom-control custom-checkbox"> -->
<!-- 						<label><input type="checkbox" name="hos_cate" value="고양이">고양이</label> -->
<!-- 						</div> -->
<!-- 						<div class="custom-control custom-checkbox"> -->
<!-- 							<label><input type="checkbox" name="hos_cate" value="새">새</label> -->
<!-- 						</div> -->
<!-- 						<div class="custom-control custom-checkbox"> -->
<!-- 						    <label><input type="checkbox" name="hos_cate" value="파충류">파충류</label>  -->
<!-- 						</div> -->
<!-- 						<div class="custom-control custom-checkbox"> -->
<!-- 							<label><input type="checkbox" name="hos_cate" value="기타">기타동물</label> -->
<!-- 						</div> -->
<!-- 			</div> -->
	
			
	</form>

<script>
var hospitalList = []; //ArrayList 값을 받을 배열변수를 선언

//즉시예약가능순




function searchPlaces() {
	var mapKeyword = document.getElementById("mapKeyword").value
	var mapCate = document.getElementsByName("hos_cate").value
	var mapCondition = document.getElementById("searchCondition").value
// 	var mapTimeOption = document.getElementById("timeOption").value
	
	console.log("1");
	console.log("1" + mapKeyword);
	console.log("1" + mapCate);
	console.log("1" + mapCondition);
// 	console.log("1" + mapTimeOption);
	
	//즉시예약가능순
// 		var currentTime = new Date();
// 		var formattedTime = currentTime.toLocaleTimeString("en-US", { hour12: false });
// 		mapTimeOption.value = formattedTime;


	console.log("2");
		

	$.ajax({
		url : '/getMapData',
		type : 'post',
		data : {
		    key: mapKeyword,
		    cate: mapCate,
		    condition: mapCondition
		  },
// 			{mapTimeOption: mapTimeOption}	
		dataType : 'json',
		async: false,
		success : function(result) {
			console.log(result); // Add this line to check the response
		    hospitalList = result;
		    console.log("hospitalList 결과 : " + hospitalList);
		    mapLatLng(hospitalList);
		},
		error : function(xhr, status, error) {
			// Handle error
			console.log('Error:', error);
		}
	});
};
</script>

<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
    mapOption = { 
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
 
 
function mapLatLng(hospitalList) {
	// 가지고 있는 좌표를 WGS84로 변환
	for(var i=0; i<hospitalList.length; i++) {
		var hospital = hospitalList[i];
		var coords = new kakao.maps.Coords(hospital.latitude, hospital.longitude);
		var latLng = coords.toLatLng();
		hospitalList[i].latitude = latLng.getLat()
		hospitalList[i].longitude = latLng.getLng()
		var positions = new kakao.maps.LatLng(hospitalList[i].latitude, hospitalList[i].longitude)
		
		// 마커 이미지의 이미지 주소입니다
		var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
		
		  // 마커 이미지의 이미지 크기 입니다
	    var imageSize = new kakao.maps.Size(24, 35); 
	    
	    // 마커 이미지를 생성합니다    
	    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
	    
	    // 마커를 생성합니다
	    var marker = new kakao.maps.Marker({
	        map: map, // 마커를 표시할 지도
	        position: positions[i].latlng, // 마커를 표시할 위치
	        image : markerImage // 마커 이미지 
	    });
		
	}
};

</script>
<%@ include file="footer.jsp"%>

</body>
</html>