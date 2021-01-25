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

	.card-head-first{float: left;}
	.card-head-second{float: left; margin-left: 610px;}
	.card-head-third{float: right; margin-right: 10px;}
	.card-body{float: left; width: 33.3%; margin-bottom: 20px;}
	
	.uploadimg{width: 360px; height: 360px; border-radius: 10px; transform: scale(1.00); transition: transform .3s;}
	.uploadimg:hover{transform: scale(1.03); transition: transform .3s;}
	.board-uploadimg{overflow: hidden; border-radius: 10px;}
	
	.user-profile{width: 50px; height: 50px; border-radius: 5em;}	
	.board-profile{margin: 0px 0px 8px 8px;}	
	.board-usernick{font-size: 1.2em; font-weight: bold;}
	.board-count{width: 360px; font-size: 0.8em; text-align: right; margin: 3px 0px 0px 0px;}
	
	#button-boardinsert{width: 140px; color: #5f5f5f; background-color: #ffe6be;}
	.current{padding-left: 5px;}
	 
	#paging-container{margin: 50px 0px 20px 0px;}
	
	/* 진회색: #5f5f5f, 진노랑: #ffe6be, 연노랑: #fff5e9 */ 
</style>
<script type="text/javascript">
	function myFunction() {
	    var selectbox, filter, a, txtValue, list;
	    selectbox = document.getElementById("selectbox");		//selectbox
	    filter = selectbox.value								//selectbox value값 filter에 담기
	    list = document.getElementsByClassName("card-body");	//card-body(게시글이 담기는 영역)를 list에 담기
	    
	    for(i=0; i<list.length; i++){
	        a = document.getElementsByClassName("category")[i];	//dto.bcategoryname를 a에 담기
	        txtValue = a.textContent;							//dto.bcategoryname의 텍스트 값을 txtValue에 담기
	        
	        if (txtValue == filter) {
	        	list[i].style.display = "";
	        } else {
	        	list[i].style.display = "none";
	        }
		}
	}
</script>


<script>
	function myFunction() {
  		var x = document.getElementById("mySelect").value;
  		document.getElementById("demo").innerHTML = "You selected: " + x;
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
	<div class="card-head">
		<div class="card-head-first">
			<h2 style="color: #5f5f5f;  font-family:'Malgun Gothic';">CAMPING TALK</h2>
		</div>
		
		<div class="card-head-second">
			<button type="button" class="btn btn-light" onclick="location.href='boardinsertform.do'" id="button-boardinsert">+ 게시글 쓰기</button>
		</div>
		
		<div class="card-head-third" style="width: 140px;">
			<div class="dropdown-selectbox">
		  		<select onchange="myFunction()" class="selectpicker form-control" id="selectbox" aria-label="Example select with button addon">
					<option value="일반 캠핑" selected>일반 캠핑</option>
				    <option value="카라반">카라반</option>
				    <option value="글램핑">글램핑</option>
				    <option value="차박">차박</option>
				    <option value="나만의 캠핑">나만의 캠핑</option>
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
				<a href="profileform.do?memno=${dto.memno }&brdwriter=${dto.brdwriter }"><img class="user-profile" src="./resources/img/profile.png" alt="profile-photo"></a>&nbsp; 
				<span class="board-usernick">&nbsp;${dto.brdwriter}</span>
			</div>	
			<!-- 사용자가 업로드한 이미지 -->
			<div class="board-uploadimg">
				<a href="boarddetailform.do?brdno=${dto.brdno }&memno=${dto.memno }"><img class="uploadimg" src="./resources/img/boardUpload/${dto.brdfile}"></a><br>
				<div class="board-count">조회수 ${dto.brdcount}</div>
				<div class="category"> ${dto.bcategoryname }</div>
			</div>
		</div>
	</c:forEach>
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
			    	<span class="page-link text-warning"  aria-label="Next" onclick="alert('이전 페이지가 없습니다.');">&laquo;</span>
		  		</c:if>
		  	</div>
			
			<!-- 페이징 목록 -->
			<c:forEach var="i" begin="0" end="4">
				<li class="page-item"><a class="page-link text-warning" href="?page=${startNum + i }">${startNum + i }</a></li>
			</c:forEach>
		  			
		  	<!-- 다음 버튼 -->
		  	<div>
			  	<c:if test="${startNum + 5 < lastNum }">
			    	<a href="?page=${startNum + 5 }" class="page-link text-warning" aria-label="Next">&raquo;</a>
			  	</c:if>
			  	<c:if test="${startNum + 5 >= lastNum }">
			    	<span class="page-link text-warning" aria-label="Next" onclick="alert('다음 페이지가 없습니다.');">&raquo;</span>
		  		</c:if>
		  	</div>
		  	
		</ul>
	</nav>
</div>
<!-- End Paging Area  -->



</main>	
</body>
</html>