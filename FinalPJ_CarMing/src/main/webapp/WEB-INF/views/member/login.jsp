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
<!-- 	<link href="https://fonts.googleapis.com/css?family=Ubuntu" rel="stylesheet"> -->
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="resources/js/login.js"></script>
	<!-- CSS -->
	<link rel="stylesheet" href="resources/css/linearicons.css">
	<link rel="stylesheet" href="resources/css/owl.carousel.css">
	<link rel="stylesheet" href="resources/css/themify-icons.css">
	<link rel="stylesheet" href="resources/css/font-awesome.min.css">
	<link rel="stylesheet" href="resources/css/nice-select.css">
	<link rel="stylesheet" href="resources/css/nouislider.min.css">
	<link rel="stylesheet" href="resources/css/bootstrap.css">
	<link rel="stylesheet" href="resources/css/main.css">
	
	<style type="text/css">
		body {background-color: #fff; font-family: 'Ubuntu', sans-serif;}
    	.main {background-color: #fff; width: 400px; height: 500px; margin: 7em auto; border-radius: 1.5em; box-shadow: 0px 11px 35px 2px rgba(0, 0, 0, 0.14);}
    	
	    .loginform-logo{padding-top: 33px;}   
	    .login-logo{width: 150px; height: 100%; margin-right: 10px;}

		.input-user-idpw {width: 75%; color: #5f5f5f; font-size: 14px; letter-spacing: 1px; padding: 10px 15px; background: #fff;
				 		  border: none; border-radius: 5px; outline: none; box-sizing: border-box; border: 1px solid rgba(0, 0, 0, 0.1);
						  margin-bottom: 8px; margin-left: 46px; text-align: left; font-family: 'Ubuntu', sans-serif;}
	    .userid:focus, .userpass:focus {border: 2px solid rgba(0, 0, 0, 0.18) !important;}
	    #memid:hover{background: #fafafa; transition: 0.2s;}
	    #mempw:hover{background: #fafafa; transition: 0.2s;}
	    
	    .login-btn {cursor: pointer; color: #5f5f5f !important; background: #ffe6be; width: 300px; border: 0; border-radius: 5px; padding: 10px 40px;
				 	font-weight: bold; margin-top: 15px; margin-left: 12%; font-size: 1.1em; box-shadow: 0 0 20px 1px rgba(0, 0, 0, 0.04); outline: none;}
	    .login-btn:hover {background: #ffdb9f; transition: 0.2s;}
	    .signup{padding-top: 10px; margin: -2px 10px 20px 0;}
	    .signup > a > span {display: inline-block; color: gray; font-size: 0.85em; font-weight: bold;}
	    .register-img{width: 13px; height: 12px; opacity: 0.2;}
	    a {text-decoration: none; } 
	    form.form1 {padding-top: 30px;}
	    input::placeholder{color: silver;}
	    
	    .naver_login_text{color: gray; font-size: 0.75em; margin-bottom: 3px;}
	    
		@media (max-width: 600px) {.main {border-radius: 7px;}
    
	</style>


</head>
<body>
	<main role="main" style="padding: 30px 570px; position: fixed;">
		<section id="content">
			<div class="main">
				<div class="loginform-logo" align="center">
					<a href="home.do"><img class="login-logo" src="./resources/img/logo.png"></a>
				</div>
				<form class="form1">
					<input class="input-user-idpw" type="text" align="center" placeholder="이메일" id="memid">
					<input class="input-user-idpw" type="password" align="center" placeholder="비밀번호" id="mempw">
					<input type="button" value="로그인" class="login-btn" align="center" onclick="ajaxlogin();">
					<div class="signup" align="center">
						<a href="registerform.do" class="signup-btn">
							<img class="register-img" src="./resources/img/user_signup.png">
							<span>회원가입</span>
						</a>
					</div>
					<div class="naver_login_text" align="center">SNS계정으로 간편 로그인</div>
					<!-- 네이버 로그인 창으로 이동 -->
					<div id="naver_id_login" style="text-align: center;">
						<a href="${url}">
							<img width="180" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png"/>
						</a>
					</div>
					<br>
				</form>        
		   	</div>
		</section>
	
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="resources/js/login.js?ver=1"></script>
	<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>

	</main>
</body>
</html>