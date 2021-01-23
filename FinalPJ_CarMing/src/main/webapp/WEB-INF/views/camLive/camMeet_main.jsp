<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<style type="text/css">
video {
	width: 100%;
    height: 100%;
    object-fit: cover;
}
</style>

<script type="text/javascript">

var videoImg = document.getElementById('videoImg');

function getMedia() {
	var videoDiv = document.getElementById('localVideo');
	var image = document.getElementById('change');

	if (navigator.getUserMedia) {
		navigator.getUserMedia({
			audio : false,
			video : true
		}, function(stream) {
			videoDiv.removeChild(image);
			var myVideo = document.createElement('video');
			addVideo(myVideo, stream);
			
		}, function(err) {
			console.log("The following error occurred: " + err.name);
		});
	} else {
		console.log("getUserMedia not supported");
	}
}


	function addVideo(video, stream) {
		video.srcObject = stream;
		video.onloadedmetadata = function(e) {
			if(videoImg.className == "bi bi-camera-video-fill") {
				videoImg.className = "bi bi-camera-video-off-fill";
			    
				video.play();
			    videoDiv.append(video);
			    
			  } else {
				  videoImg.className = "bi bi-camera-video-fill";
			    
			  }
		};
		
		
	}
</script>

<title>CarMing</title>
</head>
<body>
	<%@include file="../common/header.jsp"%>

	<!-- Start Banner Area -->
	<section class="banner-area organic-breadcrumb">
		<div class="container">
			<div class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
				<div class="col-first">
					<h1>우리서로 캠LIVE</h1>
					<nav class="d-flex align-items-center">
						<a href="index.html">Home<span class="lnr lnr-arrow-right"></span></a>
						<a href="category.html">캠핑 MEET</a>
					</nav>
				</div>
			</div>
		</div>
	</section>
	<!-- End Banner Area -->
	
	<!--================ camMeet Area =================-->
	<section class="features-area section_gap">
		<div class="container">
			<div class="row" style="margin-top: 20px;">
				<!-- Local Video Area -->
				<div class="col-lg-8">
					<div class="row"
						data-masonry="{&quot;percentPosition&quot;: true }"
						style="position: relative; height: 1094.09px;">
						<div class="col-sm-6 col-lg-4 mb-4"
							style="position: absolute; left: 0%; top: 0px;">
							<img src="resources/camLive/img/video-call-01.jpeg"
								class="card-img-top">
						</div>
						<div class="col-sm-6 col-lg-4 mb-4"
							style="position: absolute; left: 50%; top: 0px;">
							<img src="resources/camLive/img/video-call-02.jpeg"
								class="card-img-top" style="height: 150px">
						</div>
						<div class="col-sm-6 col-lg-4 mb-4"
							style="position: absolute; left: 50%; top: 200.771px;">
							<img src="resources/camLive/img/video-call-03.jpeg"
								class="card-img-top">
						</div>

						<div class="col-sm-6 col-lg-4 mb-4"
							style="position: absolute; left: 0%; top: 359.286px;">
							<img src="resources/camLive/img/video-call-04.jpeg"
								class="card-img-top">
						</div>
						<div class="col-sm-6 col-lg-4 mb-4" id="localVideo"
							style="position: absolute; left: 0%; top: 528.078px;">
							<img id="change" src="resources/camLive/img/video-call-05.jpeg"
								class="card-img-top">
						</div>
						<div class="col-sm-6 col-lg-4 mb-4"
							style="position: absolute; left: 50%; top: 599.38px;">
							<img src="resources/camLive/img/video-call-06.jpeg"
								class="card-img-top" style="height: 160px;">
						</div>
						<div class="col-sm-6 col-lg-4 mb-4"
							style="position: absolute; left: 0%; top: 703.354px;">
							<img src="resources/camLive/img/video-call-07.jpeg"
								class="card-img-top">
						</div>
					</div>
				</div>

				<!-- CamMeet description Area -->
				<div class="col-lg-4 shadow p-3 mb-4 bg-white rounded">
					<h1>언택트 캠핑하자!</h1>
					<p>There are advances being made in science and technology
						everyday, and a good example of this is the</p>
					<button type="button" class="genric-btn primary circle" onclick="getMedia();">
						<i id="videoImg" class="bi bi-camera-video-fill" style="font-size: 20px;"></i>
              		</button>
				</div>
			</div>
		</div>
	</section>

	<%@include file="../common/footer.jsp"%>
	<!-- 이미지 정렬을 위한 CDN -->
	<script src="https://cdn.jsdelivr.net/npm/masonry-layout@4.2.2/dist/masonry.pkgd.min.js" integrity="sha384-GNFwBvfVxBkLMJpYMOABq3c+d3KnQxudP/mGPkzpZSTYykLBNsZEnG2D9G/X/+7D" crossorigin="anonymous" async></script>
</body>
</html>