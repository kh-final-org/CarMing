<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고 목록</title>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

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

<link rel="stylesheet" href="resources/css/list.css">


</head>
<body>

	<!-- Start Header Area -->
	<%@include file="../../views/common/header.jsp"%>
	<!-- End Header Area -->
	<br>
	<!-- Start Banner Area -->
	<section class="banner-area organic-breadcrumb">
		<div class="container">
			<div
				class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
				<div class="col-first">
				
					<h1>신고 사항</h1>
					<nav class="d-flex align-items-center">
						<a href="tipAndRecipeMain.do">신고 사항<span
							class="lnr lnr-arrow-right"></span></a> <a href="category.html">목록</a>
					</nav>
				</div>
			</div>
			<div class="section-top-border text-right">
				<div class="button-group-area mt-40" style="padding-bottom: 5em">
					<a href="tipAndRecipeMain.do"
						class="genric-btn danger-border e-large">목록으로</a>
						<a href="writereportform.do"
						class="genric-btn danger-border e-large">새 글 작성하기</a>
						
				</div>
			</div>
		</div>
	</section>
	<!-- End Banner Area -->
	<!-- 목록 부분 -->
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="card">

					<div class="gaadiex-list"  style="padding-bottom: 3%; margin-bottom: 3%">
					<c:forEach var = "list" items="${list }">
						<div class="gaadiex-list-item">
							<img class="gaadiex-list-item-img"
								src="resources/img/tipandrecipe/honey.jpg"
								alt="List user"><%-- ${list.reportFileName } --%>
							<div class="gaadiex-list-item-text">
								<h3 style="color: orange">
									<a href="#">제보자 닉네임:${list.reportWriter}</a>
								</h3>
								
								<h4><a href="reportdetail.do?reportNo=${list.reportNo }" id="content">
								
								<c:set var="TextValue" value="${list.reportContent }"/> 
								내용: ${fn:substring(TextValue,0,10)}</a></h4>
								
								
								<p>카테고리: ${list.categoryName }</p>
								<p>작성날짜:<fmt:formatDate pattern = "yyyy-MM-dd" 
         						value = "${list.reportDate}" /></p>	
							</div>
						</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 목록 종료 -->
	

	<!-- start footer Area -->

	<%@include file="../../views/common/footer.jsp"%>
	<!-- End footer Area -->

</body>
</html>