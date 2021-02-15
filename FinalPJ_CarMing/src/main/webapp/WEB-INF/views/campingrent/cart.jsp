<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CarMing | 장바구니</title>
<link rel="stylesheet" href="resources/css/cart.css">
<link rel="stylesheet" href="resources/scss/theme/_product.scss">

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="resources/js/cartlist.js?ver=5"></script>
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

	<!--================Cart Area =================-->
	<c:choose>
	<c:when test="${empty cartlist}">
		<div class="card-container-cartform">
			<div class="cart_empty_img">
				<img class="cart_img" src="resources/img/pengcart.jpg">
			</div>
			<div class="cart_empty_text">
				<div class="cart_empty_button">
					<button type="button" class="cart_button" onclick="location.href='productlist.do';">+ 카트에 상품 담으러 가기</button>
				</div>
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
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                            	<td></td>
                            	<td></td>
                            	<td></td>
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