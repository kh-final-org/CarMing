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
   .popup-dim{position: absolute; left: 0; top: 0; width: 100%; height: 140%; background: rgba(0,0,0,0.6); opacity: 0; transition: all 0.3s; z-index: -1;}
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

<!-- <script type="text/javascript">
	function myFunction() {
	    var selectbox, filter, a, txtValue, list;
	    selectbox = document.getElementById("selectbox");
	    filter = selectbox.value
	
	    list = document.getElementsByClassName("check");
	    
	    for(i=0; i<list.length; i++){
	        a = document.getElementsByClassName("text")[i];
	        txtValue = a.textContent || a.innerText;
	        
	        
	        if (txtValue.indexOf(filter) > -1) {
	        	list[i].style.display = "";
	        	
	        } else {
	        	list[i].style.display = "none";
	        }
		}
	}
</script> -->

 <script type="text/javascript">

 function YnCheck(obj) {

    var checked = obj.checked;

    if(checked){

    	var value = obj.value = "Y";
        var Y = document.createTextNode(value);
	    document.getElementById("my").appendChild(Y);	

    }else{

    	var value = obj.value = "N";
       var N = document.createTextNode(value);
	    document.getElementById("my").appendChild(N);	

    }

 };

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
            <h1>The stars in the night sky</h1>
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
				  		<select  class="selectpicker form-control" id="selectbox" aria-label="Example select with button addon">
							<option value="일반 캠핑" selected>일반 캠핑</option>
						    <option value="카라반">카라반</option>
						    <option value="글램핑">글램핑</option>
						    <option value="차박">차박</option>
						    <option value="나만의 캠핑">나만의 캠핑</option>
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
							<a onclick="myFunction()" id="location" href="#location-popup" class="location-open">위치 등록</a>

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
									    
									    
									    
									    var lat = document.createTextNode(lat); 
									      
									    document.getElementById("lat").appendChild(lat);		
									    
    
									    var lang = document.createTextNode(lng);
									    document.getElementById("long").appendChild(lang);		
									    
									});
								</script>
													
								<div class="location-finish">
									<a class="btn btn-light" onclick="myFunction()" id="location-finish-btn" href="#a">등록하기</a>
								</div>
								<div class="location-cancel">
									 <a onclick="myFunction()" id="close" href="#a"><img class="popup-cancel" src="./resources/img/cancel.png"></a>
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
						<input type="checkbox" id="chkcarplace" value="chkcarplace"onchange="YnCheck(this);">
						<span class="icon"></span>
						<span class="text">차박 명소 등록하기</span>
					</label>&emsp;&emsp;
					<label class="check">
						<input type="checkbox" id="chkprivate" value="chkprivate" onchange="YnCheck(this);">
						<span class="icon"></span>
						<span class="text">나만 보기</span>
						<span id="my"></span>
					</label>				
					<div > 위도: <span id="lat" ></span>, 경도: <span id="long"></span></div>
					
				</div>
			</div>
			<!-- End Upload Contents Area -->
		</div>
		
		<div class="card-body-bottom">
			<button type="submit" class="btn btn-light" id="button-boardupload">올리기</button>
		</div>
	 
	
	</div>
</form>
<!-- Start Footer Area -->
<%@ include file="../common/footer.jsp" %>
<!-- End Footer Area -->
</body>
</html>