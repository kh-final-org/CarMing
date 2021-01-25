<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx" class="no-js">

<head>
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
<!-- Site Title -->
<title>핑구 레시피</title>

</head>

<body>

	<!-- Start Header Area -->
	<%@include file="../../views/common/header.jsp"%>
	<!-- End Header Area -->

	<!-- Start Banner Area -->
	<section class="banner-area organic-breadcrumb">
		<div class="container">
			<div
				class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
				<div class="col-first">
					<h1>핑구레시피</h1>
					<nav class="d-flex align-items-center">
						<a href="index.html">Home<span class="lnr lnr-arrow-right"></span></a>
						<a href="category.html">Blog</a>
					</nav>
				</div>
			</div>
		</div>
	</section>
	<!-- End Banner Area -->

	<!--================Blog Area =================-->
	<section class="blog_area single-post-area section_gap">
		<div class="container">
			<div class="row">
				<div class="col-lg-13 posts-list">
					<div class="single-post row">
						<div class="col-lg-13">
							<div class="feature-img">
								<img class="img-fluid" src="resources/img/banner/banner-bg.jpg"
									style="width: 80em; height: 40em; margin-left: auto; margin-right: auto; display: block;"
									alt="">
							</div>
							<br>
							<br>
						</div>
						<div class="col-lg-2  col-md-6">
							<div class="blog_info text-right">
								<div class="post_tag">
									<br>
									<br>
									<br> <a class="active" href="#"><b>카밍꿀팁</b></a>
								</div>
								<ul class="blog_meta list">
									<li>작성일: <input type="text"></li>
								</ul>

							</div>
						</div>
						<div class="col-lg-9 col-md-9 blog_details">
							<h2>제목: 
							<input type="text"> <br></h2>
							<p class="excert">
								<textarea rows="30" cols="100"></textarea>
						</div>

					</div>
				</div>
			</div>
		</div>
	</section>
	<!--================Blog Area =================-->

	<!-- start footer Area -->

	<%@include file="../../views/common/footer.jsp"%>
	<!-- End footer Area -->

</body>

</html>