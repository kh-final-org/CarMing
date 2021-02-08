<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CarMing | 캠플레이스 - 상세 페이지</title>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<style type="text/css">

.campphoto{
	float : left;
	margin : 40px 40px 40px 20%;
}

.camptable{
	float: right;
	width : 500px;
	height : 400px;
	margin : 40px 20% 40px 40px;
}
.campdata{
}
</style>
</head>
<body>
	<section id="header">
		<%@include file ="../common/header.jsp" %>
	</section>
	
	<section class="banner-area organic-breadcrumb">
		<div class="container">
			<div
				class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
				<div class="col-first">
					<h1>캠플레이스</h1>
				</div>
			</div>

		</div>
	</section>
	

<section id="content">
	<div class="campphoto">
		<img alt="" src="" style="width:500px; height:400px">
	</div>
	
	<div class="camptable">
		<div class="camprow">
			<div class="campdata"><span class="campname">이름</span></div>
			<hr>
			<div class="campdata"><span class=" campcontent">내용</span></div>
			<hr>
			<div class="campdata"><a href="#" class="campdetail">상세보기</a></div>
		</div>
	</div>
</section>
    
     <script src="resources/js/vendor/jquery-2.2.4.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4"
	 crossorigin="anonymous"></script>
	<script src="resources/js/vendor/bootstrap.min.js"></script>
	<script src="resources/js/jquery.ajaxchimp.min.js"></script>
	<script src="resources/js/jquery.nice-select.min.js"></script>
	<script src="resources/js/jquery.sticky.js"></script>
	<script src="resources/js/nouislider.min.js"></script>
	<script src="resources/js/jquery.magnific-popup.min.js"></script>
	<script src="resources/js/owl.carousel.min.js"></script>
	<!-- <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCjCGmQ0Uq4exrzdcL6rvxywDDOvfAu6eE"></script> -->
	<script src="resources/js/gmaps.min.js"></script>
<!--<script src="resources/js/main.js"></script> -->

</body>
</html>