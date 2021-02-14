<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CarMing | 주문 및 결제내역 확인</title>
<link rel="stylesheet" href="resources/css/pay_result.css">
<style type="text/css">
	.col-first{margin: -1% 63.5% 0 -18%; } 
	.col-first > .maintext{font-weight: bold; font-size: 2.0em; color: #fff; text-align: left;}
	.text-1{margin: -5% 0 3%;}




</style>


<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
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
	
	
	<section class="order_details section_gap">
		<div class="container">
			<h1 class="title_confirmation" style="font-size: 20pt;">감사합니다. 고객님의 주문이 완료되었습니다.</h1>
			<div class="row order_d_inner" style="margin-right: 0%; margin-left: 35%; width: 100%;">
				<div class="col-lg-4">
					<div class="details_item">
						<h4>주문 정보</h4>
						<h3>${login.memname }님의 주문 내역은 다음과 같습니다.</h3>
						<br>
						<ul class="list">
							<li><a href="#"><span>결제 번호</span> : ${payNo }</a></li>
							<li><a href="#"><span>제품명</span> : ${pName }</a></li>
							<li><a href="#"><span>주문 날짜</span> : ${payDay }</a></li>
							<li><a href="#"><span>금액</span> : ${totalPrice }</a></li>
							<c:choose>
								<c:when test="${pay_method == 'kakaopay' }">
									<li><a href="#"><span>결제 수단</span> : 카카오페이</a></li>
								</c:when>
								<c:when test="${pay_method == 'inicis' }">
									<li><a href="#"><span>결제 수단</span> : 카드</a></li>
								</c:when>
							</c:choose>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div style="text-align: center;">
			<button type="button" onclick="location.href='ordernpay.do';">주문 내역 보기</button>
			<button type="button" onclick="location.href='home.do';">홈으로</button>
		</div>
	</section>
	<%@ include file="../common/footer.jsp" %>
</body>
</html>