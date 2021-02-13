<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CarMing | 마이페이지</title>
<link rel="stylesheet" href="resources/css/mypage.css">

</head>
<body>
	<%@ include file="../common/header.jsp" %>
	
	<!-- Start Banner Area -->
	<section class="banner-area organic-breadcrumb">
	   <div class="container">
	      <div class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
	         <div class="col-first" id="banner-text-1">
	         	<div class="maintext text-1">Everything has an end,</div>
	         	<div class="maintext text-2">so time feels more precious</div>
	         </div>
	      </div>
	   </div>
	</section>
	<!-- End Banner Area -->
	<main role="main" style="padding: 50px 200px 40px; ">
	
	<!-- Start Container Area -->
	<div class="card-container">
		<!-- 사용자 프로필 -->
		<div class="card-profile">
			<div class="profilepage-profile">
				<img class="user-profile" src="${login.memfile}" alt="">
				<div class="user-id"><strong>${login.memnick}</strong></div>
				<div class="user-email">${login.memid}</div>
			</div>
			<div class="my-desc">
				<input type="button" class="profile-btn" id="profile-btn-1" value="프로필 수정" onclick="location.href='profilechangeform.do'">&middot;
				<button type="button" class="profile-btn" id="profile-btn-2" onclick="location.href='ordernpay.do'">주문 및 결제 내역</button>
			</div>
		</div>
		
		<!-- Start BoardList/Map Area -->
		<div class="card-body" >
			<!-- 내 게시글  -->
			<div class="card-mypage-title">내 게시글 </div>
			<div class="card-boardlist-board">
				<div class="boardlistup" id="board-photo">
					<div class="boardlistup-frame">
						<a href="boarddetailform.do?brdno=${dto.brdno }&memno=${dto.memno}">
							<img class="boardlist-img" src="resources/img/board/${dto.brdfilename }">
						</a>
					</div>
				</div>
			</div>
			<table class="table table-hover"></table>
			
			<div class="card-mypage-title">내 캠핑맵</div>
			<div class="card-boardlist-map">
				<div class="boardlistup" id="board-photo">
					<div class="boardlistup-frame">
						<a href="boarddetailform.do?brdno=${dto.brdno }&memno=${dto.memno}">
							<img class="boardlist-img" src="resources/img/board/${dto.brdfilename }">
						</a>
					</div>
				</div>
			</div>
		</div>
		<!-- End BoardList/Map Area -->
	</div>
	<!-- End Container Area -->
	<table class="table table-hover"></table>
	</main>
	
	<%@ include file="../common/footer.jsp" %>
</body>
</html>