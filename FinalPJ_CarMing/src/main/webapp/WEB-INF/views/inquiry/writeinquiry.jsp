<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CarMing | 문의하기</title>
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


<link rel="stylesheet" href="resources/css/inquiry.css">

<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
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
<!-- ★★★위 스크립트로 상단바 위치가 깨짐★★★
<script src="resources/js/main.js"></script>-->
<script src ="resources/js/inquiry.js" type="text/javascript"></script>


</head>
<body>
	<!-- Start Header Area -->
	<%@include file="../../views/common/header.jsp"%>
	<!-- End Header Area -->

	<!-- Start Banner Area -->
	<section class="banner-area organic-breadcrumb">
	   <div class="container">
	      <div class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end" >
	         <div class="col-first" id="banner-text-1">
	            <h1>The stars in the night sky</h1>
	            <nav class="d-flex align-items-center">
	               <a href="home.do"><span class="lnr lnr-home"></span>Home</a>&emsp;
	               <a href="#"><span class="lnr lnr-arrow-right-circle"></span>Camping</a>
	            </nav>
	         </div>
	      </div>
		  <div class="section-top-border text-right" id="banner-text-2">
	       	 <div class="button-group-area mt-40" style="padding-bottom: 5em">
	       	 	<button class="banner-btn" id="gowrite" type="button" onclick="location.href='writeinquiryform.do'">문의하기</button>
	       	 	<button class="banner-btn" id="golist" type="button" onclick="location.href='inquirylist.do'">문의 목록</button>
	         </div>
		  </div>
		</div>
	</section>
	<!-- End Banner Area -->

	<!-- Start Container Area -->
<form:form  id="target" method="POST" enctype="multipart/form-data" modelAttribute="InquiryDto" action="writeinquiry.do?memNo=${login.memno}" >
	<div class="container-contact">
		<div class="row">
			<div class="col-md-3">
				<div class="contact-info">
					<img id="pingu-qna" src="./resources/img/qna.png">
					<img id="pingu-img" src="resources/img/logo_chatbot.png" alt="image" /><br>
					<h3>문의하기</h3>
					<h5>핑구에게 물어보세요</h5>
					<h6>문의 남겨주시면 최대한<br>빠르게 답변드리겠습니다</h6>
				</div>
			</div>
			
			<div class="col-md-9">
				<div class="contact-form">
					<!-- 사용자 닉네임 -->
					<div class="form-group-inquiry-form">
						<label class="control-label col-sm-2" id="user-nickname" for="nickname">문의자 닉네임</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="nickname"
								value="${login.memnick}" readonly="readonly" name="memNick">
						</div>
					</div>
					
					<!-- 작성일 -->
					<div class="form-group-inquiry-form">
						<label class="control-label col-sm-2" id="inquiry-date" for="date">문의 작성일</label>
						<div class="inquiry-date-form">
							<c:set var="now" value="<%=new java.util.Date()%>" />
							<input type="date" class="form-control" id="date"
								   value=<fmt:formatDate pattern = "yyyy-MM-dd" 
         						   value = "${now}" /> readonly="readonly" >
						</div>
					</div>
				
					<!-- 카테고리 -->
					<div class="form-group-category-form">
						<span class="inquiry-category"><strong>문의 유형</strong></span>
						<div class="inquiry-category-wrap">
							<select class="col-sm-10" id="categoryno" name="categoryNo">
								<option value="0" selected disabled>카테고리(필수)</option>
								<option value="1">상품 및 배송</option>
								<option value="2">교환 및 반품</option>
								<option value="3">기타</option>
							</select> 
						<div class="inquiry-category-err" id=emptycategory>카테고리를 선택해 주세요</div>
						</div>
					</div>
					
					<!-- 문의 내용 -->
					<div class="form-group">
						<label class="control-label col-sm-2" for="inquiryContent" id="inquiry-text">문의 내용</label>
						<div class="col-sm-10">
						   	<textarea rows="3" cols="75" id="inquiryContent" name="inquiryContent" placeholder="문의 내용을 입력해주세요." 
						   			  style="resize: none;" required="required"></textarea>
						</div>	
						<div class="inquiry-content-err" id=emptycontent>문의내용을 작성해 주세요</div>
					</div>
					<br>
					<!-- 사진 업로드 -->
					<div class="inquiry-file"><strong>첨부 파일</strong></div>
					<div class="upload-img-form">
						<div class="img_wrap center-block">
							<img id="img" src="">
			  			</div>
						<div class="upload-img-content">
							<input type="file" class="custom-file-input" id="input_img" name="inquiryFile" accept="image/*">
							<label class="custom-file-label" for="input_img" id="filename"></label>
						</div>
					</div>
					<div class="inquiry-content-err" id=emptyfile>사진을 선택해 주세요</div>
					<div class="report-submit-form">
						<button type="button" class="btn btn-light" id="button-boardupload" onclick="inquiry()">보내기</button>
					</div>
					
				</div>	
			</div>
		</div>
	</div>
	</form:form>
	<!-- End Container Area -->
	
	<!-- start footer Area -->
	<%@include file="../../views/common/footer.jsp"%>
	<!-- End footer Area -->

</body>
</html>