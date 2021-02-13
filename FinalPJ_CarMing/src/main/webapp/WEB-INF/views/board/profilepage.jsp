<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CarMing | 캠핑토크 - 프로필 페이지</title>
<link rel="stylesheet" href="resources/css/profilepage.css">
	
</head>
<body>
<!-- Start Header Area -->
<%@include file="../common/header.jsp"%>
<!-- End Header Area -->

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
<main role="main" style="padding: 50px 200px; ">

<!-- Start Container Area -->
<div class="card-container">
	<!-- 사용자 프로필/신고 -->
	<div class="card-profile">
		<div class="profilepage-profile">
			<img class="user-profile" src="./resources/img/${mem.memfile }" alt="">
			<div class="user-id"><strong></strong>${mem.memnick}</div>
		</div>
		<div class="profilepage-message">
			<a href="privateform.do?memno=${mem.memno }">
				<img class="user-message" src="./resources/img/message.png">
				<span class="user-message-text">&nbsp;1:1 채팅</span>
			</a>&nbsp;&middot;&nbsp;
			<a href="writereportform.do?targetNo=${mem.memno }&targetTypeNo=3" class="board-report-target3" id="member-report-target">신고</a>
		</div>
	</div>
	
	<div class="card-board">
		<div class="card-boardtext">게시글 보기</div>
		
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
</div>
<!-- End Container Area -->

<!-- 여백을 주기 위해 임시로 만들어 놓음 -->
<table class="table table-hover"></table>
</main>

<!-- start Footer Area -->
<%@include file="../../views/common/footer.jsp"%>
<!-- End Footer Area -->

</body>
</html>