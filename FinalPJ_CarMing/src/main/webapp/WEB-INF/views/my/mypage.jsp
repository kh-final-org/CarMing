<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CarMing</title>
<style type="text/css">
	.profile-wrapper{
		border: 1px solid #eeeeee;
		padding: 30px; 
		box-sizing: content-box; 
		text-align: center;
		background: #fafaff;
		margin: auto;
	}
	.profile-wrapper h1{
		padding-top: 30px;
	}
	.mypage-title{
		margin: 50px;
		font-size: 20px;
	}
	.filter-bar d-flex flex-wrap align-items-center{
		text-align: center;
	}
	.row{
		margin-top: 100px;
		margin-bottom: 100px;
		margin-left: -80px;
		margin-right: -100px;
	}
	.myboard-wrapper{
		margin: 50px;
	}
	.mycamp-wrapper{
		margin: 50px;
	}
</style>
</head>
<body>
	<%@ include file="../common/header.jsp" %>
	<!-- Start Banner Area -->
	<section class="banner-area organic-breadcrumb">
		<div class="container">
			<div class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
				<div class="col-first">
					<h1>마이페이지</h1>
					<nav class="d-flex align-items-center">
						<a href="index.html">홈<span class="lnr lnr-arrow-right"></span></a>
						<a href="category.html">마이페이지</a>
					</nav>
				</div>
			</div>
		</div>
	</section>
	<!-- End Banner Area -->
	<!-- start 프로필 정보 영역 -->
		<div class="container">
		<div class="row">
			<div class="profile-wrapper">
				<div class="thumb-wrapper">
					<img src="resources/img/user.png" style="width: 200px; height: 250px;">
					<div class="badge">7</div>
				</div>
				<div class="text-area">
					<h1>monaa22</h1>
				<div class="user-mail">
					<p>bialeeys@naver.com</p>
				</div>
					<div class="my-desc">
						<input type="button" value="프로필 수정" onclick="" style="background: #ffba00; border: none; color: white;">
					</div>
				</div>

			</div>
			<!-- end 프로필 정보 영역 -->
			<!-- start 내 게시물 영역 -->
			<div class="col-xl-9 col-lg-8 col-md-7" style="border: 1px solid #eeeeee; background: #fafaff;">
				<span class="mypage-title">내 게시물</span>
				<div class="myboard-wrapper">
					<div class="single-product">
						<img class="img-fluid" src="resources/img/logo.png" alt="" style="width:150px; height:150px;">
						<img class="img-fluid" src="resources/img/logo.png" alt="" style="width:150px; height:150px;">
					</div>
					<div class="filter-bar d-flex flex-wrap align-items-center">
						<div class="pagination">
							<a href="#" class="prev-arrow"><i class="fa fa-long-arrow-left" aria-hidden="true"></i></a>
							<a href="#" class="active">1</a>
							<a href="#">2</a>
							<a href="#">3</a>
							<a href="#" class="dot-dot"><i class="fa fa-ellipsis-h" aria-hidden="true"></i></a>
							<a href="#">6</a>
							<a href="#" class="next-arrow"><i class="fa fa-long-arrow-right" aria-hidden="true"></i></a>
						</div>
					</div>
				</div>
			<!-- end 내 캠핑맵 영역 -->
				<span class="mypage-title">내 캠핑맵</span>
				<div class="mycamp-wrapper">
					<div class="single-product">
						<img class="img-fluid" src="resources/img/logo.png" alt="" style="width:150px; height:150px;">
						<img class="img-fluid" src="resources/img/logo.png" alt="" style="width:150px; height:150px;">
					</div>
					<div class="filter-bar d-flex flex-wrap align-items-center">
						<div class="pagination">
							<a href="#" class="prev-arrow"><i class="fa fa-long-arrow-left" aria-hidden="true"></i></a>
							<a href="#" class="active">1</a>
							<a href="#">2</a>
							<a href="#">3</a>
							<a href="#" class="dot-dot"><i class="fa fa-ellipsis-h" aria-hidden="true"></i></a>
							<a href="#">6</a>
							<a href="#" class="next-arrow"><i class="fa fa-long-arrow-right" aria-hidden="true"></i></a>
						</div>
					</div>
				</div>
			</div>
		</div>
		</div>
	<%@ include file="../common/footer.jsp" %>
</body>
</html>