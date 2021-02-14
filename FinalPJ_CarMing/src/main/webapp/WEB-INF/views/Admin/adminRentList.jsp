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
<link rel="stylesheet" href="resources/css/adminRentList.css">

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
				<col style="width: 7.5%">
				<col style="width: 15%">
				<col style="width: 8%">
				<col style="width: 15%">
				<col style="width: 15%">
				<col style="width: 10%">
				<col style="width: 5%">
				<thead>
					<tr>
						<th>NO.</th>
						<th>프로필 사진</th>
						<th>닉네임</th>
						<th>카테고리</th>
						<th>결제번호</th>
						<th>렌트 시작날짜</th>
						<th>렌트 종료날짜</th>
						<th>렌탈현황</th>
						<th>삭제</th>
					</tr>
				</thead>
				<c:forEach var="list" items="${list}">
					<tbody>
						<tr>
							<td class="cartNo" ><a href="adminRentDetail.do?cartNo=${list.cartNo}"><span>${list.cartNo}</span></a></td>
							<td><a href="profileform.do?memno=${list.memNo}">
								<img src= "${list.memFile }" class="avatar" alt=""></a>
							</td>
							<td><span>${list.memNick }</span></td>
							<td>${list.pCategoryName }</td>
							<td>#${list.payNo }</td>
							<td><fmt:formatDate pattern="yyyy-MM-dd"
									value="${list.startDate}" /></td>

							<td><fmt:formatDate pattern="yyyy-MM-dd"
									value="${list.endDate}" var="endDate"/>
									${endDate}</td>
							<td>
							<jsp:useBean id="toDay" class="java.util.Date" />
							<fmt:formatDate value='${toDay}' pattern='yyyy-MM-dd' var="nowDate"/>
							<c:set var="status" value="${list.stateNo}" /> 
									<c:choose>
									<c:when test="${ status == 4}">
										<span class="status text-danger">&bull;</span>
										${list.stateName }
									</c:when>
									<c:when test="${ status == 5}">
										<span class="status text-success">&bull;</span>
										${list.stateName }
									</c:when>
									<c:when test="${ endDate < nowDate}">
										<span class="status text-danger">&bull;</span>
										연체
									</c:when>
									<c:when test="${ status == 2}">
										<span class="status text-success">&bull;</span>
										${list.stateName }
									</c:when>
									<c:when test="${ status == 3}">
										<span class="status text-warning">&bull;</span>
										${list.stateName }
									</c:when>
									
									
									<c:when test="${ status == 6}">
										<span class="status text-danger">&bull;</span>
										${list.stateName }
									</c:when>
									
								</c:choose> 
							</td>
							<td>
							<a href="deleteRent.do?cartNo=${list.cartNo}" class="delete" title="Delete"
							data-toggle="tooltip"><i class="material-icons">&#xE5C9;</i></a>
							</td>
						</tr>
					</tbody>
				</c:forEach>
			</table>
	
	
			<!-- ==================================================================================================
				================================================ paging ================================================ -->
			<c:set var="page" value="${(empty param.page) ? 1 : param.page}"></c:set>
			<c:set var="startNum" value="${page - (page-1) % 5}"></c:set>
			<c:set var="lastNum" value="${fn:substringBefore(Math.ceil(count/8), '.')}"></c:set>
			<!-- 현재 페이지 -->
<!-- 			<div class="hint-text"> -->
<%-- 					Page <b>${(empty param.page) ? 1:param.page}</b> / <b>${lastNum }</b>  --%>
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
	</div>
	<!-- End Container Area -->
	
	<!-- start footer Area -->
	<%@include file="../../views/common/footer.jsp"%>
	<!-- End footer Area -->
</body>
</html>