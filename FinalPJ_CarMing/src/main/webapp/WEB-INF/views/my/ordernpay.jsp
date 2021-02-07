<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@
	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"
%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
							<c:choose>
								<c:when test="${empty cartList}">
								<tr>
									<td colspan="6">
										<h2>주문 내역이 비었습니다.</h2>
									</td>
								</tr>
								</c:when>
								<c:otherwise>
									<c:forEach var="cartListDto" items="${cartList }">
										<tr>
											<td>${cartListDto.cartNo }</td>
											<td><img src="storage/${cartListDto.pFile }" width="100px;" height="100px;"></td>
											<td>${cartListDto.pName }</td>
											<td>${cartListDto.cAmount }</td>
											<td><fmt:formatDate value="${cartListDto.startDate }" pattern="yyyy-MM-dd"/>&nbsp;~&nbsp;<fmt:formatDate value="${cartListDto.endDate }" pattern="yyyy-MM-dd"/></td>
											<c:choose>
												<c:when test="${cartListDto.stateNo == 2}">
													<td>
														결제완료
													</td>
												</c:when>
												<c:when test="${cartListDto.stateNo == 3}">
													<td>
														대여중
													</td>
												</c:when>
												<c:when test="${cartListDto.stateNo == 4}">
													<td>
														대여중
													</td>
												</c:when>
												<c:when test="${cartListDto.stateNo == 5}">
													<td>
														대여중
													</td>
												</c:when>
											</c:choose>
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
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
							<th>결제 금액</th>
						</tr>
						<c:choose>
							<c:when test="${empty payList}">
								<tr>
									<td colspan="5">
										<h2>결제 내역이 비었습니다.</h2>
									</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="payDto" items="${payList}">
									<tr>
										<td>${payDto.payNo }</td>
										<c:choose>
											<c:when test="${payDto.method == 'kakaopay' }">
												<td>카카오페이</td>
											</c:when>
											<c:when test="${payDto.method == 'inicis' }">
												<td>카드</td>
											</c:when>
										</c:choose>
										<td>${payDto.addr }</td>
										<td><fmt:formatDate value="${payDto.payDay}" pattern="yyyy-MM-dd"/></td>
										<td><fmt:formatNumber value="${payDto.totalPrice }" pattern="###,###,###"/>원</td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</table>
				</div>
			</div>	
    <!--================End Cart Area =================-->
	<%@ include file="../common/footer.jsp" %>
</body>
</html>