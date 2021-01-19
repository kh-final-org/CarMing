<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#locaion-upload{color: gray;}
	.popup{position: absolute; left: 33%; top: 50%; width: 550px; height: 520px; box-shadow: 0px 0px 20px rgba(0,0,0,0.4); border-radius: 5px; z-index: 5;
		   text-align: right; padding: 7px 15px; box-sizing: border-box; background: #fff; opacity: 0; transition: all 0.5s;}
	.popup a{color: #5f5f5f;}
	.popup:target{opacity: 1;}
	.dim{position: absolute; left: 0; top: 0; width: 100%; height: 100%; background: rgba(0,0,0,0.6); opacity: 0; transition: all 0.3s; z-index: -1;}
	.popup:target + .dim{opacity: 1; z-index: 2;} /*위치등록 아이콘 클릭 했을 시 */	
	.popup-cancel{width: 12px; height: 12px; opacity: 0.7;}
	
	#map{margin: 10px 0px; width:100%; height: 300px; border: 1px solid silver;}
	.popup-title{text-align: center; font-size: 1.3em; color: #5f5f5f;}
	.location-input-value{margin-top: -5px;}
	.latitude{float: left; width: 35%; margin: 0px 68px; text-align: left;}
	.longitude{float: left; width: 35%; text-align: left;}
	.searchimg{width: 20px; height: 20px; opacity: 50%;}
	#button-addon2{background-color: #fff5e9; border: 1px solid silver;}	
	#location-finish-btn{width: 200px; height: 40px; background-color: #ffe6be; border-radius: 7px; font-size:1.2em; margin: 10px 160px 0px 0px;}
</style>
</head>
<body>
		<!-- 위치등록 버튼 클릭 시  레이어팝업 -->
		<div class="popup" id="location-popup">
			<a href="#a"><img class="popup-cancel" src="./resources/img/cancel.png"></a>
		
			<!-- 지도/레이어팝업 -->
			<div class="popup-title"><strong>위치 찾기</strong></div>
			<div id="map"></div>
			<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ec2908c95e9e6b6c236066424e7e8fa2"></script>
			<script>
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			   		mapOption = { 
			        	center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			        	level: 3 // 지도의 확대 레벨
			    	};
			
				// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
				var map = new kakao.maps.Map(mapContainer, mapOption); 
			</script> 
			
			
			<div class="location-search">
				<div class="input-group mb-3" >
					<input type="search" class="form-control" placeholder="주소를  검색해주세요." aria-label="Recipient's username" aria-describedby="button-addon2">
					<div class="input-group-append">
				    	<button class="btn btn-outline-secondary" type="submit" id="button-addon2"><img class="searchimg" src="./resources/img/search.png"></button>
				  	</div>
				</div>	
			</div>
			
			<div class="location-input-value">
				<div class="latitude">
					<span>위도 &#58; </span>
					<span>1234567890</span>&deg;
				</div>
				<div class="longitude">
					<span>경도 &#58; </span>
					<span>1234567890</span>&deg;
				</div>
			</div>
			
			<div class="location-finish">
				<button type="submit" class="btn btn-light" onclick="#" id="location-finish-btn">등록하기</button>
			</div>
										
			<!-- 레이어 팝업 배경 -->
			<div class="popup-back"></div>
		</div>
</body>
</html>