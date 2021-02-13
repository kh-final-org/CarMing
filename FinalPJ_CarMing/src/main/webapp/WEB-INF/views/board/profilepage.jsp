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
<style type="text/css">
	.col-first{margin: -1% 63.5% 0 -18%; } 
	.col-first > .maintext{font-weight: bold; font-size: 2.0em; color: #fff; text-align: left;}
	.text-1{margin: -5% 0 3%;}
	.card-container{width: 100%;}

	.card-profile{float: left; width: 27%; height: 400px; margin: 3.8% 5% 0 0; 
				  border-radius: 10px; box-shadow: 10px 10px 30px rgba(0, 0, 0, 0.14);}	
	.profilepage-profile{margin: 22% 21.5%;}	
	.user-profile{width: 170px; height: 170px; border-radius: 5em;}
	.user-id{font-size:1.6em; margin: 8% 23%; width: 100px; text-align: center; font-weight: bold;}
	.profilepage-message{margin: -13% 25%; width: 80%;}
	.user-message{width: 30px; height: 30px; opacity: 0.6;}
	.user-message-text{font-size:1.2em; color: gray;}
	#member-report-target{font-size: 1.2em; color: silver;}
	
	.card-board{float: right; width: 65.5%; height: 100%;}
	.card-boardtext{font-size:1.8em; margin-bottom: 17px; color: #5f5f5f;}
	.boardlistup{float: left; width: 33.3%}
	.boardlistup-frame{position: relative; width: 235px; height: 235px; overflow: hidden; border-radius: 5px;}
	.boardlist-img{width: 235px; height: 235px; border-radius: 5px; transform: scale(1.00);	transition: transform .2s;}
	.boardlist-img:hover{transform: scale(1.02); transition: transform .2s;}
	.boardlistup{overflow: hidden; border-radius: 5px; margin-bottom: 10px;}
	
	.board-uploadimg-frame{display: relative;}
	.video-thumbnail-img{position: relative;}
	.video-icon{position: absolute; z-index: 5; top: 5px; left: 200px; cursor: pointer;}
	.video-icon > img {width: 25px; height: 100%; opacity: 0.5;}
	
	#board-photo{float: left;}
	
</style>	

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
			<img class="user-profile" src="./resources/img/profile.png" alt="profile-photo">
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