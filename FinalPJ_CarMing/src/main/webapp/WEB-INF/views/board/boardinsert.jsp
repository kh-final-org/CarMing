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

<link rel="stylesheet" href="resources/css/board.css">


<!-- <script type="text/javascript">
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
</script> -->
<script>
 function myFunction() {
  var x = document.getElementById("location-popup");
  if (x.style.display == "none") {
    x.style.display = "block";
  } else {
    x.style.display = "none";
  } 
}  

</script>

</head>
<body onload="location.href='#location-popup'">
<!-- Start Header Area -->
<%@include file="../common/header.jsp"%>
<!-- End Header Area -->

<!-- Start Banner Area -->
   <section class="banner-area organic-breadcrumb">
      <div class="container">
         <div
            class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
            <div class="col-first">
               <h1>Camping Talk</h1>
               <nav class="d-flex align-items-center">
                  <a href="index.html">Home<span class="lnr lnr-arrow-right"></span></a>
                  <a href="boardmainform.do">Talk</a>
               </nav>
            </div>
         </div>
      </div>
   </section>
<!-- End Banner Area -->

<form action="boardinsertres.do" method="post">
	<div class="card-container">
		<div class="card-head">
			<h2 style="color: #5f5f5f;">게시글 작성하기</h2>
		</div>
		
		<div class="card-body">
			<!-- Start Photo/Video upload Area -->
			<div class="card-body-left">
				<div class="card-context">
					<img class="camera-logo" src="./resources/img/camera.png"><br>
					<span class="logo-bottom-context">사진 또는 동영상 올리기</span><br>
					<span class="logo-bottom-context">(사진은 최대 5장, 동영상은 1개만)</span>
				</div>
			</div>
			<!-- End Photo/Video Upload Area -->
			
			<!-- Start Upload Contents Area -->
			<div class="card-body-right">
				<!-- Category -->
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
				
				<!-- Textarea -->
				<div class="body-content">
				   	<textarea rows="10" cols="52" placeholder="게시글 내용을 입력해 주세요." style="resize: none;" required="required"></textarea>
				</div>
				
				<!-- Location Upload -->
				<div class="body-location" >
					<div class="body-location-left">
						<span class="location-logo-text">
							<img class="location-logo" src="./resources/img/placeholder.png">&nbsp;서울특별시 카밍캠핑장
						</span>
					</div>
					
					<div class="body-location-right">
						<div class="location-logo-text">
							<img class="location-logo" src="./resources/img/precision.png">&nbsp;
						<!-- 	<a href="#location-popup" class="location-open">위치 등록</a> -->
							
							<a onclick="myFunction()" id="location" href="#location-popup" class="location-open">위치 등록</a>
							<!-- onclick="myFunction()" -->
							<!--  --> 
							<!-- Start Location-Popup -->
							<div class="popup" id="location-popup">
								<div class="popup-title"><strong>위치 찾기</strong></div>
								<!-- 지도를 담는 map -->
								<div id="map"></div>
								<div class="location-search">
									<div class="input-group mb-3" >
										<input type="search" class="form-control" placeholder="주소를  검색해 주세요." aria-label="Recipient's username" aria-describedby="button-addon2">
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
									        center: new kakao.maps.LatLng(37.739010, 127.200003), // 지도의 중심좌표
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
									    
									    var lat = latlng.getLat();
									    var lng = latlng.getLng();
									    
									    var resultDiv = document.getElementById('clickLatlng'); 
									    resultDiv.innerHTML = lat+":"+lng;
									    
									});
								</script>
													
								<div class="location-finish">
									<button type="submit" class="btn btn-light" onclick="#" id="location-finish-btn">등록하기</button>
								</div>
								<div class="location-cancel">
									<a onclick="myFunction()" id="close" href="#a"><img class="popup-cancel" src="./resources/img/cancel.png"></a>							
									<!-- onclick="myFunction()" -->
								</div>
							</div>
							<!-- End Location-Popup -->
							
							<!-- Popup Background -->
							<div class="popup-dim"></div>
						</div>
					</div>
				</div><br>
				
				<!-- Checkbox -->
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
			<!-- End Upload Contents Area -->
		</div>
		
		<div class="card-body-bottom">
			<button type="submit" class="btn btn-light" id="button-boardupload">올리기</button>
		</div>
	
	
	</div>
</form>

</body>
</html>