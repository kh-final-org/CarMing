<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CarMing</title>
<style type="text/css">
	.order-table{
		text-align: center;
		vertical-align: center;
	}	
</style>
</head>
<body>
	<%@ include file="../common/header.jsp" %>
	<!--================Cart Area =================-->
	<!-- Start Banner Area -->
	<section class="banner-area organic-breadcrumb">
		<div class="container">
			<div class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
				<div class="col-first">
					<h1>주문 / 결제 내역</h1>
					<nav class="d-flex align-items-center">
						<a href="index.html">홈<span class="lnr lnr-arrow-right"></span></a>
						<a href="category.html">주문 / 결제 내역</a>
					</nav>
				</div>
			</div>
		</div>
	</section>
	<!-- End Banner Area -->
        <div class="order_details_table" style="margin-top: 10%; margin-bottom: 10%; margin-left: 5%; margin-right: 5%;">
				<div class="table-responsive">
						<tr>
							<h2>주문 내역</h2>
						</tr>
						<table class="table" style="padding: 10px; text-align: center;">
							<p>주문 상품 정보</p>
							<tr>
								<th>주문 번호</th>
								<th>제품 썸네일</th>
								<th>제품 이름</th>
								<th>수량</th>
								<th>렌트 기간</th>
								<th>렌트 처리 상태</th>
							</tr>
							<tr>
								<td>30</td>
								<td><img src="resources/img/logo.png" width="100px;" height="100px;"></td>
								<td>겨울 나기용 텐트</td>
								<td>3</td>
								<td>2020.1.17~2020.1.18</td>
								<td></td>
							</tr>
						</table>
				</div>
				<div class="table-responsive">
					<tr>
						<h2>결제 내역</h2>
					</tr>
					<table class="table" style="padding: 10px; text-align: center;">
						<p>결제 정보</p>
						<tr>
							<th>결제 번호</th>
							<th>결제 수단</th>
							<th>배송지</th>
							<th>결제일</th>
							<th>결제 수단</th>
						</tr>
						<tr>
							<td>30</td>
							<td><img src="resources/img/logo.png" width="100px;" height="100px;"></td>
							<td>겨울 나기용 텐트</td>
							<td>3</td>
							<td>2020.1.17~2020.1.18</td>
						</tr>
					</table>
				</div>
			</div>	
    <!--================End Cart Area =================-->
	<%@ include file="../common/footer.jsp" %>
</body>
</html>