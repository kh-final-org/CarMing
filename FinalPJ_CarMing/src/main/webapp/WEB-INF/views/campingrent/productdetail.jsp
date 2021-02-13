<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CarMing | 캠핑렌트 - 상품 상세 페이지 </title>
<link rel="stylesheet" href="resources/css/productdetail.css">
<style type="text/css">
	.col-first{margin: -1% 63.5% 0 -18%; } 
	.col-first > .maintext{font-weight: bold; font-size: 2.0em; color: #fff; text-align: left;}
	.text-1{margin: -5% 0 3%;}
	
	.card-container{padding: 0 200px;}
	.card-container-review{padding: 0 200px 50px;}
	.product-name{color: #5f5f5f; font-size: 2.2em; font-weight: bold; margin-bottom: 3.5%;}
	.product-price{color: #ff9b00; font-size: 1.7em; font-weight: bold; margin-bottom: 3%;}
	.s_product_text > ul > li > span{font-weight: bold;}
	.product_count > label > span{font-weight: bold;}
	
	.rentbtn{padding: 8px 0 10px; line-height: 20px; border: 0; border-radius: 4px; font-weight: bold;
			 text-align: center; color: #5f5f5f; background-color: #ffe6be; cursor: pointer;}
	.rentbtn:hover{background: #ffdb9f; transition: 0.2s;}
	.cart-in{width: 140px; margin-right: 5px; font-size: 1.05em;}
	.review-re{width: 140px; font-size: 1.05em;}
	.rent-list{width: 100px; font-size: 1.05em;}
	#qty{margin: 1% 0 0 5.5%; border: 1px solid silver; width: 163px; outline: none; border-radius: 3px;}
	.product_count{width: 100%;}
	
	#startDate{border: 1px solid silver; padding: 1.5px 2px; border-radius: 3px;}
	#endDate{border: 1px solid silver; padding: 1.5px 2px; border-radius: 3px;}
		
	#myTab{background: #ffba00; border-top-left-radius: 0.5em; border-top-right-radius: 0.5em;}
	a#home-tab{font-size: 1em; color: #5f5f5f; background: #fff5e9; border-radius: 3px;}
	a#home-tab:hover{background: #fff; transition: 0.2s;}
	a#review-tab{font-size: 1em; color: #5f5f5f; background: #fff; border-radius: 3px;}
	a#review-tab:hover{background: #fff5e9; transition: 0.2s;}
	input#name.form-control{font-size: 1.1em; color: #5f5f5f;}
    textarea#message.form-control{padding: 5px 10px; border: 1px solid silver; border-radius: 5px; 
    							  font-size: 1.1em; resize: none;}
	textarea#message.form-control::placeholder{color: silver;}
	.tab-content{border-bottom-left-radius: 0.5em; border-bottom-right-radius: 0.5em;}	
		
	#user-profile{border-radius: 10em;}
	.review_list{width: 100%; margin-bottom: 3%;}
	.review_item{width: 100%}
	.user-profile-form{float: left; margin-right: 3%;}
	.media-body-form{float: left;}
	.stars-icon{margin-left: -50%; align-content: left;}
	.review-context{float: left; text-align: left;}
	.review-delete-from{float: right;}	
	.total_rate{clear: both; width: 100%}
	
		
	#box-avg-form{background: #fff5e9; padding:5%;}
	.avgbox{color: #5f5f5f; font-size: 1.2em;}
	.text-1 {font-weight: bold;}
	.text-2{color: #ff9b00; font-weight: bold;}	
		
</style>
	
	
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
	
	<!--================Single Product Area =================-->
		<div class="product_image_area" style="padding-top: 50px;">
			<div class="card-container">
				<div class="row s_product_inner">
					<!-- 상품 사진 -->
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
					
					<!-- 상품 정보 -->
					<div class="col-lg-5 offset-lg-1">
						<div class="s_product_text">
							<div class="product-name" >${productdto.pName }</div>
							<div class="product-price"><fmt:formatNumber value="${productdto.pPrice }" pattern="###,###,###"/>&nbsp;원</div>
							<ul class="list">
								<c:choose>
									<c:when test="${productdto.pCategoryNo == 1}"><li><span>카테고리</span>&emsp;&emsp;텐트 / 타프</li></c:when>
									<c:when test="${productdto.pCategoryNo == 2}"><li><span>카테고리</span>&emsp;&emsp;매트 / 침낭</li></c:when>
									<c:when test="${productdto.pCategoryNo == 3}"><li><span>카테고리</span>&emsp;&emsp;코펠 / 버너 / 취사</li></c:when>
									<c:when test="${productdto.pCategoryNo == 4}"><li><span>카테고리</span>&emsp;&emsp;텐트 / 체어 / 테이블</li></c:when>
									<c:when test="${productdto.pCategoryNo == 5}"><li><span>카테고리</span>&emsp;&emsp;화로대 / BBQ</li></c:when>
								</c:choose>
								<c:if test="${productdto.pAmount != 0}">
									<li><span>재고&emsp;&emsp;&emsp;&emsp;</span>${productdto.pAmount }개</li>
								</c:if>
								<c:if test="${productdto.pAmount == 0}">
									<li>
										<span>상품 재고가 없습니다.&emsp;</span>
										<button type="button"><span class="lnr lnr-arrow-right" style="">&emsp;재고 추가</span></button>
									</li>
								</c:if>
								<li>
									<span>렌트 시작일&emsp;</span><input type="date" name="startDate" id="startDate">
								</li>
								<li>
									<span>렌트 반납일&emsp;</span><input type="date" name="endDate" id="endDate">
								</li>
							</ul>
							<div class="product_count">
								<label for="qty"><span>수량&emsp;&nbsp;</span></label>
								<input type="number" name="cAmount" id="qty" max="${productdto.pAmount}" value="1" title="Quantity:" class="input-text qty">
								<!-- <button onclick="var result = document.getElementById('sst'); var sst = result.value; if( !isNaN( sst )) result.value++;return false;"
								 class="increase items-count" type="button"><i class="lnr lnr-chevron-up"></i></button>
								<button onclick="var result = document.getElementById('sst'); var sst = result.value; if( !isNaN( sst ) &amp;&amp; sst > 0 ) result.value--;return false;"
								 class="reduced items-count" type="button"><i class="lnr lnr-chevron-down"></i></button> -->
							</div>
							<div class="card_area d-flex align-items-center">
								<c:if test="${productdto.pAmount != 0}">
									<button class="rentbtn cart-in" id="insertCart_btn">장바구니</button>
								</c:if>
								<c:if test="${productdto.pAmount == 0}">
							<!-- 		<button type="button" class="primary-btn" id="insertCart_btn" disabled>품절</button> -->
									<span class="primary-btn">품절</span>
								</c:if>
								<button class="rentbtn rent-list" onclick="location.href='productlist.do'">목록</button>
								
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--================End Single Product Area =================-->
	
		<!--================Product Description Area =================-->
		<form action="insertreview.do" method="post">
		<input type="hidden" id="starvalue" name="reviewStar" >
		<input type="hidden" name="pNo" id="pNo" value="${productdto.pNo }">
		<input type="hidden" name="pFile" id="pFile" value="${productdto.pFile }">
		<input type="hidden" name="pPrice" id="pPrice" value="${productdto.pPrice }">
		<input type="hidden" name="pName" id="pName" value="${productdto.pName }">
		<input type="hidden" name="pAmount" id="pAmount" value="${productdto.pAmount }">
		<input type="hidden" name="pCategoryNo" id="pCategoryNo" value="${productdto.pCategoryNo}">
		<section class="product_description_area">
			<div class="card-container-review">
				<!-- 상품 설명 및 리뷰 버튼 -->
				<ul class="nav nav-tabs" id="myTab" role="tablist">
					<li class="nav-item">
						<a class="nav-link" id="home-tab" data-toggle="tab" 
						   href="#home" role="tab" aria-controls="home" aria-selected="true">상품 설명</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" id="review-tab" data-toggle="tab" 
						   href="#review" role="tab" aria-controls="review" aria-selected="false">상품 리뷰</a>
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
							<!-- 리뷰 리스트 -->
							<div class="col-lg-6">
								<c:choose>
								<c:when test="${empty reviewlist}">
									<div>등록된 리뷰가 없습니다.</div>
								</c:when>
								<c:otherwise>

									<c:forEach var="rentReviewDtos" items="${reviewlist}">
										<!-- Start Review Area -->
										<div class="review_list">
											<div class="review_item">
												
												
												<div class="media">
													<div class="media-body">
														<!-- 사용자 프로필 사진 -->
														<div class="user-profile-form">
															<img id="user-profile" src="resources/img/${login.memfile }" alt="" style="width:70px; height:70px;">
														</div>
														
														<!-- 사용자 이메일 / 평점 -->
														<div class="media-body-form">
															<div class="stars-icon">
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
															</div>
															<div>${rentReviewDtos.reviewWriter }</div>
															<!-- 사용자 리뷰 -->
															<div class="review-context">${rentReviewDtos.reviewContext }</div>
														</div>
													</div>
												</div>
												
												<c:if test="${login.memid == rentReviewDtos.reviewWriter || login.memcode == 1}">
													<div class="review-delete-from">
														<a href="deletereview.do?reviewNo=${rentReviewDtos.reviewNo }&pNo=${productdto.pNo}" id="deletereview">
															<img src="resources/img/trash.svg">
														</a>
													</div>
												</c:if>
												
											</div>
										</div>
										<!-- End Review Area -->
										<c:set var="reviewSum" value="${reviewSum+rentReviewDtos.reviewStar}" />
									</c:forEach>
								</c:otherwise>
								</c:choose>
								
								<!-- 평균 평점 -->
								<div class="row total_rate" style="text-align: center;">
								 	<div class="col-6">
										<c:set var="reviewSum" value="${reviewSum }" />
										<c:set var="reviewAvg" value="${reviewSum/countreview }"/>
										<fmt:formatNumber var="reviewAvg" value="${reviewAvg }" pattern="0.0"/>
								 	    <c:if test="${empty reviewlist}">
											<div class="box_total" id="box-avg-form" style="display: none;">
												<div class="avgbox text-1">평균 평점</div>
												<div class="avgbox text-2">${reviewAvg }</div>
												<div class="avgbox text-3">리뷰 갯수&nbsp;<strong>${countreview }</strong>개</div>
											</div>
										</c:if>
										<c:if test="${not empty reviewlist}">
											<div class="box_total" id="box-avg-form">
												<div class="avgbox text-1">평균 평점</div>
												<div class="avgbox text-2">${reviewAvg }</div>
												<div class="avgbox text-3">리뷰 갯수&nbsp;<strong>${countreview }</strong>개</div>
											</div>
										</c:if>
									</div>
								</div>
							</div> 
							
							<!-- 리뷰 및 평점 남기기  -->
							<div class="col-lg-6">
								<div class="review_box">
									<h6 style="color: #5f5f5f;">리뷰 및 평점 남기기</h6>
									<c:set var="reviewAvg" value="${reviewSum/countreview }"/>
									<div id="rating">
										<span>
											<img style="width:15px; height:15px;" id="image1" onmouseover="show(1)" onclick="mark(1)" onmouseout="noshow(1)" src="resources/img/nonstar.png">
											<img style="width:15px; height:15px;" id="image2" onmouseover="show(2)" onclick="mark(2)" onmouseout="noshow(2)" src="resources/img/nonstar.png">
											<img style="width:15px; height:15px;" id="image3" onmouseover="show(3)" onclick="mark(3)" onmouseout="noshow(3)" src="resources/img/nonstar.png">
											<img style="width:15px; height:15px;" id="image4" onmouseover="show(4)" onclick="mark(4)" onmouseout="noshow(4)" src="resources/img/nonstar.png">
											<img style="width:15px; height:15px;" id="image5" onmouseover="show(5)" onclick="mark(5)" onmouseout="noshow(5)" src="resources/img/nonstar.png">
										</span>
									</div><br>
									
									<div class="col-md-12">
										<div class="form-group">
											<input type="text" class="form-control" value="${login.memid}" id="name" name="reviewWriter" placeholder="아이디 입력" 
												   onfocus="this.placeholder = ''" onblur="this.placeholder = '아이디 입력'">
										</div>
									</div>
									<div class="col-md-12">
										<div class="form-group">
											<textarea class="form-control" name="reviewContext" id="message" rows="3" placeholder="리뷰를 남겨주세요." 
													  onfocus="this.placeholder = ''" onblur="this.placeholder = '고객님의 소중한 리뷰를 작성해주세요.'"></textarea>
										</div>
									</div>
									<div class="col-md-12 text-right">
										<button type="submit" value="submit" class="rentbtn review-re" id="insertCart_btn">리뷰 등록하기</button>
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