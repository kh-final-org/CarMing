<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

<style type="text/css">
	.col-first{margin: -1% 63.5% 0 -18%; } 
	.col-first > .maintext{font-weight: bold; font-size: 2.0em; color: #fff; text-align: left;}
	.text-1{margin: -5% 0 3%;}
	#banner-text-2{position: absolute; top: 60%; right: 14%;}
	
	.banner-btn{width: 115px; padding: 8px 0 10px; line-height: 18px; border: 2px solid #fff5e9; border-radius: 3px;
				font-size: 1.1em; text-align: center; color: #fff5e9; background: transparent; opacity: 0.95;  
				position:relative; overflow: hidden; transition: 0.95s; cursor: pointer;}
	.banner-btn:hover{background: #fff5e9; color: #5f5f5f;}
	.banner-btn::before{content: ""; position: absolute; left:0; width:100%; height: 0%; background: #fff5e9; z-index: -1; 
						top:0; border-radius: 0 0 50% 50%; transition: 0.95s;}
	.banner-btn:hover::before{height: 180%;}
	.container-contact{margin: 50px 340px; box-shadow: 15px 5px 30px rgba(0, 0, 0, 0.14);}

	.col-md-3{background: #ff9b00; padding: 4%; border-top-left-radius: 0.5rem; border-bottom-left-radius: 0.5rem;}
	#pingu-img{width: 100px; height: 100%; margin: -13.5% 0 8% 23%; z-index: 1;}
	#pingu-confirm{width: 55px; height: 100%; margin: -5% 0 16% 35%; z-index: 10;}
	.contact-info h3{margin-bottom: 1.8%; margin-top: -2%; margin-left: -1%; color: #fff; text-align: center; font-weight: bold;}
	.contact-info h5{ margin-left: 1.5%; color: #fff; text-align: center; margin-bottom: 8%; font-weight: bold;}
	.contact-info h6{ margin-left: 1.8%; color: #fff; text-align: center; opacity: 0.8;}

	.col-md-9{padding: 3% 5% 0; border-top-right-radius: 0.5rem; border-bottom-right-radius: 0.5rem;border: 1px solid #e2e2e2; background: #fff5e9;}
	.contact-form{width: 750px; height: 100%;}
	#user-nickname{float: left; width: 150px; padding: 0; margin: 5px 0 0 15px; font-size: 1.2em; font-weight: bold;}
	#nickname{float: right; width: 450px; margin-right: 10px;}
	.form-group-inquiry-form{float: left; width:100%;}
	#inquiry-date{float: left; width: 150px; padding: 0; margin: 5px 0 0 15px; font-size: 1.2em; font-weight: bold;}
	#date{float: right; width: 450px; margin-right: 150px;}	
	.form-group-category-form{float: left; margin-bottom: 4px; width: 100%;}
	.inquiry-category{display: inline-block; float: left; margin: 5px 0 0 15px; width: 10%; font-size: 1.2em; }
	.inquiry-category-wrap{float: left; width: 72%; margin-left: 60px;}
	#category{width:450px;}
	.current{font-size: 1.1em;}
	textarea {padding: 10px 14px; border: 1px solid #e2e2e2; border-radius: 5px; font-size: 1.1em; color: gray; }
	#inquiry-text{font-size: 1.2em; margin-bottom: 10px; font-weight: bold;}	
	.inquiry-file{display: inline-block; font-size: 1.2em; margin-bottom: 10px; margin-left: 15px;}
	.uploadimg {width: 350px; height: 350px; border-radius: 10px;}
	.img_wrap {width: 350px; height: 350px; margin-top: 20px; }
	.img_wrap img {max-width: 100%; max-height: 95%;}
	.center-block {display: block; margin-left: auto; margin-right: auto; margin-left: 135px;}
	.upload-img-form{position: relative; width: 590px; border: 1px solid #e2e2e2; margin-left: 15px; 
					 border-radius: 5px; margin-bottom: 30px; background: #fff;}
	
</style>


<!-- CSS -->
<link rel="stylesheet" href="resources/css/linearicons.css">
<link rel="stylesheet" href="resources/css/owl.carousel.css">
<link rel="stylesheet" href="resources/css/themify-icons.css">
<link rel="stylesheet" href="resources/css/font-awesome.min.css">
<link rel="stylesheet" href="resources/css/nice-select.css">
<link rel="stylesheet" href="resources/css/nouislider.min.css">
<link rel="stylesheet" href="resources/css/bootstrap.css">
<link rel="stylesheet" href="resources/css/main.css">

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
	       	 	<button class="banner-btn" id="golist" type="button" onclick="location.href='#'">버튼</button>
	       	 	<button class="banner-btn" id="golist" type="button" onclick="location.href='#'">버튼</button>
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