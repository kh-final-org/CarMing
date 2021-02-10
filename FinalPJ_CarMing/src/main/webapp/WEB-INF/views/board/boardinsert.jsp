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
<title>CarMing | 캠핑토크 - 사진 올리기</title>
<link rel="stylesheet" href="resources/css/board.css">

<script type="text/javascript" src="resources/js/board.js?ver=1"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
var sel_file;
$(document).ready(function() {
	$("#input_img").on("change", handleImgFileSelect);
	
	/* $("#location-finish-btn").click(function(){

	/* 	if(mapname.val() != ""){ */
			/* alert(place.val());
			$('#emptymap').hide();
			 */
		/* }; */
	
/*  });  */ 
	
});
function handleImgFileSelect(e) {
	$("#img").empty(); //remove는 태그 자체를 지운다 
	var files = e.target.files;
	var filesArr = Array.prototype.slice.call(files);

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


/* $(document).ready(function(){
	var img = $('#input_img');
	var category = $('select[name=bcategoryno]');
	var content = $('textarea[name=brdcontent]');	
	var place = $('#place');
	var mapname = $('#mapname')
	
	if(img.val() == ""){
			$('#emptyimg').show();
			console.log(img.val())
		}
		
		img.change(function(){
			$('#emptyimg').hide();
			console.log(img.val())
			
		var filename = img.val().split('\\').pop();
        $('#filename').text(filename);
			
		});
	
		
		if(category.val() == null){
				$('#emptycategory').show();
			}
		
		category.change(function(){
				$('#emptycategory').hide();
				});
			
		if(content.val().trim() == ""){
			$('#emptycontent').show();
		}
		if(content.text().trim() != null){
			content.keyup(function(){
			$('#emptycontent').hide();
			
			});
		}
		
		if(place.text().trim() == ""){
			$('#emptymap').show();
		} */
		
		 
		
		
		
		
/* });	 */	 



function board(){
	
	var img = $('#input_img');
	var category = $('select[name=bcategoryno]');
	var content = $('textarea[name=brdcontent]');	
	var place = $('#place');
	var mapname = $('#mapname')
	
	
			/* if(category.val() == null ||
			content.val().trim() == "" 	||
			img.val() == "" ||
			mapname.val() == ""){
				alert("모든 항목을 작성해 주세요");
				return;
				
				
			} */
	
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
			
			img.change(function(){
				$('#emptyimg').hide();
				console.log(img.val())
				
			var filename = img.val().split('\\').pop();
	        $('#filename').text(filename);
	        
	        	
			});
			
			
			if(place.val() == ""){
				$('#emptymap').show();
				alert(place.val());
				
			};
			
			/* if(mapname.val() != null){
				$('#emptymap').hide();
				alert(place.text());
				alert(mapname.val().text()+"2");
		        alert(mapname.val()); 
			};  */
			
			
			/* if(mapname.text() !=""){
				alert(mapname.text())
			} */
			
			mapname.keyup(function(){
				$('#emptymap').hide();
			}); 
			
			
			if(category != null &&
			content.val() != "" 	&&
			img != null &&
			mapname.val() != "")	{
				alert("문의주셔서 감사합니다.");
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
<form:form action="boardinsertres.do?memno=${login.memno }" 
		   method="post" enctype="multipart/form-data" modelAttribute="boardDto" id="target" >
	<div class="card-container">
		<div class="card-head">
			<h2 style="color: #5f5f5f;">게시글 작성하기</h2>
		</div>
		
		<div class="card-body">
			<!-- Image Upload-->
			<div class="board-img-err" id="emptyimg">사진을 선택헤 주세요</div>
			<div class="card-body-left">
				<div class="upload-img-form">
					<div class="img_wrap center-block">
						<img id="img" src="">
		  			</div>
					<div class="upload-img-content">
						<label class="custom-file-label" for="input_img" id="filename"></label>
						<input type="file" class="custom-file-input" id="input_img" name="brdfile" accept="image/*">
					</div>
				</div>
			</div>
			
			<div class="card-body-right">
				<!-- Category -->
				<div class="board-err" id="emptycategory">카테고리를 선택헤 주세요</div>
				<div class="body-category" style="width: 500px;">
					<div class="dropdown-selectbox">
				  		<select onchange="carPlaceChk()" class="selectpicker form-control" id="selectbox" 
				  				aria-label="Example select with button addon" name="bcategoryno">
							<option value="0" selected disabled>카테고리(필수)</option>
							<option value="1" >일반 캠핑</option>
						    <option value="2">카라반</option>
						    <option value="3">글램핑</option>
						    <option value="4">차박</option>
						    <option value="5">나만의 캠핑</option>
					  	</select>
					</div>
				</div>			
				
				<!-- Textarea -->
				<div class="board-err" id="emptycontent">내용을 입력해 주세요</div>
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
									<div style="padding:0%; margin:0%">키워드 이외의 장소는 클릭해서 선택하실 수 있습니다.</div>
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
											    plc.setAttribute("style","border:0px; outline:none;");

										        
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
				<div class="board-err" id="emptymap">장소를 선택해 주세요</div>
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
					<div class="chkcarplace-box" style="display: none">
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
			<button type="button" class="btn btn-light" id="button-boardupload" onclick="board()">올리기</button>
		</div>
	</div>
</form:form>
<!-- End Container Area -->

<!-- Start Footer Area -->
<%@ include file="../common/footer.jsp" %>
<!-- End Footer Area -->
</body>
</html>