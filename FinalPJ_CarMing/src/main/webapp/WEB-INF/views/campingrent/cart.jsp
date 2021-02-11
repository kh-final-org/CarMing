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
<title>CarMing | 장바구니</title>
<link rel="stylesheet" href="resources/scss/theme/_product.scss">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="resources/js/cartlist.js?ver=5"></script>
<style type="text/css">
	#banner-text-2{position: absolute; top: 255px; right: 245px;}
	.banner-btn{width: 115px; padding: 8px 0 10px; line-height: 18px; border: 2px solid #fff5e9; border-radius: 3px;
				font-size: 1.1em; text-align: center; color: #fff5e9; background: transparent; opacity: 0.95;  
				position:relative; overflow: hidden; transition: 0.95s; cursor: pointer;}
	.banner-btn:hover{background: #fff5e9; color: #5f5f5f;}
	.banner-btn::before{content: ""; position: absolute; left:0; width:100%; height: 0%; background: #fff5e9; z-index: -1; 
						top:0; border-radius: 0 0 50% 50%; transition: 0.95s;}
	.banner-btn:hover::before{height: 180%;}
	
	
	
	
	.cart_empty_img{text-align: center; width: 35%;}
	.cart_empty_text{text-align: center;margin-bottom: 20%;}
	.cart_empty_button{margin-top: 5%;}
	
	
</style>
</head>
<body>
	<%@ include file="../common/header.jsp" %>
	
	<!-- Start Banner Area -->
	<section class="banner-area organic-breadcrumb">
	   <div class="container">
	      <div class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end" >
	         <div class="col-first" id="banner-text-1">
	            <h1>The stars in the night sky</h1>
	            <nav class="d-flex align-items-center">
	               <a href="home.do"><span class="lnr lnr-home"></span>Home</a>&emsp;
	               <a href="#"><span class="lnr lnr-arrow-right-circle"></span>Camping</a>
	            </nav>
	         </div>
	      </div>
		  <div class="section-top-border text-right" id="banner-text-2">
	       	 <div class="button-group-area mt-40" style="padding-bottom: 5em">
	       	 	<button class="banner-btn" id="gowrite" type="button" onclick="location.href='#'">캠핑렌트</button>
	       	 	<button class="banner-btn" id="golist" type="button" onclick="location.href='#'">장바구니</button>
	         </div>
		  </div>
		</div>
	</section>
	<!-- End Banner Area -->

	<!--================Cart Area =================-->
	<c:choose>
	<c:when test="${empty cartlist}">
		<div class="cart_empty_img">
			<img src="resources/img/cart.png"><br>
		</div>
		<div class="cart_empty_text">
			<h1>"장바구니가 비어 있습니다."</h1>
			<div class="cart_empty_button">
				<button type="button" onclick="location.href='productlist.do';">상품 담기</button>
			</div>
		</div>
	</c:when>
	<c:otherwise>
    <section class="cart_area">
        <div class="container">
            <div class="cart_inner">
                <div class="table-responsive">
                    <table class="table">
                        <thead>
                            <tr>
                            	<th scope="col"><input type="checkbox" name="allCheck" id="allCheck"></th>
                            	<th scope="col" style="width:100px;">전체 선택</th>
                                <th scope="col">상품</th>
                                <th scope="col">렌트 대여일</th>
                                <th scope="col">렌트 반납일</th>
                                <th scope="col">가격</th>
                                <th scope="col">수량</th>
                                <th scope="col">총합</th>
                            </tr>
                        </thead>
                        <c:set var="sum" value="0"></c:set>
                        <c:forEach var="cartListDto" items="${cartlist}">
                        	<fmt:formatDate var="sDate" value="${cartListDto.startDate}" pattern="yyyyMMdd"/>
                           	<fmt:formatDate var="eDate" value="${cartListDto.endDate}" pattern="yyyyMMdd"/>
		                    <fmt:parseNumber var="itDate" value="${sDate / (1000*60*60*24)}" integerOnly="true" scope="request"/>
		                    <fmt:parseNumber var="isDate" value="${eDate / (1000*60*60*24)}" integerOnly="true" scope="request"/>
                        <tbody>
                            <tr>
                            	<td><input type="checkbox" name="chBox" class="chBox" data-cartNo="${cartListDto.cartNo }"></td>
                                <td colspan="2">
                                    <div class="media">
                                        <div class="d-flex">
                                            <img style="width:152px; height:102px;" src="storage/${cartListDto.pFile }" alt="">
                                        </div>
                                        <div class="media-body">
                                            <p>${cartListDto.pName } </p>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                	<!-- <input type="date" id="sdatePicker"> -->
                                	<fmt:formatDate value="${cartListDto.startDate }" pattern="yyyy-MM-dd"/>
                                	<input type="hidden" id="startDate" value="${cartListDto.startDate}">
                                </td>
                                <td>
                              		<!-- <input type="date" id="edatePicker"> -->
                              		<fmt:formatDate value="${cartListDto.endDate }" pattern="yyyy-MM-dd"/>
                                	<input type="hidden" id="endDate" value="${cartListDto.endDate}">
                                </td>
                                <td>
                                    <h5 id="pPrice">${cartListDto.pPrice }</h5>
                                </td>
                                <td>
                                    <div class="product_count">
                                        <input type="text" name="cAmount" id="sst" maxlength="12" value="${cartListDto.cAmount }" title="Quantity:"
                                            class="input-text qty">
                                        <button onclick="var result = document.getElementById('sst'); var sst = result.value; if( !isNaN( sst )) result.value++;return false;"
                                            class="increase items-count" type="button"><i class="lnr lnr-chevron-up"></i></button>
                                        <button onclick="var result = document.getElementById('sst'); var sst = result.value; if( !isNaN( sst ) &amp;&amp; sst > 0 ) result.value--;return false;"
                                            class="reduced items-count" type="button"><i class="lnr lnr-chevron-down"></i></button>
                                    </div>
                                </td>
                                <td>
                                   <c:set var="sum" value="${sum+(cartListDto.pPrice*cartListDto.cAmount*(eDate-sDate)) }"/>
                                   <h5><fmt:formatNumber value="${cartListDto.pPrice*cartListDto.cAmount*(eDate-sDate) }" pattern="###,###,###"/></h5>
                                </td>
                            </tr>
							</c:forEach>

                            <tr class="bottom_button">
                                <td colspan="3">
	                                <a class="gray_btn" id="selectDelete_btn">선택 삭제</a> 

                                </td>
                                <td>

                                </td>
                                <td></td>
                                <td></td>
                                <td>

                                </td>
                                <td>

                                </td>
                            </tr>
                            <tr>
                            	<td></td>
                            	<td></td>
                                <td>

                                </td>
                                <td></td>
                                <td></td>
                                <td style="text-align: right;">
									<h5>총 금액</h5>
                                </td>
                                <td colspan="2" style="text-align: right;">
                                   <fmt:formatNumber value="${sum}" pattern="###,###,###"/><span>원</span>
                                </td>
                            </tr>
                            <tr class="out_button_area">
                            	<td></td>
                            	<td></td>
                                <td></td>
                                <td>
                                </td>
                                <td>
                                </td>
								<td></td>
								<td></td>
                                <td style="text-align: center;"> 
		                            <div class="checkout_btn_inner d-flex align-items-center">
			                            <a class="gray_btn" href="productlist.do">&nbsp;&nbsp;&nbsp;&nbsp;쇼핑 계속하기&nbsp;&nbsp;&nbsp;&nbsp;</a>
			                            <a class="primary-btn" href="payinfo.do">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;결제하기&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
		                            </div>
                                </td>

                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </section>
    </c:otherwise>
    </c:choose>
    <!--================End Cart Area =================-->
	<%@ include file="../common/footer.jsp" %>
</body>
</html>