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
		.un {
		    width: 76%;
		    color: #5f5f5f;
		    font-size: 14px;
		    letter-spacing: 1px;
		    background: rgba(136, 126, 126, 0.04);
		    padding: 10px 20px;
		    border: none;
		    border-radius: 8px;
		    outline: none;
		    box-sizing: border-box;
		    border: 2px solid rgba(0, 0, 0, 0.02);
		    margin-bottom: 8px;
		    margin-left: 46px;
		    text-align: left;
		    font-family: 'Ubuntu', sans-serif;
	    }
	    
	    .pass {
		    width: 76%;
		    color: #5f5f5f;
		    font-size: 14px;
		    letter-spacing: 1px;
		    background: rgba(136, 126, 126, 0.04);
		    padding: 10px 20px;
		    border: none;
		    border-radius: 8px;
		    outline: none;
		    box-sizing: border-box;
		    border: 2px solid rgba(0, 0, 0, 0.02);
		    margin-bottom: 50px;
		    margin-left: 46px;
		    text-align: left;
		    margin-bottom: 27px;
		    font-family: 'Ubuntu', sans-serif;
	    }
	    
	    .submit {
	      	cursor: pointer;
	        color: #5f5f5f !important;
	        background: #ffe6be;
	        border: 0;
	        width: 300px;
	        border-radius: 8px;
	        padding-left: 40px;
	        padding-right: 40px;
	        padding-bottom: 10px;
	        padding-top: 10px;
	        font-family: 'Ubuntu', sans-serif;
	        font-weight: bold;
	        margin-left: 12%;
	        font-size: 1.1em;
	        box-shadow: 0 0 20px 1px rgba(0, 0, 0, 0.04);
	        outline: none;
	    }
	    
	    .sign{padding-top: 55px; color: #5f5f5f; font-size: 2.2em;}   
	    .forgot {color: gray; padding-top: 10px; font-size: 1.15em;}
	    .signup-btn {color: gray; font-size: 0.8em;}
	    form.form1 {padding-top: 30px;}
	    input::placeholder{color: silver;}
	</style>


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
<main role="main" style="padding-bottom: 5px; ">
<section id="content">
	<div class="main">
		<p class="sign" align="center">CarMing</p>
		<form class="form1">
			<input class="un " type="text" align="center" placeholder="이메일" id="memid">
			<input class="pass" type="password" align="center" placeholder="비밀번호" id="mempw">
			<input type="button" value="로그인" class="submit" align="center" onclick="login();">
			<div class="forgot" align="center"><a href="registerform.do" class="signup-btn">회원가입</a></div>
		</form>        
   	</div>
</section>





</main>
</body>
</html>