<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CarMing | 비밀번호 변경</title>
<!-- CSS -->
<link rel="stylesheet" href="resources/css/linearicons.css">
<link rel="stylesheet" href="resources/css/owl.carousel.css">
<link rel="stylesheet" href="resources/css/themify-icons.css">
<link rel="stylesheet" href="resources/css/font-awesome.min.css">
<link rel="stylesheet" href="resources/css/nice-select.css">
<link rel="stylesheet" href="resources/css/nouislider.min.css">
<link rel="stylesheet" href="resources/css/bootstrap.css">
<link rel="stylesheet" href="resources/css/main.css">
<link rel="stylesheet" href="resources/css/pwchange.css">

</head>
<body>
	<!-- Start Content Area -->
	<section class="content">
	<div class="row">
	   		<div class="loginform-logo" align="center">
				<a href="home.do"><img class="login-logo" src="./resources/img/logo.png"></a>
			</div>
			<div class="card-head-first">
    			<h2 class="text-center">비밀번호 수정</h2>
    		</div>
    		
	        <form  class="form-horizontal" action="PWchange.do" method="post" enctype="multipart/form-data" modelAttribute="MemberDto" >
	        	<!-- 현재 비밀번호 -->
	        	<div class="form-group">
		            <div class="form-main-text">
		                <label for="mempw" id="main-text">현재 비밀번호</label>         
		            </div>
		            <div class="col-sm-6">
		                <input type="password" class="form-control" name="beforemempw" id="beforemempw">
		         	</div>
		        </div>
		        
		        <!-- 새 비밀번호 --> 
		        <div class="form-group">
		            <div class="form-main-text">
		                <label for="memname" id="main-text">새 비밀번호</label>
		            </div>
		            <div class="col-sm-6">
						<input type="password" class="form-control" name="newmempw" id="newmempw">
		            </div>
		            <div id="mempw_error" class="chk_error">6~13자 영문, 숫자를 사용하세요.(공백 제외)</div>
		        </div>
		        
		        <!-- 새 비밀번호 확인 -->
		        <div class="form-group">
		            <div class="form-main-text">
		                <label for="memname" id="main-text">새 비밀번호 확인</label>
		            </div>
		            <div class="col-sm-6">
						<input type="password" class="form-control" name="newmempwchk" id="newmempwchk">
		            </div>
		            <span id="mempwchk_error" class="chk_error">비밀번호가 일치하지 않습니다.</span>
		        </div>
		         
		        <!-- 버튼 -->  
		        <div class="form-group" >
		            <div class="card-body-bottom">
			            <input type="submit" value="수정" class="btn btn-light" id="btn-modify" onclick="return empty_password()"/>
			            <input type="button" value="취소" class="btn btn-light" id="btn-cancel" onclick="location.href='profilechangeform.do'"/>
		            </div>
		        </div>
			</form> 
		</div>
    </section>
    <!-- End Content Area -->
    
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
	<!-- <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCjCGmQ0Uq4exrzdcL6rvxywDDOvfAu6eE"></script> -->
	<script src="resources/js/gmaps.min.js"></script>
<!-- 	<script src="resources/js/main.js"></script> -->
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="resources/js/passwordchange.js?ver=1"></script>


</body>
</html>