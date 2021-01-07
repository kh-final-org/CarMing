<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의 목록</title>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Mobile Specific Meta -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Favicon-->
<link rel="shortcut icon" href="img/fav.png">
<!-- Author Meta -->
<meta name="author" content="CodePixar">
<!-- Meta Description -->
<meta name="description" content="">
<!-- Meta Keyword -->
<meta name="keywords" content="">
<!-- meta character set -->
<meta charset="UTF-8">
<!-- CSS ============================================= -->
<link rel="stylesheet" href="css/linearicons.css">
<link rel="stylesheet" href="css/font-awesome.min.css">
<link rel="stylesheet" href="css/themify-icons.css">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/owl.carousel.css">
<link rel="stylesheet" href="css/nice-select.css">
<link rel="stylesheet" href="css/nouislider.min.css">
<link rel="stylesheet" href="css/ion.rangeSlider.css" />
<link rel="stylesheet" href="css/ion.rangeSlider.skinFlat.css" />
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="resources/css/list.css">


</head>
<body>

	<!-- Start Header Area -->
	<%@include file="../tipAndRecipe/header.jsp"%>
	<!-- End Header Area -->
	<br>
	<!-- Start Banner Area -->
	<section class="banner-area organic-breadcrumb">
		<div class="container">
			<div
				class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
				<div class="col-first">
				
					<h1>문의 사항</h1>
					<nav class="d-flex align-items-center">
						<a href="tipAndRecipeMain.do">문의사항<span
							class="lnr lnr-arrow-right"></span></a> <a href="category.html">목록</a>
					</nav>
				</div>
			</div>
			<div class="section-top-border text-right">
				<div class="button-group-area mt-40" style="padding-bottom: 5em">
					<a href="tipAndRecipeMain.do"
						class="genric-btn danger-border e-large">목록으로</a>
					<a href="writeinquiryform.do"
						class="genric-btn danger-border e-large">새 글 작성하기</a>
				</div>
			</div>
		</div>
	</section>
	<!-- End Banner Area -->
	<!-- 목록 부분 -->
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="card">

					<div class="gaadiex-list">
						<div class="gaadiex-list-item">
							<img class="gaadiex-list-item-img"
								src="resources/img/tipandrecipe/honey.jpg"
								alt="List user">
							<div class="gaadiex-list-item-text">
								<h3 style="color: orange">
									<a href="#">이예슬</a>
								</h3>
								
								<h4><a href="inquirydetail.do">brunch this weekend?</a></h4>
								<p>캠렌트</p>
								<p>2020/12/29</p>
								
							</div>
						</div>
						<div class="gaadiex-list-item">
							<img class="gaadiex-list-item-img"
								src="resources/img/tipandrecipe/honey.jpg"
								alt="List user">
							<div class="gaadiex-list-item-text">
								<h3>
									<a href="#">이예슬</a>
								</h3>
								
								<h4>Brunch this weekend?</h4>
								<p>캠렌트</p>
								<p>2020/12/29</p>
							</div>
						</div>
						<div class="gaadiex-list-item">
							<img class="gaadiex-list-item-img"
								src="resources/img/tipandrecipe/honey.jpg"
								alt="List user">
							<div class="gaadiex-list-item-text">
								<h3>
									<a href="#">이예슬</a>
								</h3>
								
								<h4>Brunch this weekend?</h4>
								<p>캠렌트</p>
								<p>2020/12/29</p>
							</div>
						</div>
						<div class="gaadiex-list-item">
							<img class="gaadiex-list-item-img"
								src="http://www.free-icons-download.net/images/commercial-male-user-icon-32765.png"
								alt="List user">
							<div class="gaadiex-list-item-text">
								<h3>
									<a href="#">Guy Carpenter</a>
								</h3>
								<h4>Brunch this weekend?</h4>
								<p>I'll be in your neighborhood doing errands</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 목록 종료 -->
	

	<!-- start footer Area -->

	<%@include file="../../views/common/footer.jsp"%>
	<!-- End footer Area -->

	<script src="js/vendor/jquery-2.2.4.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"
		integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4"
		crossorigin="anonymous"></script>
	<script src="js/vendor/bootstrap.min.js"></script>
	<script src="js/jquery.ajaxchimp.min.js"></script>
	<script src="js/jquery.nice-select.min.js"></script>
	<script src="js/jquery.sticky.js"></script>
	<script src="js/nouislider.min.js"></script>
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<!--gmaps Js-->
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCjCGmQ0Uq4exrzdcL6rvxywDDOvfAu6eE"></script>
	<script src="js/gmaps.min.js"></script>
	<script src="js/main.js"></script>
</body>
</html>