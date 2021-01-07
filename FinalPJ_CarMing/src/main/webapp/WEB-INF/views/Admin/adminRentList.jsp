<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>렌트 목록</title>
<!-- Mobile Specific Meta -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Favicon-->
<link rel="shortcut icon" href="resources/img/fav.png">
<!-- Author Meta -->
<meta name="author" content="CodePixar">
<!-- Meta Description -->
<meta name="description" content="">
<!-- Meta Keyword -->
<meta name="keywords" content="">
<!-- meta character set -->
<meta charset="UTF-8">


<!--
		CSS
		============================================= -->
<link rel="stylesheet" href="resources/css/linearicons.css">
<link rel="stylesheet" href="resources/css/owl.carousel.css">
<link rel="stylesheet" href="resources/css/themify-icons.css">
<link rel="stylesheet" href="resources/css/font-awesome.min.css">
<link rel="stylesheet" href="resources/css/nice-select.css">
<link rel="stylesheet" href="resources/css/nouislider.min.css">
<link rel="stylesheet" href="resources/css/bootstrap.css">
<link rel="stylesheet" href="resources/css/main.css">
<link rel="stylesheet" href="resources/css/adminList.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"
	integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4"
	crossorigin="anonymous"></script>
<script src="resources/js/vendor/bootstrap.min.js"></script>
<script src="resources/js/jquery.ajaxchimp.min.js"></script>
<script src="resources/js/jquery.nice-select.min.js"></script>
<script src="resources/js/jquery.sticky.js"></script>
<script src="resources/js/nouislider.min.js"></script>
<script src="resources/js/jquery.magnific-popup.min.js"></script>
<script src="resources/js/owl.carousel.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<!--gmaps Js-->
<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCjCGmQ0Uq4exrzdcL6rvxywDDOvfAu6eE"></script>
<script src="resources/js/gmaps.min.js"></script>
<script src="resources/js/main.js"></script>

<script>
$(document).ready(function(){
	$('[data-toggle="tooltip"]').tooltip();
});
</script>
</head>
<body>
<!-- Start Header Area -->
	<%@include file="../tipAndRecipe/header.jsp"%>
	<!-- End Header Area -->
	<br>
	<!-- Start Banner Area -->
	<section class="banner-area organic-breadcrumb">
		<div class="container">
			<div
				class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
				<div class="col-first">
					<br>
					<h1>렌트</h1>
					<nav class="d-flex align-items-center">
						<a href="tipAndRecipeMain.do">렌트<span
							class="lnr lnr-arrow-right"></span></a> <a href="category.html">목록</a>
					</nav>
				</div>
			</div>
			<div class="section-top-border text-right">
				<div class="button-group-area mt-40" style="padding-bottom: 5em">
					<a href="tipAndRecipeMain.do"
						class="genric-btn danger-border e-large">목록으로</a> <a
						href="writeinquiryform.do"
						class="genric-btn danger-border e-large">새 글 작성하기</a>
				</div>
			</div>
		</div>
	</section>
	<!-- End Banner Area -->

	<div class="blog_right_sidebar" style="width: 30%; float: right; background-color: white; border: 0px;">
		<aside class="single_sidebar_widget search_widget">
			 <div class="input-group">
				<input type="text" class="form-control" placeholder="상품 검색하기"
					onfocus="this.placeholder = ''" onblur="this.placeholder = '상품 검색하기'">
				<span class="input-group-btn">
					<button class="btn btn-default" type="button">
						<i class="lnr lnr-magnifier"></i>
					</button>
				</span>
			</div>
		</aside>
	</div>

	<div class="container-xl">
    <div class="table-responsive">
            <table class="table table-striped table-hover" style="text-align: center;">
                <thead>
                    <tr>
                        <th>NO.</th>			
                        <th>닉네임</th>
                        <th>카테고리</th>
                        <th>결제번호</th>
                        <th>렌트 시작날짜</th>
                        <th>렌트 종료날짜</th>
                        <th>렌탈현황</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><a href="adminRentDetail.do">1</a></td>
                        <td><a href="#"><img src="resources/img/tipandrecipe/honey.jpg" class="avatar" alt="Avatar"> camlove</a></td>
                        <td>캠핑용품</td>                        
                        <td>#12345</td>
                        <td>2020/12/30</td>
                        <td>2020/12/31</td>
                        <td><span class="status text-warning">&bull;</span> 렌트중</td>
                    </tr>
                   <tr>
                        <td><a href="adminRentDetail.do">2</a></td>
                        <td><a href="#"><img src="resources/img/tipandrecipe/honey.jpg" class="avatar" alt="Avatar"> camlove</a></td>
                        <td>캠핑용품</td>                        
                        <td>#12345</td>
                        <td>2020/12/30</td>
                        <td>2020/12/31</td>
                        <td><span class="status text-warning">&bull;</span> 렌트중</td>
                    </tr>
                   <tr>
                        <td><a href="adminRentDetail.do">3</a></td>
                        <td><a href="#"><img src="resources/img/tipandrecipe/honey.jpg" class="avatar" alt="Avatar"> camlove</a></td>
                        <td>캠핑용품</td>                        
                        <td>#12345</td>
                        <td>2020/12/30</td>
                        <td>2020/12/31</td>
                        <td><span class="status text-danger">&bull;</span> 연체</td>
                    </tr>
                    <tr>
                        <td><a href="adminRentDetail.do">4</a></td>
                        <td><a href="#"><img src="resources/img/tipandrecipe/honey.jpg" class="avatar" alt="Avatar"> camlove</a></td>
                        <td>캠핑용품</td>                        
                        <td>#12345</td>
                        <td>2020/12/30</td>
                        <td>2020/12/31</td>
                        <td><span class="status text-success">&bull;</span> 반납 </td>
                    </tr>
                    <tr>
                        <td><a href="adminRentDetail.do">5</a></td>
                        <td><a href="#"><img src="resources/img/tipandrecipe/honey.jpg" class="avatar" alt="Avatar"> camlove</a></td>
                        <td>캠핑용품</td>                        
                        <td>#12345</td>
                        <td>2020/12/30</td>
                        <td>2020/12/31</td>
                        <td><span class="status text-warning">&bull;</span> 렌트중</td>
                    </tr>
                </tbody>
            </table>
			<div class="clearfix">
				<div class="hint-text" style="margin-left: 2%;">
					Showing <b>5</b> out of <b>25</b> entries
				</div>
				<ul class="pagination">
					<li class="page-item"><a href="#" class="page-link"
						aria-label="Previous"> <span aria-hidden="true"> <span
								class="lnr lnr-chevron-left"></span>
						</span>
					</a></li>
					<li class="page-item"><a href="#" class="page-link">1</a></li>
					<li class="page-item"><a href="#" class="page-link">2</a></li>
					<li class="page-item active"><a href="#" class="page-link">3</a></li>
					<li class="page-item"><a href="#" class="page-link">4</a></li>
					<li class="page-item"><a href="#" class="page-link">5</a></li>
					<li class="page-item"><a href="#" class="page-link"
						aria-label="Next"> <span aria-hidden="true"> <span
								class="lnr lnr-chevron-right"></span>
						</span>
					</a></li>
				</ul>
			</div>
		</div>
    </div>

		<!-- start footer Area -->
		<%@include file="../../views/common/footer.jsp"%>
		<!-- End footer Area -->
	</body>
</html>