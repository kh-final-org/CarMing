<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CarMing</title>
<script type="text/javascript"></script>
	
</head>
<body>
	<%@ include file="../common/header_cart.jsp" %>
	<!--================Cart Area =================-->
    <section class="cart_area">
        <div class="container">
            <div class="cart_inner">
                <div class="table-responsive">
                    <table class="table">
                        <thead>
                            <tr>
                            	<th scope="col"><input type="checkbox"></th>
                            	<th scope="col" style="width:100px;">전체 선택</th>
                                <th scope="col">상품</th>
                                <th scope="col">렌트 대여일</th>
                                <th scope="col">렌트 반납일</th>
                                <th scope="col">가격</th>
                                <th scope="col">수량</th>
                                <th scope="col">총합</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                            	<td colspan="2"><input type="checkbox"></td>
                                <td>
                                    <div class="media">
                                        <div class="d-flex">
                                            <img style="width:152px; height:102px;" src="resources/img/tent.jpg" alt="">
                                        </div>
                                        <div class="media-body">
                                            <p>Minimalistic shop for multipurpose use 	 	 	 	 	 	 	 </p>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                	<input type="date">
                                </td>
                                <td>
                                	<input type="date">
                                </td>
                                <td>
                                    <h5>$360.00</h5>
                                </td>
                                <td>
                                    <div class="product_count">
                                        <input type="text" name="qty" id="sst" maxlength="12" value="1" title="Quantity:"
                                            class="input-text qty">
                                        <button onclick="var result = document.getElementById('sst'); var sst = result.value; if( !isNaN( sst )) result.value++;return false;"
                                            class="increase items-count" type="button"><i class="lnr lnr-chevron-up"></i></button>
                                        <button onclick="var result = document.getElementById('sst'); var sst = result.value; if( !isNaN( sst ) &amp;&amp; sst > 0 ) result.value--;return false;"
                                            class="reduced items-count" type="button"><i class="lnr lnr-chevron-down"></i></button>
                                    </div>
                                </td>
                                <td>
                                    <h5>$720.00</h5>
                                </td>
                            </tr>
                         
                            <tr class="bottom_button">
                                <td colspan="3">
                                    <a class="gray_btn" href="onclick=allDelete();">전체 삭제</a>
                                    <a class="gray_btn" href="onclick=oneDelete();">선택 삭제</a>
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
                                <td>

                                </td>
                                <td>
                                    <h5>Subtotal</h5>
                                </td>
                                <td>
                                    <h5>$2160.00</h5>
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
                                <td>                         	
                            		<div class="checkout_btn_inner d-flex align-items-center">
                                        <a class="gray_btn" href="#">&nbsp;&nbsp;&nbsp;&nbsp;쇼핑 계속하기&nbsp;&nbsp;&nbsp;&nbsp;</a>
                                        <a class="primary-btn" href="#">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;결제하기&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
                                    </div>      
                                </td>

                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </section>
    <!--================End Cart Area =================-->
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<%@ include file="../common/footer.jsp" %>
</body>
</html>