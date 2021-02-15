<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="zxx" class="no-js">
<head>
<meta charset="UTF-8">
<title>CarMing | 캠핑 추천  - 카밍 레시피</title>
<style type="text/css">
	.col-first{margin: -1% 63.5% 0 -18%; } 
	.col-first > .maintext{font-weight: bold; font-size: 2.0em; color: #fff; text-align: left;}
	.text-1{margin: -5% 0 3%;}

 	#category_detail{background: #ffe6be; border-radius: 8px;}
 	
 	.bee-img{width: 70px; height: 70px;}
 	.recipe-img{width: 70px; height: 70px;}
 	.categories-img{margin-right: 5%;}
	
	.container-form{width: 100%;}
	.categories_post{float: left; width: 50%; margin-bottom: 3%}
	div.categories_details{background: transparent; }
	
	div.blog_right_sidebar{float: left; width: 75%; margin-bottom: -2%; margin-right: 7.5%; border: 0; background: #fff; }
	.btn.btn-default{margin-top: -6%; margin-right: -3%;}

</style>


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

<!-- kakao share -->
<script type="text/JavaScript" src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript">
   function sendLinkCustom() {
          Kakao.init("ec2908c95e9e6b6c236066424e7e8fa2");
          Kakao.Link.sendCustom({
              templateId: 44747
          });
      }
</script>
<script>   
   try {
         function sendLinkDefault(recipepURL , recipeFile) {
         Kakao.init('ec2908c95e9e6b6c236066424e7e8fa2')
         Kakao.Link.sendDefault({
                objectType: 'feed',
                content: {
                  title: 'Camping Talk',
                  description: '#추천 레시피',
                  imageUrl: recipeFile,
                  link: {
                       mobileWebUrl: 'https://www.10000recipe.com' + recipepURL,
                       webUrl: 'https://www.10000recipe.com' + recipepURL,
                  },
                },
                buttons: [{
                    title: '게시글 보러가기',
                    link: {
                      mobileWebUrl: 'https://www.10000recipe.com' + recipepURL,
                      webUrl: 'https://www.10000recipe.com' + recipepURL,
                    },
               }],
            })
         }; window.kakaoDemoCallback && window.kakaoDemoCallback() }
   catch(e) { window.kakaoDemoException && window.kakaoDemoException(e) }
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
	<main role="main" style="padding: 50px 200px; ">

	<!-- Start Category Area -->
	<div class="card-container">
		<div class="container-form">
			<div class="categories_post" id="category_post">
				<img src="resources/img/white.JPG" style="height: 150px;" alt="post">
				<div class="categories_details" id="category_detail">
					<div class="categories_text">
						<a href="recipeCrawling.do">
							<h5 style="font-weight: bold; color: #5f5f5f;">카밍 레시피</h5>
						</a>
						<div class="border_line" style="background: #5f5f5f;"></div>
						<p style="color: #5f5f5f;">카밍이 추천하는 맛있는 요리</p>
					</div>
				</div>
			</div>
		
			<div class="categories_post">
				<img src="resources/img/white.JPG" style="height: 150px;" alt="post">
				<div class="categories_details" id="category_detail">
					<div class="categories_text">
						<a href="TipCrawling.do">
							<h5 style="font-weight: bold; color: #5f5f5f;">카밍 꿀팁</h5>
						</a>
						<div class="border_line" style="background: #5f5f5f;"></div>
						<p style="color: #5f5f5f;">캠핑에 꼭 필요한 유용한 정보들</p>
					</div>
				</div>
			</div>
		</div>
	<!-- End Category Area -->

	<!--================Blog Area =================-->
	<section class="blog_area">
		<div class="container">
			<div class="row">
			
				<div class="col-lg-8" style="margin: -0.25% -8% 0 6%;">
					<div class="blog_left_sidebar">

						<c:forEach var="list" items="${list}">
						
							<article class="row blog_item">
								<div class="col-md-3">
									<div class="blog_info text-right">
										<div class="post_tag">
											<a class="active" href="#"><span style="font-weight: bold; color: #5f5f5f;">카밍 레시피</span></a>
										</div>

										<ul class="blog_meta list">
											<li>
												<a href="https://www.10000recipe.com${list.recipeWriterURL }">${list.recipeWriter }
													<i class="lnr lnr-user"></i>
												</a>
											</li>
											<li><a href="#">${list.views }<i class="lnr lnr-eye"></i></a></li>
											<li>카카오톡 공유 &nbsp;<a id="kakao-link-btn" onClick="sendLinkDefault('${list.recipeURL}','${list.recipeFile}');">
											<img class="share-kakaotalk" src="./resources/img/kakaotalk.png" style="height:20px; width: 20px"></a><li>
										</ul>
									</div>
								</div>
								<div class="col-md-9">
									<div class="blog_post">
										<a href="https://www.10000recipe.com${list.recipeURL }">
										<img src="${list.recipeFile }" style="width: 450px; height: 350px; border-radius: 5px;"></a>
										<div  class="blog_details">
											<a class="name" href="https://www.10000recipe.com${list.recipeURL }">
												<h5 style="color: #5f5f5f; font-weight: bold; width: 400px;">${list.recipeTitle}</h5>
											</a>
											<div class="recipe-detail-btn">
												<a href="https://www.10000recipe.com${list.recipeURL }"
													class="genric-btn primary" 
													style="margin-top: 1.5%; border-radius: 3px; font-size: 1em; margin-top: -0.3%;">
													<span>레시피 보기</span>
												</a>
											</div>
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
				
				<!-- 검색 -->
				<div class="col-lg-4" style="padding: 0;">
					<div class="blog_right_sidebar">
						<aside class="single_sidebar_widget search_widget">
							<div class="input-group">
								<input type="text" id="input" onkeyup="myFunction()" class="form-control" placeholder="무엇을 검색할까요?"
									onfocus="this.placeholder = ''"
									onblur="this.placeholder = '검색하기'"
									style="padding: 12%; font-size: 1.15em; border-radius: 5px; margin-top: -15%;"> 
									<span class="input-group-btn">
									<button class="btn btn-default" type="button">
										<i class="lnr lnr-magnifier"></i>
									</button>
								</span>
							</div>
						</aside>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--================Blog Area =================-->


	</div>
	</main>


	<!-- start footer Area -->
	<%@include file="../../views/common/footer.jsp"%>
	<!-- End footer Area -->

</body>

</html>