<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
         
        <form class="form-horizontal" action="regist.do" method="post">
         <div class="form-group">
            <div class="col-sm-2 control-label">
                <label id="memid">이메일</label>
            </div>
            <div class="col-sm-6">
                <input type="email" class="form-control" name="memid" id="memid">
            </div>
         </div>   
          
         <div class="form-group">
            <div class="col-sm-2 control-label">
                <label id="mempw">패스워드</label>
            </div>
            <div class="col-sm-6">
                <input type="password" class="form-control" name="mempw" id="mempw">
            </div>
         </div>
          
         <div class="form-group">
            <div class="col-sm-2 control-label">
                <label for="mempwchk">패스워드 체크</label>
            </div>
            <div class="col-sm-6">
                <input type="password" class="form-control" name="mempwchk" id="mempwchk" >
            </div>
         </div>
         
         <div class="form-group">
            <div class="col-sm-2 control-label">
                <label id="memname">이름</label>
            </div>
            <div class="col-sm-6">
                <input type="text" class="form-control" name="memname" id="memname">
            </div>
         </div>
         
         <div class="form-group">
            <div class="col-sm-2 control-label">
                <label id="memnick">닉네임</label>
            </div>
            <div class="col-sm-6">
                <input type="text" class="form-control" name="memnick" id="memnick">
            </div>
         </div>                

          
          <div class="form-group">
            <div class="col-sm-2 control-label">
                <label id="memzip">우편번호</label>
            </div>
            <div class="col-sm-3">
             <input type="text" id="memzip" name="memzip" class="form-control">
            </div>
            <div class="col-sm-3">
            <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" class="btn btn-primary">
          
            </div>
         </div>   
         
            <div class="form-group" >
             <div class="col-sm-2 control-label">
                <label id="memaddr">주소</label>
             </div>
             <div class="col-sm-6">
                <input type="text" id="memaddr" name="memaddr"   class="form-control">
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
            </div>
         </div>
         
         <div class="form-group">
            <div class="col-sm-2 control-label">
                <label id="membirth">생일</label>
            </div>
            <div class="col-sm-6">
                <input type="date" class="form-control" name="membirth" id="membirth">
            </div>
         </div>
         
         <div class="form-group">
            <div class="col-sm-2 control-label">
                <label id="memgender">성별</label>
            </div>
            <div class="col-sm-6">
                <input type="radio" name="memgender" id="memgender" value="1">남성
                <input type="radio" name="memgender" id="memgender" value="2">여성                
            </div>
         </div>
         
          <div class="form-group">
            <div class="col-sm-2 control-label" style="max-width : fit-content">
                <input type="checkbox" name="memchk" id="memchk" value="Y">[선택]친구찾기를 위해 개인정보를 사용하시는거에 동의하십니까?
            </div>
         </div>
         
 
          
          
         <div class="form-group" >
            <div class="col-sm-12  text-center">
            <input type="submit" value="회원가입" class="btn btn-success" onclick="return regist_chk()">
            <input type="button" value="취소" class="btn btn-warning" onclick="location.href='index.jsp'">
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
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCjCGmQ0Uq4exrzdcL6rvxywDDOvfAu6eE"></script>
	<script src="resources/js/gmaps.min.js"></script>
	<script src="resources/js/main.js"></script>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="resources/js/register2.js"></script>

</body>
</html>