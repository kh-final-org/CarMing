<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<style type="text/css">
#mapcheck{
    margin-top: 40px;
    place-content: center;

}
/* Hiding the checkbox, but allowing it to be focused */
.badgebox
{
    opacity: 0;
    
}

.badgebox + .badge
{
    /* Move the check mark away when unchecked */
    text-indent: -999999px;
    /* Makes the badge's width stay the same checked and unchecked */
	width: 20px;
}

.badgebox:focus + .badge
{
    /* Set something to make the badge looks focused */
    /* This really depends on the application, in my case it was: */
    
    /* Adding a light border */
    box-shadow: inset 0px 0px 5px;
    /* Taking the difference out of the padding */
}

.badgebox:checked + .badge
{
    /* Move the check mark back when checked */
	text-indent: 0;
}
.mapcontent{
	float : right;
	margin : 40px 20% 40px 40px;
}
.btn{
	margin-left : 40px;
	font-size: 2rem !important;
	
}
.btn-default {
	border-color: #ccc !important;
}
.camptable{
	float: left;
	width : 500px;
	height : 400px;
	margin : 40px 40px 5px 20%;
	overflow : auto;
}
.campdata{
	width : 33%;
	float : left;
	text-align : center;
}
.pagenum{
	clear: both;
	margin-left : 20%;
	width : 500px;
	text-align: center;
}
.pagenum>a{
	width: 30px;
    border-radius: 3px;
    float: left;
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
	
	<div>
		<div class="row text-center" id="mapcheck">
	        <br>
			<label for="default" class="btn btn-default">전체 <input type="radio" id="default" class="badgebox" name="campcategory" value="캠핑장" checked="checked"><span class="badge">&check;</span></label>
	        <label for="primary" class="btn btn-primary">오토 <input type="radio" id="primary" class="badgebox" name="campcategory" value="오토캠핑장"><span class="badge">&check;</span></label>
	        <label for="info" class="btn btn-info">카라반 <input type="radio" id="info" class="badgebox" name="campcategory" value="카라반"><span class="badge" >&check;</span></label>
	        <label for="success" class="btn btn-success">글램핑 <input type="radio" id="success" class="badgebox" name="campcategory" value="글램핑"><span class="badge">&check;</span></label>
	        <c:if test="${not empty login}">
	        <label for="warning" class="btn btn-warning">차박명소 <input type="radio" id="warning" class="badgebox" name="campcategory" value="차박명소"><span class="badge">&check;</span></label>
	        <input type="hidden" value="${login.memno }" name="memno">
	        </c:if>
		</div>
		<div>
		<div class="mapcontent">
			<div id="map" style="width:500px;height:400px;"></div>
		</div>
		
		<div class="camptable" id="camptable">
			<div class="camprow" id="camprwo">
				<ul id="placesList"></ul>  
				   	
			</div>
			
		</div>
			<ul id="pagination" class="pagenum"></ul>
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
	<script src="resources/js/gmaps.min.js"></script>
	<script src="resources/js/main.js"></script>

	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d642f0ec29fa1aa1c0907815f0c88f11&libraries=services"></script>
	<script src="resources/js/maincamplace.js"></script>

</body>
</html>