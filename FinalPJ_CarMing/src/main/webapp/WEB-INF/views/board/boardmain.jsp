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
<main role="main" style="padding-top: 50px; padding-bottom: 50px;">

<!-- start of container -->
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
			
			<!-- 
			<button class="btn btn-outline-secondary dropdown-toggle" type="button" id="dropdown-category" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">&nbsp;&nbsp;&nbsp;카테고리&emsp;</button>
			<div class="dropdown-menu">
				<ul class="navi">
					<li><a class="dropdown-item" href="#.do?bcategoryno=${dto.bcategoryno }">일반 캠핑</a></li>
					<li><a class="dropdown-item" href="#.do?bcategoryno=${dto.bcategoryno }">카라반</a></li>
					<li><a class="dropdown-item" href="#.do?bcategoryno=${dto.bcategoryno }">글램핑</a></li>
					<li><a class="dropdown-item" href="#.do?bcategoryno=${dto.bcategoryno }">차박</a></li>
					<li><a class="dropdown-item" href="#.do?bcategoryno=${dto.bcategoryno }">나만의 캠핑</a></li>
				</ul>
			</div>
			 -->
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
<!-- end of container -->
</main>	
	
<!-- start paging 
<div class="card-bottom">
	<tr>
		<td colspan="5">
			<!-- 처음 페이지로 이동: 현재 페이지가 1보다 크면 	[<<] 하이퍼 링크를 화면에 출력 -->
		<!-- 	<c:if test="${map.boardPager.curBlock > 1}">
				<a href="javascript:list('1')">[&laquo;]</a>-->
		<!-- 	</c:if>
			<!-- 이전페이지 블록으로 이동: 현재 페이지 블럭이 1보다 크면 [<] 하이퍼링크를 화면에 출력 -->
		<!-- 	<c:if test="${map.boardPager.curBlock > 1}">
				<a href="javascript:list('1')">[&lt;]</a>
			</c:if>
		
			<!-- **하나의 블럭 시작 페이지부터 끝 페이지까지 반복문 실행 -->
		<!-- 	<c:forEach var="num" begin="${map.boardPager.blockBegin}" end="${map.boardPager.blockEnd}">
				<!-- 현재페이지이면 하이퍼링크 제거 -->
		<!-- 		<c:choose>
					<c:when test="${num == map.boardPager.curPage}">
						<span style="color: red">${num}</span>&nbsp;
					</c:when>
					<c:otherwise>
						<a href="javascript:list('${num}')">${num}</a>&nbsp;
					</c:otherwise>
				</c:choose>
			</c:forEach>
			
			<!-- 다음페이지 블록으로 이동 : 현재 페이지 블럭이 전체 페이지 블럭보다 작거나 같으면 [>]하이퍼링크를 화면에 출력 -->
		<!-- 	<c:if test="${map.boardPager.curBlock <= map.boardPager.totBlock}">
				<a href="javascript:list('${map.boardPager.nextPage}')">[&gt;]</a>
			</c:if>
				
			<!-- 끝페이지로 이동 : 현재 페이지가 전체 페이지보다 작거나 같으면 [>>]하이퍼링크를 화면에 출력 -->
		<!-- 	<c:if test="${map.boardPager.curPage <= map.baordPager.totPage}">
				<a href="javascript:list('${map.boardPager.totPage}')">[&raquo;]</a>
			</c:if>
		</td>
	</tr>
</div>
<!-- end paging -->	

	
<!-- start footer Area -->
<!-- end footer Area -->

</body>
</html>