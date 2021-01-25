<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의 내용</title>
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


<!--
		CSS
		============================================= -->
<link rel="stylesheet" href="resources/css/linearicons.css">
<link rel="stylesheet" href="resources/css/owl.carousel.css">
<link rel="stylesheet" href="resources/css/themify-icons.css">
<link rel="stylesheet" href="resources/css/font-awesome.min.css">
<link rel="stylesheet" href="resources/css/nice-select.css">
<link rel="stylesheet" href="resources/css/nouislider.min.css">
<link rel="stylesheet" href="resources/css/bootstrap.css">
<link rel="stylesheet" href="resources/css/main.css">
<link rel="stylesheet" href="resources/css/contactus.css">

<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- 	<script src="resources/js/vendor/jquery-2.2.4.min.js"></script> -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"
	integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4"
	crossorigin="anonymous"></script>
<script src="resources/js/vendor/bootstrap.min.js"></script>
<script src="resources/js/jquery.ajaxchimp.min.js"></script>
<script src="resources/js/jquery.nice-select.min.js"></script>
<script src="resources/js/jquery.sticky.js"></script>
<script src="resources/js/nouislider.min.js"></script>
<script src="resources/js/jquery.magnific-popup.min.js"></script>
<script src="resources/js/owl.carousel.min.js"></script>
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
					<h1>문의 사항</h1>
					<nav class="d-flex align-items-center">
						<a href="tipAndRecipeMain.do">문의사항<span
							class="lnr lnr-arrow-right"></span></a> <a href="category.html">상세페이지</a>
					</nav>
				</div>
			</div>
			<div class="section-top-border text-right">
				<div class="button-group-area mt-40" style="padding-bottom: 5em">
					<a href="tipAndRecipeMain.do"
						class="genric-btn danger-border e-large">목록으로</a> <a
						href="writeinquiryform.do"
						class="genric-btn danger-border e-large">새 글 작성하기</a>
				</div>
			</div>
		</div>
	</section>
	<!-- End Banner Area -->


	<!------ 내용---------->

	<form action="writeinquiry.do" method="POST">
		<div class="container contact">
			<div class="row">
				<div class="col-md-3">
					<div class="contact-info">
						<img src="resources/img/logo_chatbot.png" alt="image" />
						<h2>문의내용</h2>
						<h4>핑구에게 연락이 왔어요~</h4>
					</div>
				</div>
				<div class="col-md-9">
					<div class="contact-form">
						<div class="form-group">
							<label class="control-label col-sm-2" for="nickname"> 사용자
								닉네임:</label>
							<div class="col-sm-10">
								<p class="form-control" id="nickname">${list.memNick }</p>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2" for="category">
								카테고리</label>
							<div class="col-sm-10">
								<p class="form-control" id="category">${list.categoryName }</p>
							</div>
						</div>
						<br>
						<div class="form-group">
							<label class="control-label col-sm-2" for="content" style="">문의
								내용:</label>
							<div class="col-sm-10">
								<pre class="form-control" style="height: 600px;">${list.inquiryContent }
								</pre>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2" for="input_img">첨부
								이미지:</label>
							<div class="col-sm-10">
								<img id="img" class=" form-control" style="height: 440px"
									;
									src="resources/img/inquiry/${list.filename }">
							</div>
						</div>
					</div>

					<div class="form-group">
						<label class="control-label col-sm-2" for="category">작성일</label>
						<div class="col-sm-10">
							<p class="form-control" id="category"><fmt:formatDate pattern = "yyyy-MM-dd" 
         						value = "${list.inquiryDate}" /></p>	
						</div>
					</div>

				</div>
			</div>
		</div>
	</form>
	<div style="padding-bottom: 30%"></div>
	<!-- start footer Area -->
	<%@include file="../../views/common/footer.jsp"%>
	<!-- End footer Area -->

</body>
</html>