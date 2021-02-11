<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CarMing | 프로필 수정</title>
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
	.content{padding: 50px 580px;} 
	
	.loginform-logo{margin: 0 36% 2%;}   
    .login-logo{width: 100px; height: 100%; margin-top: -5px;}
	
	.card-head-first{width: 100%; margin-bottom: 10%;}
	.card-head-first > h2{font-weight: bold;}
	.form-group{margin-bottom: 15px; padding: 0;}
	
	.col-sm-6{margin: 0; padding: 0; width: 800px; margin-right: auto; margin-left: auto; 
			  max-width:100% !important;} 	/*input 태그*/
 	.form-control{display: inline !important; width: 50% !important;} 
 	#form-control-pw{background: #fff5e9; cursor: pointer; border: 1px solid #e2e2e2; outline: none;}
 	#form-control-pw:hover{background: #ffe6be; transition: 0.2s; }
	.form-main-text{margin-bottom: 8px; color: #5f5f5f; font-size: 1.2em;}
	#main-text{cursor: pointer; font-weight: bold;}

	.ex-text{margin-top: 3px; font-size: 1.0em;}
	.chk_error{margin-top: 3px; font-size: 1.0em; color: red; display: none;}

	#memzip.form-control{max-width: 30% !important;}
	
	.uploadimg {width: 360px; height: 360px;}
	.img_wrap {width: 340px; height: 310px; margin-top: 18px;}
	.img_wrap img {max-width: 100%; max-height: 100%;}
	.center-block {display: block; margin-left: auto; margin-right: auto; margin-left: 110px;}	
	.upload-img-form{position: relative; width: 400px; height: 250px; border: 1px solid #e2e2e2;
					 border-radius: 5px; background: #fff; margin-bottom: 60px;}
   	.upload-img-content{position: absolute; margin: -70px 0 0 -1px; width: 400px;}
	
	.checkbox input{display: none;}
	.checkbox span{display: inline-block; vertical-align: middle; cursor: pointer;}
	.checkbox .icon{position: relative; width: 20px; height: 20px; border: 2px solid silver; 
					background: #fff; border-radius: 3px; transition: background 0.1s ease;}
	.checkbox .icon::after{content: ''; position: absolute; top: 0.5px; left: 5px; width: 6px; height: 11px; 
						   border-right: 2px solid #fff; border-bottom: 2px solid #fff; transform: rotate(45deg) scale(0); 
						   transition: all 0.1s ease; transition-delay: 0.1s; opacity: 0;}
	.checkbox .text{margin-left: 5px; color: #5f5f5f; font-size: 1.1em;}
	.checkbox input:checked ~ .icon{border-color: transparent; background: orange;}
	.checkbox input:checked ~ .icon::after{opacity: 1; transform: rotate(45deg) scale(1);}
	.checkbox-subtext{color: silver;}
	
	.btn{width: 155px; height: 40px; border: 0; border-radius: 5px; outline: none; margin-top: -4px;
   		 background-color: #fff5e9; color: #5f5f5f; font-size:1.2em; cursor: pointer;}
	.btn:hover{background: #ffe6be; transition: 0.2s; outline: none;}
	#btn-addr{border: 1px solid #e2e2e2; font-size: 1.15em;}
	#btn-modify{width: 195px; height: 45px; margin-left: 3px; background-color: #ffe6be; font-weight: bold;}
	#btn-modify:hover{background: #ffdb9f; transition: 0.2s;}
	#btn-quit{width: 195px; height: 45px; background-color: #ffe6be; font-weight: bold;}
	#btn-quit:hover{background: #ffdb9f; transition: 0.2s;}
	
	input#memphone::placeholder{color: silver;}


</style>

	

</head>
<body>
	<!-- Start Content Area -->
	<section class="content">
		<div class="row">
			<div class="loginform-logo" align="center">
				<a href="home.do"><img class="login-logo" src="./resources/img/logo.png"></a>
			</div>
			<div class="card-head-first">
    			<h2 class="text-center">프로필 수정</h2>
    		</div>
    		
        	<form class="form-horizontal" action="profilechange.do" method="post" enctype="multipart/form-data" modelAttribute="MemberDto" >
         		<!-- 이메일 -->
	         	<div class="form-group">
	            	<div class="form-main-text">
	                	<label for="memid" id="main-text">이메일</label>
	            	</div>
	            	<div class="col-sm-6">
		                <input type="email" class="form-control" name="memid" id="memid" readonly="readonly" value='${login.memid}'>
		            </div>
         		</div>   
          
          		<!-- 비밀번호 -->
		        <div class="form-group">
		            <div class="form-main-text">
		                <label for="mempw" id="main-text">비밀번호</label>         
		            </div>
		            <div class="col-sm-6">
		            	<c:choose>
			                <c:when test="${logintype eq 'naver'}"><p>네이버계정은 비밀번호를 수정하실 수 없습니다.</c:when>
			                <c:otherwise>
			                	<input type="button" class="form-control" id="form-control-pw" onclick="location.href='PWchangeform.do'" value="비밀번호 수정">
			                </c:otherwise>
		                </c:choose>
		            </div>
		        </div>
          
         		 <!-- 이름 -->
		        <div class="form-group">
		            <div class="form-main-text">
		                <label for="memname" id="main-text">이름</label>
		            </div>
		            <div class="col-sm-6">
						<input type="text" class="form-control" name="memname" id="memname" readonly="readonly" value='${login.memname}'>
		            </div>
		        </div>
         
         		<!-- 닉네임 -->
		        <div class="form-group">
		            <div class="form-main-text">
		                <label for="memnick" id="main-text">닉네임</label>
		            </div>
		            <div class="col-sm-6">
		                <input type="text" class="form-control" name="memnick" id="memnick" value='${login.memnick}' >
		                <span id="memnick_error" class="chk_error">닉네임을 입력해주세요.</span>
		            </div>
		        </div>                

        		<!-- 우편번호 -->  
          		<div class="form-group">
		            <div class="form-main-text">
		                <label for="memzip" id="main-text">우편번호</label>
		            </div>
		            <div class="col-sm-6">
			             <input type="text" id="memzip" name="memzip" class="form-control" readonly="readonly" value='${login.memzip}'>
			             <input type="button" class="btn btn-light" id="btn-addr" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
			             <span id="memaddr_error" class="chk_error">주소를 입력해주세요.</span>
		            </div>
		        </div>   
         		
         		<!-- 주소 -->
	           	<div class="form-group" >
	            	<div class="form-main-text">
	                	<label for="memaddr" id="main-text">주소</label>
	             	</div>
		            <div class="col-sm-6">
		                <input type="text" id="memaddr" name="memaddr" class="form-control" readonly="readonly" value='${login.memaddr}'>
		            </div>   
	            </div>
      
      			<!-- 상세주소 -->
		        <div class="form-group"> 
		        	<div class="form-main-text">
		                <label for="memaddr2" id="main-text">상세주소</label>
		             </div>
		             <div class="col-sm-6"> 
		               <input type="text" id="memaddr2" name="memaddr2" class="form-control" value='${login.memaddr2}' >
		             </div>
		        </div>
          
     			<!-- 전화번호 -->
		        <div class="form-group">
		            <div class="form-main-text">
		                <label for="memphone" id="main-text">전화번호</label>
		            </div>
		            <div class="col-sm-6">
		                <input type="text" class="form-control" name="memphone" id="memphone" placeholder="-없이 적어주세요." value='${login.memphone}'>
		                <span id="memphone_error" class="chk_error">전화번호를 입력해주세요.</span>
		            </div>
		        </div>
         		
         		<!-- 생일 -->
		        <div class="form-group">
		            <div class="form-main-text">
		                <label for="membirth" id="main-text">생일</label>
		            </div>
		            <div class="col-sm-6">
		                <input type="date" class="form-control" name="membirth" id="membirth" value='${membirth}' min="1900-01-01"  >
		                <span id="membirth_error" class="chk_error">생일을 입력해주세요.</span>
		            </div>
		        </div>
		        
		        <!-- 성별 -->
         		<div class="form-group">
            		<div class="form-main-text">
                		<label for="memgender" id="main-text">성별</label>
           		 	</div>
	            	<div class="col-sm-6">
	            		<c:choose>
			        		<c:when test="${gender eq 'M'}"> 
				                <label class="checkbox">
				            		<input type="checkbox" name="memgender" value="1" checked="checked">
									<span class="icon"></span>&nbsp;
									<span class="checkbox-text">남성</span>&nbsp;
				                </label>&emsp;
				                <label class="checkbox">
				            		<input type="checkbox" name="memgender" value="2">
									<span class="icon"></span>&nbsp;
									<span class="checkbox-text">여성</span>&nbsp;
				                </label>
		                	</c:when>
			        		<c:when test="${gender eq 'F'}"> 
				                <label class="checkbox">
				            		<input type="checkbox" name="memgender" value="1">
									<span class="icon"></span>&nbsp;
									<span class="checkbox-text">남성</span>&nbsp;
				                </label>&emsp;
				                <label class="checkbox">
				            		<input type="checkbox" name="memgender" value="2" checked="checked">
									<span class="icon"></span>&nbsp;
									<span class="checkbox-text">여성</span>&nbsp;
				                </label>
		                	</c:when>
		                	<c:otherwise>
		                		<label class="checkbox">
				            		<input type="checkbox" name="memgender" value="1">
									<span class="icon"></span>&nbsp;
									<span class="checkbox-text">남성</span>&nbsp;
				                </label>&emsp;
				                <label class="checkbox">
				            		<input type="checkbox" name="memgender" value="2">
									<span class="icon"></span>&nbsp;
									<span class="checkbox-text">여성</span>&nbsp;
				                </label>
		                	</c:otherwise>
		                </c:choose>
	            	</div>
				</div>
         		
         		<!-- 프로필 사진 -->
         		<div class="form-group">
            		<div class="form-main-text">
                		<label for="memfile" id="main-text">프로필 사진</label>
            		</div>
            		
            		
            		
            		<!-- ---------------------------------------------------------------------------------------------- -->
            		<!-- 병인 -->
<!-- 		            <div class="col-sm-6"> -->
<!-- 		                <input type="file" id="photofile" name="photofile" accept="image/*"/> -->
<%-- 		                <c:choose> --%>
<%-- 		                	<c:when test="${not empty login.memfile }"> --%>
<%-- 		                		<div class="select_img"><img id="thumbnail" src="${login.memfile}" /></div> --%>
<%-- 		                	</c:when> --%>
<%-- 		                	<c:otherwise> --%>
<!-- 		                		<div class="select_img"><img id="thumbnail" src="" /></div> -->
<%-- 		                	</c:otherwise> --%>
<%-- 		                </c:choose> --%>
<!-- 		            </div> -->
		            
		            
					<div class="col-sm-6">
						<div class="upload-img-form">
							<div class="img_wrap center-block">
							<c:choose>
								<c:when test="${not empty login.memfile }">
								<img id="img" src="${login.memfile }">
								</c:when>
								<c:otherwise>
								<img id="img" src="">
								</c:otherwise>
							</c:choose>
				  			</div>
							<div class="upload-img-content">
								<label class="custom-file-label" for="input_img"></label>
								<input type="file" class="custom-file-input" id="input_img" name="photofile" accept="image/*">
							</div>
						</div>
					</div>
		        </div>
	            <!-- ---------------------------------------------------------------------------------------------- -->
		            
		            
         		
         		<!-- 친구 찾기 동의 -->
		        <div class="form-group">
		        	<div class="form-main-text">
		                <label id="main-text">약관 동의</label>
		            </div>
		            <div class="form-checkbox">
		            	<c:choose>
			            	<c:when test="${login.memchk eq 'Y'}">
			            		<label class="checkbox">
				            		<input type="checkbox" id="memchk" name="memchk" value="Y" checked="checked">
									<span class="icon"></span>&nbsp;
									<span class="checkbox-text">친구 찾기를 위한 귀하의 개인정보 사용 동의</span>&nbsp;
									<span class="checkbox-subtext">(선택)</span>
								</label>
			            	</c:when>
			            	<c:otherwise>
				            	<label class="checkbox">
				                	<input type="checkbox" id="memchk" name="memchk" value="Y" checked="checked">
									<span class="icon"></span>&nbsp;
									<span class="checkbox-text">친구 찾기를 위한 귀하의 개인정보 사용 동의</span>&nbsp;
									<span class="checkbox-subtext">(선택)</span>
								</label>
			                </c:otherwise>
		                </c:choose>
		            </div>
		        </div><br>
         
 				<!-- 버튼 -->
		        <div class="form-group">
		        	<div class="card-body-bottom">
						<button type="submit" class="btn btn-light" id="btn-quit" onclick="location.href='deleteuserform.do'">탈퇴</button>
						<button type="submit" class="btn btn-light" id="btn-modify" onclick="return empty_change()">완료</button>
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
<!--<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCjCGmQ0Uq4exrzdcL6rvxywDDOvfAu6eE"></script> -->
	<script src="resources/js/gmaps.min.js"></script>
<!--<script src="resources/js/main.js"></script> -->
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="resources/js/profilechange.js?ver=1"></script>


</body>
</html>