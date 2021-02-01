<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고 내용</title>
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


<link rel="stylesheet" href="resources/css/contactus.css">


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
					<br>
					<h1>신고 사항</h1>
					<nav class="d-flex align-items-center">
						<a href="tipAndRecipeMain.do">신고 사항<span
							class="lnr lnr-arrow-right"></span></a> <a href="category.html">신고내용</a>
					</nav>
				</div>
			</div>
			<div class="section-top-border text-right">
				<div class="button-group-area mt-40" style="padding-bottom: 5em">
					<a href="reportlist.do"
						class="genric-btn danger-border e-large">목록으로</a> <a
						href="deletereport.do?reportNo=${list.reportNo}"
						class="genric-btn danger-border e-large">삭제하기</a>
				</div>
			</div>
		</div>
	</section>
	<!-- End Banner Area -->


	<!------ Include the above in your HEAD tag ---------->
	
	<form action="writeinquiry.do" method="POST">
	<div class="container contact">
		<div class="row">
				<div class="col-md-3">
					<div class="contact-info">
						<img src="resources/img/logo_chatbot.png" alt="image" />
						<h2>신고 내용</h2>
						<h4 style="color: #fdd9bd;">핑구에게 신고가 들어왔어요</h4>
					</div>
				</div>
				<div class="col-md-9">
					<div class="contact-form">
						<div class="form-group">
							<label class="control-label col-sm-2" for="writerNickname"> 제보자
								닉네임:</label>
							<div class="col-sm-10">
								<p class="form-control" id="writerNickname">${list.reportWriter }</p>		
							</div>
						</div>
						
						<div class="form-group">
							<label class="control-label col-sm-2" for="receiverNickname"> 신고대상
								닉네임:</label>
							<div class="col-sm-10">
								<p class="form-control" id="receiverNickname">				
								<a href="boarddetailform.do?brdno=${list.targetNo}">${list.targetWriter }</a>
								</p>	
							</div>
						</div>
						
						<div class="form-group">
							<label class="control-label col-sm-2" for="category"> 카테고리:
							</label><div class="col-sm-10">
								<p class="form-control" id="nickname">${list.categoryName }</p>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2" for="category"> 신고유형:
							</label><div class="col-sm-10">
								<p class="form-control" id="nickname">${list.targetTypeName }</p>
							</div>
						</div>
						<br>
						<div class="form-group">
							<label class="control-label col-sm-2" for="content" style="">신고
								내용:</label>
							<div class="col-sm-10">
								<textarea rows="15" cols="100" class="form-control"  readonly="readonly">${list.reportContent }</textarea>

							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2" for="input_img">첨부
								이미지:</label>
							<div class="col-sm-10">
								<img id="img" class=" form-control" style="height: 440px"
									;
									src="resources/img/report/${list.reportFileName }">
							</div>
						</div>
					</div>

					<div class="form-group">
						<label class="control-label col-sm-2" for="comment">작성일:</label>
						<div class="col-sm-10">
							<p class="form-control" id="category"><fmt:formatDate pattern = "yyyy-MM-dd" 
         						value = "${list.reportDate}" /></p>	
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
	<div style="padding-bottom: 20%"></div>
	<!-- start footer Area -->
	<%@include file="../../views/common/footer.jsp"%>
	<!-- End footer Area -->

</body>
</html>