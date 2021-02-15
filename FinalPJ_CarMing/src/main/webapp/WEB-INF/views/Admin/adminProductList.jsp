<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>CarMing | 제품 목록</title>
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
<link rel="stylesheet" href="resources/css/adminProductList.css">

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
	         <div class="col-first" id="banner-text-1">
	         	<div class="maintext text-1">Everything has an end,</div>
	         	<div class="maintext text-2">so time feels more precious</div>
	         </div>
	      </div>
	      <div class="section-top-border text-right" id="banner-text-2">
	       	 <div class="button-group-area mt-40" style="padding-bottom: 5em">
	       	 	<button class="banner-btn" id="goinsert" type="button" onclick="location.href='insertform.do'">제품 등록</button>
	         </div>
		  </div>
	   </div>
	</section>
	<!-- End Banner Area -->
	
	<!-- Start Container Area -->	
	<div class="card-container">
		<div class="gaadiex-list-title">
			<h2>PRODUCT LIST</h2>
		</div>
		
		<!-- 제품 검색 -->
		<div class="blog_right_sidebar">
			<aside class="single_sidebar_widget search_widget">
				<div class="input-group">
					<input type="text" id="input" onkeyup="myFunction()"
						   class="form-control" placeholder="제품 검색하기"
						   onfocus="this.placeholder = ''"
						   onblur="this.placeholder = '제품 검색하기'"
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
				<col style="width: 17%">
				<col style="width: 12%">
				<col style="width: 7%">
				<col style="width: 12%">
				<col style="width: 5%">
				<col style="width: 5%">
				<thead>
					<tr>
						<th>NO.</th>
						<th>제품명</th>
						<th>카테고리</th>
						<th>가격</th>
						<th>재고 현황</th>
						<th>추가 재고 수량</th>
						<th>삭제</th>
						<th>수정</th>
					</tr>
				</thead>
				<c:forEach var="list" items="${list}">
					<tbody>
						<tr>
							<td class="cartNo">${list.pNo}</td>
							<td><a href="productdetail.do?pNo=${list.pNo}">${list.pName}</a></td>
							<td>${list.pCategoryName }</td>
							<td><fmt:formatNumber value="${list.pPrice }" pattern="###,###,###"/>&nbsp;원</td>
							<td><fmt:formatNumber value="${list.pAmount }" pattern="###,###,###"/>&nbsp;개</td>
							<td>
								<form action="addAmount.do">
									<input type="number" name= "pAmount" value="1" min="1">
									<button type="submit" value="" >
										<i class="material-icons" >&#xE147;</i>
									</button>
								</form>
							</td>
							<td>
								<a href="deleteProduct.do?pNo=${list.pNo}" class="delete" data-toggle="tooltip">
									<i class="material-icons">&#xE5C9;</i>
								</a>
							</td>
							<td>
								<a href="updateProductForm.do?pNo=${list.pNo }" class="settings" data-toggle="tooltip">
									<i class="material-icons">&#xE8B8;</i>
								</a>
							</td>
						</tr>
					</tbody>
				</c:forEach>
			</table>
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