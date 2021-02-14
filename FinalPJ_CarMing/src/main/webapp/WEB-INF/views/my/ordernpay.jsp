<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@
	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"
%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
								<th>반납</th>
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
											<td><fmt:formatDate value="${cartListDto.startDate }" pattern="yyyy-MM-dd"/>&nbsp;~&nbsp;<fmt:formatDate value="${cartListDto.endDate }" pattern="yyyy-MM-dd" var="endDate" />${endDate }</td>
											<jsp:useBean id="toDay" class="java.util.Date" />
											<fmt:formatDate value='${toDay}' pattern='yyyy-MM-dd' var="nowDate"/>
											<c:choose>
												<c:when test="${cartListDto.stateNo == 4}">
													<td>
														반납신청
													</td>
												</c:when>
												<c:when test="${cartListDto.stateNo == 5}">
													<td>
														반납완료
													</td>
												</c:when>
												<c:when test="${endDate < nowDate}">
													<td>
														연체
													</td>
												</c:when>
												<c:when test="${cartListDto.stateNo == 2}">
													<td>
														결제완료
													</td>
												</c:when>
												<c:when test="${cartListDto.stateNo == 3}">
													<td>
														대여중(배송완료)
													</td>
												</c:when>
												<c:when test="${cartListDto.stateNo == 6}">
													<td>
														연체
													</td>
												</c:when>
											</c:choose>
											<td><button onclick="location.href='returnProduct.do?cartNo=${cartListDto.cartNo}'">상품반납</button></td>
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</table>
				</div>
				<!-- ==================================================================================================
				================================================ paging ================================================ -->
				<c:set var="cpage" value="${(empty param.page) ? 1 : param.page}"></c:set>
				<c:set var="startNum" value="${cpage - (cpage-1) % 5}"></c:set>
				<c:set var="lastNum" value="${fn:substringBefore(Math.ceil(oCount/10), '.')}"></c:set>
				<div class="hint-text">
					Showing <b>${(empty cpage) ? 1:cpage}</b> out of <b>${lastNum }</b> pages
				</div>
				<!-- 현재 페이지 -->
				<!-- paging 버튼  -->
				<div class="container ml-auto" id="paging-container" align="center">
					<nav aria-label="Page navigation example">
						<ul class="pagination justify-content-center" style="border-left: 0px; margin-top: 6%;">
							<!-- 이전 버튼 -->
							<c:if test="${startNum > 1 }">
								<li class="page-item">
									<a class="page-link text-warning" href="?page=${startNum - 1 }&search=${param.search}" aria-label="Previous">
						 				<span aria-hidden="true" class="btn-prev">&laquo;</span>
							    	</a>
							   	</li>
							</c:if>		
						
							<c:if test="${startNum <= 1 }">
								<li class="page-item">
									<a class="page-link text-warning" aria-label="Previous">
						 				<span aria-hidden="true" class="btn-prev" onclick="alert('이전 페이지가 없습니다.');">&laquo;</span>
						    		</a>
							   	</li>
							</c:if>
						
							<c:forEach var="i" begin="0" end="4">
								<c:if test="${(startNum + i ) <= lastNum }">
									<!-- 현재 페이지 style 변경 -->
									<li class="page-item"><a class="page-link text-warning ${(cpage == (startNum + i)) ? 'active' : ''}" href="?cpage=${startNum + i }&search=${param.search}">${startNum + i }</a></li>
								</c:if>
							</c:forEach>
						  			
						  	<!-- 다음 버튼 -->
						  	<c:if test="${startNum + 4 < lastNum }">
							    <li class="page-item">
							    	<a class="page-link text-warning" href="?cpage=${startNum + i }&search=${param.search}" aria-label="Next">
							    		<span aria-hidden="true">&raquo;</span>
							      	</a>
							   	</li>
						  	</c:if>
						  	
						  	<c:if test="${startNum + 4 >= lastNum }">
							    <li class="page-item">
							    	<a class="page-link text-warning " aria-label="Next">
							    		<span aria-hidden="true" onclick="alert('다음 페이지가 없습니다.');">&raquo;</span>
							      	</a>
							   	</li>
						  	</c:if>	
						</ul>
					</nav>
				</div>
			<!-- ==================================================================================================
				================================================ paging ================================================ -->
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
					<!-- ==================================================================================================
				================================================ paging ================================================ -->
					<c:set var="page" value="${(empty param.page) ? 1 : param.page}"></c:set>
					<c:set var="startNum" value="${page - (page-1) % 5}"></c:set>
					<c:set var="lastNum" value="${fn:substringBefore(Math.ceil(pCount/10), '.')}"></c:set>
					<div class="hint-text">
						Showing <b>${(empty param.page) ? 1:param.page}</b> out of <b>${lastNum }</b> pages
					</div>
					<!-- 현재 페이지 -->
					<!-- paging 버튼  -->
					<div class="container ml-auto" id="paging-container" align="center">
						<nav aria-label="Page navigation example">
							<ul class="pagination justify-content-center" style="border-left: 0px; margin-top: 6%;">
								<!-- 이전 버튼 -->
								<c:if test="${startNum > 1 }">
									<li class="page-item">
										<a class="page-link text-warning" href="?page=${startNum - 1 }&search=${param.search}" aria-label="Previous">
							 				<span aria-hidden="true" class="btn-prev">&laquo;</span>
								    	</a>
								   	</li>
								</c:if>		
							
								<c:if test="${startNum <= 1 }">
									<li class="page-item">
										<a class="page-link text-warning" aria-label="Previous">
							 				<span aria-hidden="true" class="btn-prev" onclick="alert('이전 페이지가 없습니다.');">&laquo;</span>
							    		</a>
								   	</li>
								</c:if>
							
								<c:forEach var="i" begin="0" end="10">
									<c:if test="${(startNum + i ) <= lastNum }">
										<!-- 현재 페이지 style 변경 -->
										<li class="page-item"><a class="page-link text-warning ${(page == (startNum + i)) ? 'active' : ''}" href="?page=${startNum + i }&search=${param.search}">${startNum + i }</a></li>
									</c:if>
								</c:forEach>
							  			
							  	<!-- 다음 버튼 -->
							  	<c:if test="${startNum + 4 < lastNum }">
								    <li class="page-item">
								    	<a class="page-link text-warning" href="?page=${startNum + i }&search=${param.search}" aria-label="Next">
								    		<span aria-hidden="true">&raquo;</span>
								      	</a>
								   	</li>
							  	</c:if>
							  	
							  	<c:if test="${startNum + 4 >= lastNum }">
								    <li class="page-item">
								    	<a class="page-link text-warning " aria-label="Next">
								    		<span aria-hidden="true" onclick="alert('다음 페이지가 없습니다.');">&raquo;</span>
								      	</a>
								   	</li>
							  	</c:if>	
							</ul>
						</nav>
					</div>
			<!-- ==================================================================================================
				================================================ paging ================================================ -->	
				</div>
			</div>
    <!--================End Cart Area =================-->
	<%@ include file="../common/footer.jsp" %>
</body>
</html>