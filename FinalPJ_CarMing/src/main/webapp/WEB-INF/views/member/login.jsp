<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@
	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CarMing</title>
  <link rel="stylesheet" href="resources/css/login.css">
  <link href="https://fonts.googleapis.com/css?family=Ubuntu" rel="stylesheet">
  <meta name="viewport" content="width=device-width, initial-scale=1" />

  


</head>


<body>

	<section id="header">
		<%@include file ="../common/header.jsp" %>
	</section>
	<!-- Start Banner Area -->

	<section class="banner-area organic-breadcrumb">
		<div class="container">
			<div
				class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
				<div class="col-first">
					<h1>로그인</h1>
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
	<section id="content">
	 	<div class="main">
	    	<p class="sign" align="center">로그인</p>
	    <form class="form1">
	      <input class="un " type="text" align="center" placeholder="e-mail" id="memid">
	      <input class="pass" type="password" align="center" placeholder="Password" id="mempw">
	      <input type="button" value="로그인" class="submit" align="center" onclick="ajaxlogin();">
	      <!-- 네이버 로그인 창으로 이동 -->
			<div id="naver_id_login" style="text-align:center"><a href="${url}">
			<img width="223" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png"/></a></div>
			<br>		
	      <p class="forgot" align="center"><a href="registerform.do">회원가입</a></p>
	    </form>      
	           
    	</div>
	</section>
	
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="resources/js/login.js?ver=1"></script>
	
	<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>

</body>
</html>