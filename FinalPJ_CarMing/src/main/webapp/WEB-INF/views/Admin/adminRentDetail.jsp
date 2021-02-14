<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CarMing | 렌탈 상세 페이지</title>
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

<!--gmaps Js-->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCjCGmQ0Uq4exrzdcL6rvxywDDOvfAu6eE"></script>
<script src="resources/js/gmaps.min.js"></script>
<script src="resources/js/main.js"></script>
<link rel="stylesheet" href="resources/css/adminRentDetail.css">

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
	       	 	<button class="banner-btn" id="godeliver" type="button" onclick="location.href='sendRent.do?cartNo=${list.cartNo}'">상품 배송</button>
	       	 	<button class="banner-btn" id="goreturn" type="button" onclick="location.href='returnRent.do?cartNo=${list.cartNo}'">반납 완료</button>
	       	 	<button class="banner-btn" id="golist" type="button" onclick="location.href='adminRentList.do'">렌트 목록</button>
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
					<img id="pingu-check" src="./resources/img/checked.png"><!-- 사진 변경하기 -->
					<img id="pingu-img" src="resources/img/logo_chatbot.png" alt="image" /><br>
					<h3>확인하기</h3>
					<h5>핑구에게 확인하세요</h5>
					<h6>렌트하신 상품의<br>렌트 상태를 확인해보세요</h6>
				</div>
			</div>
			<div class="col-md-9">
				<div class="contact-form">
					<div class="form-group-check">
						<label class="control-label col-sm-2" for="nickname" id="main-text">사용자 닉네임</label>
						<div class="col-sm-10">
							<p class="form-control" id="nickname">${list.memNick }</p>
						</div>
					</div>
					<div class="form-group-check">
						<label class="control-label col-sm-2" for="category" id="main-text">카테고리</label>
						<div class="col-sm-10">
							<p class="form-control" id="category">${list.pCategoryName}</p>
						</div>
					</div>
					<div class="form-group-check">
						<label class="control-label col-sm-2" for="product" id="main-text">상품명</label>
						<div class="col-sm-10">
							<p class="form-control" id="product">${list.pName }</p>
						</div>
					</div>
					<div class="form-group-check">
						<label class="control-label col-sm-2" for="paycode" id="main-text">결제 번호</label>
						<div class="col-sm-10">
							<p class="form-control" id="paycode">#${list.payNo }</p>
						</div>
					</div>
					<div class="form-group-check">
						<label class="control-label col-sm-2" for="price" id="main-text">상품 가격</label>
						<div class="col-sm-10">
							<p class="form-control" id="price">${list.totalPrice}원</p>
						</div>
					</div>
					<div class="form-group-check">
						<label class="control-label col-sm-2" for="amount" id="main-text">상품 수량</label>
						<div class="col-sm-10">
							<p class="form-control" id="price">${list.cAmount}</p>
						</div>
					</div>
					<div class="form-group-check">
						<label class="control-label col-sm-2" for="comment" id="main-text">렌트 시작일</label>
						<div class="col-sm-10">
							<p class="form-control" id="startDate">
								<fmt:formatDate pattern = "yyyy-MM-dd" value="${list.startDate}"/>
							</p>
						</div>
					</div>
					<div class="form-group-check">
						<label class="control-label col-sm-2" for="comment" id="main-text">렌트 종료일</label>
						<div class="col-sm-10">
							<p class="form-control" id="endDate">
								<fmt:formatDate pattern = "yyyy-MM-dd" value="${list.endDate}"/>
							</p>
						</div>
					</div>
					<div class="form-group-check">
						<label class="control-label col-sm-2" for="state" id="main-text">렌탈 현황</label>
						<div class="col-sm-10">
							<p class="form-control" id="price">${list.stateName }</p>
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