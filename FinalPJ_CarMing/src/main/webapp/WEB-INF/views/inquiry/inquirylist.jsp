<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CarMing | 문의  목록</title>
<!-- <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css"> -->
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Mobile Specific Meta -->
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
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

<link rel="stylesheet" href="resources/css/inquirylist.css">



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
	       	 	<button class="banner-btn" id="golist" type="button" onclick="location.href='inquirylist.do'">문의 목록</button>
	         </div>
		  </div>
		</div>
	</section>
	<!-- End Banner Area -->
	
	<!-- Start Container Area -->
	<div class="card-container">
		<div class="gaadiex-list-title">
			<h2>INQUIRY LIST</h2>
		</div>
		
		<!-- 카테고리 검색 -->
		<!-- <div class="blog_right_sidebar">
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
		
		<!-- 문의자 목록 -->
		<div class="card">
			<div class="gaadiex-list" style="padding-bottom: 3%; margin-bottom: 3%;">
				<c:forEach var = "list" items="${list}">
				<div class="gaadiex-list-item">
					<div class="gaadiex-list-item-img">
						<img class="list-item-img" src="${list.profilepic }" alt="List user">
					</div>
					<div class="gaadiex-list-item-text">
						<h4><a href="inquirydetail.do?inquiryNo=${list.inquiryNo }" id="content">
							<c:set var="TextValue" value="${list.inquiryContent }"/> 
								<span class="list-item-text-ck">문의 내용&nbsp;&#124;&nbsp;${fn:substring(TextValue,0,4)}</span>
							</a>
						</h4>
						<div class="gaadiex-list-item-text-ck">
							<a href="profileform.do?memno=${list.memNo }">
								<span class="list-item-text-ck">닉네임&nbsp;&#124;&nbsp;${list.memNick }</span>
							</a>
						</div>
						<div class="category">카테고리&nbsp;&#124;&nbsp;${list.categoryName}</div>
						<div>작성 날짜&nbsp;&#124;&nbsp;<fmt:formatDate pattern = "yyyy-MM-dd" value = "${list.inquiryDate}"/></div>	
						<button class="banner-btn" id="golist" type="button" style="color: orange;" onclick="location.href='deleteinquiry.do?inquiryNo=${list.inquiryNo}'">삭제</button>	
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