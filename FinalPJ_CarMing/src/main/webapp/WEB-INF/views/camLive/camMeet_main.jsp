<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <script src="https://192.168.35.179:3000/socket.io/socket.io.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
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
				<div class="col-lg-6">
					<div class="row"
						data-masonry="{&quot;percentPosition&quot;: true }">
						<div class="col-sm-6 col-lg-4 mb-4">
							<img src="resources/camLive/img/video-call-01.jpeg"
								class="card-img-top">
						</div>
						<div class="col-sm-6 col-lg-4 mb-4">
							<img src="resources/camLive/img/video-call-02.jpeg"
								class="card-img-top">
						</div>
						<div class="col-sm-6 col-lg-4 mb-4">
							<img src="resources/camLive/img/video-call-03.jpeg"
								class="card-img-top">
						</div>
						<div class="col-sm-6 col-lg-4 mb-4">
							<img src="resources/camLive/img/video-call-04.jpeg"
								class="card-img-top" style="height: 255px;">
						</div>
						<div class="col-sm-6 col-lg-4 mb-4">
							<img src="resources/camLive/img/video-call-05.jpeg"
								class="card-img-top">
						</div>
						<div class="col-sm-6 col-lg-4 mb-4">
							<img src="resources/camLive/img/video-call-06.jpeg"
								class="card-img-top">
						</div>
						<div class="col-sm-6 col-lg-4 mb-4">
							<img src="resources/camLive/img/video-call-07.jpeg"
								class="card-img-top">
						</div>
						<div class="col-sm-6 col-lg-4 mb-4">
							<img src="resources/camLive/img/video-call-08.jpeg"
								class="card-img-top">
						</div>
						<div class="col-sm-6 col-lg-4 mb-4">
							<img src="resources/camLive/img/video-call-09.jpeg"
								class="card-img-top">
						</div>
						<div class="col-sm-6 col-lg-4 mb-4">
							<img src="resources/camLive/img/video-call-10.jpeg"
								class="card-img-top">
						</div>
					</div>
				</div>

				<!-- CamMeet description Area -->
				<div class="col-lg-6 shadow mb-4 bg-white rounded"
					style="text-align: center;">
					<h1 style="padding-top: 100px; font-weight: bold; font-size: 40px;">
						CAMPING MEET</h1>
					<p>캠핑의 즐거움을 화상통화로 함께 즐겨보세요 :)</p>

					<div class="d-flex flex-row" style="margin-top: 100px">
						<input id="inputUrl" class="form-control" placeholder="camping meet code"
							style="text-align: center"
							onfocus="this.placeholder = ''"
							onblur="this.placeholder = 'camping meet code '">

						<button id="enter" class="click-btn btn btn-warning" type="button">
							<i class="fa fa-long-arrow-right" aria-hidden="true"></i>
						</button>

						<div style="position: absolute; left: -5000px;">
							<input name="b_36c4fd991d266f23781ded980_aefe40901a"
								tabindex="-1" value="" type="text">
						</div>
					</div>

					<div class="d-flex flex-row" style="margin-top: 20px; padding-bottom: 100px;">
						<button type="button" id="new" class="btn btn-outline-warning" style="width: 100%">new meeting</button>
					</div>
				</div>
			</div>
		</div>
	</section>

	<%@include file="../common/footer.jsp"%>
	<script src="resources/camLive/camMeet.js"></script>
	<!-- 이미지 정렬을 위한 CDN -->
	<script src="https://cdn.jsdelivr.net/npm/masonry-layout@4.2.2/dist/masonry.pkgd.min.js" integrity="sha384-GNFwBvfVxBkLMJpYMOABq3c+d3KnQxudP/mGPkzpZSTYykLBNsZEnG2D9G/X/+7D" crossorigin="anonymous" async></script>
</body>
</html>