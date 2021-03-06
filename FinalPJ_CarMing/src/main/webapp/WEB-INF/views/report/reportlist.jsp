<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CarMing | 신고  목록</title>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Mobile Specific Meta -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Favicon-->
<link rel="shortcut icon" href="img/fav.png">
<!-- Author Meta -->
<meta name="author" content="CodePixar">
<!-- Meta Description -->
<meta name="description" content="">
<!-- Meta Keyword -->
<meta name="keywords" content="">
<!-- meta character set -->
<meta charset="UTF-8">


<style type="text/css">
	.col-first{margin: -1% 63.5% 0 -18%; } 
	.col-first > .maintext{font-weight: bold; font-size: 2.0em; color: #fff; text-align: left;}
	.text-1{margin: -5% 0 3%;}
	#banner-text-2{position: absolute; top: 60%; right: 14%;}
	
	.banner-btn{width: 115px; padding: 8px 0 10px; line-height: 18px; border: 2px solid #fff5e9; border-radius: 3px;
				font-size: 1.1em; text-align: center; color: #fff5e9; background: transparent; opacity: 0.95;  
				position:relative; overflow: hidden; transition: 0.95s; cursor: pointer;}
	.banner-btn:hover{background: #fff5e9; color: #5f5f5f;}
	.banner-btn::before{content: ""; position: absolute; left:0; width:100%; height: 0%; background: #fff5e9; z-index: -1; 
						top:0; border-radius: 0 0 50% 50%; transition: 0.95s;}
	.banner-btn:hover::before{height: 180%;}

	.card-container{padding: 50px 200px;}
	.card {position: relative; width: 80%; margin-left: auto; margin-right: auto; margin-bottom: 5%;}
	
	div.blog_right_sidebar{float: right; width: 22%; margin-bottom: -1.5%; margin-right: 7.5%; border: 0; background: #fff; }
	.btn.btn-default{margin-top: -6%; margin-right: -3%;}
	
	.gaadiex-list {border-radius: 10px; list-style-type: none; margin: 0; padding: 0;}
	.gaadiex-list-title > h2{float:left; width: 25%; margin: 1% 0 0.8% 10%; font-family:'Malgun Gothic'; color: #5f5f5f; font-size: 2.2em;}
	.gaadiex-list>.gaadiex-list-item {padding: 0 20px 0 25px;}
	.gaadiex-list-item {width: 45%; float:left; margin-left: 2%;}
	.gaadiex-list-item-img > img {float: left; width: 100px; height: 100px; margin: 50px 30px 8px 30px; border-radius: 50%;}
	.gaadiex-list-item-text {margin-top: 50px; color: gray; margin-left: 160px;}
	.gaadiex-list-item-text a{color: gray;}
	.gaadiex-list-item-text a:hover{color: #ffba00; color: gray;}
	.gaadiex-list-item-text h4{margin-bottom: 5px; font-weight: bold; color: gray;}
	.list-item-text-ck{font-weight: bold;}
	.list-item-text-ck:hover{border-radius: 2px; background: #fff5e9; transition: 0.2s;}
</style>


<script>
function myFunction() {
    var input, filter, ul, li, a, i, txtValue, list;
    input = document.getElementById("input");
    filter = input.value

    list = document.getElementsByClassName("gaadiex-list-item");
    
    for(i=0; i<list.length; i++){
        a = document.getElementsByClassName("category")[i];
        txtValue = a.textContent || a.innerText;
        
        if (txtValue.toUpperCase().indexOf(filter) > -1) {
        	list[i].style.display = "";
        } else {
        	list[i].style.display = "none";
        }
	}
}
</script>
</head>
<body>
	<!-- Start Header Area -->
	<%@include file="../../views/common/header.jsp"%>
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
		  <div class="section-top-border text-right" id="banner-text-2">
	       	 <div class="button-group-area mt-40" style="padding-bottom: 5em">
	       	 	<button class="banner-btn" id="golist" type="button" onclick="location.href='reportlist.do'">신고 목록</button>
	         </div>
		  </div>
		</div>
	</section>
	<!-- End Banner Area -->

	
	<!-- Start Container Area -->
	<div class="card-container">
		<div class="gaadiex-list-title">
			<h2>REPORT LIST</h2>
		</div>
		
		<!-- 카테고리 검색 -->
<!-- 		<div class="blog_right_sidebar">
			<aside class="single_sidebar_widget search_widget">
				<div class="input-group">
					<input type="text" id="input" onkeyup="myFunction()"
						   class="form-control" placeholder="카테고리 검색하기"
						   onfocus="this.placeholder = ''"
						   onblur="this.placeholder = '카테고리 검색하기'"
						   style="padding: 12%; font-size: 1.15em; border-radius: 5px; margin-top: -15%;"> 
					<span class="input-group-btn">
						<button class="btn btn-default" type="button">
							<i class="lnr lnr-magnifier"></i>
						</button>
					</span>
				</div>
			</aside>
		</div> -->
		
		<!-- 신고자 목록 -->
		<div class="card">
			<div class="gaadiex-list"  style="padding-bottom: 3%; margin-bottom: 3%">
				<c:forEach var = "list" items="${list }">
				<div class="gaadiex-list-item">
					<div class="gaadiex-list-item-img">
						<img class="gaadiex-item-img" src=${list.memFile } alt="List user"><%-- ${list.reportFileName } --%>
					</div>
					<div class="gaadiex-list-item-text">
						<h4><a href="reportdetail.do?reportNo=${list.reportNo}&targetTypeNo=${list.targetTypeNo}" id="content">
							<c:set var="TextValue" value="${list.reportContent }"/> 
								<span class="list-item-text-ck">신고 내용&nbsp;&#124;&nbsp;${fn:substring(TextValue,0,4)}</span>
							</a>
						</h4>
						<div class="gaadiex-list-item-text-ck">
							<a href="profileform.do?memno=${list.memNo }">
								<span class="list-item-text-ck">제보자 닉네임&nbsp;&#124;&nbsp;${list.reportWriter}</span>
							</a>
						</div>
						<div class="category">카테고리&nbsp;&#124;&nbsp;${list.categoryName }</div>
						<div>작성날짜&nbsp;&#124;&nbsp;<fmt:formatDate pattern = "yyyy-MM-dd" value = "${list.reportDate}" /></div>
						<button class="banner-btn" id="golist" type="button" style="color: orange;" onclick="location.href='deletereport.do?reportNo=${list.reportNo}'">삭제</button>	
					</div>
				</div>
				</c:forEach>
			</div>
		</div>


			<!-- ==================================================================================================
				================================================ paging ================================================ -->
			<c:set var="page" value="${(empty param.page) ? 1 : param.page}"></c:set>
			<c:set var="startNum" value="${page - (page-1) % 5}"></c:set>
			<c:set var="lastNum" value="${fn:substringBefore(Math.ceil(count/8), '.')}"></c:set>
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
			<!-- ==================================================================================================
				================================================ paging ================================================ -->
	</div>
	<!-- End Container Area -->
	
	<!-- start footer Area -->
	<%@include file="../../views/common/footer.jsp"%>
	<!-- End footer Area -->

</body>
</html>