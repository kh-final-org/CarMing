$(document).ready(function(){
	
	if($('input:radio[name=campcategory]:checked').val()=="차박명소"){
		
		ajaxlocation();
		
	}else{
		searchPlaces();
	}
	
	$("input:radio[name=campcategory]").click(function(){
		
		if($('input:radio[name=campcategory]:checked').val()=="차박명소"){
			
			ajaxlocation();
			
		}else{
			searchPlaces();
		}
		
	});
	
	
});


// 마커를 담을 배열입니다
var markers = [];

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 5 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places();  

// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
var infowindow = new kakao.maps.InfoWindow({zIndex:1});

// 키워드로 장소를 검색합니다
//searchPlaces();

// 키워드 검색을 요청하는 함수입니다
function searchPlaces() {

    var keyword = $('input:radio[name=campcategory]:checked').val();

    if (!keyword.replace(/^\s+|\s+$/g, '')) {
        alert('키워드를 입력해주세요!');
        return false;
    }

    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
    ps.keywordSearch( keyword, placesSearchCB); 
}

// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function placesSearchCB(data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {

        // 정상적으로 검색이 완료됐으면
        // 검색 목록과 마커를 표출합니다
        displayPlaces(data);

        // 페이지 번호를 표출합니다
        displayPagination(pagination);

    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

        alert('검색 결과가 존재하지 않습니다.');
        return;

    } else if (status === kakao.maps.services.Status.ERROR) {

        alert('검색 결과 중 오류가 발생했습니다.');
        return;

    }
}

// 검색 결과 목록과 마커를 표출하는 함수입니다
function displayPlaces(places) {

    var listEl = document.getElementById('placesList'), 
    menuEl = document.getElementById('camptable'),
    fragment = document.createDocumentFragment(), 
    bounds = new kakao.maps.LatLngBounds(), 
    listStr = '';
    
    // 검색 결과 목록에 추가된 항목들을 제거합니다
    removeAllChildNods(listEl);

    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();
    
    for ( var i=0; i<places.length; i++ ) {

        // 마커를 생성하고 지도에 표시합니다
        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
            marker = addMarker(placePosition, i), 
            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        bounds.extend(placePosition);

        // 마커와 검색결과 항목에 mouseover 했을때
        // 해당 장소에 인포윈도우에 장소명을 표시합니다
        // mouseout 했을 때는 인포윈도우를 닫습니다
        (function(marker, title) {
            kakao.maps.event.addListener(marker, 'mouseover', function() {
                displayInfowindow(marker, title);
            });

            kakao.maps.event.addListener(marker, 'mouseout', function() {
                infowindow.close();
            });

            itemEl.onmouseover =  function () {
                displayInfowindow(marker, title);
            };

            itemEl.onmouseout =  function () {
                infowindow.close();
            };
        })(marker, places[i].place_name);

        fragment.appendChild(itemEl);
    }

    // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
    listEl.appendChild(fragment);
    menuEl.scrollTop = 0;

    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
    map.setBounds(bounds);
}

// 검색결과 항목을 Element로 반환하는 함수입니다
function getListItem(index, places) {

    var el = document.createElement('li'),
    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                '<div class="info">' +
                '   <h5><a href="'+places.place_url+'">' + places.place_name + '</a></h5>';

    if (places.road_address_name) {
        itemStr += '    <span>' + places.road_address_name + '</span>' +
                    '   <span class="jibun gray">' +  places.address_name  + '</span>';
    } else {
        itemStr += '    <span>' +  places.address_name  + '</span>'; 
    }
                 
      itemStr += '  <p class="tel">' + places.phone  + '</p>' +
                '</div>';           

    el.innerHTML = itemStr+"<hr>";
    el.className = 'item';

    return el;
}

// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, idx, title) {
    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
        imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
        imgOptions =  {
            spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
            spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
        },
        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new kakao.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage 
        });

    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

    return marker;
}

// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}

// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
function displayPagination(pagination) {
    var paginationEl = document.getElementById('pagination'),
        fragment = document.createDocumentFragment(),
        i; 

    // 기존에 추가된 페이지번호를 삭제합니다
    while (paginationEl.hasChildNodes()) {
        paginationEl.removeChild (paginationEl.lastChild);
    }

    for (i=1; i<=pagination.last; i++) {

        var el = document.createElement('a');
        el.className = "page-link";
        el.href = "#";
        el.innerHTML = i;

        if (i===pagination.current) {
            el.className = "on "+el.className;
        } else {
            el.onclick = (function(i) {
                return function() {
                    pagination.gotoPage(i);
                }
            })(i);
        }
        
        fragment.appendChild(el);
    }
    paginationEl.appendChild(fragment);
}

// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
// 인포윈도우에 장소명을 표시합니다
function displayInfowindow(marker, title) {
    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

    infowindow.setContent(content);
    infowindow.open(map, marker);
}

 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
function removeAllChildNods(el) {   
    while (el.hasChildNodes()) {
        el.removeChild (el.lastChild);
    }
}

////아이작스로 차박명소 값 받아오기
function ajaxlocation(){
	var memno = $("input[name=memno]").val();
	var pagename = $("input[name=pagename]").val();
	console.log(memno);
	console.log(pagename);
	
	
	
	var locParam = {};
	locParam["memno"] = memno;
	locParam["pagename"] = pagename;

	
	if(memno=="" || memno==null){
		alert("로그인이 제대로 되어있는지 확인해 주세요.");
	}else{
		if(pagename=="pagecampl"){
		$.ajax({
			type:"post",
			url : "ajaxlocationCampl.do",
			data : memno,
			contentType : "application/json",
			dataType : "json",
			success:function(msg){
				var count = 0;
				for(var key in msg){
						count++;
				}
				if(count>0){
					
					var positions = new Array();
					for(var key in msg){
						console.log("맵이름:"+key+"/ 경도, 위도:"+msg[key]);
						var obj = {
								title: key,
								latlng: new kakao.maps.LatLng(msg[key][0],msg[key][1])
						};
						positions.push(obj);
						console.log(positions[0].latlng);
					}
					var listEl = document.getElementById('placesList');
					menuEl = document.getElementById('camptable'),
				    fragment = document.createDocumentFragment(), 
				    bounds = new kakao.maps.LatLngBounds(), 
				    listStr = '';
					
					//페이징 제거
					var paginationEl = document.getElementById('pagination');
					//paginationEl.removeChild(paginationEl.fisrtChild);
					if(paginationEl){
						removeAllChildNods(paginationEl);
					}
					// 검색 결과 목록에 추가된 항목들을 제거합니다
					if(listEl){
						removeAllChildNods(listEl);
					}
				    // 지도에 표시되고 있는 마커를 제거합니다
				    removeMarker();
		
					// 마커 이미지의 이미지 주소입니다
					var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
					    
					for (var i = 0; i < positions.length; i ++) {
					  
					    // 마커 이미지의 이미지 크기 입니다
					    var imageSize = new kakao.maps.Size(24, 35); 
					    
					    // 마커 이미지를 생성합니다    
					    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
					    
					    
					    
					    // 마커를 생성합니다
					    var marker = new kakao.maps.Marker({
					        map: map, // 마커를 표시할 지도
					        position: positions[i].latlng, // 마커를 표시할 위치
					        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
					        image : markerImage // 마커 이미지 
					    });
					    
					    markers.push(marker); 
					    
					        var placePosition = positions[i].latlang, 
					            itemEl = getListItemck(i, positions[i]); // 검색 결과 항목 Element를 생성합니다

					        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
					        // LatLngBounds 객체에 좌표를 추가합니다
					        //postion 좌표값전달
					       bounds.extend(positions[i].latlng);

					        // 마커와 검색결과 항목에 mouseover 했을때
					        // 해당 장소에 인포윈도우에 장소명을 표시합니다
					        // mouseout 했을 때는 인포윈도우를 닫습니다
					        (function(marker, title) {
					        	console.log("마커 : "+title);
					            kakao.maps.event.addListener(marker, 'mouseover', function() {
					                displayInfowindow(marker, title);
					            });

					            kakao.maps.event.addListener(marker, 'mouseout', function() {
					                infowindow.close();
					            });

					            itemEl.onmouseover =  function () {
					                displayInfowindow(marker,title);
					            };

					            itemEl.onmouseout =  function () {
					                infowindow.close();
					            };
					        })(marker, positions[i].title);

					        fragment.appendChild(itemEl);
					    }

					    // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
					    listEl.appendChild(fragment);
					    menuEl.scrollTop = 0;

					    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
					    map.setBounds(bounds);
					    
					
				}else{
					var listEl = document.getElementById('placesList');
					var menuEl = document.getElementById('camptable');
				    var fragment = document.createDocumentFragment();
				    
				  //페이징 제거
					var paginationEl = document.getElementById('pagination');
					//paginationEl.removeChild(paginationEl.fisrtChild);
					if(paginationEl){
						removeAllChildNods(paginationEl);
					}
					// 검색 결과 목록에 추가된 항목들을 제거합니다
					if(listEl){
						removeAllChildNods(listEl);
					}
				    // 지도에 표시되고 있는 마커를 제거합니다
				    removeMarker();
				    
				    var el = document.createElement('li'),
				    itemStr = '<span class="markerbg marker_0"></span>' +
				                '<div class="info">' +
				                '   <h5>저장하신 캠핑맵이 없습니다.</h5>'
				                +'</div>';           

				    el.innerHTML = itemStr+"<hr>";
				    el.className = 'item';
				    fragment.appendChild(el);
				    listEl.appendChild(fragment);
				    menuEl.scrollTop = 0;
				}
			},
			error:function(){
				console.error("차박 명소 불러들어오기 통신 오류");
				alert("차박 명소 불러들어오기 통신 오류");
				
			}

		});
		}else{
			$.ajax({
				type:"post",
				url : "ajaxlocationMy.do",
				data : memno,
				contentType : "application/json",
				dataType : "json",
				success:function(msg){
					var count = 0;
					for(var key in msg){
							count++;
					}
					if(count>0){
						
						var positions = new Array();
						for(var key in msg){
							console.log("맵이름:"+key+"/ 경도, 위도:"+msg[key]);
							var obj = {
									title: key,
									latlng: new kakao.maps.LatLng(msg[key][0],msg[key][1])
							};
							positions.push(obj);
							console.log(positions[0].latlng);
						}
						var listEl = document.getElementById('placesList');
						menuEl = document.getElementById('camptable'),
					    fragment = document.createDocumentFragment(), 
					    bounds = new kakao.maps.LatLngBounds(), 
					    listStr = '';
						
						//페이징 제거
						var paginationEl = document.getElementById('pagination');
						//paginationEl.removeChild(paginationEl.fisrtChild);
						if(paginationEl){
							removeAllChildNods(paginationEl);
						}
						// 검색 결과 목록에 추가된 항목들을 제거합니다
						if(listEl){
							removeAllChildNods(listEl);
						}
					    // 지도에 표시되고 있는 마커를 제거합니다
					    removeMarker();
			
						// 마커 이미지의 이미지 주소입니다
						var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
						    
						for (var i = 0; i < positions.length; i ++) {
						  
						    // 마커 이미지의 이미지 크기 입니다
						    var imageSize = new kakao.maps.Size(24, 35); 
						    
						    // 마커 이미지를 생성합니다    
						    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
						    
						    
						    
						    // 마커를 생성합니다
						    var marker = new kakao.maps.Marker({
						        map: map, // 마커를 표시할 지도
						        position: positions[i].latlng, // 마커를 표시할 위치
						        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
						        image : markerImage // 마커 이미지 
						    });
						    
						    markers.push(marker); 
						    
						        var placePosition = positions[i].latlang, 
						            itemEl = getListItemck(i, positions[i]); // 검색 결과 항목 Element를 생성합니다

						        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
						        // LatLngBounds 객체에 좌표를 추가합니다
						        //postion 좌표값전달
						       bounds.extend(positions[i].latlng);

						        // 마커와 검색결과 항목에 mouseover 했을때
						        // 해당 장소에 인포윈도우에 장소명을 표시합니다
						        // mouseout 했을 때는 인포윈도우를 닫습니다
						        (function(marker, title) {
						        	console.log("마커 : "+title);
						            kakao.maps.event.addListener(marker, 'mouseover', function() {
						                displayInfowindow(marker, title);
						            });

						            kakao.maps.event.addListener(marker, 'mouseout', function() {
						                infowindow.close();
						            });

						            itemEl.onmouseover =  function () {
						                displayInfowindow(marker,title);
						            };

						            itemEl.onmouseout =  function () {
						                infowindow.close();
						            };
						        })(marker, positions[i].title);

						        fragment.appendChild(itemEl);
						    }

						    // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
						    listEl.appendChild(fragment);
						    menuEl.scrollTop = 0;

						    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
						    map.setBounds(bounds);
						    
						
					}else{
						var listEl = document.getElementById('placesList');
						var menuEl = document.getElementById('camptable');
					    var fragment = document.createDocumentFragment();
					    
					  //페이징 제거
						var paginationEl = document.getElementById('pagination');
						//paginationEl.removeChild(paginationEl.fisrtChild);
						if(paginationEl){
							removeAllChildNods(paginationEl);
						}
						// 검색 결과 목록에 추가된 항목들을 제거합니다
						if(listEl){
							removeAllChildNods(listEl);
						}
					    // 지도에 표시되고 있는 마커를 제거합니다
					    removeMarker();
					    
					    var el = document.createElement('li'),
					    itemStr = '<span class="markerbg marker_0"></span>' +
					                '<div class="info">' +
					                '   <h5>저장하신 캠핑맵이 없습니다.</h5>'
					                +'</div>';           

					    el.innerHTML = itemStr+"<hr>";
					    el.className = 'item';
					    fragment.appendChild(el);
					    listEl.appendChild(fragment);
					    menuEl.scrollTop = 0;
					}
				},
				error:function(){
					console.error("차박 명소 불러들어오기 통신 오류");
					alert("차박 명소 불러들어오기 통신 오류");
					
				}

			});
		}
}
}

function getListItemck(index, places) {

    var el = document.createElement('li'),
    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                '<div class="info">' +
                '   <h5>' + places.title + '</h5>'
                +'</div>';           

    el.innerHTML = itemStr+"<hr>";
    el.className = 'item';
    
    console.log(places.title);

    return el;
}


