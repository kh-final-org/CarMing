<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CarMing | 캠플레이스</title>
<link rel="stylesheet" href="resources/css/camplace.css">

</head>
<body>
	<section id="header">
		<%@include file ="../common/header.jsp" %>
	</section>
	
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
	
	<section id="content">
		<div class="card-container">
			<div class="row text-center" id="mapcheck">
				<label for="default" class="btn btn-default"><span>전체</span>
					<input type="radio" id="default" class="badgebox" name="campcategory" value="캠핑장" checked="checked">
					<span class="badge">&check;</span>
				</label>
		        <label for="info" class="btn btn-info"><span>카라반</span> 
		        	<input type="radio" id="info" class="badgebox" name="campcategory" value="카라반">
	        		<span class="badge" >&check;</span>
		        </label>
		        <label for="success" class="btn btn-success"><span>글램핑</span> 
		        	<input type="radio" id="success" class="badgebox" name="campcategory" value="글램핑">
		        	<span class="badge">&check;</span>
		        </label>
		        <c:if test="${not empty login}">
			        <label for="warning" class="btn btn-warning"><span>차박 명소</span>
			        	<input type="radio" id="warning" class="badgebox" name="campcategory" value="차박명소">
			        	<span class="badge">&check;</span>
			        </label>
			        <input type="hidden" value="${login.memno }" name="memno">
		        </c:if>
		        
			</div>
			
			<div class="map-info">
				<div class="mapcontent">
					<div id="map"></div>
				</div>
				
				<div class="camptable" id="camptable">
					<div class="camprow" id="camprow">
						<ul id="placesList"></ul>  
					</div>
				</div>
			</div>
		</div>
			
		<div class="map-pagination">
			<ul id="pagination" class="pagenum"></ul>
		</div>
		
		<!-- 여백을 주기 위해 임시로 만들어 놓음 -->
		<table class="table table-hover"></table>
	</section>
    
    <!-- start Footer Area -->
	<%@include file="../../views/common/footer.jsp"%>
	<!-- End Footer Area -->
	
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
	<script src="resources/js/gmaps.min.js"></script>
<!-- 	<script src="resources/js/main.js"></script> -->

	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d642f0ec29fa1aa1c0907815f0c88f11&libraries=services"></script>
	<script src="resources/js/maincamplace.js"></script>

</body>
</html>