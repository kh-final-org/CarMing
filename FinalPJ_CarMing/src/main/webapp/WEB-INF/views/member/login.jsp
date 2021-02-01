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
	<style type="text/css">
		body {background-color: #fff; font-family: 'Ubuntu', sans-serif;}
    	.main {background-color: #fff; width: 400px; height: 450px; margin: 7em auto; border-radius: 1.5em; box-shadow: 0px 11px 35px 2px rgba(0, 0, 0, 0.14);}
    	
	    .loginform-logo{padding-top: 55px;}   
	    .login-logo{width: 150px; height: 100%; margin-right: 10px;}

		.input-user-idpw {width: 75%; color: #5f5f5f; font-size: 14px; letter-spacing: 1px; background: rgba(136, 126, 126, 0.04); padding: 10px 15px;
				 border: none; border-radius: 5px; outline: none; box-sizing: border-box; border: 2px solid rgba(0, 0, 0, 0.02);
				 margin-bottom: 8px; margin-left: 46px; text-align: left; font-family: 'Ubuntu', sans-serif;}
	    .userid:focus, .userpass:focus {border: 2px solid rgba(0, 0, 0, 0.18) !important;}
	    
	    .login-btn {cursor: pointer; color: #5f5f5f !important; background: #ffe6be; width: 300px; border: 0; border-radius: 5px; padding: 10px 40px;
				 	font-weight: bold; margin-top: 15px; margin-left: 12%; font-size: 1.1em; box-shadow: 0 0 20px 1px rgba(0, 0, 0, 0.04); outline: none;}
	    .signup{padding-top: 10px;}
	    .signup-btn {color: gray; font-size: 0.8em;}
	    a {text-decoration:none; } 
	    form.form1 {padding-top: 30px;}
	    input::placeholder{color: silver;}
	    
		@media (max-width: 600px) {.main {border-radius: 0px;}
    
	</style>


</head>
<body>
	<%@include file ="../common/header.jsp" %>

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
	<%@include file ="../common/footer.jsp" %>
</body>
</html>