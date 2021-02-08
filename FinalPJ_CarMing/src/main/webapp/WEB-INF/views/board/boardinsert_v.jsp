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
<title>CarMing | 캠핑토크 - 동영상 올리기</title>
<style type="text/css">
	.card-container{margin: 50px 190px 50px 220px;}
    .card-body{padding: 0px;}
   	
   	.card-body-left{position: relative; float: left; width: 530px; height: 350px; margin: 0 10px 0 -20px;}
   	.uploadimg {width: 310px; height: 310px;}
	.img_wrap {width: 300px; height: 280px; margin-top: 10px;}
	.img_wrap img {max-width: 100%; max-height: 100%;}
	.center-block {display: block; margin-left: auto; margin-right: auto; margin-left: 130px;}	
	.upload-img-form{position: relative; width: 530px; height: 300px; border: 1px solid #e2e2e2;
					 border-radius: 10px; margin-bottom: 15px; background: #fff; margin-bottom: -10px;}
   	.upload-img-content{position: absolute; margin-top: 18px; width: 530px;}
   	.upload-video-content{position: absolute; margin: 65px 0 0 1px; width: 530px;}
   	.video-icon{margin-top: -8px; width: 120px; height: 120px; opacity: 25%;}
	
    .card-body-right{float: right; width: 530px; height: 450px;}
    .current{padding-left: 5px;}
    li.option.selected.disabled.focus{width: 503px;}
    .body-content{margin-top: 55px; font-size: 1.2em;}
    textarea {padding: 10px 14px; border: 1px solid silver; border-radius: 5px;}
    textarea::placeholder{color: silver;}
    .location-logo{width: 25px;height: 25px;}
    .body-location{margin: 8px 0px;}
    .body-location-left{float: left; width: 77%;}
    .body-location-right{float: right; width: 21.5%; margin-right: 0;}
    .location-logo-text{display: inline-block; vertical-align: middle;}
    .body-checklist{margin: 15px 0px;}   
    .latlong-input-value{margin-top: 10px;}
	  
    .card-body-bottom{clear: both; margin: 50px 400px; padding: 0px;}   
   	#button-boardupload{width: 350px; height: 50px; background-color: #ffe6be; border-radius: 10px; outline: none;
   						font-size:1.2em; margin: -20px 0px 10px 0px; cursor: pointer;}
   	#button-boardupload:hover{background: #ffdb9f; transition: 0.2s; border: 0;}
   						

	.chkprivate-box{float: left;}
	.chkcarplace-box{float: left; margin-left: 5px;}
	.checkbox input{display: none;}
	.checkbox span{display: inline-block;vertical-align: middle;cursor: pointer;}
	.checkbox .icon{position: relative;width: 20px; height: 20px;border: 2px solid silver; border-radius: 3px; transition: background 0.1s ease;}
	.checkbox .icon::after{content: ''; position: absolute;top: 0px; left: 5px; width: 6px; height: 11px; border-right: 2px solid #fff;
						   border-bottom: 2px solid #fff; transform: rotate(45deg) scale(0); transition: all 0.1s ease; transition-delay: 0.1s; opacity: 0;}
	.checkbox .text{margin-left: 5px;}
	.checkbox input:checked ~ .icon{border-color: transparent; background: orange;}
	.checkbox input:checked ~ .icon::after{opacity: 1;transform: rotate(45deg) scale(1);}
	  
	.location-open{color: gray;}
	.popup{position: absolute; left: 33%; top: 50%; width: 550px; height: 520px; box-shadow: 0px 0px 20px rgba(0,0,0,0.4); border-radius: 5px; z-index: 10;
	        text-align: right; padding: 10px 15px; box-sizing: border-box; background: #fff; opacity: 0; transition: all 0.5s;}
	.popup:target{opacity: 1;}
	.popup-dim{position: absolute; left: 0; top: 0; width: 100%; height: 158%; background: rgba(0,0,0,0.6); opacity: 0; transition: all 0.3s; z-index: -1;}
	.popup:target + .popup-dim{opacity: 1; z-index: 2;} 
	.popup-cancel{width: 12px; height: 12px; opacity: 0.7;}
	.location-cancel{position: absolute; top: 10px; right: 15px;}
  
	.popup-title{margin-top:15px; text-align: center; font-size: 1.3em; color: #5f5f5f;}
	#map{margin: 10px 0px; width:100%; height: 300px; border: 1px solid silver;}
	.searchimg{width: 20px; height: 20px; opacity: 50%;}
	#button-addon2{background-color: #fff5e9; border: 1px solid silver;}   
	#location-finish-btn{width: 200px; height: 40px; background-color: #ffe6be; border-radius: 7px; font-size:1.2em; margin: 10px 160px 0px 0px; outline: none;}
	#location-finish-btn:hover{background-color: #ffdb9f;}
	#clickLatlng{text-align: center; margin-top: -5px;}
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery-3.5.1.min.js"></script>
<!-- <script src="resources/js/main.js"></script> -->

<!-- location-popup -->
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

<!-- 사진 업로드(미리보기) -->
<script type="text/javascript">
	var sel_file;
	$(document).ready(function() {
		$("#input_img").on("change", handleImgFileSelect);
	});

	function handleImgFileSelect(e) {
		$("#img").empty(); //remove는 태그 자체를 지운다 
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);

		/* if (files.name == null) {
		   resetInputFile();
		} */
		filesArr.forEach(function(f) {
			if (!f.type.match("image.*")) {
				alert("확장자는 이미지 확장자만 가능합니다.");
				return;
			}
			sel_file = f;

			var reader = new FileReader();
			reader.onload = function(e) {
				$("#img").attr("src", e.target.result);
				$("#img").attr("width", "90%");
				$("#img").attr("height", "440px");
			}
			reader.readAsDataURL(f);
		})
	}

	function resetInputFile() {
		$("#img").empty();
	}
</script>

<!-- 업로드한 파일명 추출 
<script type="text/javascript">
	$(document).ready(function(){ 
		var fileTarget = $('.upload-video-content .custom-file-input');
		
		fileTarget.on('change', function(){ // 값이 변경되면 
			if(window.FileReader){ // modern browser 
				var filename = $(this)[0].files[0].name; 
			} else { // old IE
				var filename = $(this).val().split('/').pop().split('\\').pop(); // 파일명만 추출 
			} 
		
			// 추출한 파일명 삽입
			$(this).siblings('.custom-file-input').val(filename); 
		}); 
	});
</script> -->

<!-- 나만보기 체크여부 -->
<script type="text/javascript">
	function YnCheck(obj) {
		$("#my").empty();
	    var checked = obj.checked;
	
	    if(checked){
	    	var value = obj.value = "Y";
    	    var Y = document.createElement("input");
		    Y.setAttribute("name", "brdprivate");
		    Y.setAttribute("type", "text");
		    Y.setAttribute("value", value);
		    
		    document.getElementById("my").appendChild(Y);	
	
	    }else{
	    	var value = obj.value = "N";
	       	var N = document.createElement("input");
	       	N.setAttribute("name", "brdprivate");
		    N.setAttribute("type", "text");
		    N.setAttribute("value", value);
		    
		    document.getElementById("my").appendChild(N);	
	    }
	    
	 };
</script> 

<!-- 차박명소 등록 체크여부 -->
<script type="text/javascript">
	function YnCheck2(obj) {
		$("#car").empty();
	    var checked = obj.checked;
	
	    if(checked){
	    	var value = obj.value = "Y";
	        var Y = document.createElement("input");
		    Y.setAttribute("name", "carmapchk");
		    Y.setAttribute("type", "text");
		    Y.setAttribute("value", value);
		    
		    document.getElementById("car").appendChild(Y);	
		    
	    }else{
	    	var value = obj.value = "N";
	    	var N = document.createElement("input");
	       	N.setAttribute("name", "carmapchk");
		    N.setAttribute("type", "text");
		    N.setAttribute("value", value);
		    
		    document.getElementById("car").appendChild(N);	
	       	
	    }
	 };
</script>

<!-- 카테고리 차박이 아닐 경우 '차박 체크박스' 숨기기 -->
<script type="text/javascript">
	function carPlaceChk() {
	    var selectbox, filter, a, txtValue, list;
	    selectbox = document.getElementById("selectbox");
	    filter = selectbox.value
	
	    list = document.getElementsByClassName("chkcarplace-box");
	    
	    for(i=0; i<list.length; i++){
	        a = document.getElementsByClassName("chkcarplace-box")[i];
	        txtValue = a.textContent || a.innerText;
	        
	        
	        if (txtValue.indexOf(filter) > -1) {
	        	list[i].style.display = "";
	        	
	        } else {
	        	list[i].style.display = "none";
	        }
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
      <div class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
         <div class="col-first">
            <h1>The stars in the night sky</h1>
         	<nav class="d-flex align-items-center">
               <a href="home.do"><span class="lnr lnr-home"></span>Home</a>&emsp;
               <a href="boardmainform.do"><span class="lnr lnr-arrow-right-circle"></span>Camping Talk</a>
            </nav>
         </div>
      </div>
   </div>
</section>
<!-- End Banner Area -->

<!-- Start Container Area -->
<form:form action="boardinsertres_v.do?&memno=${login.memno }" 
		   method="post" enctype="multipart/form-data" modelAttribute="boardDto" >
	<div class="card-container">
		<div class="card-head">
			<h2 style="color: #5f5f5f;">게시글 작성하기</h2>
		</div>
		
		<div class="card-body">
			<!-- Image/Video Upload-->
			<div class="card-body-left">
				<div class="upload-img-form">
					<div class="img_wrap center-block">
						<img id="img" src="">
		  			</div>
					<div class="upload-img-content">
						<label class="custom-file-label" for="input_img"></label>
						<input type="file" class="custom-file-input" id="input_img" name="brdfile" accept="image/*">
					</div>
				</div>
			
				<div class="upload-video-form">
					<div class="upload-video-content">
						<label class="custom-file-label" for="video-file"></label>
						<input type="file" class="custom-file-input" id="video-file" name="brdvideo" accept="video/*">
					</div>
				</div>
			</div>
			
			<!-- Start Upload Contents Area -->
			<div class="card-body-right">
				<!-- Category -->
				<div class="body-category" style="width: 500px;">
					<div class="dropdown-selectbox">
				  		<select onchange="carPlaceChk()" class="selectpicker form-control" id="selectbox" 
				  				aria-label="Example select with button addon" name="bcategoryno">
							<option value="0" selected disabled>카테고리(필수)</option>
							<option value="1">일반 캠핑</option>
						    <option value="2">카라반</option>
						    <option value="3">글램핑</option>
						    <option value="4">차박</option>
						    <option value="5">나만의 캠핑</option>
					  	</select>
					</div>
				</div>			
				
				<!-- Textarea -->
				<div class="body-content">
				   	<textarea rows="10" cols="52" placeholder="게시글 내용을 입력해 주세요." name="brdcontent" style="resize: none;" required="required"></textarea>
				</div>
				
				<!-- Location Upload -->
				<div class="body-location" >
					<div class="body-location-left">
						<span class="location-logo-text">
							<img class="location-logo" src="./resources/img/placeholder.png">&nbsp;<span id="place"></span>
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
											<input type="search" id="keyword" class="form-control" placeholder="키워드를 검색해 주세요." 
											       aria-label="Recipient's username" aria-describedby="button-addon2" >
											<div class="input-group-append">
									    	<button class="btn btn-outline-secondary" type="button" onclick="searchPlaces();" id="button-addon2" >
									    		<img class="searchimg" src="./resources/img/search.png">
									    	</button>
									  	</div>
									</div>	
								</div> 
								<div id="clickLatlng"></div>
									<script type="text/javascript"
											src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ec2908c95e9e6b6c236066424e7e8fa2&libraries=services,clusterer,drawing"></script>
									<script>
										// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
										var infowindow = new kakao.maps.InfoWindow(
												{zIndex : 1});

										var mapContainer = document
												.getElementById('map'), // 지도를 표시할 div 
										mapOption = {
											center : new kakao.maps.LatLng(
													37.566826, 126.9786567), // 지도의 중심좌표
											level : 3
										// 지도의 확대 레벨
										};

										// 지도를 생성합니다    
										var map = new kakao.maps.Map(
												mapContainer, mapOption);
										function searchPlaces() {

											var keyword = document
													.getElementById('keyword').value;

											if (!keyword.replace(/^\s+|\s+$/g,
													'')) {
												alert('키워드를 입력해주세요!');
												return false;
											}

											// 장소 검색 객체를 생성합니다
											var ps = new kakao.maps.services.Places();

											// 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
											ps.keywordSearch(keyword,
													placesSearchCB);
										}

										// 키워드 검색 완료 시 호출되는 콜백함수 입니다
										function placesSearchCB(data, status,
												 pagination) {
											if (status === kakao.maps.services.Status.OK) {

												// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
												// LatLngBounds 객체에 좌표를 추가합니다
												var bounds = new kakao.maps.LatLngBounds();

												for (var i = 0; i < data.length; i++) {
													displayMarker(data[i]);
													bounds.extend(new kakao.maps.LatLng(data[i].y,data[i].x));
												}

												// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
												map.setBounds(bounds);
											}
										}

										// 지도에 마커를 표시하는 함수입니다
										function displayMarker(place) {

											// 마커를 생성하고 지도에 표시합니다
											var marker = new kakao.maps.Marker(
													{
														map : map,
														position : new kakao.maps.LatLng(place.y,place.x)
													});

												// 마커에 클릭이벤트를 등록합니다
											    kakao.maps.event.addListener(marker, 'click', function() {
										        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
										        infowindow.setContent('<div style="padding:5px; font-size:12px;">' + place.place_name + '</div>');
										        infowindow.open(map, marker); 
										        // 클릭한 위도, 경도 정보를 가져옵니다 
										        var latlng =  new kakao.maps.LatLng(place.y,place.x);
										        
										        // 마커 위치를 클릭한 위치로 옮깁니다
										        marker.setPosition(latlng);
										        
										        var message = '[위도] ' + latlng.getLat() + ' / ';
										        message += '[경도] ' + latlng.getLng();
										       
										        var lat = latlng.getLat();
										        var lng = latlng.getLng();
										        var place2 = place.place_name;
										       
										        $("#place").empty();
										     
										        var plc = document.createElement("input");
											    plc.setAttribute("name", "mapname");
											    plc.setAttribute("type", "text");
											    plc.readOnly= true;
											    plc.setAttribute("value", place2); 
											    plc.setAttribute("style","border:0px; outline: none;");
										        
										        document.getElementById("place").appendChild(plc);
										         
										     	$("#lat").empty();
										        var lati = document.createElement("input");
											    lati.setAttribute("name", "maplatitude");
											    lati.setAttribute("type", "hidden");
											    lati.setAttribute("value", lat);
												document.getElementById("lat").appendChild(lati);
												
												$("#lang").empty();

												var lang = document.createElement("input");
												lang.setAttribute("name", "maplongtitude");
												lang.setAttribute("type", "hidden");
												lang.setAttribute("value", lng);
												document.getElementById("lang").appendChild(lang); 
										    });
										}
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
				
				<div class="latlong-input-value">
					<span style="display: none"><strong>위도 : </strong></span><span id="lat"></span>
					<span style="display: none"><strong>경도 : </strong></span><span id="lang"></span>
				</div>
				
				<!-- Checkbox -->
				<div class="body-checklist">
					<div class="chkprivate-box">
						<label class="checkbox">
							<input type="checkbox" id="chkprivate" value="chkprivate" onclick="YnCheck(this)">
							<span class="icon"></span>
							<span class="text">나만 보기</span>
							<span id="my" ><input type="text" value="N" name="brdprivate"></span>
						</label>&emsp;&emsp;
					</div>
					<div class="chkcarplace-box" style="display: none;">
						<label class="checkbox">
							<input type="checkbox" id="chkcarplace" value="chkcarplace" onclick="YnCheck2(this)">
							<span class="icon"></span>
							<span class="text" >차박 명소 등록하기</span>
							<span style="display: none;">4</span>
							<span id="car"><input type="text" value="N" name="carmapchk"></span>
						</label>
					</div>
				</div>
			</div>
			<!-- End Upload Contents Area -->
		</div>
		
		<div class="card-body-bottom">
			<button type="submit" class="btn btn-light" id="button-boardupload">올리기</button>
		</div>
	</div>
</form:form>
<!-- End Container Area -->

<!-- Start Footer Area -->
<%@ include file="../common/footer.jsp" %>
<!-- End Footer Area -->
</body>
</html>