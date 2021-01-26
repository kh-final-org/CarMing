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

		.input-user-idpw {width: 76%; color: #5f5f5f; font-size: 14px; letter-spacing: 1px; background: rgba(136, 126, 126, 0.04); padding: 10px 15px;
				 border: none; border-radius: 8px; outline: none; box-sizing: border-box; border: 2px solid rgba(0, 0, 0, 0.02);
				 margin-bottom: 8px; margin-left: 46px; text-align: left; font-family: 'Ubuntu', sans-serif;}
	    .userid:focus, .userpass:focus {border: 2px solid rgba(0, 0, 0, 0.18) !important;}
	    
	    .login-btn {cursor: pointer; color: #5f5f5f !important; background: #ffe6be; width: 300px; border: 0; border-radius: 8px; padding: 10px 40px;
				 	font-weight: bold; margin-left: 12%; font-size: 1.1em; box-shadow: 0 0 20px 1px rgba(0, 0, 0, 0.04); outline: none;}
	    .signup{padding-top: 10px;}
	    .signup-btn {color: gray; font-size: 0.8em;}
	    a {text-decoration:none; } 
	    form.form1 {padding-top: 30px;}
	    input::placeholder{color: silver;}
	    
		@media (max-width: 600px) {.main {border-radius: 0px;}
    
	</style>


</head>
<body>

<main role="main" style="padding: 30px 570px; position: fixed; ">
<section id="content">
	<div class="main">
		<div class="loginform-logo" align="center">
			<a href="home.do"><img class="login-logo" src="./resources/img/logo.png"></a>
		</div>
		<form class="form1">
			<input class="input-user-idpw" type="text" align="center" placeholder="이메일" id="memid">
			<input class="input-user-idpw" type="password" align="center" placeholder="비밀번호" id="mempw">
			<input type="button" value="로그인" class="login-btn" align="center" onclick="login();">
			<div class="signup" align="center"><a href="registerform.do" class="signup-btn">회원가입</a></div>
		</form>        
   	</div>
</section>





</main>
</body>
</html>