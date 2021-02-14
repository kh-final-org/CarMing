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
<link rel="stylesheet" href="resources/css/register2.css">

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
			<form class="form-horizontal" id="registform_data" name="registform_data" action="regist.do" method="post" >
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
		                <input type="button" id="nickduplbutton" onclick="nickdupl()" class="btn btn-primary" value="중복확인">
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
			        		<c:when test="${gender eq 'F'}"> 
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
			            <input type="submit" value="회원가입" class="btn btn-light" id="btn-register" onclick="return regist_empty();"/>
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
	<script src="resources/js/register2.js"></script>

</body>
</html>