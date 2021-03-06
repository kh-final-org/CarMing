<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CarMing | 문의 상세 페이지</title>
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


<!-- CSS -->
<link rel="stylesheet" href="resources/css/linearicons.css">
<link rel="stylesheet" href="resources/css/owl.carousel.css">
<link rel="stylesheet" href="resources/css/themify-icons.css">
<link rel="stylesheet" href="resources/css/font-awesome.min.css">
<link rel="stylesheet" href="resources/css/nice-select.css">
<link rel="stylesheet" href="resources/css/nouislider.min.css">
<link rel="stylesheet" href="resources/css/bootstrap.css">
<link rel="stylesheet" href="resources/css/main.css">
<link rel="stylesheet" href="resources/css/inquirydetail.css">


<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- 	<script src="resources/js/vendor/jquery-2.2.4.min.js"></script> -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"
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
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCjCGmQ0Uq4exrzdcL6rvxywDDOvfAu6eE"></script>
<script src="resources/js/gmaps.min.js"></script>
<!-- <script src="resources/js/main.js"></script> -->

</head>

<body>

	<!-- Start Header Area -->
	<%@include file="../../views/common/header.jsp"%>
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
		  <div class="section-top-border text-right" id="banner-text-2">
	       	 <div class="button-group-area mt-40" style="padding-bottom: 5em">
	       	 	<button class="banner-btn" id="gowrite" type="button" onclick="location.href='deleteinquiry.do?inquiryNo=${list.inquiryNo}'">문의 삭제</button>
	       	 	<button class="banner-btn" id="golist" type="button" onclick="location.href='inquirylist.do'">문의 목록</button>
	         </div>
		  </div>
		</div>
	</section>
	<!-- End Banner Area -->
	
	<!-- Start Container Area -->
		<div class="container-contact">
			<div class="row">
				<div class="col-md-3">
					<div class="contact-info">
						<img id="pingu-confirm" src="./resources/img/confirm.png">
						<img id="pingu-img" src="resources/img/logo_chatbot.png" alt="image" /><br>
						<h3>문의 내용</h3>
						<h5>핑구가 확인해 드릴게요</h5>
						<h6>고객님께서 문의하신<br>내용입니다</h6>
					</div>
				</div>
				
				<div class="col-md-9">
					<div class="contact-form">
						<!-- 사용자 닉네임 -->
						<div class="form-group-inquiry-form">
							<label class="control-label col-sm-2" id="user-nickname" for="nickname">문의자 닉네임</label>
							<div class="col-sm-10">
								<p class="form-control" id="nickname">${list.memNick}</p>
							</div>
						</div>
						
						<!-- 작성일 -->
						<div class="form-group-inquiry-form">
							<label class="control-label col-sm-2" id="inquiry-date" for="date">문의 작성일</label>
							<div class="inquiry-date-form">
								<p class="form-control" id="date"><fmt:formatDate pattern = "yyyy-MM-dd" 
         						value = "${list.inquiryDate}" /></p>
							</div>
						</div>
						
						<!-- 카테고리 -->
						<div class="form-group-category-form">
							<label class="inquiry-category" for="category"><strong>카테고리</strong></label>
							<div class="inquiry-category-wrap">
								<p class="form-control" id="category">${list.categoryName }</p>
							</div>
						</div>

						<!-- 문의 내용 -->
						<div class="form-group">
							<label class="control-label col-sm-2" for="inquiryContent" id="inquiry-text">문의 내용</label>
							<div class="col-sm-10">
							   	<textarea rows="3" cols="67" id="inquiryContent" name="inquiryContent" readonly="readonly"
							   			  style="resize: none; font-size: 1.1em;">${list.inquiryContent }</textarea>
							</div>	
						</div>

						<!-- 첨부 이미지 -->
						<div class="inquiry-file"><strong>첨부 파일</strong></div>
						<div class="upload-img-form">
							<div class="img_wrap center-block">
								<img id="img" src="resources/img/inquiry/${list.filename }">
				  			</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	<!-- End Container Area -->
	
	<!-- start footer Area -->
	<%@include file="../../views/common/footer.jsp"%>
	<!-- End footer Area -->

</body>
</html>