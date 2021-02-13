<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@
	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CarMing | 로그인</title>
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
	<link rel="stylesheet" href="resources/css/login.css">
	

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
<!-- 	  	<input type="button" value="비밀번호 암호화" onclick="passwordenc()"/> -->
		</section>
	
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="resources/js/login.js"></script>
	<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>

	</main>
</body>
</html>