<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CarMing</title>
	<link rel="stylesheet" href="resources/scss/theme/_product.scss">
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>

<body>
	<%@ include file="../common/header.jsp" %>
    <!-- Start Banner Area -->
    <section class="banner-area organic-breadcrumb">
        <div class="container">
            <div class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
                <div class="col-first">
                    <h1>결제</h1>
                    <nav class="d-flex align-items-center">
                        <a href="index.html">장바구니<span class="lnr lnr-arrow-right"></span></a>
                        <a href="single-product.html">결제하기</a>
                    </nav>
                </div>
            </div>
        </div>
    </section>
    <!-- End Banner Area -->

    <!--================Checkout Area =================-->
    <section class="checkout_area section_gap">
        <div class="container">
            <div class="billing_details">
                <div class="row">
                    <div class="col-lg-8">
                        <h3>배송 정보   <a href="" id="change_addr" style="font-size: 12pt; float: right;">배송지 변경</a></h3>
                        <form class="row contact_form" action="#" method="post" novalidate="novalidate">
                            <div class="col-md-6 form-group p_star">
                                <label for="">받는 분</label>
                                <div>
                                    <input type="text" class="form-control" id="first" name="name" placeholder="이름" value="${login.memname }">
                                </div>
                            </div>
                            <div class="col-md-12 form-group">
                                <label for="">배송 주소</label>
                                <div id="addr_btn" style="display: none;">
                                	<input type="button" onclick="sample4_execDaumPostcode();" value="우편번호 찾기" style="float: right;">
                                </div>
                                <div>
                                    <input type="text" class="form-control" id="sample4_postcode" name="name" value="${login.memzip }" placeholder="우편번호" style="width: 35%;"><br>
                                    <input type="text" class="form-control" id="sample4_roadAddress" name="roadaddr" value="${login.memaddr }" placeholder="도로명주소"><br>
                                    <span id="guide" style="color: $999; display: none;"></span>
                                    <input type="text" class="form-control" id="sample4_detailAddress" value="${login.memaddr2 }" placeholder="상세주소"><br>
                                </div>
                            </div>
                            <div class="col-md-6 form-group p_star">
                                <label for="">휴대전화</label>
                                <div>
                                    <input type="text" class="form-control" id="number" name="number" placeholder="휴대전화" value="${login.memphone }">
                                </div>
                            </div>
                            <div class="col-md-12 form-group p_star">
                                <label for="">배송 메모</label>
                                <div>
                                    <select class="country_select" id="custom_memo">
                                        <option value="1">배송 시 요청사항을 선택해주세요.</option>
                                        <option value="2">배송 전에 미리 연락주세요.</option>
                                        <option value="3">부재 시 경비실에 맡겨주세요.</option>
                                        <option value="4">부재 시 문앞에 놓아주세요.</option>
                                        <option value="5">부재 시 전화주시거나 문자 남겨주세요.</option>
                                        <option value="6">직접 입력</option>
                                    </select>
                                    <br>
                                    <span class="placeholder" data-placeholder=""></span>
                                    <div id="custom_memo_area" style="display: none;">
                                        <textarea class="form-control" name="message" id="message" rows="1" placeholder="Order Notes"></textarea>
                                    </div>
                                </div>
                            </div>
                            <h3>주문자</h3>
                                <div class="col-md-12 form-group p_star">
                                    <label for="">이름</label>
                                    <div>
                                         <input type="text" class="form-control" id="23" name="compemailany" value="${login.memname }" style="width: 48%;">
                                    </div>
                                </div>
                                <div class="col-md-6 form-group p_star">
                                    <label for="">이메일</label>
                                    <div>
                                        <input type="text" class="form-control" id="12" name="compemailany" value="${login.memid }">
                                    </div>
                                </div>
                                <div class="col-md-6 form-group p_star">
                                    <label for="">휴대전화</label>
                                    <div>
                                        <input type="text" class="form-control" id="565" name="compemailany" value="${login.memphone }">
                                    </div>
                                </div>
                                <div class="col-md-6 form-group p_star">
                                    <label for="">결제 수단</label>
                                    <div>
                                        <select class="country_select" id="pay_option">
                                            <option value="method">결제 방법을 선택해주세요.</option>
                                            <option value="cart">카드</option>
                                            <option value="kakaopay">카카오페이</option>
                                        </select>
                                    </div>
                                </div>
                        </form>
                    </div>
                    <div class="col-lg-4">
                        <div class="order_box">
                            <h2>결제 내역</h2>
                            <ul class="list">

                            	<%-- <c:forEach var="cartListDto" items="${cartlist}"> --%>
	                                <li><a href="#">Product <span>대여기간           총합</span></a></li>
	                                <li><a href="#">${cartlist.pName } <span class="middle">x 02</span> <span class="last">$720.00</span></a></li>
	                                <li><a href="#">Fresh Tomatoes <span class="middle">x 02</span> <span class="last">$720.00</span></a></li>
	                                <li><a href="#">Fresh Brocoli <span class="middle">x 02</span> <span class="last">$720.00</span></a></li>
	                            <%-- </c:forEach> --%>
                            </ul>
                            <ul class="list list_2">
                                <li><a href="#">총 금액<span>$2160.00</span></a></li>
                            </ul>
                            <div class="payment_item">
                                <div class="create_account">
                                    <input type="checkbox" id="f-option4" name="selector" onclick="agree_btn(this);">
                                    <label for="f-option4">아래 내용에 모두 동의합니다. (필수)</label>
                                    <div id="agree_alert" style="color: red; font-size:8pt;">결제 진행 필수사항을 동의해주세요.</div>
                                    <div class="check"></div>
                                </div>
                                <p>개인정보 제3자 제공 및 결제대행 서비스 표준 이용약관에 동의하겠습니다. <br>본인은 만 14세 이상이고, 위 내용을 확인하였습니다.
                                </p>
                            </div>
                            <a class="primary-btn" id="pay_go">결제 진행하기</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--================End Checkout Area =================-->
	<%@ include file="../common/footer.jsp" %>
	<script src="resources/js/pay.js"></script>
</body>
</html>