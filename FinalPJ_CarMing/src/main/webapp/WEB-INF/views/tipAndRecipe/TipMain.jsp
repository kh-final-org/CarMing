<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
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
<title>CarMing | 캠핑 추천 - 카밍 꿀팁</title>

<!-- <script>
/* 	article = document.getElementsByTagName("article");
	var x = article.style.display;
	console.log(x);
	if( x === "none"){
	    
	   
		} */
function myFunction() {
    var input, filter, ul, li, a, i, txtValue, article;
    input = document.getElementById("input");
    filter = input.value;
    /* .value.split(" ").join(""); */
    article = document.getElementsByTagName("article");
    
    for(i=0; i<article.length; i++){
        a = document.getElementsByClassName("name")[i];
        txtValue = a.textContent || a.innerText;
        
        if (txtValue.indexOf(filter) > -1) {
        	article[i].style.display = "";
        	
        	
        } else {
            article[i].style.display = "none";
            var x =  article[i].style.display;
        	
            }
	}
 		}if(x === "none"){
			 console.log(x);
			 
			 var para = document.createElement("p");
				para.innerText = "검색하신 결과가 없습니다.";
				console.log(para)
				var mydiv = document.getElementById("myDIV")
				mydiv.style.textAlign = "center";
				mydiv.style.fontSize = "30px";
				mydiv.appendChild(para);
	}
     
   
</script>  -->

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
            x = article[i].style.display = "none";
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
         function sendLinkDefault(tipURL , tipFile) {
         Kakao.init('ec2908c95e9e6b6c236066424e7e8fa2')
         Kakao.Link.sendDefault({
                objectType: 'feed',
                content: {
                  title: 'Camping Talk',
                  description: '#캠핑 꿀팁',
                  imageUrl: 'https://www.5gcamp.com/' + tipFile,
                  link: {
                       mobileWebUrl: 'https://www.5gcamp.com' + tipURL,
                       webUrl: 'https://www.5gcamp.com' + tipURL,
                  },
                },
                buttons: [{
                    title: '게시글 보러가기',
                    link: {
                      mobileWebUrl: 'https://www.5gcamp.com' + tipURL,
                      webUrl: 'https://www.5gcamp.com' + tipURL,
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
	         <div class="col-first">
	            <h1>The stars in the night sky</h1>
	         	<nav class="d-flex align-items-center">
	               <a href="index.html">Home<span class="lnr lnr-arrow-right"></span></a>
	               <a href="tipAndRecipeMain.do">Recipe</a>
	            </nav>
	         </div>
	      </div>
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
					<div id="myDIV"class="blog_left_sidebar">

						<c:forEach var="list" items="${list}">

							<article class="row blog_item">
								<div class="col-md-3">
									<div class="blog_info text-right">
										<div class="post_tag">
											<a class="active" href="#"><b>카밍 꿀팁</b></a>

										</div>

										<ul class="blog_meta list">
											<li>${list.views }<i class="lnr lnr-eye"></i></li>
											<li>카카오 공유하기 &nbsp;<a id="kakao-link-btn" onClick="sendLinkDefault('${list.tipURL}','${list.tipFile }');"><img class="share-kakaotalk" src="./resources/img/kakaotalk.png" style="height:25px; width: 25px"></a><li>
										</ul>
									</div>
								</div>
								<div class="col-md-9">
									<div class="blog_post">
										<a href="https://www.5gcamp.com${list.tipURL }"><img
											src="https://www.5gcamp.com/${list.tipFile }"
											style="width: 500px; height: 300px;"></a>
										<div class="blog_details">
											<a class="name" href="https://www.5gcamp.com${list.tipURL }">
												<h2>${list.tipTitle}</h2>
											</a> <a href="https://www.5gcamp.com${list.tipURL }"
												class="genric-btn primary" style="margin-top: 3%;"><strong>꿀팁
													보기</strong></a>
										</div>
									</div>
								</div>
							</article>
						</c:forEach>


						<!-- <nav class="blog-pagination justify-content-center d-flex">
									<ul class="pagination">
										<li class="page-item"><a href="#" class="page-link"
											aria-label="Previous"> <span aria-hidden="true"> <span
													class="lnr lnr-chevron-left"></span>
											</span>
										</a></li>
										<li class="page-item"><a href="#" class="page-link">01</a></li>
										<li class="page-item active"><a href="#"
											class="page-link">02</a></li>
										<li class="page-item"><a href="#" class="page-link">03</a></li>
										<li class="page-item"><a href="#" class="page-link">04</a></li>
										<li class="page-item"><a href="#" class="page-link">05</a></li>
										<li class="page-item"><a href="#" class="page-link"
											aria-label="Next"> <span aria-hidden="true"> <span
													class="lnr lnr-chevron-right"></span>
											</span>
										</a></li>
									</ul>
								</nav> -->
					</div>
				</div>
				<div class="col-lg-4">
					<div class="blog_right_sidebar"
						style=" background-color: white; border: 0px;">
						<aside class="single_sidebar_widget search_widget">
							<div class="input-group">
								<input type="text" class="form-control" id="input"
									onkeyup="myFunction()" placeholder="무엇을 검색할까요?"
									onfocus="this.placeholder = '무엇을 검색할까요?'"
									onblur="this.placeholder = '무엇을 검색할까요?'"> <span
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