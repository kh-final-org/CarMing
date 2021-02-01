<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>carMing</title>
<!-- Mobile Specific Meta -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
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

<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="resources/css/adminList.css">

<style type="text/css">
#memlist_tb:hover tbody tr:hover td {
    background: #fff5e9;
    color: black;
}
#paging-container{margin: 50px 0px 20px 0px;}
</style>

<script>
function myFunction() {
    var input, filter, ul, li, a, i, txtValue, tbody;
    input = document.getElementById("input");
    filter = input.value

    tbody = document.getElementsByTagName("tbody");
    
    for(i=0; i<tbody.length; i++){
        a = document.getElementsByClassName("memNo")[i];
        txtValue = a.textContent || a.innerText;
        
        if (txtValue.toUpperCase().indexOf(filter) > -1) {
        	tbody[i].style.display = "";
        } else {
        	tbody[i].style.display = "none";
        }
	}
}

function formAction() {
	var form = document.getElementById('searchForm');
	form.action;
	//document.getElementsByName('search')[0].value = "";
}
</script>
</head>
<body>
	<!-- Start Header Area -->
	<%@include file="../../views/common/header.jsp"%>
	<!-- End Header Area -->
	
	<!-- Start Banner Area 
	<section class="banner-area organic-breadcrumb">
		<div class="container">
			<div class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
				<div class="col-first">
					<br>
					<h1>회원관리</h1>
					<nav class="d-flex align-items-center">
						<a href="tipAndRecipeMain.do">회원관리<span
							class="lnr lnr-arrow-right"></span></a> <a href="category.html">목록</a>
					</nav>
				</div>
			</div>
			<div class="section-top-border text-right">
				<div class="button-group-area mt-40" style="padding-bottom: 5em">
					<a href="tipAndRecipeMain.do"
						class="genric-btn danger-border e-large">목록으로</a> <a
						href="writeinquiryform.do"
						class="genric-btn danger-border e-large">새 글 작성하기</a>
				</div>
			</div>
		</div>
	</section>
	End Banner Area -->
	<!-- Start Banner Area -->
	<section class="banner-area organic-breadcrumb">
		<div class="container">
			<div class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
				<div class="col-first">
					<h1>ADMIN</h1>
					<nav class="d-flex align-items-center">
						<a href="home.do">Home<span class="lnr lnr-arrow-right"></span></a>
						<a href="tipAndRecipeMain.do">회원관리</a>
					</nav>
				</div>
			</div>
		</div>
	</section>
	<!-- End Banner Area -->

	<!-- <div class="blog_right_sidebar"
		style="width: 30%; float: right; background-color: white; border: 0px;">
		<aside class="single_sidebar_widget search_widget">
			<div class="input-group">
				<input type="text" id="input" onkeyup="myFunction()" class="form-control" placeholder="회원 검색하기"
					onfocus="this.placeholder = ''"
					onblur="this.placeholder = '회원 검색하기'"> <span
					class="input-group-btn">
					<button class="btn btn-default" type="button">
						<i class="lnr lnr-magnifier"></i>
					</button>
				</span>
			</div>
		</aside>
	</div> -->

	<div class="container">
		<div class="table-responsive">
			<table id="memlist_tb" class="table table-striped table-hover">
				<thead>
					<tr>
						<th>NO.</th>
						<th></th>
						<th>이름</th>
						<th>닉네임</th>
						<th>생년월일</th>
						<th>이메일</th>
						<th>핸드폰</th>
						<th>성별</th>
						<th>회원삭제</th>
					</tr>
				</thead>
				<c:forEach var="list" items="${list }">
				<tbody>
					<tr>
						<td class="memNo">${list.memNo}</td>

						<td><a href="memdetail.do?memNo=${list.memNo }"><img
								src="resources/img/profile.png" class="avatar"alt="Avatar"></a></td>
						<td><a href="profileform.do?memno=${list.memNo}">${list.memName}</a></td>
						<td>${list.memNick}</td>

						<!-- date format -->
						<fmt:parseDate var="dateFmt" pattern="yyyy-MM-dd HH:mm:ss" value = "${list.memBirth }" />
						<fmt:formatDate var="dateTempParse" pattern="yyyy-MM-dd" value="${dateFmt }" /> 
						<td>
							<c:out value="${dateTempParse }" />
						</td>
						<td>${list.memId}</td>

						<td><fmt:formatDate pattern = "yyyy-MM-dd" 
         						value = "${list.memBirth}"/></td>
						<td>${list.memAddr}</td>
						<td>${list.memPhone}</td>
						<td><c:set var="gen" value="${list.memGender }" />

								<c:choose>
									<c:when test="${gen == 1 }">여</c:when>
									<c:when test="${gen == 2 }">남</c:when>
								</c:choose> <!--    <td><span class="status text-success">&bull;</span> Active</td> -->
						</td>
						<td><a href="deletemem.do?memNo=${list.memNo}" class="delete" title="Delete"
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
			<c:set var="lastNum" value="${fn:substringBefore(Math.ceil(count/10), '.')}"></c:set>
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
			</div>
		</div>

	<!-- start footer Area -->
	<%@include file="../../views/common/footer.jsp"%>
	<!-- End footer Area -->
</body>
</html>