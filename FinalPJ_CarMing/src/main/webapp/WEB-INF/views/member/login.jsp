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

  
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
  
<script src="resources/js/login.js"></script>
</head>


<body>

	<section id="header">
		<%@include file ="../common/header.jsp" %>
	</section>
		<!-- Start Banner Area -->
	<section class="banner-area organic-breadcrumb" style="height: 310px;">
		<div class="container">
			<div class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end" style="padding: 105px 0px;">
				<div class="col-first">
					<h1>The stars in the night sky</h1>
				</div>
			</div>
		</div>
	</section>
	<!-- End Banner Area -->
	<section id="content">
	 	<div class="main">
	    	<p class="sign" align="center">로그인</p>
	    <form class="form1">
	      <input class="un " type="text" align="center" placeholder="e-mail" id="memid">
	      <input class="pass" type="password" align="center" placeholder="Password" id="mempw">
	      <input type="button" value="로그인" class="submit" align="center" onclick="login();">
	      <p class="forgot" align="center"><a href="registerform.do">회원가입</a></p>
	    </form>        
	           
    	</div>
	</section>

</body>
</html>