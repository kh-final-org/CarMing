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
<link rel="stylesheet" href="resources/css/profilechange.css">

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
        	<input type="hidden" name="memno" value='${login.memno }'>
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
		                <input type="button" id="nickduplbutton" onclick="nickdupl()" class="btn btn-primary" value="중복확인">
		                <span id="memnick_error" class="chk_error">닉네임을 입력해주세요.</span>
		                <p id="nick_dupl_bad" class="chk_error"">이미 사용중인 닉네임입니다.</p>
		                <p id="nick_dupl_good" class="chk_error" style="color:green;">사용하실 수 있는 닉네임입니다.</p>
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
		                <span id="memphone_error" class="chk_error">전화번호는 -를 제외한 숫자로만 기입해주세요.</span>
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
			        		<c:when test="${login.memgender eq 1}"> 
				                <label class="checkbox">
				            		<input type="radio" name="memgender" value="1" checked="checked">
									<span class="icon"></span>&nbsp;
									<span class="checkbox-text">남성</span>&nbsp;
				                </label>&emsp;
				                <label class="checkbox">
				            		<input type="radio" name="memgender" value="2">
									<span class="icon"></span>&nbsp;
									<span class="checkbox-text">여성</span>&nbsp;
				                </label>
		                	</c:when>
			        		<c:when test="${login.memgender eq 2}"> 
				                <label class="checkbox">
				            		<input type="radio" name="memgender" value="1">
									<span class="icon"></span>&nbsp;
									<span class="checkbox-text">남성</span>&nbsp;
				                </label>&emsp;
				                <label class="checkbox">
				            		<input type="radio" name="memgender" value="2" checked="checked">
									<span class="icon"></span>&nbsp;
									<span class="checkbox-text">여성</span>&nbsp;
				                </label>
		                	</c:when>
		                	<c:otherwise>
		                		<label class="checkbox">
				            		<input type="radio" name="memgender" value="1">
									<span class="icon"></span>&nbsp;
									<span class="checkbox-text">남성</span>&nbsp;
				                </label>&emsp;
				                <label class="checkbox">
				            		<input type="radio" name="memgender" value="2">
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
								<label class="custom-file-label" for="input_img" id="filename"></label>
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
				                	<input type="checkbox" id="memchk" name="memchk" value="Y">
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
						<button type="button" class="btn btn-light" id="btn-quit" onclick="location.href='deleteuserform.do'">회원탈퇴</button>
						<button type="submit" class="btn btn-light" id="btn-modify" onclick="return empty_change()">수정하기</button>
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