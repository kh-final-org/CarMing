<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<!-- Mobile Specific Meta -->
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<!-- Favicon-->
	<link rel="shortcut icon" href="resources/img/fav.png">
	<!-- Author Meta -->
	<meta name="author" content="CodePixar">
	<!-- Meta Description -->
	<meta name="description" content="">
	<!-- Meta Keyword -->
	<meta name="keywords" content="">
	<!-- meta character set -->
	<meta charset="UTF-8">
	<!-- Site Title -->
	<title>CarMing</title>

	<!-- CSS -->
	<link rel="stylesheet" href="resources/css/linearicons.css">
	<link rel="stylesheet" href="resources/css/owl.carousel.css">
	<link rel="stylesheet" href="resources/css/themify-icons.css">
	<link rel="stylesheet" href="resources/css/font-awesome.min.css">
	<link rel="stylesheet" href="resources/css/nice-select.css">
	<link rel="stylesheet" href="resources/css/nouislider.min.css">
	<link rel="stylesheet" href="resources/css/bootstrap.css">
	<link rel="stylesheet" href="resources/css/main.css">
	<!-- bootstrap icon -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
	<style type="text/css">
		@import url("https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css");
	</style>
</head>
<body>
<!-- Start Header Area -->
	<header class="header_area sticky-header">
		<div class="main_menu">
			<nav class="navbar navbar-expand-lg navbar-light main_box">
				<div class="container">
					<!-- Brand and toggle get grouped for better mobile display -->
					<a class="navbar-brand logo_h" href="home.do"><img src="resources/img/logo.png" style="width: 100px; height: 78.363px;"></a>
					<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
					 aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					
					<!-- Collect the nav links, forms, and other content for toggling -->
					<div class="collapse navbar-collapse offset"
						id="navbarSupportedContent">
						<ul class="nav navbar-nav menu_nav ml-auto">

									<!-- 로그인 활성화후 if문으로 관리자가 아닐경우 숨기기 -->
									<li class="nav-item submenu dropdown"><a href="#"
										class="nav-link dropdown-toggle" data-toggle="dropdown"
										role="button" aria-haspopup="true" aria-expanded="false"
										style="font-size: 15px;">관리자</a>
										<ul class="dropdown-menu">
											<li class="nav-item"><a class="nav-link"
												href="memberlist.do" style="font-size: 15px;">회원 목록</a></li>
											<li class="nav-item"><a class="nav-link"
												href="adminRentList.do" style="font-size: 15px;">렌탈 목록</a></li>
											<li class="nav-item"><a class="nav-link"
												href="inquirylist.do" style="font-size: 15px;">문의 목록</a></li>
											<li class="nav-item"><a class="nav-link" href="reportlist.do" style="font-size: 15px;">신고 목록</a></li>
											<li class="nav-item"><a class="nav-link" href="insertform.do" style="font-size: 15px;">제품 등록</a></li>
											<li class="nav-item"><a class="nav-link" href="adminProductList.do" style="font-size: 15px;">제품 목록</a></li>
										</ul></li>
									<!-- 로그인 활성화후 if문으로 관리자가 아닐경우 숨기기 -->

							<li class="nav-item"><a class="nav-link" href="recipeCrawling.do" style="font-size: 15px;">캠핑추천</a></li>
							<!-- 네비바 캠핑렌트 드롭다운 제거 후 코드 수정 -->
							<li class="nav-item"><a class="nav-link" href="productlist.do" style="font-size: 15px;">캠핑렌트</a></li>
							<li class="nav-item"><a class="nav-link" href="boardmainform.do" style="font-size: 15px;">캠핑토크</a></li>
							<li class="nav-item"><a class="nav-link" href="camMeet.do" style="font-size: 15px;">우리 서로 캠LIVE</a></li>
							<li class="nav-item"><a class="nav-link" href="maincamplace.do" style="font-size: 15px;">캠플레이스</a></li>
						</ul>
						
						<ul class="nav navbar-nav navbar-right ml-auto">
							<li class="nav-item" style="padding-left:0; margin-left:0">
								<a href="mypage.do"> <!-- 마이페이지 -->        				
								<span class="bi bi-person" style="font-size: 20px"></span></a>
							</li>
							<li class="nav-item">
								<a href="cartlist.do"> <!-- 장바구니 -->
								<span class="bi bi-cart2" style="font-size: 20px"></span></a>

							</li>
							<li class="nav-item">
								<a href="logout.do"> <!-- 로그인/로그아웃 || 아이콘 상태 변하도록 구현 필요-->
								<span class="bi bi-box-arrow-in-right" style="font-size: 20px"></span>
								<!-- 로그아웃 아이콘 -->
								<!-- <span class="bi bi-box-arrow-left" style="font-size: 20px"></span> -->
								</a>
							</li>
							<!-- 검색 -->
							<li class="nav-item">
								<button class="search"><span class="bi bi-search" id="search"></span></button>
							</li>
						</ul>
					</div>
				</div>
			</nav>
		</div>
		<div class="search_input" id="search_input_box">
			<div class="container">
				<form class="d-flex justify-content-between" id="searchForm" onSubmit="formAction();">
					<c:set var="page" value="${(empty param.page) ? 1 : param.page}"></c:set>
					<input type="hidden" name="orderBy" value="${orderBy}">
					<input type="hidden" name="pCateNo" value="${pCateNo }">
					<input type="hidden" name="viewNo" value="${viewNo}">
					<input type="hidden" name="page" value="${page}">
					<input type="text" class="form-control" id="search_input" placeholder="Search Here" name="search" value="${param.search }">
					<button type="submit" class="btn"></button>
					<span class="lnr lnr-cross" id="close_search" title="Close Search"></span>
				</form>
			</div>
		</div>
	</header>
	<!-- End Header Area -->

	<script src="resources/js/vendor/jquery-2.2.4.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4"
	 crossorigin="anonymous"></script>
	<script src="resources/js/vendor/bootstrap.min.js"></script>
	<script src="resources/js/jquery.ajaxchimp.min.js"></script>
	<script src="resources/js/jquery.nice-select.min.js"></script>
	<script src="resources/js/jquery.sticky.js"></script>
	<script src="resources/js/nouislider.min.js"></script>
	<script src="resources/js/jquery.magnific-popup.min.js"></script>
	<script src="resources/js/owl.carousel.min.js"></script>
	<!--gmaps Js-->
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCjCGmQ0Uq4exrzdcL6rvxywDDOvfAu6eE"></script>
	<script src="resources/js/gmaps.min.js"></script>
	<script src="resources/js/main.js"></script>
	<!-- campingRent Js -->
	<script src="resources/js/category.js"></script>
	
	<!-- Chatbot -->
	<%@include file="../../views/chatbot/chatbot.jsp"%>
</body>
</html>