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
<link rel="stylesheet" href="resources/css/boardinsert_v.css">

<script type="text/javascript" src="resources/js/board_v.js?ver=1"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

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

<!-- 사진 파일명 추출 -->
<script type="text/javascript">
	$(document).ready(function(){
		var img = $('#input_img');
		var vid = $('#video-file');

		img.change(function(){
		$('#emptyimg').hide();
		console.log(img.val())
		
		var filename = img.val().split('\\').pop();
	    $('#filename').text(filename); 
	 
		});
	
		vid.change(function(){
		$('#emptyvideo').hide();
		console.log(vid.val())
		
		var videofilename = vid.val().split('\\').pop();
	    $('#videofilename').text(videofilename); 
			    	
		});
			
	});	
</script>

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
									<div class="popup-desc-text">키워드 이외의 장소는 지도 상에서 위치를 클릭하여  선택할 수 있습니다.</div>
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