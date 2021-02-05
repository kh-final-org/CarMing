<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>CarMing | 렌탈 목록</title>
<!-- Mobile Specific Meta -->
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Favicon-->
<link rel="shortcut icon" href="resources/img/fav.png">
<!-- Author Meta -->
<meta name="author" content="CodePixar">
<!-- Meta Description -->
<meta name="description" content="">
<!-- Meta Keyword -->
<meta name="keywords" content="">
<!-- meta character set -->
<meta charset="UTF-8">


<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<!-- <link rel="stylesheet" href="resources/css/adminList.css"> -->
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
	.container-xl{position: relative; width: 100%; margin-left: auto; margin-right: auto;}
	
	div.blog_right_sidebar{float: right; width: 22%; margin-bottom: -1.5%; margin-right: -2.5%; border: 0; background: #fff; }
	.btn.btn-default{margin-top: -6%; margin-right: -3%;}
	
	.gaadiex-list-title > h2{float:left; width: 25%; margin-top: 1%; font-family:'Malgun Gothic'; color: #5f5f5f; font-size: 2.2em;}
	
	
	
	
	
</style>

<script>
function myFunction() {
    var input, filter, ul, li, a, i, txtValue, tbody;
    input = document.getElementById("input");
    filter = input.value

    tbody = document.getElementsByTagName("tbody");
    
    for(i=0; i<tbody.length; i++){
        a = document.getElementsByClassName("cartNo")[i];
        txtValue = a.textContent || a.innerText;
        
        if (txtValue.toUpperCase().indexOf(filter) > -1) {
        	tbody[i].style.display = "";
        } else {
        	tbody[i].style.display = "none";
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
	               <a href="#">캠핑 렌트</a>
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
			<h2>RENTAL LIST</h2>
		</div>
		
		<!-- 카테고리 검색 -->
		<div class="blog_right_sidebar">
			<aside class="single_sidebar_widget search_widget">
				<div class="input-group">
					<input type="text" id="input" onkeyup="myFunction()"
						   class="form-control" placeholder="상품 검색하기"
						   onfocus="this.placeholder = ''"
						   onblur="this.placeholder = '상품 검색하기'"
						   style="padding: 12%; font-size: 1.15em; border-radius: 5px; margin-top: -15%;"> 
					<span class="input-group-btn">
						<button class="btn btn-default" type="button">
							<i class="lnr lnr-magnifier"></i>
						</button>
					</span>
				</div>
			</aside>
		</div>

		<!-- 렌탈 목록 -->
		<div class="container-xl">
			<table class="table table-striped table-hover" style="text-align: center;" width="100%">
				<col style="width: 5%">
				<col style="width: 10%">
				<col style="width: 20%">
				<col style="width: 15%">
				<col style="width: 15%">
				<col style="width: 15%">
				<col style="width: 15%">
				<thead>
					<tr>
						<th>NO.</th>
						<th>닉네임</th>
						<th>카테고리</th>
						<th>결제번호</th>
						<th>렌트 시작날짜</th>
						<th>렌트 종료날짜</th>
						<th>렌탈현황</th>
					</tr>
				</thead>
				<c:forEach var="list" items="${list}">
					<tbody>
						<tr>
							<td class="cartNo" ><a href="adminRentDetail.do?cartNo=${list.cartNo}">${list.cartNo}</a></td>
							<td><a href="#"><img
									src="resources/img/tipandrecipe/honey.jpg" class="avatar"
									alt="Avatar">${list.memNick }</a></td>
							<td>${list.pCategoryName }</td>
							<td>#${list.payNo }</td>
							<td><fmt:formatDate pattern="yyyy-MM-dd"
									value="${list.startDate}" /></td>

							<td><fmt:formatDate pattern="yyyy-MM-dd"
									value="${list.endDate}" /></td>
							<td><c:set var="status" value="${list.stateNo}" /> <c:choose>
									<c:when test="${ status == 3}">
										<span class="status text-warning">&bull;</span>
									</c:when>
									<c:when test="${ status == 5}">
										<span class="status text-success">&bull;</span>
									</c:when>
									<c:when test="${ status == 6}">
										<span class="status text-danger">&bull;</span>
									</c:when>
								</c:choose> ${list.stateName }</td>
						</tr>
					</tbody>
				</c:forEach>
			</table>


		</div>
	</div>
	<!-- End Container Area -->
	
	<!-- start footer Area -->
	<%@include file="../../views/common/footer.jsp"%>
	<!-- End footer Area -->
</body>
</html>