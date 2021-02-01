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
<!-- ★★★위 스크립트로 상단바 위치가 깨짐★★★
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">-->
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

<link rel="stylesheet" href="resources/css/list.css">
<style type="text/css">
	#banner-text-2{position: absolute; top: 255px; right: 245px;}
	.banner-btn{width: 130px; padding: 8px 0 10px; line-height: 18px; border: 2px solid #fff5e9; border-radius: 3px;
				font-size: 1.1em; text-align: center; color: #fff5e9; background: transparent; opacity: 0.95;  
				position:relative; overflow: hidden; transition: 0.95s; cursor: pointer;}
	.banner-btn:hover{background: #fff5e9; color: #5f5f5f;}
	.banner-btn::before{content: ""; position: absolute; left:0; width:100%; height: 0%; background: #fff5e9; z-index: -1; 
						top:0; border-radius: 0 0 50% 50%; transition: 0.95s;}
	.banner-btn:hover::before{height: 180%;}
	
	.card-container{padding: 50px 200px;}
	.card {position: relative; width: 80%; margin-left: auto; margin-right: auto;}

	div.blog_right_sidebar{float: right; width: 22%; margin-bottom: -1.5%; margin-right: 7.5%; border: 0; background: #fff; }
	.btn.btn-default{margin-top: -6%; margin-right: -3%;}
	
	.gaadiex-list {border-radius: 10px; list-style-type: none; margin: 0; padding: 0;}
	.gaadiex-list-title > h2{float:left; width: 25%; margin: 1.3% 0 0 10%; font-family:'Malgun Gothic'; color: #5f5f5f; font-size: 2.2em;}
	.gaadiex-list>.gaadiex-list-item {padding: 0 20px;}
	.gaadiex-list-item {width: 45%; float:left; margin-left: 2%;}
	.gaadiex-list-item-img > img {float: left; width: 100px; height: 100px; margin: 30px 50px 8px 0; border-radius: 50%;}
	.gaadiex-list-item-text {margin-top: 50px; color: gray; margin-left: 160px;}
	.gaadiex-list-item-text a{color: gray;}
	.gaadiex-list-item-text a:hover{color: #ffba00; color: gray;}
	.gaadiex-list-item-text h4{margin-bottom: 5px; font-weight: bold; color: #5f5f5f;}
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
	      <div class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end" >
	         <div class="col-first" id="banner-text-1">
	            <h1>The stars in the night sky</h1>
	            <nav class="d-flex align-items-center">
	               <a href="home.do">Home<span class="lnr lnr-arrow-right"></span></a>
	               <a href="writereportform.do">신고하기</a>
	            </nav>
	         </div>
	      </div>
		  <div class="section-top-border text-right" id="banner-text-2">
	       	 <div class="button-group-area mt-40" style="padding-bottom: 5em">
	       	 	<button class="banner-btn" id="gowrite" type="button" onclick="location.href='writeinquiryform.do'">문의하기</button>
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
		<div class="blog_right_sidebar">
			<aside class="single_sidebar_widget search_widget">
				<div  class="input-group">
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
		</div>
		
		<!-- 문의자 목록 -->
		<div class="card">
			<div class="gaadiex-list" style="padding-bottom: 3%; margin-bottom: 3%">
				<c:forEach var = "list" items="${list}">
				<div class="gaadiex-list-item">
					<div class="gaadiex-list-item-img">
						<img class="list-item-img" src="resources/img/profile.png" alt="List user">
					</div>
					<div class="gaadiex-list-item-text">
						<h4><a href="#">닉네임&nbsp;&#124;&nbsp;${list.memNick }</a></h4>
						
						<div>
							<a href="inquirydetail.do?inquiryNo=${list.inquiryNo }" id="content">
							<c:set var="TextValue" value="${list.inquiryContent }"/> 
								문의 내용&nbsp;&#124;&nbsp;${fn:substring(TextValue,0,10)}
							</a>
						</div>
						
						<div class="category">카테고리&nbsp;&#124;&nbsp;${list.categoryName}</div>
						<div>작성 날짜&nbsp;&#124;&nbsp;<fmt:formatDate pattern = "yyyy-MM-dd" value = "${list.inquiryDate}"/></div>		
					</div>
				</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<!-- End Container Area -->
	

	<!-- start footer Area -->

	<%@include file="../../views/common/footer.jsp"%>
	<!-- End footer Area -->

</body>
</html>