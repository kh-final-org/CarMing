<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CarMing | 신고 상세 페이지</title>
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


<link rel="stylesheet">
<style type="text/css">
	#banner-text-2{position: absolute; top: 255px; right: 245px;}
	.banner-btn{width: 115px; padding: 8px 0 10px; line-height: 18px; border: 2px solid #fff5e9; border-radius: 3px;
				font-size: 1.1em; text-align: center; color: #fff5e9; background: transparent; opacity: 0.95;  
				position:relative; overflow: hidden; transition: 0.95s; cursor: pointer;}
	.banner-btn:hover{background: #fff5e9; color: #5f5f5f;}
	.banner-btn::before{content: ""; position: absolute; left:0; width:100%; height: 0%; background: #fff5e9; z-index: -1; 
						top:0; border-radius: 0 0 50% 50%; transition: 0.95s;}
	.banner-btn:hover::before{height: 180%;}
	.container-contact{margin: 50px 340px; box-shadow: 15px 5px 30px rgba(0, 0, 0, 0.14);}

	.col-md-3{background: #ff9b00; padding: 4%; border-top-left-radius: 0.5rem; border-bottom-left-radius: 0.5rem;}
	#pingu-img{width: 100px; height: 100%; margin: -13.5% 0 8% 23%; z-index: 1;}
	#pingu-confirm{width: 55px; height: 100%; margin: -5% 0 16% 35%; z-index: 10;}
	.contact-info h3{margin-bottom: 1.8%; margin-top: -2%; margin-left: -1%; color: #fff; text-align: center; font-weight: bold;}
	.contact-info h5{ margin-left: 1.5%; color: #fff; text-align: center; margin-bottom: 8%; font-weight: bold;}
	.contact-info h6{ margin-left: 1.8%; color: #fff; text-align: center; opacity: 0.8;}

	.col-md-9{padding: 3% 5% 0; border-top-right-radius: 0.5rem; border-bottom-right-radius: 0.5rem;border: 1px solid #e2e2e2; background: #fff5e9;}
	.contact-form{width: 750px; height: 100%;}
	#user-nickname{float: left; width: 150px; padding: 0; margin: 5px 0 0 15px; font-size: 1.2em; font-weight: bold;}
	#writerNickname{float: right; width: 450px; margin-right: 10px;}
	.form-group-report-form{float: left; width:100%;}
	.form-group-report-form-2{float: left; width:100%; margin-bottom: 5px;}
	#report-date{float: left; width: 150px; padding: 0; margin: 5px 0 0 15px; font-size: 1.2em; font-weight: bold;}
	#date{float: right; width: 450px; margin-right: 150px;}	
	.form-group-category-form{float: left; margin-bottom: 15px; width: 100%;}
	.report-category{display: inline-block; float: left; margin: 5px 0 0 15px; width: 10%; font-size: 1.2em; mar}
	.report-category-wrap{float: left; width: 72%; margin-left: 60px;}
	.report-target-category{display: inline-block; float: left; margin: 5px 0 0 15px; width: 10%; font-size: 1.2em;}
	.form-group-target-category-form{float: left; margin-bottom: 20px; width: 100%;}
   	.receiver-name{color: #5f5f5f;}				
   	.receiver-name:hover{color: #5f5f5f;}				
	#categoryno{ width:100px;}
	.current{font-size: 1.1em;}
	textarea {padding: 10px 14px; border: 1px solid #e2e2e2; border-radius: 5px;}
    textarea::placeholder{color: silver; font-size: 1.1em;}
	#report-text{font-size: 1.2em; margin-bottom: 10px; font-weight: bold;}	
	.report-file{display: inline-block; font-size: 1.2em; margin-bottom: 10px; margin-left: 15px;}
	.uploadimg {width: 350px; height: 350px; border-radius: 10px;}
	.img_wrap {width: 350px; height: 350px; margin-top: 20px; }
	.img_wrap img {max-width: 100%; max-height: 95%;}
	.center-block {display: block; margin-left: auto; margin-right: auto; margin-left: 135px;}	
	.upload-img-form{position: relative; width: 590px; border: 1px solid #e2e2e2; margin-left: 15px; 
					 border-radius: 5px; margin-bottom: 60px; background: #fff;}
   	.upload-img-content{position: absolute; margin-top: 15px; width: 590px;}
   	#button-boardupload{width: 350px; height: 50px; margin: 25px 125px 0 135px; border-radius: 10px; 
   						background-color: #ffe6be; font-size:1.2em; color: #5f5f5f; margin-bottom: 5%;}
   						
</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"
		integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4"
		crossorigin="anonymous"></script>
<script src="resources/js/vendor/bootstrap.min.js"></script>
<script src="resources/js/jquery.ajaxchimp.min.js"></script>
<script src="resources/js/jquery.nice-select.min.js"></script>
<script src="resources/js/jquery.sticky.js"></script>
<script src="resources/js/nouislider.min.js"></script>
<script src="resources/js/jquery.magnific-popup.min.js"></script>
<script src="resources/js/owl.carousel.min.js"></script>
</head>
<body>

	<!-- Start Header Area -->
	<%@include file="../../views/common/header.jsp"%>
	<!-- End Header Area -->
	
	<!-- Start Banner Area -->
	<section class="banner-area organic-breadcrumb">
	   <div class="container">
	      <div class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end" >
	         <div class="col-first" id="banner-text-1">
	            <h1>The stars in the night sky</h1>
	            <nav class="d-flex align-items-center">
	               <a href="home.do"><span class="lnr lnr-home"></span>Home</a>&emsp;
	               <a href="#"><span class="lnr lnr-arrow-right-circle"></span>Camping</a>
	            </nav>
	         </div>
	      </div>
		  <div class="section-top-border text-right" id="banner-text-2">
	       	 <div class="button-group-area mt-40" style="padding-bottom: 5em">
	       	 	<button class="banner-btn" id="gowrite" type="button" onclick="location.href='deletereport.do?reportNo=${list.reportNo}'">신고 삭제</button>
	       	 	<button class="banner-btn" id="golist" type="button" onclick="location.href='reportlist.do'">신고 목록</button>
	         </div>
		  </div>
		</div>
	</section>
	<!-- End Banner Area -->

	<!------ Include the above in your HEAD tag ---------->
	<div class="container-contact">
		<div class="row">
			<div class="col-md-3">
				<div class="contact-info">
					<img id="pingu-confirm" src="./resources/img/confirm.png">
					<img id="pingu-img" src="resources/img/logo_chatbot.png" alt="image" /><br>
					<h3>신고 내용</h3>
					<h5>핑구가 확인해 드릴게요</h5>
					<h6>고객님께서 신고하신<br>내용입니다</h6>
				</div>
			</div>
			<div class="col-md-9">
				<div class="contact-form">
					<!-- 제보자 닉네임 -->
					<div class="form-group-report-form">
						<label class="control-label col-sm-2" id="user-nickname" for="writerNickname">제보자 닉네임</label>
						<div class="col-sm-10">
							<p class="form-control" id="writerNickname">${list.reportWriter }</p>		
						</div>
					</div>
					
					<!-- 작성일 -->
					<div class="form-group-report-form">
					<label class="control-label col-sm-2" id="report-date" for="comment">작성일</label>
					<div class="repot-date-form">
						<p class="form-control" id="date">
							<fmt:formatDate pattern = "yyyy-MM-dd" 
        						value = "${list.reportDate}" /></p>	
						</div>
					</div>
					
					<!-- 신고 대상 -->
					<div class="form-group-report-form">
						<label class="control-label col-sm-2"  id="user-nickname"  for="receiverNickname">신고대상 닉네임</label>
						<div class="col-sm-10">
							<p class="form-control" id="writerNickname">				
								<a class="receiver-name" href="boarddetailform.do?brdno=${list.targetNo}">${list.targetWriter }</a>
							</p>	
						</div>
					</div>
					
					<!-- 카테고리 -->
					<div class="form-group-report-form">
						<label class="control-label col-sm-2"  id="user-nickname" for="category">카테고리</label>
						<div class="col-sm-10">
							<p class="form-control" id="writerNickname">${list.categoryName }</p>
						</div>
					</div>
					
					<!-- 신고 유형 -->
					<div class="form-group-report-form-2">
						<label class="control-label col-sm-2" id="user-nickname" >신고유형</label>
						<div class="col-sm-10">
							<p class="form-control" id="writerNickname">${list.targetTypeName }</p>
						</div>
					</div>
					<br><br>
					
					<!-- 신고내용 -->
					<div class="form-group">
						<label class="control-label col-sm-2" for="content" id="report-text">신고 내용</label>
						<div class="col-sm-10">
							<textarea rows="3" cols="75" id="content" name="reportContent" readonly="readonly"  style="resize: none;">${list.reportContent }</textarea>
						</div>
					</div>
					
					<div class="report-file"><strong>첨부 파일</strong></div>
					<div class="upload-img-form">
						<div class="img_wrap center-block">
							<img id="img" src="resources/img/report/${list.reportFileName }">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- start footer Area -->
	<%@include file="../../views/common/footer.jsp"%>
	<!-- End footer Area -->

</body>
</html>