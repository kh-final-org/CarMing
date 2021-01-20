<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>렌트 상세 페이지</title>
<!-- Mobile Specific Meta -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
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


<link rel="stylesheet" href="resources/css/contactus.css">


<!--gmaps Js-->
<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCjCGmQ0Uq4exrzdcL6rvxywDDOvfAu6eE"></script>
<script src="resources/js/gmaps.min.js"></script>
<script src="resources/js/main.js"></script>

</head>
<body>

	<!-- Start Header Area -->
	<%@include file="../../views/common/header.jsp"%>
	<!-- End Header Area -->
	<br>
	<!-- Start Banner Area -->
	<section class="banner-area organic-breadcrumb">
		<div class="container">
			<div
				class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
				<div class="col-first">
					<br>
					<h1>렌트</h1>
					<nav class="d-flex align-items-center">
						<a href="tipAndRecipeMain.do">렌트<span
							class="lnr lnr-arrow-right"></span></a> <a href="category.html">상세페이지</a>
					</nav>
				</div>
			</div>
			<div class="section-top-border text-right">
				<div class="button-group-area mt-40" style="padding-bottom: 5em">
					<a href="tipAndRecipeMain.do"
						class="genric-btn danger-border e-large"><strong>목록으로</strong></a>
					<a href="writeinquiryform.do"
						class="genric-btn danger-border e-large"><strong>반납완료</strong></a>
				</div>
			</div>
		</div>
	</section>
	<!-- End Banner Area -->


	<!------ 내용---------->

		<div class="container contact">
			<div class="row">
				<div class="col-md-3">
					<div class="contact-info">
						<img src="resources/img/logo_chatbot.png" alt="image" />
						<h2>렌트내용</h2>
						<h4>렌트 상태를 확인해요</h4>
					</div>
				</div>
				<div class="col-md-9">
					<div class="contact-form">
						<div class="form-group">
							<label class="control-label col-sm-2" for="nickname"> 사용자
								닉네임:</label>
							<div class="col-sm-10">
								<p class="form-control" id="nickname">이예슬</p>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2" for="category">
								카테고리: </label>
							<div class="col-sm-10">
								<p class="form-control" id="category">캠프</p>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2" for="product"> 상품명:
							</label>
							<div class="col-sm-10">
								<p class="form-control" id="product">의자</p>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2" for="paycode"> 결제 번호:
							</label>
							<div class="col-sm-10">
								<p class="form-control" id="paycode">#1234</p>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2" for="price"> 상품 가격:
							</label>
							<div class="col-sm-10">
								<p class="form-control" id="price">10000원</p>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2" for="amount"> 상품 수량:
							</label>
							<div class="col-sm-10">
								<p class="form-control" id="price">1</p>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2" for="comment">렌트 시작일:</label>
							<div class="col-sm-10">
								<input type="date" class="form-control" readonly="readonly"
									id="date">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2" for="comment">렌트 종료일:</label>
							<div class="col-sm-10">
								<input type="date" class="form-control" readonly="readonly"
									id="date">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2" for="state"> 렌탈현황:</label>
							<div class="col-sm-10">
								<p class="form-control" id="price">렌트중</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	<!-- start footer Area -->
	<%@include file="../../views/common/footer.jsp"%>
	<!-- End footer Area -->

</body>
</html>