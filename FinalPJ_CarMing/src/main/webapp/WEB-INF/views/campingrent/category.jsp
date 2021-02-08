<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@
	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"
 %>
 
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>CarMing</title>
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
				<div class="col-first">
					<h1>캠핑 렌트</h1>
					<nav class="d-flex align-items-center">
						<a href="index.html">홈<span class="lnr lnr-arrow-right"></span></a>
						<a href="category.html">마이페이지<span class="lnr lnr-arrow-right"></span></a>
						<a href="category.html">카테고리</a><br><br>
					</nav>
				</div>
			</div>
		</div>
	</section>
	<!-- End Banner Area -->
	<div class="container">
		<div class="row">
			<div class="col-xl-3 col-lg-4 col-md-5">
				<div class="sidebar-categories"> 	
					<div class="head">렌트 카테고리</div>
					<ul class="main-categories">
						<li class="main-nav-list"><a id="all_category" data-toggle="collapse" href="#fruitsVegetable" aria-expanded="false" aria-controls="fruitsVegetable"><span
								 class="lnr lnr-arrow-right"></span>전체<span class="number"></span></a>
						</li>
						<li class="main-nav-list"><a id="tent" data-toggle="collapse" data-pCategoryNo="1" href="#fruitsVegetable" aria-expanded="false" aria-controls="fruitsVegetable"><span
								 class="lnr lnr-arrow-right"></span>텐트 / 타프<span class="number"></span></a>
						</li>
						<li class="main-nav-list"><a id="bag" data-toggle="collapse" data-pCategoryNo="2" href="#officeProduct" aria-expanded="false" aria-controls="officeProduct"><span
								 class="lnr lnr-arrow-right"></span>매트 / 침낭<span class="number"></span></a>
						</li>
						<li class="main-nav-list"><a id="pot" data-toggle="collapse" data-pCategoryNo="3" href="#beauttyProduct" aria-expanded="false" aria-controls="beauttyProduct"><span
								 class="lnr lnr-arrow-right"></span>코펠 / 버너 / 취사<span class="number"></span></a>
						</li>
						<li class="main-nav-list"><a id="chair" data-toggle="collapse" data-pCategoryNo="4" href="#healthProduct" aria-expanded="false" aria-controls="healthProduct"><span
								 class="lnr lnr-arrow-right"></span>체어 / 테이블<span class="number"></span></a>
						</li>
						<li class="main-nav-list"><a id="bbq" data-toggle="collapse" data-pCategoryNo="5" href="#homeAppliance" aria-expanded="false" aria-controls="homeAppliance"><span
								 class="lnr lnr-arrow-right"></span>화로대 / BBQ<span class="number"></span></a>
						</li>
					</ul>
				</div>
				<div class="sidebar-filter mt-50">
					<div class="top-filter-head">필터</div>
					<div class="common-filter">
						<div class="head">가격</div>
						<div class="price-range-area">
							<div id="price-range"></div>
							<div class="value-wrapper d-flex">
								<div class="price">가격(원):</div>
								<div id="lower-value"></div>
								<span>원</span>
								<div class="to">to</div>
								<div id="upper-value"></div>
								<span>원</span>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-xl-9 col-lg-8 col-md-7">
				<!-- Start Filter Bar -->
				<div class="filter-bar d-flex flex-wrap align-items-center">
					<div class="sorting">
						<select>
							<option value="1" selected>분류 기준</option>
							<option value="1">인기 순</option>
							<option value="1">가격 순</option>
							<option value="1">대여 순</option>
						</select>
					</div>
					<div class="sorting mr-auto">
						<select>
							<option value="1" onclick="">Show 6</option>
							<option value="1" onclick="">Show 9</option>
							<option value="1" onclick="">Show 12</option>
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
						<!-- single product -->
						<c:choose>
        					<c:when test="${empty productlist}">
        						<h1 style="text-align:center;">상품이 존재하지 않습니다.</h1>
        					</c:when>
        					<c:otherwise>
        						<c:forEach var="productDto" items="${productlist}">
        						<input type="hidden" class="pCategoryNo" value="${productDto.pCategoryNo }">
		      						<div class="col-lg-4 col-md-6">
										<div class="single-product">
										<c:if test="${login.memcode == 1 }">
											<input type="checkbox" name="chBox" class="chBox" data-pNo="${productDto.pNo }">
											<div class="delete_btn" style="float: right;">
												<button type="button" class="delete_btn" data-pNo="${productDto.pNo }">삭제</button>
											</div>
											
										</c:if>
										<a href="productdetail.do?pNo=${productDto.pNo }">
											<img class="img-fluid" src="storage/${productDto.pFile}" alt="" style="width: 255px; height: 200px;">
										</a>
											<div class="product-details">
											<h6>${productDto.pName }</h6>
												<div class="price">
													<h6><fmt:formatNumber value="${productDto.pPrice }" pattern="###,###,###"/></h6>
												</div>
												<c:if test="${productDto.pAmount != 0}">
													<h6 style="font-size: 20px;">수량: ${productDto.pAmount }</h6>
												</c:if>
												<c:if test="${productDto.pAmount == 0}">
													<h6 style="font-size: 20px;">재고가 없습니다.</h6>
												</c:if>
										<div class="prd-bottom">
											<a href="javascript:sendLink(${productDto.pNo })" class="social-info">
												<span class="lnr lnr-sync"></span>
												<p class="hover-text">카카오톡 공유하기</p>
											</a> 
 											<!--<div class="social-info">
											  <a href="javascript:sendLink()"><img src="https://developers.kakao.com/assets/img/about/logos/kakaolink/kakaolink_btn_medium.png" style="width: 30px; height: 30px;"/></a>
											  <p class="hover-text">카카오톡 공유하기</p>
											</div> -->
											<a href="productdetail.do?pNo=${productDto.pNo }" class="social-info">
												<span class="lnr lnr-move"></span>
												<p class="hover-text">상세보기</p> 	 	 	 	 	 	 	 	 	 	 	
											</a>
										</div>
									</div>
								</div>
							</div>
        				</c:forEach>
        			</c:otherwise>
        		</c:choose>
					</div>
				</section>
				<!-- End Best Seller -->
				<!-- Start Filter Bar -->
				<div class="filter-bar d-flex flex-wrap align-items-center">
					<div class="pagination">
					<c:if test="${pageMaker.prev}">
						<a href='<c:url value="/campingrent/category?page=${pageMaker.startPage-1 }"/>' class="prev-arrow"><i class="fa fa-long-arrow-left" aria-hidden="true"></i></a>
					</c:if>
					<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">
						<a href='<c:url value="/campingrent/category?page=${pageNum }"/>'><i class="fa">${pageNum }</i></a>
					</c:forEach>
					<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
						<a href='<c:url value="/campingrent/category?page=${pageMaker.endPage+1 }"/>' class="next-arrow"><i class="fa fa-long-arrow-right" aria-hidden="true"></i></a>
					</c:if>
					</div>
				</div>
				<!-- End Filter Bar -->
			</div>
		</div>
	</div>
	<%@include file="../common/footer.jsp" %>
</body>
</html>