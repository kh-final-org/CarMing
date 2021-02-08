<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CarMing | 회원가입</title>

<style type="text/css">
	#content{margin-top: 150px;}

	label{color: black;}
	.chk_error{color: red;display : none;}
	.col-sm-6 {max-width:100% !important; }
	.form-control{display: inline !important; width : 50% !important; }
	#memzip.form-control,#memnick.form-control,#memname.form-control{max-width:25% !important;}
	.btn{vertical-align: revert !important;}

</style>
</head>
<body>

	<section id="header">
		<%@include file ="../common/header.jsp" %>
	</section>

	<section id="content">
		<div class="row">
	     
		    <div class="col-xs-12 col-sm-12">
		    <h2>&nbsp;</h2> 
		    <h2 class="text-center">회원가입</h2>
		    </div>        
		     
		    <div class="col-xs-3 col-sm-3"></div>   
		    <div class="col-xs-8 col-sm-8">
		         
		      <div >      
		        <p>&nbsp;</p>
		         
		        <form  class="form-horizontal" action="regist.do" method="post" onsubmit="regist_empty();">
		         <div class="form-group">
		            <div class="col-sm-2 control-label">
		                <label id="memid">이메일</label>
		            </div>
		            <div class="col-sm-6">
		            	<c:choose>
		                <c:when test='${not empty email}'><input type="email" class="form-control" name="memid" id="memid" value="${email}" readonly="readonly"></c:when>
		                <c:otherwise>
		                <input type="email" class="form-control" name="memid" id="memid">
		                <input type="button" id="sendmail" onclick="sendMail()" value="인증하기" class="btn btn-primary" >
		                </c:otherwise>
		                </c:choose>
		                <span id="memid_error" class="chk_error">이메일 양식에 맞춰 입력해주세요</span>
		                <p>이메일 예시 : example@gmail.com</p>
		                <input type="text" name="certnum" id="certnum" placeholder="인증번호를 입력해주세요." style="width:200px; border:1px solid #ced4da;">
		                <input type="button" id="certbutton" onclick="certcf()" value="인증확인">
		                <span id="certnum_good" class="chk_error" style="color:green;">인증번호가 확인되었습니다.</span>
		            </div>
		         </div>   
		          
		         <div class="form-group">
		            <div class="col-sm-2 control-label">
		                <label id="mempw">비밀번호</label>    	
		            </div>
		            <div class="col-sm-6">
		            	<c:choose>
		                <c:when test='${not empty password}'><input type="password" class="form-control" name="mempw" id="mempw" value="${password }" readonly="readonly"></c:when>
		                <c:otherwise><input type="password" class="form-control" name="mempw" id="mempw"></c:otherwise>
		                </c:choose>
		                <span id="mempw_error" class="chk_error">비밀번호를 양식에 맞춰 입력해주세요</span>
		                <p>6~13자의 숫자와 알파벳, 특수문자 조합이 가능합니다.(공백제외)</p>
		                <p>*최소 숫자 1개와 알파벳 1개가 들어가야합니다.</p>
		            </div>
		         </div>
		          
		         <div class="form-group">
		            <div class="col-sm-2 control-label">
		                <label for="mempwchk">비밀번호 확인</label>
		
		            </div>
		            <div class="col-sm-6">
		                <c:choose>
		                <c:when test='${not empty password}'><input type="password" class="form-control" name="mempwchk" id="mempwchk" value="${password }" readonly="readonly"></c:when>
		                <c:otherwise><input type="password" class="form-control" name="mempwchk" id="mempwchk"></c:otherwise>
		                </c:choose>
		                <span id="mempwchk_error" class="chk_error">비밀번호와 다릅니다</span>
		            </div>
		         </div>
		         
		         <div class="form-group">
		            <div class="col-sm-2 control-label">
		                <label id="memname">이름</label>
		            </div>
		            <div class="col-sm-6">
		            	<c:choose>
		                <c:when test='${not empty name }'><input type="text" class="form-control" name="memname" id="memname" value="${name }" readonly="readonly" ></c:when>
		                <c:otherwise><input type="text" class="form-control" name="memname" id="memname"></c:otherwise>
		                </c:choose>
		                <span id="memname_error" class="chk_error">알파벳과 한글만으로 입력해주세요</span>
		            </div>
		         </div>
		         
		         <div class="form-group">
		            <div class="col-sm-2 control-label">
		                <label id="memnick">닉네임</label>
		            </div>
		            <div class="col-sm-6">
		                <input type="text" class="form-control" name="memnick" id="memnick" value="${nickname }">
		                <span id="memnick_error" class="chk_error">닉네임을 입력해주세요</span>
		            </div>
		         </div>                
		
		          <div class="form-group">
		            <div class="col-sm-2 control-label">
		                <label id="memzip">우편번호</label>
		            </div>
		            <div class="col-sm-6">
		             <input type="text" id="memzip" name="memzip" class="form-control" readonly="readonly">
		             <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" class="btn btn-primary" >
		             <span id="memaddr_error" class="chk_error">주소를 입력해주세요</span>
		            </div>
		         </div>   
		         
		          <div class="form-group" >
		         	<div class="col-sm-2 control-label">
		                <label id="memaddr">주소</label>
		            </div>
		            <div class="col-sm-6">
		                <input type="text" id="memaddr" name="memaddr"   class="form-control" readonly="readonly">
		            </div>   
		          </div>
		      
		          <div class="form-group"> 
		             <div class="col-sm-2 control-label">
		                <label id="memaddr2">상세주소</label>
		             </div>
		             <div class="col-sm-6"> 
		               <input type="text" id="memaddr2" name="memaddr2"   class="form-control" >
		               </div>
		          </div>
		          
		          <div class="form-group">
		            <div class="col-sm-2 control-label">
		                <label id="memphone">전화번호</label>
		            </div>
		            <div class="col-sm-6">
		                <input type="text" class="form-control" name="memphone" id="memphone" placeholder="-없이 적어주세요.">
		                <span id="memphone_error" class="chk_error">전화번호를 입력해주세요</span>
		            </div>
		         </div>
		         
		         <div class="form-group">
		            <div class="col-sm-2 control-label">
		                <label id="membirth">생일</label>
		            </div>
		            <div class="col-sm-6">
		                <input type="date" class="form-control" name="membirth" id="membirth" value="1900-01-01" min="1900-01-01" >
		                <span id="membirth_error" class="chk_error">생일을 입력해주세요</span>
		            </div>
		         </div>
		         
		         <div class="form-group">
		            <div class="col-sm-2 control-label">
		                <label id="memgender">성별</label>
		            </div>
		            <div class="col-sm-6">
		            	<c:choose>
		            	<c:when test="${gender eq 'M'}"> <input type="radio" name="memgender" value="1" checked="checked">남성&nbsp;<input type="radio" name="memgender" value="2">여성</c:when>
		            	<c:when test="${gender eq 'F'}"> <input type="radio" name="memgender" value="1" >남성&nbsp;<input type="radio" name="memgender" value="2" checked="checked">여성</c:when>
		                <c:otherwise>
		                <input type="radio" name="memgender" value="1">남성
		                &nbsp;
		                <input type="radio" name="memgender" value="2">여성
		                </c:otherwise>
		                </c:choose>  
		                <p id="memgender_error" class="chk_error">성별을 선택해주세요</p>
		            </div>
		         </div>
		         
		          <div class="form-group">
		            <div class="col-sm-2 control-label" style="max-width : fit-content">
		                <input type="checkbox" name="memchk" id="memchk" value="Y">&nbsp;<label>[선택]친구찾기를 위해 개인정보를 사용하시는거에 동의하십니까?</label>
		            </div>
		         </div>
		 
		         <div class="form-group" >
		            <div class="col-sm-12  text-center">
		            <input type="submit" value="회원가입" class="btn btn-success" onclick="return regist_empty()"/>
		            <input type="button" value="취소" class="btn btn-warning" onclick="location.href='index.jsp'"/>
		            </div>
		         </div>
		         
		        </form> 
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
	<!-- <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCjCGmQ0Uq4exrzdcL6rvxywDDOvfAu6eE"></script> -->
	<script src="resources/js/gmaps.min.js"></script>
<!-- 	<script src="resources/js/main.js"></script> -->
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
	<script src="resources/js/register2.js?ver=1"></script>

</body>
</html>