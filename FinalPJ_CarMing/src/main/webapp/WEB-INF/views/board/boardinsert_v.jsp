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
<!-- <link rel="stylesheet" href="resources/css/board_v.css"> -->
<style type="text/css">
	.col-first{margin: -1% 63.5% 0 -18%; } 
	.col-first > .maintext{font-weight: bold; font-size: 2.0em; color: #fff; text-align: left;}
	.text-1{margin: -5% 0 3%;}
	
	.card-container{margin: 50px 190px 50px 220px;}
    .card-body{padding: 0px;}
   	
   	.card-body-left{position: relative; float: left; width: 530px; height: 350px; margin: 0 2% 0 -2%;}
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
    .body-checklist{margin: 3% 0.5% 0;}   
    .latlong-input-value{margin-top: 10px;}
	  
    .card-body-bottom{clear: both; margin: 0 34.5% 0; padding: 0px;}   
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

	.board-err{float: left; width: 72%; margin-left: 3%; font-size:1.1em; color:red; padding-bottom:1%;padding-top:1%; }
	.board-img-err{float: left; width: 72%; margin-left: -1%; margin-bottom:2%; font-size:1.1em; color:red; padding-bottom:-5%;padding-top:1%; }
	.board-img-err-bottom{float: left; width: 72%; margin-left: -1%; margin-top: 10%; margin-bottom:-1%; font-size:1.1em; color:red; padding-bottom:-5%;padding-top:1%; }
	#emptyimg{position: absolute; z-index: 1000; bottom: -11%; left: 32%;}
	#emptyvideo{position: absolute; z-index: 1000;  bottom: 35%; left: 58%;}
	#emptycategory{position: absolute; z-index: 1000; top: 55%; left: 70%;}
	#emptycontent{position: absolute; z-index: 1000; top: 81%; left: 60%; }
	#emptymap{position: absolute; z-index: 1000; bottom: -11.2%; left: 50.5%; }

</style>
<script type="text/javascript" src="resources/js/board_v.js?ver=1"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>


<!-- 모든 항목 기입해야 insert -->
<script type="text/javascript">
	function board(){
		var img = $('#input_img');
		var vid = $('#video-file');
		var category = $('select[name=bcategoryno]');
		var content = $('textarea[name=brdcontent]');	
		var place = $('#place');
		var mapname = $('#mapname')
					 
			if(category.val() == null){
				$('#emptycategory').show();
			} 
			category.change(function(){
				$('#emptycategory').hide();
			});
			
			if(content.val().trim()== ""){
				$('#emptycontent').show();
			}
			content.keyup(function(){
				$('#emptycontent').hide();
			}); 
			
			if(img.val() == ""){
				$('#emptyimg').show();
			}
			
			if(vid.val() == ""){
				$('#emptyvideo').show();
			}
			
			if(place.val().trim() == ""){
				$('#emptymap').show();
			};  
			
				/* if(mapname.val() != ""){
					$('#emptymap').hide();
			        alert(mapname.val()+"mapnameval"); 
				};   */
			

				$('#location-finish-btn').click(function(){
					if(mapname.val() != ""){
						$('#emptymap').hide();
					};  
				}); 
			
			/* 	
			  $('#location-finish-btn').click(function(){
				 if(mapname.val().trim() == ""){
						$('#emptymap').hide();
						$('#emptymapname').show();
				        alert(mapname.val()+"he"); 
				};  
				if(mapname.val() != ""){
					$('#emptymap').hide();
					$('#emptymapname').hide();
			        alert(mapname.val()+"he2"); 
				};  
				alert("click");
			});   */
			
			mapname.keyup(function(){
				 if(mapname.val().trim() != ""){
						$('#emptymap').hide();
				}; 
			}); 
				
				
			if(category.val() == null ||
				content.val().trim() == "" 	||
				img.val() == "" ||
				mapname.val() == ""){
					alert("모든 항목을 기입해주세요.");
				return;
			}  	
			
			if(category != null &&
				content.val() != "" &&
				img != null &&
				mapname.val() != null )	{
				alert("게시글이 등록되었습니다.");
				$("#target").submit();
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
      <div class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
         <div class="col-first" id="banner-text-1">
         	<div class="maintext text-1">Everything has an end,</div>
         	<div class="maintext text-2">so time feels more precious</div>
         </div>
      </div>
   </div>
</section>
<!-- End Banner Area -->

<!-- Start Container Area -->
<form:form id="target" action="boardinsertres_v.do?&memno=${login.memno }" 
		   method="post" enctype="multipart/form-data" modelAttribute="boardDto" >
	<div class="card-container">
		<div class="card-head">
			<h2 style="color: #5f5f5f;">게시글 작성하기</h2>
		</div>
		
		<div class="card-body">
			<div class="board-img-err" id="emptyimg">썸네일 사진을 선택해주세요.</div>
			<!-- Image/Video Upload-->
			<div class="card-body-left">
				<div class="upload-img-form">
					<div class="img_wrap center-block">
						<img id="img" src="">
		  			</div>
					<div class="upload-img-content">
						<label id="filename" class="custom-file-label" for="input_img"></label>
						<input type="file" class="custom-file-input" id="input_img" name="brdfile" accept="image/*">
					</div>
				</div>
						
			
				<div class="upload-video-form">
					<div class="upload-video-content">
						<label id="videofilename"  class="custom-file-label" for="video-file">
							<span class="board-img-err-bottom" id="emptyvideo">영상을 선택해주세요.</span>
						</label>
						<input type="file" class="custom-file-input" id="video-file" name="brdvideo" accept="video/*">
					</div>
				</div>
			</div>
			
			<!-- Start Upload Contents Area -->
			<div class="card-body-right">
				<!-- Category -->
				<div class="board-err" id="emptycategory">카테고리를 선택해주세요.</div>
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
				<div class="board-err" id="emptycontent">내용을 입력해주세요.</div>
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
										    
									       
									        var lat = latlng.getLat();
									        var lng = latlng.getLng();
									       
									        $("#place").empty();
									     
									        var plc = document.createElement("input");
										    plc.setAttribute("name", "mapname");
										    plc.setAttribute("id", "mapname");
										    plc.setAttribute("type", "text");
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
										
										function searchPlaces() {

											var keyword = document
													.getElementById('keyword').value;

											if (!keyword.replace(/^\s+|\s+$/g,
													'')) {
												alert('키워드를 입력해주세요.');
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
											    plc.setAttribute("id", "mapname");
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
				<div class="board-err" id="emptymap">장소를 선택해주세요.</div>
				
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
			<button type="button" onclick="board()" class="btn btn-light" id="button-boardupload">올리기</button>
		</div>
	</div>
</form:form>
<!-- End Container Area -->

<!-- Start Footer Area -->
<%@ include file="../common/footer.jsp" %>
<!-- End Footer Area -->
</body>
</html>