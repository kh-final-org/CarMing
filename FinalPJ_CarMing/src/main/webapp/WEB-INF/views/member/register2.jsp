<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	.content{padding: 50px 580px;} 
	
	.loginform-logo{margin: 0 36% 2%;}   
    .login-logo{width: 100px; height: 100%; margin-top: -5px;}
	
	.card-head-first{width: 100%; margin-bottom: 10%;}
	.card-head-first > h2{font-weight: bold;}
	.form-group{margin: 0 0 15px 0; padding: 0;}
	
	.col-sm-6{margin: 0; padding: 0; width: 800px; margin-right: auto; margin-left: auto; 
			  max-width:100% !important;} 	/*input 태그*/
 	.form-control{display: inline !important; width: 50% !important;} 
	.form-main-text{margin-bottom: 8px; color: #5f5f5f; font-size: 1.2em;} /*각 메인 텍스트*/
	#main-text{cursor: pointer; font-weight: bold;}
	
	.ex-text{margin-top: 3px; font-size: 1.0em;}
	.chk_error{margin-top: 3px; font-size: 1.0em; color: red; display: none;}

	#memid.form-control{max-width: 32% !important;}
	#memzip.form-control{max-width: 32% !important;}
	
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
	
	.btn{width: 140px; height: 40px; border-radius: 5px; outline: none; margin-top: -4px;
   		 background-color: #fff5e9; color: #5f5f5f; font-size:1.2em; cursor: pointer;}
	.btn:hover{background: #ffe6be; transition: 0.2s; outline: none;}
	#sendmail{border: 1px solid #e2e2e2;}
	#btn-addr{border: 1px solid #e2e2e2;}
	#btn-register{width: 195px; height: 45px; background-color: #ffe6be; font-weight: bold;}
	#btn-register:hover{background: #ffdb9f; transition: 0.2s;}
	#btn-cancel{width: 195px; height: 45px; margin-left: 5px; background-color: #ffe6be; font-weight: bold;}
	#btn-cancel:hover{background: #ffdb9f; transition: 0.2s;}
	
	input#memphone::placeholder{color: silver;}
	

</style>
</head>
<body>
	<section class="content">
		<div class="row">
			<div class="loginform-logo" align="center">
				<a href="home.do"><img class="login-logo" src="./resources/img/logo.png"></a>
			</div>
			<div class="card-head-first">
			    <h2 class="text-center">회원가입</h2>
			</div>
			<form class="form-horizontal" action="regist.do" method="post" onsubmit="regist_empty();">
		         <!-- 이메일 -->
		         <div class="form-group">
   		            <div class="form-main-text">
	                	<label for="memid" id="main-text">이메일</label>
	                </div>
		            <div class="col-sm-6">
		            	<c:choose>
			                <c:when test='${not empty email}'>
			                	<input type="email" class="form-control" name="memid" id="memid" value="${email}" readonly="readonly">
			                </c:when>
			                <c:otherwise>
				                <input type="email" class="form-control" name="memid" id="memid">
				                <input type="button" id="sendmail" onclick="sendMail()" value="인증하기" class="btn btn-light" >
			                </c:otherwise>
		                </c:choose>
		                <div class="ex-text">작성 예시: carming@example.com</div>
		                <div class="chk_error" id="memid_error">이메일 주소를 다시 확인해주세요.</div>
		                <input type="text" name="certnum" id="certnum" placeholder="인증번호를 입력해주세요.">
		                <input type="button" id="certbutton" onclick="certcf()" value="인증확인">
		                <div class="chk_error" id="certnum_good" style="color: #ff9b00;">인증번호가 확인되었습니다.</div>
		            </div>
		         </div>   
		          
		         <!-- 비밀번호 -->
		         <div class="form-group">
		            <div class="form-main-text">
		                <label for="mempw" id="main-text">비밀번호</label>    	
		            </div>
		            <div class="col-sm-6">
		            	<c:choose>
			                <c:when test='${not empty password}'><input type="password" class="form-control" name="mempw" id="mempw" value="${password }" readonly="readonly"></c:when>
			                <c:otherwise><input type="password" class="form-control" name="mempw" id="mempw"></c:otherwise>
		                </c:choose>
		                <div class="chk_error" id="mempw_error">6~13자 영문, 숫자를 사용하세요.(공백 제외)</div>
		            </div>
		         </div>
		         
		         <!-- 비밀번호 확인 -->
		         <div class="form-group">
		            <div class="form-main-text">
		                <label for="mempwchk" id="main-text">비밀번호 확인</label>
		            </div>
		            <div class="col-sm-6">
		                <c:choose>
		                	<c:when test='${not empty password}'><input type="password" class="form-control" name="mempwchk" id="mempwchk" value="${password }" readonly="readonly"></c:when>
			                <c:otherwise><input type="password" class="form-control" name="mempwchk" id="mempwchk"></c:otherwise>
		                </c:choose>
		                <div class="chk_error" id="mempwchk_error">비밀번호가 일치하지 않습니다.</div>
		            </div>
		         </div>
		         
		         <!-- 이름 -->
		         <div class="form-group">
		            <div class="form-main-text">
		                <label for="memname" id="main-text">이름</label>
		            </div>
		            <div class="col-sm-6">
		            	<c:choose>
			                <c:when test='${not empty name }'><input type="text" class="form-control" name="memname" id="memname" value="${name }" readonly="readonly" ></c:when>
			                <c:otherwise><input type="text" class="form-control" name="memname" id="memname"></c:otherwise>
		                </c:choose>&emsp;
		                <div class="chk_error" id="memname_error">한글과 영문만 사용해주세요.</div>
		            </div>
		         </div>
		         
		         <!-- 닉네임 -->
		         <div class="form-group">
		            <div class="form-main-text">
		                <label for="memnick" id="main-text">닉네임</label>
		            </div>
		            <div class="col-sm-6">
		                <input type="text" class="form-control" name="memnick" id="memnick" value="${nickname }">
		                <span id="memnick_error" class="chk_error">닉네임을 입력해주세요.</span>
		            </div>
		         </div>                
		
		         <!-- 우편번호 -->
		         <div class="form-group">
		            <div class="form-main-text">
		               <label for="memzip" id="main-text">우편번호</label>
		            </div>
		            <div class="col-sm-6">
			            <input type="text" class="form-control" id="memzip" name="memzip" readonly="readonly">
			            <input type="button" class="btn btn-light" id="btn-addr" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"  >
			            <span id="memaddr_error" class="chk_error">주소를 입력해주세요.</span>
		            </div>
		         </div>   
		         
		         <!-- 주소 -->
		         <div class="form-group" >
			         <div class="form-main-text">
			         	<label for="memaddr" id="main-text">주소</label>
			         </div>
		         	<div class="col-sm-6">
		               <input type="text" id="memaddr" name="memaddr" class="form-control" readonly="readonly">
		            </div>   
		         </div>
		      	
		      	 <!-- 상세주소 -->
		         <div class="form-group"> 
		             <div class="form-main-text">
		                <label for="memaddr2" id="main-text">상세주소</label>
		             </div>
		             <div class="col-sm-6"> 
		             	<input type="text" id="memaddr2" name="memaddr2" class="form-control" >
		             </div>
		         </div>
		          
		         <!-- 전화번호 -->
		         <div class="form-group">
		         	<div class="form-main-text">
		            	<label for="memphone" id="main-text">전화번호</label>
		            </div>
		            <div class="col-sm-6">
		                <input type="text" class="form-control" name="memphone" id="memphone" placeholder="'-' 없이 적어주세요.">
		                <span id="memphone_error" class="chk_error">전화번호를 입력해주세요.</span>
		            </div>
		         </div>
		         
		         <!-- 생일 -->
		         <div class="form-group">
		            <div class="form-main-text">
		                <label for="membirth" id="main-text">생일</label>
		            </div>
		            <div class="col-sm-6">
		                <input type="date" class="form-control" name="membirth" id="membirth" value="1900-01-01" min="1900-01-01" >
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
	                	<div class="chk_error" id="memgender_error">성별을 선택해주세요.</div>
	            	</div>
		        </div>
		         
				<!-- 친구 찾기 동의 -->		         
		        <div class="form-group">
		        	<div class="form-main-text">
		                <label id="main-text">약관 동의</label>
		            </div>
	                <label class="checkbox">
	            		<input type="checkbox" id="memchk" name="memchk" value="Y">
						<span class="icon"></span>&nbsp;
						<span class="checkbox-text">친구 찾기를 위한 귀하의 개인정보 사용 동의</span>&nbsp;
						<span class="checkbox-subtext">(선택)</span>
	                </label>
	            </div><br>
		 		
		 		<!-- 버튼 -->
		        <div class="form-group" >
		            <div class="card-body-bottom">
			            <input type="submit" value="회원가입" class="btn btn-light" id="btn-register" onclick="return regist_empty()"/>
			            <input type="button" value="취소" class="btn btn-light" id="btn-cancel" onclick="location.href='index.jsp'"/>
		            </div>
		        </div>
			</form> 
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
	<!-- <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCjCGmQ0Uq4exrzdcL6rvxywDDOvfAu6eE"></script> -->
	<script src="resources/js/gmaps.min.js"></script>
<!-- 	<script src="resources/js/main.js"></script> -->
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
	<script src="resources/js/register2.js?ver=1"></script>

</body>
</html>