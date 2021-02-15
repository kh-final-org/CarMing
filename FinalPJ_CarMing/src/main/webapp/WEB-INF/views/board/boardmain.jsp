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
<link rel="stylesheet" href="resources/css/boardmain.css">

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

<!-- 카테고리 -->
<script type="text/javascript">
	function category(){
	 	var pCateNo = document.getElementById("selectbox").value;
		location.href="boardmainform.do?categoryNo="+pCateNo;
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
				<div class="dropdown-selectbox">
			  		<select onchange="category()" class="selectpicker form-control" id="selectbox" aria-label="Example select with button addon">
						<option selected disabled>카테고리</option>
						<option value="">전체</option>
						<option value="1">일반 캠핑</option>
					    <option value="2">카라반</option>
					    <option	value="3">글램핑</option>
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
					<div class="board-count" style="display: none;"> ${dto.categoryname }</div>
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
	<c:set var="lastNum" value="${fn:substringBefore(Math.ceil(count/9), '.')}"></c:set>
	<!-- 현재 페이지 -->
<!-- 			<div class="hint-text"> -->
<%-- 					Page <b>${(empty param.page) ? 1:param.page}</b> / <b>${lastNum }</b> --%>
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
	<!-- ==================================================================================================
		================================================ paging ================================================ -->
<!-- End Paging Area  -->
</main>	


<!-- start Footer Area -->
<%@include file="../../views/common/footer.jsp"%>
<!-- End Footer Area -->
</body>
</html>