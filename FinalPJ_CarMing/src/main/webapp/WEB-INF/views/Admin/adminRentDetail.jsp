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


<!-- <link rel="stylesheet" href="resources/css/contactus.css"> -->
<!--gmaps Js-->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCjCGmQ0Uq4exrzdcL6rvxywDDOvfAu6eE"></script>
<script src="resources/js/gmaps.min.js"></script>
<script src="resources/js/main.js"></script>
<style type="text/css">
	#banner-text-2{position: absolute; top: 255px; right: 245px;}
	.banner-btn{width: 115px; padding: 8px 0 10px; line-height: 18px; border: 2px solid #fff5e9; border-radius: 3px;
				font-size: 1.1em; text-align: center; color: #fff5e9; background: transparent; opacity: 0.95;  
				position:relative; overflow: hidden; transition: 0.95s; cursor: pointer;}
	.banner-btn:hover{background: #fff5e9; color: #5f5f5f;}
	.banner-btn::before{content: ""; position: absolute; left:0; width:100%; height: 0%; background: #fff5e9; z-index: -1; 
						top:0; border-radius: 0 0 50% 50%; transition: 0.95s;}
	.banner-btn:hover::before{height: 180%;}
	.container-contact{margin: 50px 340px; box-shadow: 15px 5px 30px rgba(0, 0, 0, 0.14);}

	.col-md-3{background: #ff9b00; padding: 4%; border-top-left-radius: 0.5rem; border-bottom-left-radius: 0.5rem;}
	#pingu-img{width: 100px; height: 100%; margin: -16% 0 8% 23%; z-index: 1;}
	#pingu-check{width: 55px; height: 100%; margin: -7% 0 20% 36%; z-index: 10;}
	.contact-info h3{margin-bottom: 1.8%; margin-top: -2%; margin-left: -1%; color: #fff; text-align: center; font-weight: bold;}
	.contact-info h5{ margin-left: 1.5%; color: #fff; text-align: center; margin-bottom: 8%; font-weight: bold;}
	.contact-info h6{ margin-left: 1.8%; color: #fff; text-align: center; opacity: 0.8;}
	
	.col-md-9{padding: 3% 5% 1.5%; max-width: 100%; border-top-right-radius: 0.5rem; border-bottom-right-radius: 0.5rem; border: 1px solid #e2e2e2; background: #fff5e9;}
	.contact-form{width: 750px; height: 100%;}
	.form-group-check{float: left; width: 100%;} 
	#main-text{float: left; width: 150px; padding: 0; margin: 5px 0 0 15px; font-size: 1.2em; font-weight: bold;}
	#nickname{float: right; width: 450px; margin-right: 10px;}
	#category{float: right; width: 450px; margin-right: 10px;}
	#product{float: right; width: 450px; margin-right: 10px;}
	#paycode{float: right; width: 450px; margin-right: 10px;}
	#price{float: right; width: 450px; margin-right: 10px;}
	#startDate{float: right; width: 450px; margin-right: 10px;}
	#endDate{float: right; width: 450px; margin-right: 10px;}
	
</style>


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
	            <nav class="d-flex align-items-center"></nav>
	         </div>
	      </div>
		  <div class="section-top-border text-right" id="banner-text-2">
	       	 <div class="button-group-area mt-40" style="padding-bottom: 5em">
	       	 	<button class="banner-btn" id="gowrite" type="button" onclick="location.href='sendRent.do?cartNo=${list.cartNo}'">상품 배송</button>
	       	 	<button class="banner-btn" id="gowrite" type="button" onclick="location.href='returnRent.do?cartNo=${list.cartNo}'">반납 완료</button>
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
						<label class="control-label col-sm-2" for="state" id="main-text">렌탈현황</label>
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