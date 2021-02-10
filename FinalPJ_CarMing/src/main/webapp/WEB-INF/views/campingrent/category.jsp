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
<meta charset="EUC-KR">
<title>CarMing | 캠핑 렌트</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script src="resources/js/category.js?ver=4"></script>
<script type="text/javascript">
	function showall() {
	var list = document.getElementsByClassName("single-product");
		 for(i=0; i<list.length; i++){
			 list[i].style.display ="block";
		 }
	}
</script>


<script type="text/javascript">
	function tent() {
	var list = document.getElementsByClassName("single-product");
	
	
		 for(i=0; i<list.length; i++){
			 var catNo = document.getElementsByClassName("pCategoryNo")[i].value;
			
			 console.log(catNo );
				if(catNo == 1){
				 list[i].style.display ="";
				}else {
					list[i].style.display = "none";
				}
			 
		 }
		 
	}
</script>


<script type="text/javascript">
	function mat() {
	var list = document.getElementsByClassName("single-product");
	 
	for(i=0; i<list.length; i++){
		 var cartNo = document.getElementsByClassName("pCategoryNo")[i].value;
		
		 console.log(cartNo );
			if(cartNo == 2){
			 list[i].style.display ="";
			}else {
				list[i].style.display = "none";
			}
		 
		 }
	}
</script>

<script type="text/javascript">
	function cook() {
	var list = document.getElementsByClassName("single-product");
	
	for(i=0; i<list.length; i++){
		 var cartNo = document.getElementsByClassName("pCategoryNo")[i].value;
		
		 console.log(cartNo );
			if(cartNo == 3){
			 list[i].style.display ="";
			}else {
				list[i].style.display = "none";
			}
		 
		 }
	}
</script>

<script type="text/javascript">
	function chair() {
	var list = document.getElementsByClassName("single-product");
	for(i=0; i<list.length; i++){
		 var cartNo = document.getElementsByClassName("pCategoryNo")[i].value;
		
		 console.log(cartNo );
			if(cartNo == 4){
			 list[i].style.display ="";
			}else {
				list[i].style.display = "none";
			}
		 
		 }
	}
</script>

<script type="text/javascript">
	function bbq() {
	var list = document.getElementsByClassName("single-product");
	for(i=0; i<list.length; i++){
		 var cartNo = document.getElementsByClassName("pCategoryNo")[i].value;
		
		 console.log(cartNo );
			if(cartNo == 5){
			 list[i].style.display ="";
			}else {
				list[i].style.display = "none";
			}
		 
		 }
	}
</script>


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
						<li class="main-nav-list"><a id="all_category" data-toggle="collapse" href="#" onclick="showall();" aria-expanded="false" aria-controls="fruitsVegetable"><span
								 class="lnr lnr-arrow-right"></span>전체<span class="number"></span></a>
						</li>
						<li class="main-nav-list"><a id="tent" data-toggle="collapse" data-pCategoryNo="1" href="#" onclick="tent();" aria-expanded="false" aria-controls="fruitsVegetable"><span
								 class="lnr lnr-arrow-right"></span>텐트 / 타프<span class="number"></span></a>
						</li>
						<li class="main-nav-list"><a id="bag" data-toggle="collapse" data-pCategoryNo="2" href="#" onclick="mat();"aria-expanded="false" aria-controls="officeProduct"><span
								 class="lnr lnr-arrow-right"></span>매트 / 침낭<span class="number"></span></a>
						</li>
						<li class="main-nav-list"><a id="pot" data-toggle="collapse" data-pCategoryNo="3" href="#" onclick="cook();" aria-expanded="false" aria-controls="beauttyProduct"><span
								 class="lnr lnr-arrow-right"></span>코펠 / 버너 / 취사<span class="number"></span></a>
						</li>
						<li class="main-nav-list"><a id="chair" data-toggle="collapse" data-pCategoryNo="4" href="#" onclick="chair();" aria-expanded="false" aria-controls="healthProduct"><span
								 class="lnr lnr-arrow-right"></span>체어 / 테이블<span class="number"></span></a>
						</li>
						<li class="main-nav-list"><a id="bbq" data-toggle="collapse" data-pCategoryNo="5" href="#" onclick="bbq();" aria-expanded="false" aria-controls="homeAppliance"><span
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
							<option value="1">가격 순</option>
						</select>
					</div>
					<div class="sorting mr-auto">
						<select>
							<option value="1">Show 6</option>
							<option value="1">Show 9</option>
							<option value="1">Show 12</option>
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
	      						<div class="col-lg-4 col-md-6" >
									<div class="single-product">
        								<input type="hidden" class="pCategoryNo" id="categoryNo" value="${productDto.pCategoryNo }">
										<c:if test="${login.memcode == 1 }">
											<input type="checkbox" name="chBox" class="chBox" data-pNo="${productDto.pNo }">
											<div class="delete_btn" style="float: right;">
												<button type="button" class="delete_btn" data-pNo="${productDto.pNo }">삭제</button>
											</div>
											
										</c:if>
										<a href="productdetail.do?pNo=${productDto.pNo }">
											<img class="img-fluid" src="resources/img/rent/${productDto.pFile}" alt="" style="width: 255px; height: 200px;">
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
 											<!--<div class="social-info">
											  <a href="javascript:sendLink()"><img src="https://developers.kakao.com/assets/img/about/logos/kakaolink/kakaolink_btn_medium.png" style="width: 30px; height: 30px;"/></a>
											  <p class="hover-text">카카오톡 공유하기</p>
											</div> -->
											<a href="productdetail.do?pNo=${productDto.pNo }" class="social-info">
												<span class="lnr lnr-move"></span>
												<p class="hover-text">상세보기</p>
											</a>
											<a href="javascript:sendLink(${productDto.pNo })" class="social-info">
												<span class="lnr lnr-sync"></span>
												<p class="hover-text">카카오톡 공유</p>
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
				
			<!-- ==================================================================================================
				================================================ paging ================================================ -->
			<c:set var="page" value="${(empty param.page) ? 1 : param.page}"></c:set>
			<c:set var="startNum" value="${page - (page-1) % 5}"></c:set>
			<c:set var="lastNum" value="${fn:substringBefore(Math.ceil(count/10), '.')}"></c:set>
			<div class="hint-text">
				Showing <b>${(empty param.page) ? 1:param.page}</b> out of <b>${lastNum }</b> pages
			</div>
			<!-- 현재 페이지 -->
			<div class="filter-bar d-flex flex-wrap align-items-center">
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
			</div>
			<!-- ==================================================================================================
				================================================ paging ================================================ -->
			</div>
		</div>
	</div>
	<%@include file="../common/footer.jsp" %>
</body>
</html>