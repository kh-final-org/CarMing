<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="com.finalPJ.carming.model.dto.MemberDto" %>  
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CarMing</title>
<style type="text/css">
	.card-container{width: 100%;}

	.card-profile{float: left; width: 27%; height: 400px; margin-right: 80px; margin-top: 40px; border-radius: 10px; box-shadow: 10px 10px 30px silver;}	
	.profilepage-profile{margin: 70px 63px 25px 63px;}	
	.user-profile{width: 170px; height: 170px; border-radius: 5em;}
	.user-id{font-size:1.6em; margin: 15px 38px 10px 38px; width: 100px; text-align: center;}
	.profilepage-message{margin: 10px 0px 10px 95px;}
	.user-message{width: 30px; height: 30px;opacity: 35%;}
	.user-message-text{font-size:1.2em; color: silver;}
	
	.card-board{float: right; width: 65.5%; height: 100%;}
	.boardlistup{float: left; width: 33.3%}
	.card-boardtext{font-size:1.8em; margin-bottom: 17px;color: #5f5f5f;}
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
      <div
         class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
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
	<!-- 사용자 프로필 -->
	<div class="card-profile">
		<div class="profilepage-profile">
			<img class="user-profile" src="./resources/img/profile.png" alt="profile-photo">
			<div class="user-id">${dto.brdwriter }</div>
		</div>
		<div class="profilepage-message">
			<a href="privateform.do?memno=${dto.memno }">
				<img class="user-message" src="./resources/img/message.png">
				<span class="user-message-text">&nbsp;1:1 채팅</span>
			</a>
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
					<a href="boarddetailform.do?brdno=${dto.brdno }&memno=${dto.memno}">
						<img class="boardlist-img" src="./resources/img/boardUpload/${dto.brdfile }">
					</a>
				</div>
			</div>
		</c:forEach>
	</div>	
</div>
<!-- End Container Area -->

<!-- 여백을 주기 위해 임시로 만들어 놓음 -->
<table class="table table-hover"></table>

<!-- Start Paging Area -->
<div class="container ml-auto" id="paging-container" align="center">
	<nav aria-label="Page navigation example">
		<ul class="pagination justify-content-center">
			<c:set var="page" value="${(empty param.page) ? 1 : param.page}"/>
			<c:set var="startNum" value="${page - (page-1) % 5}"/>
			<c:set var="lastNum" value="15"/>
			
			<!-- 이전 버튼 -->
			<div>
			  	<c:if test="${startNum > 1}">
			    	<a href="?page=${startNum - 1 }" class="page-link text-warning" aria-label="Next">&laquo;</a>
			  	</c:if>
			  	<c:if test="${startNum <= 1 }">
			    	<span class="page-link text-warning" onclick="alert('이전 페이지가 없습니다.');" style="margin:50px;">&laquo;</span>
		  		</c:if>
		  	</div>
			
			<!-- 페이징 목록 -->
			<c:forEach var="i" begin="0" end="4">
				<li class="page-item"><a class="page-link text-warning" href="?memno=${dto.memno }&page=${startNum + i }">${startNum + i }</a></li>
			</c:forEach>
		  			
		  	<!-- 다음 버튼 -->
		  	<div>
			  	<c:if test="${startNum + 5 < lastNum }">
			    	<a href="?page=${startNum + 5 }" class="page-link text-warning" aria-label="Next">&raquo;</a>
			  	</c:if>
			  	<c:if test="${startNum + 5 >= lastNum }">
			    	<span id="dd" aria-label="Next" onclick="alert('다음 페이지가 없습니다.');">&raquo;</span>
		  		</c:if>
		  	</div>
		  	
		</ul>
	</nav>
</div>
<!-- End Paging Area  -->

</main>
</body>
</html>