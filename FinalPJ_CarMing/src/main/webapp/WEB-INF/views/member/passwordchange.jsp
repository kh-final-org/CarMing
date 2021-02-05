<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
label{
	color: black;
}
.chk_error{
	color: red;
	display : none;

}
.col-sm-6 {
	max-width:100% !important; 
}
.form-control{
	display: inline !important; 
	width : 50% !important; 
}
#memzip.form-control,
#memnick.form-control,
#memname.form-control{
	max-width:25% !important;
}
.btn{
	vertical-align: revert !important;
}

.select_img img{
	border : 1px solid black;
	width : 200px;
	height : 250px;

}


</style>
</head>
<body>

	<section id="header">
		<%@include file ="../common/header.jsp" %>
	</section>
	
	<section class="banner-area organic-breadcrumb">
		<div class="container">
			<div
				class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
				<div class="col-first">
					<h1>회원가입</h1>
				</div>
			</div>

		</div>
	</section>
	

<section id="content">
<div class="row">
     
    <div class="col-xs-12 col-sm-12">
    <h2>&nbsp;</h2> 
    <h2 class="text-center">비밀번호 수정</h2>
    </div>        
     
    <div class="col-xs-3 col-sm-3"></div>   
    <div class="col-xs-8 col-sm-8">
         
      <div >      
        <p>&nbsp;</p>
         
        <form  class="form-horizontal" action="PWchange.do" method="post" enctype="multipart/form-data" modelAttribute="MemberDto" >

          
         <div class="form-group">
            <div class="col-sm-2 control-label">
                <label id="mempw">현재 비밀번호</label>         
            </div>
            <div class="col-sm-6">
                <input type="password" class="form-control" name="beforemempw" id="beforemempw">
         	</div>
         </div>
          
         <div class="form-group">
            <div class="col-sm-2 control-label">
                <label id="memname">새 비밀번호</label>
            </div>
            <div class="col-sm-6">
				<input type="password" class="form-control" name="newmempw" id="newmempw">
            </div>
            <span id="mempw_error" class="chk_error">비밀번호를 양식에 맞춰 입력해주세요</span>
            <p>6~13자의 숫자와 알파벳조합으로 입력해주세요(공백제외)</p>
         </div>
         
         <div class="form-group">
            <div class="col-sm-2 control-label">
                <label id="memname">새 비밀번호 확인</label>
            </div>
            <div class="col-sm-6">
				<input type="password" class="form-control" name="newmempwchk" id="newmempwchk">
            </div>
            <span id="mempwchk_error" class="chk_error">비밀번호와 다릅니다</span>
         </div>
         
          
         <div class="form-group" >
            <div class="col-sm-12  text-center">
            <input type="submit" value="수정" class="btn btn-success" onclick="return empty_password()"/>
            <input type="button" value="취소" class="btn btn-warning" onclick="location.href='profilechangeform'"/>
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
	<script src="resources/js/main.js"></script>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="resources/js/passwordchange.js?ver=1"></script>


</body>
</html>