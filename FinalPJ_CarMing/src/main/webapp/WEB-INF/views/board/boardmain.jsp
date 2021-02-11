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
<title>CarMing | 캠핑토크</title>
<style type="text/css">
	.card-container{width: 100%;}

	.card-head-first{float: left;}
	.card-head-second{float: left; margin-left: 605px;}
	.card-head-third{position: absolute; top: 406px; right: 205px; float: right; margin-right: 10px;}
	
	.card-body{float: left; width: 33.3%; margin-bottom: 20px;}
	.user-profile{width: 50px; height: 50px; border-radius: 5em;}	
	.board-usernick{font-size: 1.2em; font-weight: bold;}
	.uploadimg{width: 360px; height: 360px; transform: scale(1.00); transition: transform .3s; border-radius: 10px;}
	.uploadimg:hover{transform: scale(1.03); transition: transform 0.3s; border-radius: 10px;}
	.board-uploadimg-frame{position: relative; width: 360px; height: 360px; overflow: hidden; border-radius: 10px;}
	.board-profile{margin: 0px 0px 8px 8px;}	
	.board-count{width: 360px; font-size: 0.8em; text-align: right; margin: 3px 0px 0px 0px;}
	
	#button-boardinsert{width: 140px; color: #5f5f5f; background-color: #ffe6be;}
	.upload-btn{width: 140px; padding: 8px 0 10px; line-height: 20px; border: 0; border-radius: 4px;
				font-size: 1.15em; text-align: center; color: #5f5f5f; background-color: #ffe6be; cursor: pointer;}
	.upload-btn:hover{background: #ffdb9f; transition: 0.2s;}
	.current{padding-left: 5px;}
	li.option.selected.disabled.focus{width: 140px;}
	#popout-layout{position: absolute; z-index: 1000; margin-top: 8px; padding: 10px 20px; 
				   border-radius: 5px; background: #fff; box-shadow: 1.5px 1.5px 6px silver;}
	.nice-select:hover{background: rgba(136, 126, 126, 0.04); transition: 0.2s;}
	.content-item-icon{float: left;}
	.content-item-content{float: right; color: gray;}
	
	.content-item-content-title{font-weight: bold; font-size: 1em; margin-top: 5px;}
	.content-item-content-subtitle{font-size: 0.8em; margin-top: -5px; margin-bottom: 5px;}
	.upload-icon-photo{width: 25px; height: 25px; opacity: 0.3; margin-top: 12px; margin-right: 12px;}
	.upload-icon-video{width: 25px; height: 25px; opacity: 0.3; margin-top: 28px; margin-right: 12px;}
	 
	.board-uploadimg-frame{display: relative;}
	.video-thumbnail-img{position: relative;}
	.video-icon{position: absolute; z-index: 5; top: 10px; left: 315px; cursor: pointer;}
	.video-icon > img {width: 30px; height: 100%; opacity: 0.3;}
	
	
	#paging-container{margin: 50px 0px 20px 0px;}
	
	/* 진회색: #5f5f5f, 연연회색:#e2e2e2, 흰색 위 hover: #fafafa,
	       주황색: #ff9b00, 쨍한 노랑: #ffba00; 진진노랑(hover): #ffdb9f; 진노랑: #ffe6be, 연노랑: #fff5e9 */ 
</style>

<script type="text/javascript">
	function myFunction() {
	    var selectbox, filter, a, txtValue, list;
	    selectbox = document.getElementById("selectbox");
	    filter = selectbox.value
	
	    list = document.getElementsByClassName("card-body");

	    for(i=0; i<list.length; i++){
	        a = document.getElementsByClassName("category")[i];
	        txtValue = a.textContent || a.innerText;
	       
	        if (txtValue.indexOf(filter) > -1 ) {
	        	list[i].style.display = "";
	        } else {
	        	list[i].style.display = "none";					
	        }
		}
	}
</script>
<script type="text/javascript">
	function showall() {
		list = document.getElementsByClassName("card-body");
		 for(i=0; i<list.length; i++){
			 list[i].style.display ="";
		 }
	}
</script>
<script>
	function popoutFunction() {
		var x = document.getElementById("upload-popout");
			if (x.style.display == "none") {
				x.style.display = "block";
			} else {
				x.style.display = "none";
			} 
		}  
</script>




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
               <a href="home.do"><span class="lnr lnr-home"></span>Home</a>&emsp;
               <a href="boardmainform.do"><span class="lnr lnr-arrow-right-circle"></span>Camping Talk</a>
            </nav>
         </div>
      </div>
   </div>
</section>
<!-- End Banner Area -->
<main role="main" style="padding: 50px 200px; ">

<!-- Start Container Area -->
<div class="card-container">
	<div class="card-head">
		<div class="card-head-first">
			<h2 style="color: #5f5f5f; font-family:'Malgun Gothic';">CAMPING TALK</h2>
		</div>
		
		<div class="card-head-second">
			<button type="button" class="upload-btn" onclick="popoutFunction()">+&nbsp;&nbsp;게시글쓰기</button>
			
			<div class="scale-up-top" id="upload-popout" style="display: none;">
				<div class="popout popout--prepared popout--axis-1 popout--dir-0 popout--cross-dir-1" id="popout-layout" data-popout="true">
					<div class="animated-popout-dropdown-content-active">
						<div class="upload-dropdown-content">
							<a class="upload-dropdown-content-item" href="boardinsertform.do?brdwriter=${dto.brdwriter }">
								<div class="content-item-icon"><img class="upload-icon-photo" src="./resources/img/photo.png"></div>
								<div class="content-item-content">	
									<div class="content-item-content-title">사진 올리기</div>
									<div class="content-item-content-subtitle">캠핑 사진을 공유해주세요.</div>
								</div>
							</a><br>
							<a class="upload-dropdown-content-item" href="boardinsertform_v.do?brdwriter=${dto.brdwriter }">
								<div class="content-item-icon"><img class="upload-icon-video" src="./resources/img/videocam.png"></div>
								<div class="content-item-content">
									<div class="content-item-content-title">영상 올리기</div>
									<div class="content-item-content-subtitle">캠핑 영상을 공유해주세요.</div>
								</div>
							</a>					
						</div>
					</div>
				</div>
			</div>
			
		
			<div class="card-head-third" style="width: 140px;">
				<button onclick="showall()">전체</button>
				<div class="dropdown-selectbox">
			  		<select onchange="myFunction()" class="selectpicker form-control" id="selectbox" aria-label="Example select with button addon">
						<option value="0" selected disabled>카테고리</option>
						<option value="1">일반 캠핑</option>
					    <option value="2">카라반</option>
					    <option value="3">글램핑</option>
					    <option value="4">차박</option>
					    <option value="5">나만의 캠핑</option>
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
		<c:forEach items="${list}" var="dto">
			<div class="card-body" style="padding: 0px">
				<!-- 프로필 사진/아이디 -->
				<div class="board-profile">
					<a href="profileform.do?memno=${dto.memno }&brdwriter=${dto.brdwriter }">
						<img class="user-profile" src="./resources/img/profile.png" alt="profile-photo">
					</a>&nbsp; 
					<span class="board-usernick">&nbsp;${dto.brdwriter}</span>
				</div>	
				<!-- 사용자가 업로드한 이미지 -->
				<div class="board-uploadimg">
					<div class="board-uploadimg-frame">
						<c:choose>
							<c:when test="${dto.brdvideoname eq 'N' }">
								<a href="boarddetailform.do?brdno=${dto.brdno }&memno=${dto.memno }">
									<img class="uploadimg" src="resources/img/board/${dto.brdfilename}">
								</a><br>
							</c:when>
							
							<c:when test="${dto.brdvideoname ne 'N' }">
							<div class="video-icon">
								<img class="user-profile" src="./resources/img/video.png">
							</div>
							<div class="video-thumbnail-img">
								<a href="boarddetailform_v.do?brdno=${dto.brdno }&memno=${dto.memno }">
								<img class="uploadimg" src="resources/img/board/${dto.brdfilename}">
								</a><br>
							</div>
							</c:when>
						</c:choose>
					</div>
					<div class="board-count">조회수 ${dto.brdcount}</div>
					<div class="board-count"> ${dto.categoryname }</div>
					<div class="category" style="display: none;"> ${dto.bcategoryno }</div>
				</div>
			</div>
		</c:forEach>
	</div>
</div>
<!-- End Container Area -->

<!-- 여백을 주기 위해 임시로 만들어 놓음 -->
<table class="table table-hover"></table>

<!-- Start Paging Area -->
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
			<!-- ==================================================================================================
				================================================ paging ================================================ -->

<!-- End Paging Area  -->
</main>	


<!-- start Footer Area -->
<%@include file="../../views/common/footer.jsp"%>
<!-- End Footer Area -->
</body>
</html>