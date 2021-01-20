<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CarMing</title>
<style type="text/css">
	.card-container{margin: 0px 200px; padding-bottom: 50px;}
	
	.card-head-first{float: left;}
	.card-head-second{float: left; margin-left: 610px;}
	.card-head-third{float: right; margin-right: 10px;}
	.card-body{float: left; width: 33.3%; margin-bottom: 20px;}
	
	.uploadimg{width: 360px; height: 360px; border-radius: 10px; transform: scale(1.00); transition: transform .3s;}
	.uploadimg:hover{transform: scale(1.03); transition: transform .3s;}
	.board-uploadimg{overflow: hidden; border-radius: 10px;}
	
	.user-profile{width: 50px; height: 50px;}	
	.board-profile{margin: 0px 0px 8px 8px;}	
	.board-count{width: 360px; font-size: 0.8em; text-align: right; margin: 3px 0px 0px 0px;}
	
	#main-dropdown-menu {width: 120px;} 
	#dropdown-category{width: 140px; text-align: left; border-color: silver;}
	#button-boardinsert{width: 140px; color: #5f5f5f; background-color: #ffe6be;} 
	
	/**********************************************
	.navi li a:hover{background-color: #fff5e9;} 
	***********************************************
	진회색: #5f5f5f, 진노랑: #ffe6be, 연노랑: #fff5e9 */ 
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
               <h1>Camping Talk</h1>
               <nav class="d-flex align-items-center">
                  <a href="index.html">Home<span class="lnr lnr-arrow-right"></span></a>
                  <a href="boardmainform.do">Talk</a>
               </nav>
            </div>
         </div>
      </div>
   </section>
<!-- End Banner Area -->
<main role="main" style="padding-top: 50px; padding-bottom: 50px;">

<!-- Start Container Area -->
<div class="card-container">
	<div class="card-head">
		<div class="card-head-first">
			<h2 style="color: #5f5f5f;  font-family:'Malgun Gothic';">CAMPING TALK</h2>
		</div>
		
		<div class="card-head-second">
			<button type="button" class="btn btn-light" onclick="location.href='boardinsertform.do'" id="button-boardinsert">+ 게시글 쓰기</button>
		</div>
		
		<div class="card-head-third" style="width: 140px;">
			<div class="dropdown-selectbox">
		  		<select class="selectpicker form-control" id="selectbox" aria-label="Example select with button addon">
					<option value="generalCamping" selected>일반 캠핑</option>
				    <option value="caravan">카라반</option>
				    <option value="glamping">글램핑</option>
				    <option value="carCamping">차박</option>
				    <option value="myOwnCamping">나만의 캠핑</option>
			  	</select>
			</div>
		</div>
	</div>
	<br><br><br><br>
	
	<!-- 게시글이 없을 경우 -->
	<c:if test="${empty list }">
			<p>작성된 게시글이 없습니다.</p>
	</c:if>
	
	<!-- 게시글이 있을 경우 -->
	<c:forEach items="${list }" var="dto">
		<div class="card-body" style="padding: 0px">
			<!-- 프로필 사진/아이디 -->
			<div class="board-profile">
				<a href="profileform.do"><img class="user-profile" src="./resources/img/profile.png" alt="profile-photo"></a>&nbsp; 
				<span style="font-size:1.2em;">&nbsp;${dto.brdwriter}</span>
			</div>	
			<!-- 사용자가 업로드한 이미지 -->
			<div class="board-uploadimg">
				<a href="boarddetailform.do?brdno=${dto.brdno }"><img class="uploadimg" src="./resources/img/boardUpload/${dto.brdfile}"></a><br>
				<div class="board-count">조회수 ${dto.brdcount}</div>
			</div>
		</div>
	</c:forEach>
</div>
<!-- End Container Area -->

</main>	
</body>
</html>