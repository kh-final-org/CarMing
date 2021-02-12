<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CarMing | 마이페이지</title>
<style type="text/css">
	.card-container{width: 100%;}
		
	.card-profile{float: left; width: 27%; height: 400px; margin-right: 80px; margin-top: 40px; 
				  border-radius: 10px; box-shadow: 10px 10px 30px rgba(0, 0, 0, 0.14);}	
	.profilepage-profile{margin: 55px 63px 25px;}	
	.user-profile{width: 170px; height: 170px; border-radius: 5em;}
	.user-id{font-size:1.6em; margin: 15px 38px 10px 38px; width: 100px; text-align: center;}
	.user-email{font-size:1.2em; color: silver; margin: -5% 2% 0; text-align: center;}
	.my-desc{padding: 0 7%; margin-top: -1%;}
	.profile-btn{width: 140px; padding: 8px 0 10px; line-height: 20px; border: 0; border-radius: 4px; outline: none;
				font-size: 1.15em; text-align: center; color: #5f5f5f; background-color: #ffe6be; cursor: pointer;}
	.profile-btn:hover{background: #ffdb9f; transition: 0.2s;}
	#profile-btn-1{width: 115px !important; margin-right: 2px;}
	#profile-btn-1{margin: 0;}

	.card-body{float: right; width: 65.5%; height: 100%; padding: 0 !important;}
	.card-mypage-title{font-size:1.8em; margin-bottom: 17px; color: #5f5f5f;}
	.boardlistup{float: left; width: 33.3%}
	.boardlistup-frame{position: relative; width: 235px; height: 235px; overflow: hidden; border-radius: 5px;}
	.boardlist-img{width: 235px; height: 235px; border-radius: 5px; transform: scale(1.00);	transition: transform .2s;}
	.boardlist-img:hover{transform: scale(1.02); transition: transform .2s;}
	.boardlistup{overflow: hidden; border-radius: 5px; margin-bottom: 10px;}
	.card-boardlist-board{margin-bottom: 5%; width: 100%;}
	#board-photo{float: left;}
	#banner-text-2{position: absolute; top: 255px; right: 245px;}
	.banner-btn{width: 115px; padding: 8px 0 10px; line-height: 18px; border: 2px solid #fff5e9; border-radius: 3px;
				font-size: 1.1em; text-align: center; color: #fff5e9; background: transparent; opacity: 0.95;  
				position:relative; overflow: hidden; transition: 0.95s; cursor: pointer;}
	.banner-btn:hover{background: #fff5e9; color: #5f5f5f;}
	.banner-btn::before{content: ""; position: absolute; left:0; width:100%; height: 0%; background: #fff5e9; z-index: -1; 
						top:0; border-radius: 0 0 50% 50%; transition: 0.95s;}
	.banner-btn:hover::before{height: 180%;}
	
	.card-container{padding: 50px 200px;}
	.card {position: relative; width: 80%; margin-left: auto; margin-right: auto;}

	div.blog_right_sidebar{float: right; width: 22%; margin-bottom: -1.5%; margin-right: 7.5%; border: 0; background: #fff;}
	.btn.btn-default{margin-top: -6%; margin-right: -3%;}
	.gaadiex-list {border-radius: 10px; list-style-type: none; margin: 0; padding: 0;}
	.gaadiex-list-title > h2{float:left; width: 25%; margin: 1% 0 0 10%; font-family:'Malgun Gothic'; color: #5f5f5f; font-size: 2.2em;}
	.gaadiex-list>.gaadiex-list-item {padding: 0 20px 0 25px;}
	.gaadiex-list-item {width: 45%; float:left; margin-left: 2%;}
	.gaadiex-list-item-img > img {float: left; width: 100px; height: 100px; margin: 50px 30px 8px 30px; border-radius: 50%;}
	.gaadiex-list-item-text {margin-top: 50px; color: gray; margin-left: 160px;}
	.gaadiex-list-item-text a{color: gray;}
	.gaadiex-list-item-text a:hover{color: #ffba00; color: gray;}
	.gaadiex-list-item-text h4{margin-bottom: 5px; font-weight: bold; color: gray;}
	.list-item-text-ck:hover{border-radius: 2px; background: #fff5e9; transition: 0.2s;}

</style>
</head>
<body>
	<%@ include file="../common/header.jsp" %>
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
	<main role="main" style="padding: 50px 200px 40px; ">
	
	<!-- Start Container Area -->
	<div class="card-container">
		<!-- 사용자 프로필 -->
		<div class="card-profile">
			<div class="profilepage-profile">
				<img class="user-profile" src="${login.memfile}" alt="">
				<div class="user-id"><strong>userNick</strong></div>
				<div class="user-email">bialeeys@naver.com</div>
			</div>
			<div class="my-desc">
				<input type="button" class="profile-btn" id="profile-btn-1" value="프로필 수정" onclick="location.href='profilechangeform.do'">
				<button type="button" class="profile-btn" id="profile-btn-2" onclick="location.href='ordernpay.do'">주문 및 결제 내역</button>
			</div>
		</div>
		
		<!-- Start BoardList/Map Area -->
		<div class="card-body" >
			<!-- 내 게시글  -->
				<div class="card">
			<div class="gaadiex-list" style="padding-bottom: 3%; margin-bottom: 3%">
				<c:forEach var = "list" items="">
				<div class="gaadiex-list-item">
					<div class="gaadiex-list-item-img">
						<img class="list-item-img" src="hi" alt="List user">
					</div>
					<div class="gaadiex-list-item-text">
						<h4>
						<a href="inquirydetail.do?inquiryNo=2" id="content">
							<c:set var="TextValue" value="abc"/> 
								<%-- <span class="list-item-text-ck">문의 내용&nbsp;&#124;&nbsp;${fn:substring(TextValue,0,8)}</span> --%>
							</a>
						</h4>
						
						<div class="gaadiex-list-item-text-ck">
							<a href="profileform.do?memno=1">닉네임&nbsp;&#124;&nbsp;abc</a>
						</div>
						
						<div class="category">카테고리&nbsp;&#124;&nbsp;2</div>
						<%-- <div>작성 날짜&nbsp;&#124;&nbsp;<fmt:formatDate pattern = "yyyy-MM-dd" value = "${list.inquiryDate}"/></div>	 --%>
						<button class="banner-btn" id="golist" type="button" style="color: orange;" onclick="location.href='deleteinquiry.do?inquiryNo=1'">삭제</button>	
					</div>
				</div>
				</c:forEach>
			</div>
		</div>
		<%-- 	
			<div class="card-mypage-title">내 캠핑맵</div>
			<div class="card-boardlist-map">
				<div class="boardlistup" id="board-photo">
					<div class="boardlistup-frame">
						<a href="boarddetailform.do?brdno=${dto.brdno }&memno=${dto.memno}">
							<img class="boardlist-img" src="resources/img/board/${dto.brdfilename }">
						</a>
					</div>
				</div>
			</div>
		</div> --%>
		<!-- End BoardList/Map Area -->
	</div>
	<!-- End Container Area -->
	<table class="table table-hover"></table>
	</main>
	
	<%@ include file="../common/footer.jsp" %>
</body>
</html>