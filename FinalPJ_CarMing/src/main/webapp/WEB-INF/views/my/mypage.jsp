<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CarMing | 마이페이지</title>
<style type="text/css">
	.card-container{width: 100%;}
		
	.card-profile{float: left; width: 27%; height: 400px; margin-right: 2%; margin-top: 40px; 
				  border-radius: 10px; box-shadow: 10px 10px 30px rgba(0, 0, 0, 0.14);}	
	.profilepage-profile{margin: 55px 63px 25px;}	
	.user-profile{width: 170px; height: 170px; border-radius: 5em;}
	.user-id{font-size:1.6em; margin: 15px 38px 10px 38px; width: 100px; text-align: center;}
	.user-email{font-size:1.2em; color: silver; margin: -5% 2% 0; text-align: center;}
	.my-desc{padding: 0 7%; margin-top: -1%; text-align: center}
	.profile-btn{width: 140px; padding: 8px 0 10px; line-height: 20px; border: 0; border-radius: 4px; outline: none;
				font-size: 1.15em; text-align: center; color: #5f5f5f; background-color: #ffe6be; cursor: pointer;}
	.profile-btn:hover{background: #ffdb9f; transition: 0.2s;}
	#profile-btn-1{width: 115px !important; margin-right: 2px;}
	#profile-btn-1{margin: 0;}
	.card-mypage-title{font-size:1.8em; margin-bottom: 17px; color: #5f5f5f;}

	.card-board{float: right; width:65.5%; height: 100%;}
	.card-boardtext{font-size:1.8em; margin-bottom: 17px; color: #5f5f5f;}
	.boardlistup{float: left; width: 33.3%}
	.boardlistup-frame{position: relative; padding: 10%; width: 235px; height: 235px; overflow: hidden; border-radius: 5px;}
	.boardlist-img{width: 235px; height: 235px; border-radius: 5px; transform: scale(1.00);	transition: transform .2s;}
	.boardlist-img:hover{transform: scale(1.02); transition: transform .2s;}
	.boardlistup{overflow: hidden; border-radius: 5px; margin-bottom: 10px;}
	.card-boardlist-board{margin-bottom: 5%; width: 100%;}
	#board-photo{float: left;}
	
	/* 맵 css */


	
	.mapcontent{float : left; width: 50%;}
	#map{width: 540px; height: 450px; border-radius: 10px;}
	.map-info{margin-top: 50px;}
	
	.camptable{float: right; width: 40%; width: 540px; height: 450px; overflow: auto; }
	.campdata{width: 33%; float: left; text-align: center;}
	

</style>

</head>
<body>
	<%@ include file="../common/header.jsp" %>
	<!-- Start Banner Area -->
	<section class="banner-area organic-breadcrumb">
	   <div class="container">
	      <div class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
	         <div class="col-first">
	            <h1>The stars in the night sky</h1>
	            <nav class="d-flex align-items-center">
	               <a href="home.do"><span class="lnr lnr-home"></span>Home</a>&emsp;
	               <a href="#"><span class="lnr lnr-arrow-right-circle"></span>Camping</a>
	            </nav>
	         </div>
	      </div>
	   </div>
	</section>
	<!-- End Banner Area -->
	<main role="main" style="padding: 50px 200px 40px; ">
	
	<!-- Start Container Area -->
	<div class="card-container">
		<!-- 사용자 프로필 -->
		<div class="card-profile">
			<div class="profilepage-profile">
				<img class="user-profile" src="${login.memfile}" alt="">
				<div class="user-id"><strong>${login.memnick }</strong></div>
				<div class="user-email">${login.memid }</div>
			</div>
			<div class="my-desc" >
				<input type="button" class="profile-btn" id="profile-btn-1" value="프로필 수정" onclick="location.href='profilechangeform.do'">
				<br>
				<button type="button" class="profile-btn" id="profile-btn-2" onclick="location.href='ordernpay.do'">주문 및 결제 내역</button>
			</div>
		</div>
		</div>
		
		<!-- Start BoardList/Map Area -->
			<div class="card-board" >
			<!-- 내 게시글  -->
			<div class="card-boardtext">내 게시글 </div>
					<!-- 게시글이 없을 경우 -->
					<c:if test="${empty list }">
						<p>작성된 게시글이 없습니다.</p>
					</c:if>
					
					<!-- 게시글이 있을 경우 -->
					<c:forEach items="${list }" var="dto">
						<div class="card-boardlist">
							<div class="boardlistup" id="board-photo">
								<div class="boardlistup-frame">
									<a href="boarddetailform.do?brdno=${dto.brdno }&memno=${dto.memno}">
										<img class="boardlist-img" src="resources/img/board/${dto.brdfilename }">
									</a>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			<div class="card-board" >
				<!-- ==================================================================================================
				================================================ paging ================================================ -->
			<c:set var="page" value="${(empty param.page) ? 1 : param.page}"></c:set>
			<c:set var="startNum" value="${page - (page-1) % 5}"></c:set>
			<c:set var="lastNum" value="${fn:substringBefore(Math.ceil(count/6), '.')}"></c:set>
			<!-- 현재 페이지 -->
			<div class="hint-text">
					Showing <b>${(empty param.page) ? 1:param.page}</b> out of <b>${lastNum }</b> pages
			</div>
			<!-- paging 버튼  -->
			<div class="container ml-auto" id="paging-container" align="center">
				<nav aria-label="Page navigation example">
					<ul class="pagination justify-content-center" style="border-left: 0px;">
						<!-- 이전 버튼 -->
						<c:if test="${startNum > 1 }">
							<li class="page-item">
								<a class="page-link text-warning" href="?page=${startNum - 1 }&search=${param.search}" aria-label="Previous">
					 				<span aria-hidden="true" class="btn-prev">&laquo;</span>
						    	</a>
						   	</li>
						</c:if>		
					
						<c:if test="${startNum <= 1 }">
							<li class="page-item">
								<a class="page-link text-warning" aria-label="Previous">
					 				<span aria-hidden="true" class="btn-prev" onclick="alert('이전 페이지가 없습니다.');">&laquo;</span>
					    		</a>
						   	</li>
						</c:if>
					
						<c:forEach var="i" begin="0" end="4">
							<c:if test="${(startNum + i ) <= lastNum }">
							<!-- 현재 페이지 style 변경 -->
							<li class="page-item"><a class="page-link text-warning ${(page == (startNum + i)) ? 'active' : ''}" href="?page=${startNum + i }&search=${param.search}">${startNum + i }</a></li>
							</c:if>
						</c:forEach>
					  			
					  	<!-- 다음 버튼 -->
					  	<c:if test="${startNum + 4 < lastNum }">
						    <li class="page-item">
						    	<a class="page-link text-warning" href="?page=${startNum + i }&search=${param.search}" aria-label="Next">
						    		<span aria-hidden="true">&raquo;</span>
						      	</a>
						   	</li>
					  	</c:if>
					  	
					  	<c:if test="${startNum + 4 >= lastNum }">
						    <li class="page-item">
						    	<a class="page-link text-warning" aria-label="Next">
						    		<span aria-hidden="true" onclick="alert('다음 페이지가 없습니다.');">&raquo;</span>
						      	</a>
						   	</li>
					  	</c:if>	
					</ul>
				</nav>
			</div>
			</div>
		
			<!-- ==================================================================================================
				================================================ paging ================================================ -->
		
			<table class="table table-hover"></table>
			<div class="card-board" >
			<div class="card-mypage-title">내 캠핑맵</div>

			<input type="radio" name="campcategory" id="campcategory" checked="checked" value="차박명소" style="display:none"/>
			<input type="hidden" value="${login.memno }" name="memno">

			<div class="map-info">
				<div class="mapcontent">
					<div id="map" style="width:100%;height:350px;"></div>
				</div>
				
				<div class="camptable" id="camptable" style="width:40%;">
					<div class="camprow" id="camprow">
						<ul id="placesList"></ul>  
					</div>
				</div> 
				</div>
			</div>
		
		<!-- End BoardList/Map Area -->
	<!-- End Container Area -->
	<table class="table table-hover"></table>
	</main>
	
	<%@ include file="../common/footer.jsp" %>
</body>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d642f0ec29fa1aa1c0907815f0c88f11&libraries=services"></script>
<script src="resources/js/maincamplace.js"></script>
</html>