<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CarMing</title>
<style type="text/css">
	.card-container{margin: 50px 200px;}
	.card-body{padding: 0px;}
	
	.card-body-left{float: left; width: 530px; height: 400px; margin: 0px 0px 0px -20px; 
					text-align: center; background-color: #fff5e9; border-radius: 20px;}
	.card-context{margin: 100px; font-size: 1.2em;}	 		
	.camera-logo{margin-top: 5px; width: 120px; height: 120px; opacity: 25%;}
	.logo-bottom-context{color: gray;} 	
	
	.card-body-right{float: right; width: 530px; height: 450px;}
	#button-dropdown{width: 500px; text-align: left;}	
	.body-content{margin-top: 55px; font-size: 1.2em;}
	textarea {padding: 10px 12px;}
	.location-logo{width: 25px;height: 25px;}
	.body-location{margin: 10px 0px;}
	.body-location-left{float: left; width: 77%;}
	.body-location-right{float: right; width: 23%;}
	.location-logo-text{display: inline-block; vertical-align: middle;}
	.body-checklist{margin: 10px 0px;}	
	
	.card-body-bottom{clear: both; margin: 50px 400px; padding: 0px;}	
	#button-boardupload{width: 350px; height: 50px; background-color: #ffe6be; border-radius: 10px; font-size:1.2em; margin: -20px 0px 50px 0px; cursor: pointer;}

	.check input{display: none;}
	.check span{cursor: pointer; isplay: inline-block; vertical-align: middle; margin-left: 3px;} 	
	.check .icon{display: inline-block; width: 20px; height: 20px; background-color: transparent; /*z-index: 5*/
				 border: 2px solid silver; border-radius: 3px; position: relative; cursor: pointer;}
	.check .icon::before, .check .icon::after {content: ''; display: inline-block; width: 1.7px; height: 0px; 
											   background-color: #fff; position: absolute; transform-origin: left top; border-radius: 2px;}
	.check .icon::before {top: 7px; left: 1.5px; transform: rotate(-45deg);}
	.check .icon::after {top: 12.5px; left: 7px; transform: rotate(-135deg);}
	.check input:checked ~ .icon{background-color: orange; border-color: orange;}
	.check input:checked ~ .icon::before{height: 7px; transition: all 0.12s ease;}
	.check input:checked ~ .icon::after{height: 11px; transition: all 0.12s ease 0.12s;}
	
	.location-open{color: gray;}
	.popup{position: absolute; left: 33%; top: 50%; width: 550px; height: 520px; box-shadow: 0px 0px 20px rgba(0,0,0,0.4); border-radius: 5px; z-index: 5;
	   	   text-align: right; padding: 10px 15px; box-sizing: border-box; background: #fff; opacity: 0; transition: all 0.5s;}
	.popup:target{opacity: 1;}
	.popup-dim{position: absolute; left: 0; top: 0; width: 100%; height: 127%; background: rgba(0,0,0,0.6); opacity: 0; transition: all 0.3s; z-index: -1;}
	.popup:target + .popup-dim{opacity: 1; z-index: 2;} /*위치등록 아이콘 클릭 했을 시 */	
	.popup-cancel{width: 12px; height: 12px; opacity: 0.7;}
	.location-cancel{position: absolute; top: 10px; right: 15px;}
	
	.popup-title{margin-top:15px; text-align: center; font-size: 1.3em; color: #5f5f5f;}
	#map{margin: 10px 0px; width:100%; height: 300px; border: 1px solid silver;}
	.searchimg{width: 20px; height: 20px; opacity: 50%;}
	#button-addon2{background-color: #fff5e9; border: 1px solid silver;}	
	#location-finish-btn{width: 200px; height: 40px; background-color: #ffe6be; border-radius: 7px; font-size:1.2em; margin: 10px 160px 0px 0px;}
	#clickLatlng{text-align: center; margin-top: -5px;}
</style>

<!-- 
<script type="text/javascript">
	$(document).ready(function(){
	
		$(".location-logo-text-2 > a").click(function(){
			$(".popup").show();
			return false;
		});
		
		$(".popup .close").click(function(){
			$(this).parent().hide();
			$(".popup-dim").hide();
		});
	});
</script>
 -->

</head>
<body>
<!-- Start Header Area -->
<%@include file="../common/header.jsp"%>
<!-- End Header Area -->

<form action="boardinsertres.do" method="post">
	<div class="card-container">
		<div class="card-head">
			<h2 style="color: #5f5f5f;">게시글 작성하기</h2>
		</div>
		
		<div class="card-body">
			<!-- 사진/동영상 올리기  -->
			<div class="card-body-left">
				<div class="card-context">
					<img class="camera-logo" src="./resources/img/camera.png"><br>
					<span class="logo-bottom-context">사진 또는 동영상 올리기</span><br>
					<span class="logo-bottom-context">(사진은 최대 5장, 동영상은 1개만)</span>
				</div>
			</div>
			
			<div class="card-body-right">
				<div class="body-category" style="width: 500px;">
					<div class="dropdown-selectbox">
				  		<select class="selectpicker form-control" id="selectbox" aria-label="Example select with button addon">
							<option value="generalCamping" selected>일반 캠핑</option>
						    <option value="caravan">카라반</option>
						    <option value="glamping">글램핑</option>
						    <option value="carCamping">차박</option>
						    <option value="myOwnCamping">나만의 캠핑</option>
					  	</select>
					</div>
				</div>			
				<!-- 
					<button class="btn btn-outline-secondary dropdown-toggle" type="button" id="button-dropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						카테고리&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
					</button>
					<div class="dropdown-menu">
						<ul class="navi">
							<li><a class="dropdown-item">일반 캠핑</a></li>
							<li><a class="dropdown-item">카라반</a></li>
							<li><a class="dropdown-item">글램핑</a></li>
							<li><a class="dropdown-item">차박</a></li>
							<li><a class="dropdown-item">나만의 캠핑</a></li>
						</ul>
					</div>
				 -->
				
				<div class="body-content">
				   	<textarea rows="10" cols="52" placeholder="게시글 내용을 입력해주세요." style="resize: none;"></textarea>
				</div>
				
				<div class="body-location">
					<!-- start of body-location-left -->
					<div class="body-location-left">
						<span class="location-logo-text">
							<img class="location-logo" src="./resources/img/placeholder.png">&nbsp;서울특별시 카밍캠핑장
						</span>
					</div>
					<!-- end of body-location-left -->
					
					<!-- start of body-location-right -->
					<div class="body-location-right">
						<div class="location-logo-text">
							<img class="location-logo" src="./resources/img/precision.png">&nbsp;
							<a href="#location-popup" class="location-open">위치 등록</a>
							<!-- start of location-popup -->
							<div class="popup" id="location-popup">
								<div class="popup-title"><strong>위치 찾기</strong></div>
								<!-- 지도를 담는 map -->
								<div id="map"></div>
								<div class="location-search">
									<div class="input-group mb-3" >
										<input type="search" class="form-control" placeholder="주소를  검색해주세요." aria-label="Recipient's username" aria-describedby="button-addon2">
										<div class="input-group-append">
									    	<button class="btn btn-outline-secondary" type="submit" id="button-addon2"><img class="searchimg" src="./resources/img/search.png"></button>
									  	</div>
									</div>	
								</div>
								<div id="clickLatlng"></div>
								<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ec2908c95e9e6b6c236066424e7e8fa2"></script>
								<script>
									var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
									    mapOption = { 
									        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
									        level: 3 // 지도의 확대 레벨
									    };
									
									var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
									
									// 지도를 클릭한 위치에 표출할 마커입니다
									var marker = new kakao.maps.Marker({ 
									    // 지도 중심좌표에 마커를 생성합니다 
									    position: map.getCenter() 
									}); 
									// 지도에 마커를 표시합니다
									marker.setMap(map);
									
									// 지도에 클릭 이벤트를 등록합니다
									// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
									kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
									    
									    // 클릭한 위도, 경도 정보를 가져옵니다 
									    var latlng = mouseEvent.latLng; 
									    // 마커 위치를 클릭한 위치로 옮깁니다
									    marker.setPosition(latlng);
									    
									    var message = '위도 : ' + latlng.getLat() + ' , ';
									    message += '경도 : ' + latlng.getLng();
									    
									    var resultDiv = document.getElementById('clickLatlng'); 
									    resultDiv.innerHTML = message;
									    
									});
								</script>
													
								<div class="location-finish">
									<button type="submit" class="btn btn-light" onclick="#" id="location-finish-btn">등록하기</button>
								</div>
								<div class="location-cancel">
									<a href="#a"><img class="popup-cancel" src="./resources/img/cancel.png"></a>							
								</div>
							</div>
							
							<!-- 레이어 팝업 배경 -->
							<div class="popup-dim"></div>
							<!-- end of location-popup -->
						
						</div>
					</div>
					<!-- end of body-location-right -->
				</div><br>
				
				<div class="body-checklist">
					<label class="check">
						<input type="checkbox" id="chkcarplace" value="chkcarplace">
						<span class="icon"></span>
						<span class="text">차박 명소 등록하기</span>
					</label>&emsp;&emsp;
					<label class="check">
						<input type="checkbox" id="chkprivate" value="chkprivate">
						<span class="icon"></span>
						<span class="text">나만 보기</span>
					</label>
				</div>
			</div>
		</div>
		
		<div class="card-body-bottom">
			<button type="submit" class="btn btn-light" id="button-boardupload">올리기</button>
		</div>
	
	
	
	</div>
</form>

</body>
</html>