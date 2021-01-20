<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
<title>카밍 정보 메인</title>
<script>
function myFunction() {
    var input, filter, ul, li, a, i, txtValue, article;
    input = document.getElementById("input");
    filter = input.value

    article = document.getElementsByTagName("article");
    
    for(i=0; i<article.length; i++){
        a = document.getElementsByClassName("name")[i];
        txtValue = a.textContent || a.innerText;
        
        if (txtValue.toUpperCase().indexOf(filter) > -1) {
        	article[i].style.display = "";
        } else {
            article[i].style.display = "none";
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
			<div
				class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
				<div class="col-first">
					<h1>핑구 추천</h1>
					<nav class="d-flex align-items-center">
						<a href="index.html">Home<span class="lnr lnr-arrow-right"></span></a>
						<a href="tipAndRecipeMain.do">레시피</a>
					</nav>
				</div>
			</div>
			<!-- <div class="section-top-border text-right">
				<div class="button-group-area mt-40" style="padding-bottom: 5em">
					<a href="recipeWriteForm.do" class="genric-btn primary e-large"
						style="font-weight: bold; background-color: rgb(202, 82, 38);">새
						글 작성하기</a>
				</div>
			</div> -->
		</div>
	</section>
	<!-- End Banner Area -->

	<!--================Blog Categorie Area =================-->
	<section class="blog_categorie_area">
		<div class="container">
			<div class="row">
				<div class="col-lg-6">
					<div class="categories_post">
						<img src="resources/img/tipandrecipe/fire.jpg"
							style="width: 400px; height: 300px;" alt="post">
						<div class="categories_details">
							<div class="categories_text">
								<a href="recipeCrawling.do">
									<h5>카밍 레시피</h5>
								</a>
								<div class="border_line"></div>
								<p>카밍이 추천하는 맛있는 요리</p>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="categories_post">
						<img src="resources/img/tipandrecipe/honey.jpg"
							style="width: 400px; height: 300px;" alt="post">
						<div class="categories_details">
							<div class="categories_text">
								<a href="TipCrawling.do">
									<h5>카밍 꿀팁</h5>
								</a>
								<div class="border_line"></div>
								<p>캠핑에 꼭 필요한 정보들</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--================Blog Categorie Area =================-->

	<!--================Blog Area =================-->
	<section class="blog_area">
		<div class="container">
			<div class="row">
				<div class="col-lg-8">
					<div class="blog_left_sidebar">

						<c:forEach var="list" items="${list}">
						
							<article class="row blog_item">
								<div class="col-md-3">
									<div class="blog_info text-right">
										<div class="post_tag">
											<a class="active" href="#"><b>카밍 레시피</b></a>

										</div>

										<ul class="blog_meta list">
											<li><a
												href="https://www.10000recipe.com${list.recipeWriterURL }">${list.recipeWriter }<i
													class="lnr lnr-user"></i></a></li>
											<li><a href="#">${list.views }<i class="lnr lnr-eye"></i></a></li>
										</ul>
									</div>
								</div>
								<div class="col-md-9">
									<div class="blog_post">
										<a href="https://www.10000recipe.com${list.recipeURL }"><img
											src="${list.recipeFile }"
											style="width: 500px; height: 300px;"></a>
										<div  class="blog_details">
											<a class="name" href="https://www.10000recipe.com${list.recipeURL }">
												<h2>${list.recipeTitle}</h2>
											</a>
											<a href="https://www.10000recipe.com${list.recipeURL }"
												class="genric-btn primary" style="margin-top: 3%;"><strong>레시피
													보기</strong></a>
											
										</div>
									</div>
								</div>
							</article>
						</c:forEach>
		

						<nav class="blog-pagination justify-content-center d-flex">
							<ul class="pagination">
								<!-- <li class="page-item"><a href="#" class="page-link"
									aria-label="Previous"> <span aria-hidden="true"> <span
											class="lnr lnr-chevron-left"></span>
									</span>
								</a></li>
								<li class="page-item"><a href="#" class="page-link">01</a></li>
								<li class="page-item active"><a href="#" class="page-link">02</a></li>
								<li class="page-item"><a href="#" class="page-link">03</a></li>
								<li class="page-item"><a href="#" class="page-link">04</a></li>
								<li class="page-item"><a href="#" class="page-link">05</a></li>
								<li class="page-item"><a href="#" class="page-link"
									aria-label="Next"> <span aria-hidden="true"> <span
											class="lnr lnr-chevron-right"></span>
									</span>
								</a></li> -->
							</ul>
						</nav>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="blog_right_sidebar">
						<aside class="single_sidebar_widget search_widget">
							<div class="input-group">
								<input type="text" id="input" onkeyup="myFunction()" class="form-control" placeholder="카밍 검색하기"
									onfocus="this.placeholder = ''"
									onblur="this.placeholder = '검색하기'"> <span
									class="input-group-btn">
									<button class="btn btn-default" type="button">
										<i class="lnr lnr-magnifier"></i>
									</button>
								</span>
							</div>
							<!-- /input-group -->
							<div class="br"></div>
						</aside>
						<aside class="single_sidebar_widget popular_post_widget">
							<h3 class="widget_title">카밍 추천 글</h3>
							<div class="media post_item">
								<img src="resources/img/banner/banner-bg.jpg"
									style="width: 60px; height: 50px;" alt="post">
								<div class="media-body">
									<a href="blog-details.html">
										<h3>Space The Final Frontier</h3>
									</a>
									<p>02 Hours ago</p>
								</div>
							</div>
							<div class="media post_item">
								<img src="resources/img/banner/banner-bg.jpg"
									style="width: 60px; height: 50px;" alt="post">
								<div class="media-body">
									<a href="blog-details.html">
										<h3>The Amazing Hubble</h3>
									</a>
									<p>02 Hours ago</p>
								</div>
							</div>
							<div class="media post_item">
								<img src="resources/img/banner/banner-bg.jpg"
									style="width: 60px; height: 50px;" alt="post">
								<div class="media-body">
									<a href="blog-details.html">
										<h3>Astronomy Or Astrology</h3>
									</a>
									<p>03 Hours ago</p>
								</div>
							</div>
							<div class="media post_item">
								<img src="resources/img/banner/banner-bg.jpg"
									style="width: 60px; height: 50px;" alt="post">
								<div class="media-body">
									<a href="blog-details.html">
										<h3>Asteroids telescope</h3>
									</a>
									<p>01 Hours ago</p>
								</div>
							</div>
							<div class="br"></div>
						</aside>
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