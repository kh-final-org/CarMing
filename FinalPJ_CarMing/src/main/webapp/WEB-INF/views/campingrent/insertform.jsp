<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CarMing</title>
	<link rel="stylesheet" href="resources/css/linearicons.css">
	<link rel="stylesheet" href="resources/css/owl.carousel.css">
	<link rel="stylesheet" href="resources/css/themify-icons.css">
	<link rel="stylesheet" href="resources/css/font-awesome.min.css">
	<link rel="stylesheet" href="resources/css/nice-select.css">
	<link rel="stylesheet" href="resources/css/nouislider.min.css">
	<link rel="stylesheet" href="resources/css/bootstrap.css">
	<link rel="stylesheet" href="resources/css/main.css">
</head>
<body>
	<%@ include file="../common/header_productinsert.jsp" %>
	<div class="comment-form">
                        <h4>제품 등록</h4>
                        <form>
                            <div class="form-group form-inline">
                                <div class="form-group col-lg-6 col-md-6 name">
                                   	 <span>카테고리</span><input type="text" class="form-control" id="category" placeholder="카테고리를 입력해주세요." onfocus="this.placeholder = ''"
                                        onblur="this.placeholder = '카테고리를 입력해주세요.'">
                                </div>
                                <br>
                                <div class="form-group col-lg-6 col-md-6 name">
                                     <span>제품명</span><input type="text" class="form-control" id="name" placeholder="제품명을 입력해주세요. "
                                        onfocus="this.placeholder = ''" onblur="this.placeholder = '제품명을 입력해주세요.'">
                                </div>
                                <br>
                                <div class="form-group col-lg-6 col-md-6 name">
                                    <span>제품 이미지</span><input type="file" class="form-control" id="image">
                                </div>
                                <br>
                                <div class="form-group col-lg-6 col-md-6 name">
                                    <span>제품 설명</span><input type="file" class="form-control" id="descript">
                                </div>
                                <br>
                                <div class="form-group col-lg-6 col-md-6 name">
									<span>렌트 가격</span><input type="number" class="form-control" id="amount" min="1" max="500">
								</div>
								<br>
								<div class="form-group col-lg-6 col-md-6 name">
									<span>렌트 가능한 재고</span><input type="number" class="form-control" id="amount" min="1" max="500">
								</div>
                            </div>              
                            <a href="#" class="primary-btn submit_btn">취소</a>
                            <a href="#" class="primary-btn submit_btn">등록</a>
                        </form>
       </div>
	<%@ include file="../common/footer.jsp" %>
	<script src="js/vendor/jquery-2.2.4.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4"
	 crossorigin="anonymous"></script>
	<script src="js/vendor/bootstrap.min.js"></script>
	<script src="js/jquery.ajaxchimp.min.js"></script>
	<script src="js/jquery.nice-select.min.js"></script>
	<script src="js/jquery.sticky.js"></script>
    <script src="js/nouislider.min.js"></script>
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<!--gmaps Js-->
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCjCGmQ0Uq4exrzdcL6rvxywDDOvfAu6eE"></script>
	<script src="js/gmaps.min.js"></script>
	<script src="js/main.js"></script>
</body>
</html>