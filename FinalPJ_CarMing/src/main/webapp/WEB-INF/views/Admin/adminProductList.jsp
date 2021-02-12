<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	#memlist_tb{width:100%; }
	#memlist_tb:hover tbody tr:hover td {background: #fff5e9; transition: 0.2s; }
	#paging-container{margin: 50px 0px 20px 0px;}
	.gaadiex-list-title > h2{float:left; width: 25%; margin-top: 1%; font-family:'Malgun Gothic'; color: #5f5f5f; font-size: 2.2em;}
	div.blog_right_sidebar{float: right; width: 22%; margin-bottom: -1.5%; margin-right: -2.5%; border: 0; background: #fff; }
	.btn.btn-default{margin-top: -6%; margin-right: -3%;}
	
	img.avatar{width: 70px; height: 70px;}
	.table-responsive{position: relative; width: 100%; margin-left: auto; margin-right: auto;}
	.table-wrapper {min-width: 1000px; background: #fff; padding: 20px 25px; border-radius: 3px; box-shadow: 0 1px 1px rgba(0,0,0,.05);}
	.table-title {padding-bottom: 15px; background: #299be4; color: #fff; padding: 16px 30px; margin: -20px -25px 10px; border-radius: 3px 3px 0 0;}
	.table-title h2 {margin: 5px 0 0; font-size: 24px;}
	.table-title .btn {color: #566787; float: right; font-size: 13px; background: #fff; border: none; min-width: 50px;
					   border-radius: 2px; border: none; outline: none !important;margin-left: 10px;}
	.table-title .btn:hover, .table-title .btn:focus {color: #566787; background: #f2f2f2;}
	.table-title .btn i {float: left;font-size: 21px; margin-right: 5px;}
	.table-title .btn span {float: left;margin-top: 2px;}
	table.table tr th, table.table tr td {border-color: #e9e9e9; padding: 12px 15px; vertical-align: middle;}
	table.table tr th:first-child {width: 60px;} 
	table.table tr th:last-child {width: 100px;}
	table.table-striped tbody tr:nth-of-type(odd) {background-color: #fcfcfc;}
	table.table-striped.table-hover tbody tr:hover {background: #f5f5f5;}
	table.table-striped.table-hover tbody tr td{text-align: center;}
	table.table-striped.table-hover tbody tr td a img{margin: 0;}

	table.table-striped.table-hover thead tr th{text-align: center;}
	
	table.table th i {font-size: 13px;margin: 0 5px;cursor: pointer;}	
	table.table td:last-child i {opacity: 0.9; font-size: 22px; margin: 0 5px;}
	table.table td span {font-weight: bold; color: #5f5f5f; display: inline-block; text-decoration: none;}
	table.table td a span {font-weight: bold; color: #5f5f5f; display: inline-block; text-decoration: none;}
/* 	table.table td a:hover {color: #ff9b00;} */
	table.table td a.settings {color: #2196f3;}
	table.table td a.delete {color: #f44336;}
	table.table td i {font-size: 19px;}
	table.table .avatar {border-radius: 50%; vertical-align: middle; margin-right: 10px; }
	.avatar {width: 5em; height: 5em;}
	.status {font-size: 30px; margin: 2px 2px 7px; display: inline-block; vertical-align: middle; line-height: 10px;}
	.text-success {color: #10c469;}
	.text-info {color: #62c9e8;}
	.text-warning {color: #FFC107;}
	.text-danger {color: #ff5b5b;}
	.hint-text {float: left; margin-top: 10px; font-size: 13px;}
	
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
	      <div class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
	         <div class="col-first">
	            <h1>The stars in the night sky</h1>
	         	<nav class="d-flex align-items-center">
	               <a href="home.do"><span class="lnr lnr-home"></span>Home</a>&emsp;
	               <a href="#"><span class="lnr lnr-arrow-right-circle"></span>Camping</a>
	            </nav>
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
		<div class="table-responsive">
			<table class="table table-striped table-hover" id="memlist_tb" style="text-align: center; width: 100%;">
				<col style="width: 5%">
				<col style="width: 10%">
				<col style="width: 15%">
				<col style="width: 10%">
				<col style="width: 7%">
				<col style="width: 17%">
				<col style="width: 5%">
				<col style="width: 5%">
				<thead>
					<tr>
						<th>NO.</th>
						<th>제품명</th>
						<th>카테고리</th>
						<th>가격</th>
						<th>제고현황</th>
						<th>추가 제고물량</th>
						<th>삭제</th>
						<th>수정</th>
					</tr>
				</thead>
				<c:forEach var="list" items="${list}">
					<tbody>
						<tr>
							<td class="cartNo" >${list.pNo}</td>
							<td><a href="productdetail.do?pNo=${list.pNo}">${list.pName}</a></td>
							<td>${list.pCategoryName }</td>
							<td>${list.pPrice }</td>
							<td>#${list.pAmount }</td>
							<td><form action="addAmount.do"><input type="number" name= "pAmount" value="1" min="1" style="width:15%">
							<button type="submit" style="text-align: center; color: green; border:none; text-decoration: none; background: none;" value="" >
							<i class="material-icons" >&#xE147;</i></button>
							</form></td>
							<td>
							<a href="deleteProduct.do?pNo=${list.pNo}" class="delete" 
							data-toggle="tooltip"><i class="material-icons">&#xE5C9;</i></a>
							</td>
							<td> <a href="#" class="settings" data-toggle="tooltip"><i class="material-icons">&#xE8B8;</i></a></td>
						</tr>
					</tbody>
				</c:forEach>
			</table>
		</div>
	</div>
	<!-- End Container Area -->
	<!-- ==================================================================================================
				================================================ paging ================================================ -->
			<c:set var="page" value="${(empty param.page) ? 1 : param.page}"></c:set>
			<c:set var="startNum" value="${page - (page-1) % 5}"></c:set>
			<c:set var="lastNum" value="${fn:substringBefore(Math.ceil(count/8), '.')}"></c:set>
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
	
	<!-- start footer Area -->
	<%@include file="../../views/common/footer.jsp"%>
	<!-- End footer Area -->
</body>
</html>