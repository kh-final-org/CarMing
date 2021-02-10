<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@
	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"
 %>
 
 <%@
 	taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"
  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CarMing</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
var locked = 0;

function show(star){
    if(locked){
        return;
    }
    var i;
    var image;
    var el;
    
    for(i=1; i<=star; i++){
        image = 'image'+i;
        el = document.getElementById(image).src = "resources/img/star.png";
    }
}
function noshow(star){
    if(locked){
        return;
    }
    var i;
    var image;
    var el;
    
    for(i=1; i<=star; i++){
        image = 'image'+i;
        el = document.getElementById(image).src = "resources/img/nonstar.png";
    }
}
function lock(star){
    show(star);
    locked = 1;
    for(i=5; i>=star; i--){
    	image = 'image'+i;
    	el = document.getElementById(image).src = "resources/img/nonstar.png";
    }
}
function mark(star){
    lock(star);
    for(i=1; i<=star; i++){
    	image = 'image'+i;
    	el = document.getElementById(image).src = "resources/img/star.png";
    }
    document.getElementById("starvalue").value = star;
}
</script>
<script src="resources/js/cart.js"></script>
</head>
<body>
	<%@ include file="../common/header.jsp" %>
	<!-- Start Banner Area -->
	<form action="cart.do" method="post">
	<section class="banner-area organic-breadcrumb">
		<div class="container">
			<div class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
				<div class="col-first">
					<h1>캠핑 렌트</h1>
					<nav class="d-flex align-items-center">
						<a href="index.html">홈<span class="lnr lnr-arrow-right"></span></a>
						<a href="category.html">캠핑 렌트<span class="lnr lnr-arrow-right"></span></a>
						<a href="category.html">상품 보기</a>
					</nav>
				</div>
			</div>
		</div>
	</section>
	<!-- End Banner Area -->
	
	<!--================Single Product Area =================-->
		<div class="product_image_area">
			<div class="container">
				<div class="row s_product_inner">
					<div class="col-lg-6">
						<div class="s_Product_carousel">
							<div class="single-prd-item">
								<img class="img-fluid" src="resources/img/rent/${productdto.pFile }" alt="">
							</div>
							<div class="single-prd-item">
								<img class="img-fluid" src="resources/img/rent/${productdto.pFile2 }" alt="">
							</div>
							<div class="single-prd-item">
								<img class="img-fluid" src="resources/img/rent/${productdto.pFile3 }" alt="">
							</div>
						</div>
					</div>
					<div class="col-lg-5 offset-lg-1">
						<div class="s_product_text">
							<h3>${productdto.pName }</h3>
							<h2><fmt:formatNumber value="${productdto.pPrice }" pattern="###,###,###"/>&nbsp;원</h2>
							<ul class="list">
								<c:choose>
									<c:when test="${productdto.pCategoryNo == 1}"><li><span>카테고리:</span>&nbsp;텐트 / 타프</li></c:when>
									<c:when test="${productdto.pCategoryNo == 2}"><li><span>카테고리:</span>&nbsp;매트 / 침낭</li></c:when>
									<c:when test="${productdto.pCategoryNo == 3}"><li><span>카테고리:</span>&nbsp;코펠 / 버너 / 취사</li></c:when>
									<c:when test="${productdto.pCategoryNo == 4}"><li><span>카테고리:</span>&nbsp;텐트 / 체어 / 테이블</li></c:when>
									<c:when test="${productdto.pCategoryNo == 5}"><li><span>카테고리:</span>&nbsp;화로대 / BBQ</li></c:when>
								</c:choose>
								<c:if test="${productdto.pAmount != 0}">
									<li>
										<span>재고: ${productdto.pAmount }</span>
									</li>
								</c:if>
								<c:if test="${productdto.pAmount == 0}">
									<li>
										<span>상품 재고가 없습니다.</span><span class="lnr lnr-arrow-right" style="">재고 추가</span>
									</li>
								</c:if>
								<li>
									<span>렌트시작일: </span><input type="date" name="startDate" id="startDate">
								</li>
								<li>
									<span>렌트반납일: </span><input type="date" name="endDate" id="endDate">
								</li>
							</ul>
							<div class="product_count">
								<label for="qty">수량:</label>
								<input type="number" name="cAmount" id="sst" max="${productdto.pAmount}" value="1" title="Quantity:" class="input-text qty">
								<!-- <button onclick="var result = document.getElementById('sst'); var sst = result.value; if( !isNaN( sst )) result.value++;return false;"
								 class="increase items-count" type="button"><i class="lnr lnr-chevron-up"></i></button>
								<button onclick="var result = document.getElementById('sst'); var sst = result.value; if( !isNaN( sst ) &amp;&amp; sst > 0 ) result.value--;return false;"
								 class="reduced items-count" type="button"><i class="lnr lnr-chevron-down"></i></button> -->
							</div>
							<div class="card_area d-flex align-items-center">
								<c:if test="${productdto.pAmount != 0}">
									<span class="primary-btn" id="insertCart_btn">장바구니에 담기</span>
								</c:if>
								<c:if test="${productdto.pAmount == 0}">
							<!-- 		<button type="button" class="primary-btn" id="insertCart_btn" disabled>품절</button> -->
									<span class="primary-btn">품절</span>
								</c:if>
								<a class="primary-btn" href="productlist.do">목록</a>
								
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		</form>
		<!--================End Single Product Area =================-->
	
		<!--================Product Description Area =================-->
		<form action="insertreview.do" method="post">
		<input type="hidden" id="starvalue" name="reviewStar" >
		<input type="hidden" name="pNo" id="pNo" value="${productdto.pNo }">
		<input type="hidden" name="pFile" id="pFile" value="${productdto.pFile }">
		<input type="hidden" name="pPrice" id="pPrice" value="${productdto.pPrice }">
		<input type="hidden" name="pName" id="pName" value="${productdto.pName }">
		<input type="hidden" name="pAmount" id="pAmount" value="${productdto.pAmount }">
		<section class="product_description_area">
			<div class="container">
				<ul class="nav nav-tabs" id="myTab" role="tablist">
					<li class="nav-item">
						<a class="nav-link" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">상품 설명</a>
					</li>
					<li class="nav-item">
						<a class="nav-link active" id="review-tab" data-toggle="tab" href="#review" role="tab" aria-controls="review"
						 aria-selected="false">상품 리뷰</a>
					</li>
				</ul>
				<div class="tab-content" id="myTabContent" style="text-align:center;">
					<div class="tab-pane fade" id="home" role="tabpanel" aria-labelledby="home-tab">
						<img class="product_description" src="resources/img/rent/${productdto.pDesc}">
					</div>
					<div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab">
					</div>
					<div class="tab-pane fade show active" id="review" role="tabpanel" aria-labelledby="review-tab">
						<div class="row">
							<div class="col-lg-6">
									<c:choose>
									<c:when test="${empty reviewlist}">
										<h3>등록되어 있는 리뷰가 존재하지 않습니다. <br>
										리뷰를 남겨주세요.</h3>
									</c:when>
									<c:otherwise>

										<c:forEach var="rentReviewDtos" items="${reviewlist}">
											<div class="review_list">
												<div class="review_item">
													<div class="media">
														<div class="media-body">
															<c:if test="${login.memid == rentReviewDtos.reviewWriter || login.memcode == 1}">
																<a href="deletereview.do?reviewNo=${rentReviewDtos.reviewNo }&pNo=${productdto.pNo}" id="deletereview">
																	<img src="resources/img/trash.svg">
																</a>
															</c:if>
															<div class="d-flex">
																<img src="resources/img/logo.png" alt="" style="width:70px; height:70px;">
															</div>				
															<div class="media-body">
																<h4>${rentReviewDtos.reviewWriter }</h4>
																<span>
																	<c:if test="${rentReviewDtos.reviewStar == 1 }">
																		<img style="width:15px; height:15px;" id="image1" src="resources/img/star.png">
																	</c:if>
																	<c:if test="${rentReviewDtos.reviewStar == 2 }">
																		<img style="width:15px; height:15px;" id="simage1" src="resources/img/star.png">
																		<img style="width:15px; height:15px;" id="simage2" src="resources/img/star.png">
																	</c:if>
																	<c:if test="${rentReviewDtos.reviewStar == 3 }">
																		<img style="width:15px; height:15px;" id="simage1" src="resources/img/star.png">
																		<img style="width:15px; height:15px;" id="simage2" src="resources/img/star.png">
																		<img style="width:15px; height:15px;" id="simage3" src="resources/img/star.png">
																	</c:if>
																	<c:if test="${rentReviewDtos.reviewStar == 4 }">
																		<img style="width:15px; height:15px;" id="simage1" src="resources/img/star.png">
																		<img style="width:15px; height:15px;" id="simage2" src="resources/img/star.png">
																		<img style="width:15px; height:15px;" id="simage3" src="resources/img/star.png">
																		<img style="width:15px; height:15px;" id="simage4" src="resources/img/star.png">
																	</c:if>
																	<c:if test="${rentReviewDtos.reviewStar == 5 }">
																		<img style="width:15px; height:15px;" id="simage1" src="resources/img/star.png">
																		<img style="width:15px; height:15px;" id="simage2" src="resources/img/star.png">
																		<img style="width:15px; height:15px;" id="simage3" src="resources/img/star.png">
																		<img style="width:15px; height:15px;" id="simage4" src="resources/img/star.png">
																		<img style="width:15px; height:15px;" id="simage5" src="resources/img/star.png">
																	</c:if>
																</span>
															</div>
														</div>
													</div>
													<p>${rentReviewDtos.reviewContext }</p>
												</div>
											</div>
											<c:set var="reviewSum" value="${reviewSum+rentReviewDtos.reviewStar}" />
										</c:forEach>
									</c:otherwise>
								</c:choose>   
								<div class="row total_rate" style="text-align: center;">
									 	<div class="col-6">
											<c:set var="reviewSum" value="${reviewSum }" />
											<c:set var="reviewAvg" value="${reviewSum/countreview }"/>
											<fmt:formatNumber var="reviewAvg" value="${reviewAvg }" pattern="0.0"/>
									 	    <c:if test="${empty reviewlist}">
												<div class="box_total" style="display: none;">
														<h5>평균 평점</h5>
														<h4>${reviewAvg }</h4>
														<h6>리뷰 갯수: ${countreview }개</h6>
												</div>
											</c:if>
											<c:if test="${not empty reviewlist}">
												<div class="box_total">
														<h5>평균 평점</h5>
														<h4>${reviewAvg }</h4>
														<h6>리뷰 갯수: ${countreview }개</h6>
												</div>
											</c:if>
							
										</div>
									<!-- <div class="col-6">
										<div class="rating_list">
											<h3>별점 갯수</h3>
											<ul class="list">
												<li><a href="#">5 Star <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i
														 class="fa fa-star"></i><i class="fa fa-star"></i> 01</a></li>
												<li><a href="#">4 Star <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i
														 class="fa fa-star"></i><i class="fa fa-star"></i> 01</a></li>
												<li><a href="#">3 Star <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i
														 class="fa fa-star"></i><i class="fa fa-star"></i> 01</a></li>
												<li><a href="#">2 Star <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i
														 class="fa fa-star"></i><i class="fa fa-star"></i> 01</a></li>
												<li><a href="#">1 Star <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i
														 class="fa fa-star"></i><i class="fa fa-star"></i> 01</a></li>
											</ul>
										</div>
									</div> -->
								</div>
							</div> 
							
							<div class="col-lg-6">
								<div class="review_box">
									<h4>리뷰 남기기</h4>
									<span>평점 남기기</span>
									<c:set var="reviewAvg" value="${reviewSum/countreview }"/>
									<div id="rating">
										<span>
											<img style="width:15px; height:15px;" id="image1" onmouseover="show(1)" onclick="mark(1)" onmouseout="noshow(1)" src="resources/img/nonstar.png">
											<img style="width:15px; height:15px;" id="image2" onmouseover="show(2)" onclick="mark(2)" onmouseout="noshow(2)" src="resources/img/nonstar.png">
											<img style="width:15px; height:15px;" id="image3" onmouseover="show(3)" onclick="mark(3)" onmouseout="noshow(3)" src="resources/img/nonstar.png">
											<img style="width:15px; height:15px;" id="image4" onmouseover="show(4)" onclick="mark(4)" onmouseout="noshow(4)" src="resources/img/nonstar.png">
											<img style="width:15px; height:15px;" id="image5" onmouseover="show(5)" onclick="mark(5)" onmouseout="noshow(5)" src="resources/img/nonstar.png">
										</span>
									</div>
									<br>
										<div class="col-md-12">
											<div class="form-group">
												<input type="text" class="form-control" value="${login.memid}" id="name" name="reviewWriter" placeholder="아이디 입력" onfocus="this.placeholder = ''" onblur="this.placeholder = '아이디 입력'">
											</div>
										</div>
										<div class="col-md-12">
											<div class="form-group">
												<textarea class="form-control" name="reviewContext" id="message" rows="1" placeholder="리뷰를 남겨주세요." onfocus="this.placeholder = ''" onblur="this.placeholder = '리뷰를 남겨주세요.'"></textarea>
											</div>
										</div>
										<div class="col-md-12 text-right">
											<button type="submit" value="submit" class="primary-btn">리뷰 남기기</button>
										</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		</form>
	<!--================End Product Description Area =================-->

	<%@ include file="../common/footer.jsp" %>

</body>
</html>