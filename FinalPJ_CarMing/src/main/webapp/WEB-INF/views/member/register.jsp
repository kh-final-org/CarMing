<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CarMing | 회원가입</title>
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
	#content{text-align: -webkit-center; padding: 50px 100px;}
	
	.loginform-logo{margin-bottom: 15px;}   
    .login-logo{width: 140px; height: 100%; margin-top: -5px;}
	    
	.content-form{max-width: 78%; border: 1px solid #e2e2e2; border-radius: 10px; padding: 40px 0px; background: #fff5e9;}
	h4{padding-left: 9%; text-align: left; margin: 0 10px 10px; color: #5f5f5f; font-size: 1.2em; font-weight: bold;}
	.content-panel{width: 85%; padding: 15px 20px; border: 1px solid #ccc; border-radius: 5px; 
				   background: #fafafa; color: gray;} 
	.content-panel-text{font-size: 0.95em; text-align: left;}
	
	.checkbox input{display: none;}
	.checkbox span{display: inline-block; vertical-align: middle; cursor: pointer;}
	.checkbox .icon{position: relative; width: 20px; height: 20px; border: 2px solid silver; 
					background: #fff; border-radius: 3px; transition: background 0.1s ease;}
	.checkbox .icon::after{content: ''; position: absolute; top: 0.5px; left: 5px; width: 6px; height: 11px; 
						   border-right: 2px solid #fff; border-bottom: 2px solid #fff; transform: rotate(45deg) scale(0); 
						   transition: all 0.1s ease; transition-delay: 0.1s; opacity: 0;}
	.checkbox .text{margin-left: 5px; color: #5f5f5f; font-size: 1.25em;}
	.checkbox input:checked ~ .icon{border-color: transparent; background: orange;}
	.checkbox input:checked ~ .icon::after{opacity: 1; transform: rotate(45deg) scale(1);}
	
	.checkbox-form{margin: -15px 0 20px 0; font-size: 0.9em;}
	.agree-btn{width: 300px; padding: 10px 0 10px; line-height: 25px; border: 0; border-radius: 10px; outline: none;
				font-size: 1.3em; text-align: center; color: #5f5f5f; background-color: #ffe6be; cursor: pointer;}
	.agree-btn:hover{background: #ffdb9f; transition: 0.2s;}
	.agree-btn > span{font-size: 0.95em; font-weight: bold;}
</style>

</head>
<body>
	<section id="content">
		<div class="panel panel-default">
		    <div class="panel-body">
		    	<div class="loginform-logo" align="center">
					<a href="home.do"><img class="login-logo" src="./resources/img/logo.png"></a>
				</div>
		        <div class="content-form">
		            <h4>CarMing 이용약관 동의</h4>
		            <div class="content-panel" id="panel">
			            <div class="content-panel-text">
			            	<strong>여러분을 환영합니다.</strong><br>CarMing 서비스 및 제품(이하 '서비스')를 이용해 주셔서 감사합니다.
			                                   본 약관은 다양한 CarMing 서비스의 이용과 관련하여 아울러 여러분의  CarMing 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
			                CarMing 서비스를 이용하실 경우 여러분은 본 약관 및 관련 운영 정책을 확인하거나 동의하게 되므로, 잠시 시간을 내시어 주의 깊게 살펴봐 주시기 바랍니다.
			            </div><br>
			            <div class="content-panel-text">
			                <strong>다양한  CarMing 서비스를 즐겨보세요.</strong>
		                </div>
		        	</div><br>
		        
		        	<h4>개인정보 수집 및 위치정보 이용 동의</h4>
			        <div class="content-panel">
			        	<div class="content-panel-text">
			            	개인정보 보호법에 따라 CarMing에 회원가입 신청하시는 분께 수집하는 개인정보의 항목, 개인정보의 수집 및 이용목적, 개인정보의 보유 및<br>이용기간,
			            	동의 거부권 및 동의 거부 시 불이익에 관한 사항을 안내 드립니다.<br>
			            	<strong>1. 수집하는 개인정보</strong><br>
			            	회원가입 시점에 CarMing이 이용자로부터 수집하는 개인정보는 아래와 같습니다.<br>
			            	회원 가입 시에 ‘아이디, 비밀번호, 이름, 생년월일, 성별, 휴대전화번호’를 필수항목으로 수집합니다.<br>
			            	<strong>2. 수집한 개인정보의 이용</strong><br>
			            	CarMing은 회원관리, 서비스 개발・제공 및 향상, 안전한 인터넷 이용환경 구축 등 아래의 목적으로만 개인정보를 이용합니다.<br>
			            	<strong>3. 개인정보 수집 및 이용 동의를 거부할 권리</strong><br>
			            	이용자는 개인정보의 수집 및 이용 동의를 거부할 권리가 있습니다. 회원가입 시 수집하는 최소한의 개인정보,<br> 
			            	즉, 필수 항목에 대한 수집 및 이용 동의를 거부하실 경우, 회원가입이 어려울 수 있습니다.
			            	<br><br>그리고 위치정보 이용약관에 동의하시면, 위치를 활용한 정보 등을 포함하는 CarMing 위치기반 서비스를 이용할 수 있습니다.
			            </div>
			        </div><br><br>
		        	
		            <div class="checkbox-form">
		                <label class="checkbox">
		            		<input type="checkbox" id="agree" name="agree" value="true">
							<span class="icon"></span>
							<span class="text"><strong>CarMing 이용약관, 개인정보 수집 및 이용, 위치정보 이용약관에 모두 동의합니다.</strong></span>
		                </label>
		            </div>
		            <button type="button" class="agree-btn" onclick="law_check()"><span>다음 단계</span></button>
			    </div>
			</div>
		</div>
	</section>

 	<script src="resources/js/vendor/jquery-2.2.4.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4"
	 		crossorigin="anonymous"></script>
	<script src="resources/js/vendor/bootstrap.min.js"></script>
	<script src="resources/js/jquery.ajaxchimp.min.js"></script>
	<script src="resources/js/jquery.nice-select.min.js"></script>
	<script src="resources/js/jquery.sticky.js"></script>
	<script src="resources/js/nouislider.min.js"></script>
	<script src="resources/js/jquery.magnific-popup.min.js"></script>
	<script src="resources/js/owl.carousel.min.js"></script>
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCjCGmQ0Uq4exrzdcL6rvxywDDOvfAu6eE"></script>
	<script src="resources/js/gmaps.min.js"></script>
	<script src="resources/js/main.js"></script>
	<script src="resources/js/register.js"></script>
</body>
</html>