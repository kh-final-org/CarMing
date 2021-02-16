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
<link rel="stylesheet" href="resources/css/mypage.css">

<style type="text/css">
	.mapcontent{float : left; width: 50%;}
	#map{width: 500px; height: 400px; border-radius: 10px;}
	.map-info{margin-top: 10px;}
	</style>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d642f0ec29fa1aa1c0907815f0c88f11&libraries=services"></script>
<script src="resources/js/maincamplace.js?ver=2"></script>

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
	      <div class="section-top-border text-right" id="banner-text-2">
	       	 <div class="button-group-area mt-40" style="padding-bottom: 5em">
	       	 	<button class="banner-btn" id="golist" type="button" onclick="location.href='writeinquiryform.do'">문의하기</button>
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
				<div class="user-id"><strong>${login.memnick}</strong></div>
				<div class="user-email">${login.memid}</div>
			</div>
			<div class="my-desc">
				<input type="button" class="profile-btn" id="profile-btn-1" value="프로필 수정" onclick="location.href='profilechangeform.do'">&middot;
				<button type="button" class="profile-btn" id="profile-btn-2" onclick="location.href='ordernpay.do'">주문 및 결제 내역</button>
			</div>
		</div>
		</div>
		
		<!-- Start BoardList/Map Area -->
			<div class="card-board" >
			<!-- 내 게시글  -->
			<div class="card-mypage-title">내 게시글 </div>
					<!-- 게시글이 없을 경우 -->
					<c:if test="${empty list }">
						<p>작성된 게시글이 없습니다.</p>
					</c:if>
					
					<!-- 게시글이 있을 경우 -->
					<c:forEach items="${list }" var="dto">
						<div class="card-boardlist">
							<div class="boardlistup" id="board-photo">
								<div class="boardlistup-frame">
									<c:choose>
										<c:when test="${dto.brdvideoname eq 'N' }">
											<a href="boarddetailform.do?brdno=${dto.brdno }&memno=${dto.memno}">
												<img class="boardlist-img" src="resources/img/board/${dto.brdfilename }">
											</a>
										</c:when>
										
										<c:when test="${dto.brdvideoname ne 'N' }">
											<div class="video-icon">
												<img class="user-profile" src="./resources/img/video.png">
											</div>
											<div class="video-thumbnail-img">
												<a href="boarddetailform.do?brdno=${dto.brdno }&memno=${dto.memno}">
													<img class="boardlist-img" src="resources/img/board/${dto.brdfilename }">
												</a>
											</div>
										</c:when>
									</c:choose>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
				<!-- ==================================================================================================
				================================================ paging ================================================ -->
			<div class="card-board-paging" >
			<c:set var="page" value="${(empty param.page) ? 1 : param.page}"></c:set>
			<c:set var="startNum" value="${page - (page-1) % 5}"></c:set>
			<c:set var="lastNum" value="${fn:substringBefore(Math.ceil(count/6), '.')}"></c:set>
			<!-- 현재 페이지 -->
<!-- 			<div class="hint-text"> -->
<%-- 					Showing <b>${(empty param.page) ? 1:param.page}</b> out of <b>${lastNum }</b> pages --%>
<!-- 			</div> -->
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
			<input type="hidden" value='pagemy' name="pagename">

				<div class="map-info">
					<div class="mapcontent">
						<div id="map" style="width:100%;"></div>
					</div>
					<div class="camptable" id="camptable" style="width: 45%; height: 400px;">
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
</html>