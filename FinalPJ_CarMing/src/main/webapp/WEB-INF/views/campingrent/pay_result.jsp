<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

	#main-text{color: #ff9b00; font-size: 20pt; margin-bottom: 20px; font-weight: bold;}
	.details_item{padding: 5% 8% 2%; border: 1px solid #e2e2e2; border-radius: 10px; box-shadow: 10px 10px 30px rgba(0, 0, 0, 0.14);
				  margin-bottom: 10%; margin-left: -13%;}
	
	
	.btn{width: 140px; height: 40px; border-radius: 5px; outline: none; margin-top: -4px;
   		 color: #5f5f5f; font-size:1.2em; cursor: pointer;}
	.btn:hover{ transition: 0.2s; outline: none;}
	#btn-orderlist, #btn-home{background-color:  #ffe6be;}
	#btn-orderlist:hover, #btn-home:hover{background: #ffdb9f;}


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
			<h2 class="title_confirmation" id="main-text" style="font-size: 20pt;">고객님의 주문이 완료되었습니다.</h2>
			<div class="row order_d_inner" style="margin-right: 0%; margin-left: 35%; width: 100%;">
				<div class="col-lg-4">
					<div class="details_item">
						<h4 style="padding-left: 3%; color: #5f5f5f;"><strong>주문 정보</strong></h4>
						<h5 style="color: gray; margin: 4%;"><strong>${login.memname }</strong>님의 주문 내역은 다음과 같습니다.</h5>
						<br>
						<ul class="list">
							<li><a href="#"><span>결제 번호</span>${payNo }</a></li>
							<li><a href="#"><span>제품명</span>${pName }</a></li>
							<li><a href="#"><span>주문 날짜</span>${payDay }</a></li>
							<li><a href="#"><span>금액</span><fmt:formatNumber value="${totalPrice }" pattern="###,###,###"/>&nbsp;원</a></li>
							<c:choose>
								<c:when test="${pay_method == 'kakaopay' }">
									<li><a href="#"><span>결제 수단</span>카드</a></li>
								</c:when>
								<c:when test="${pay_method == 'inicis' }">
									<li><a href="#"><span>결제 수단</span> 카드</a></li>
								</c:when>
							</c:choose>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div style="text-align: center;">
			<button type="button" class="btn btn-light" id="btn-orderlist"  onclick="location.href='ordernpay.do';">주문 내역 보기</button>
			<button type="button" class="btn btn-light" id="btn-home"  onclick="location.href='home.do';">홈으로</button>
		</div>
	</section>
	<%@ include file="../common/footer.jsp" %>
</body>
</html>