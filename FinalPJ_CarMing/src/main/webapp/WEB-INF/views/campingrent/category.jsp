<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>CarMing | 캠핑렌트</title>
<link rel="stylesheet" href="resources/css/rentmain.css">

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script src="resources/js/category.js?ver=4"></script>

</head>
<body>
	<%@include file="../common/header.jsp" %>
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
	<div class="card-container">
		<div class="row">
			<!-- Start Left Menu -->
			<div class="col-xl-3 col-lg-4 col-md-5">
				<!-- 카테고리 -->
				<div class="sidebar-categories"> 	
					<div class="head">카테고리</div>
					<input type="hidden" id="pCateNo" value="${pCateNo}">
					<ul class="main-categories">
						<li class="main-nav-list">
							<a id="all_category"  href="productlist.do?viewNo=${viewNo}&pCateNo=6">
								<span class="lnr lnr-arrow-right"></span>전체
								<span class="number"></span>
							</a>
						</li>
						<li class="main-nav-list">
							<a id="tent" data-pCategoryNo="1" href="productlist.do?viewNo=${viewNo}&pCateNo=1" >
								<span class="lnr lnr-arrow-right"></span>텐트 / 타프
								<span class="number"></span>
							</a>
						</li>
						<li class="main-nav-list">
							<a id="bag" data-pCategoryNo="2" href="productlist.do?viewNo=${viewNo}&pCateNo=2" >
								<span class="lnr lnr-arrow-right"></span>매트 / 침낭
								<span class="number"></span>
							</a>
						</li>
						<li class="main-nav-list">
							<a id="bunner" data-pCategoryNo="3" href="productlist.do?viewNo=${viewNo}&pCateNo=3" >
								<span class="lnr lnr-arrow-right"></span>코펠 / 버너 / 취사
								<span class="number"></span>
							</a>
						</li>
						<li class="main-nav-list">
							<a id="chair" data-pCategoryNo="4" href="productlist.do?viewNo=${viewNo}&pCateNo=4" >
								<span class="lnr lnr-arrow-right"></span>체어 / 테이블
								<span class="number"></span>
							</a>
						</li>
						<li class="main-nav-list">
							<a id="bbq" data-pCategoryNo="5" href="productlist.do?viewNo=${viewNo}&pCateNo=5" >
								<span class="lnr lnr-arrow-right"></span>화로대 / BBQ
								<span class="number"></span>
							</a>
						</li>
					</ul>
				</div>
				
				<!-- 필터 -->
				<div class="sidebar-filter mt-50">
					<div class="top-filter-head" id="left-menu">필터</div>
					<div class="common-filter">
						<div class="head" id="left-menu">가격</div>
						<div class="price-range-area">
							<div id="price-range"></div>
							<div class="value-wrapper d-flex">
								<div class="price">가격(원):</div>
								<div id="lower-value"></div>
								<span>원</span>
								<div class="to">-</div>
								<div id="upper-value"></div>
								<span>원</span>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- End Left Menu -->
			
			<div class="col-xl-9 col-lg-8 col-md-7">
				<!-- Start Filter Bar -->
				<div class="filter-bar d-flex flex-wrap align-items-center">
					<div class="sorting">
						<select id="selViewSort" onchange="selSort()">
							<option value="pNo" selected disabled>분류 기준</option>
							<option value="pNo">최신 순</option>
							<option value="oPNo">오래된 순</option>
							<option value="expPrice">높은 가격</option>
							<option value="chpPrice">낮은 가격</option>
						</select>
					</div>
					<div class="sorting mr-auto">
						<select id="selViewNumber" onchange="selView()" >
							<option value="9">게시글 수&nbsp;&#40;${viewNo}&#41;</option>
							<option value="6">6개씩 보기</option>
							<option value="9">9개씩 보기</option>
							<option value="12">12개씩 보기</option>
						</select>
					</div>
					<c:if test="${login.memcode == 1}">
						<div class="sorting mr-auto" style="float: right;">
							<input type="checkbox" name="allCheck" id="allCheck"/><label for="allCheck">모두 선택</label>
							<input type="button" class="selectDelete_btn" value="선택 삭제">
						</div>
					</c:if>
				</div>
				<!-- End Filter Bar -->
				
				<!-- Start Best Seller -->
				<section class="lattest-product-area pb-40 category-list">
					<div class="row">
						<c:choose>
        					<c:when test="${empty productlist}">
        						<div class="empty-product">등록된 상품이 없습니다.</div>
        					</c:when>
        					<c:otherwise>
        						<c:forEach var="productDto" items="${productlist}">
        						<!-- Start Product List Area -->
        						<div class="product-frame-form">
									<div class="single-product">
        								<input type="hidden" class="pCategoryNo" id="categoryNo" value="${productDto.pCategoryNo }">
										<c:if test="${login.memcode == 1 }">
											<input type="checkbox" name="chBox" class="chBox" data-pNo="${productDto.pNo }">
											<div class="delete_btn" style="float: right;">
												<button type="button" class="delete_btn" data-pNo="${productDto.pNo }">삭제</button>
											</div>
										</c:if>
										
										<div class="product-left">
											<!-- 상품 이미지 -->
				      						<div class="product-uploadimg-frame">
												<a href="productdetail.do?pNo=${productDto.pNo }">
													<img class="product-img" src="resources/img/rent/${productDto.pFile}" alt="">
												</a>
											</div>
											
											<!-- 상품 정보 -->
											<div class="product-details">
												<h6>${productDto.pName }</h6>
												
												<div class="price">
													<div class="product-desc-1">
														가격&nbsp;&#124;&nbsp;<fmt:formatNumber value="${productDto.pPrice }" pattern="###,###,###"/>원
													</div>
												</div>
												<c:if test="${productDto.pAmount != 0}">
													<div class="product-desc-2">수량&nbsp;&#124;&nbsp;${productDto.pAmount }개</div>
												</c:if>
												<c:if test="${productDto.pAmount == 0}">
													<div class="product-desc-3">재고가 없습니다.</div>
												</c:if>
											</div>
										</div>
										
										<div class="product-right">
											<div class="product-share">
												<a href="javascript:sendLink(${productDto.pNo })" class="social-info">
													<img class="share-kakaotalk" src="./resources/img/kakaotalk.png">
												</a> 
											</div>
										</div> 
									</div>
								</div>
								<!-- End Product List Area -->
        						</c:forEach>
        					</c:otherwise>
        				</c:choose>
					</div>
				</section>
				<!-- End Best Seller -->
			</div>
		</div><br>
		
		<!-- ==================================================================================================
			================================================ paging ================================================ -->
		<c:set var="viewNo" value="${viewNo}"/>
		<c:set var="page" value="${(empty param.page) ? 1 : param.page}"></c:set>
		<c:set var="startNum" value="${page - (page-1) % 5}"></c:set>
		<c:set var="lastNum" value="${fn:substringBefore(Math.ceil(count/viewNo), '.')}"></c:set>
<!-- 			<div class="hint-text"> -->
<%-- 				Showing <b>${(empty param.page) ? 1:param.page}</b> out of <b>${lastNum }</b> pages --%>
<!-- 			</div> -->
		<!-- 현재 페이지 -->
			<!-- paging 버튼  -->
			<div class="container ml-auto" id="paging-container" align="center">
				<nav aria-label="Page navigation example">
					<ul class="pagination justify-content-center" style="border-left: 0px;">
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
								<c:if test="${viewNo >= count}">
									<li class="page-item"><a class="page-link text-warning ${(page == (startNum + i)) ? 'active' : ''}" href="?page=${startNum + i }&search=${param.search}&viewNo=${viewNo}">1</a></li>
								</c:if>
								<c:if test="${viewNo < count}">
									<li class="page-item"><a class="page-link text-warning ${(page == (startNum + i)) ? 'active' : ''}" href="?page=${startNum + i }&search=${param.search}&viewNo=${viewNo}">${startNum + i }</a></li>
								</c:if>
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
	<!-- End Container Area -->
	
	
	<%@include file="../common/footer.jsp" %>
</body>
</html>