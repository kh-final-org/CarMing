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
<title>CarMing</title>
<style type="text/css">
	.card-container{width: 100%;}

	.card-profile{float: left; width: 27%; height: 400px; margin-right: 80px; margin-top: 40px; 
				  border-radius: 10px; box-shadow: 10px 10px 30px rgba(0, 0, 0, 0.14);}	
	.profilepage-profile{margin: 70px 63px 25px 63px;}	
	.user-profile{width: 170px; height: 170px; border-radius: 5em;}
	.user-id{font-size:1.6em; margin: 15px 38px 10px 38px; width: 100px; text-align: center;}
	.profilepage-message{margin: 10px 0px 10px 74px;}
	.user-message{width: 30px; height: 30px;opacity: 0.6;}
	.user-message-text{font-size:1.2em; color: gray;}
	#member-report-target{font-size: 1.2em; color: silver;}
	
	.card-board{float: right; width: 65.5%; height: 100%;}
	.card-boardtext{font-size:1.8em; margin-bottom: 17px;color: #5f5f5f;}
	.boardlistup{float: left; width: 33.3%}
	.boardlistup-frame{position: relative; width: 235px; height: 235px; overflow: hidden; border-radius: 5px;}
	.boardlist-img{width: 235px; height: 235px; border-radius: 5px; transform: scale(1.00);	transition: transform .2s;}
	.boardlist-img:hover{transform: scale(1.02); transition: transform .2s;}
	.boardlistup{overflow: hidden; border-radius: 5px; margin-bottom: 10px;}
	
	#board-photo{float: left;}
	
	#paging-container{margin: 50px 0px 20px 0px;}
	div #dd{display: inline-block;}
	
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
         <div class="col-first">
            <h1>The stars in the night sky</h1>
            <nav class="d-flex align-items-center">
               <a href="index.html">Home<span class="lnr lnr-arrow-right"></span></a>
               <a href="boardmainform.do">Talk</a>
            </nav>
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
			<div class="user-id"><strong></strong>${login.memnick}</div>
		</div>
		<div class="profilepage-message">
			<a href="privateform.do?memno=${mem.memno }">
				<span class="user-message-text">&nbsp;프로필 수정</span>
			</a><br>
			<a href="ordernpay.do">
				<span class="user-message-text">주문 및 결제 내역</span>
			</a>
		</div>
	</div>
	
	<div class="card-board">
		<div class="card-boardtext">나만의 게시글</div>
		
		<!-- 게시글이 없을 경우 -->
		<c:if test="${empty list }">
			<p>작성된 게시글이 없습니다.</p>
		</c:if>
		
		<!-- 게시글이 있을 경우 -->
			<div class="card-boardlist">
				<div class="boardlistup" id="board-photo">
					<div class="boardlistup-frame">
						<a href="">
							<img class="boardlist-img" src="resources/img/board/${dto.brdfilename }">
						</a>
					</div>
				</div>
			</div>
	</div>
	<!-- 나만의 캠핑맵 -->
	<div class="card-board">
		<div class="card-boardtext">나만의 캠핑맵</div>
		
		<!-- 게시글이 없을 경우 -->
		<c:if test="${empty list }">
			<p>작성된 게시글이 없습니다.</p>
		</c:if>
		
		<!-- 게시글이 있을 경우 -->
			<div class="card-boardlist">
				<div class="boardlistup" id="board-photo">
					<div class="boardlistup-frame">
						<a href="">
							<img class="boardlist-img" src="resources/img/board/${dto.brdfilename }">
						</a>
					</div>
				</div>
			</div>
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