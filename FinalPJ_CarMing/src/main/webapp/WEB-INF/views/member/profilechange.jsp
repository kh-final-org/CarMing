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
    <h2 class="text-center">회원수정</h2>
    </div>        
     
    <div class="col-xs-3 col-sm-3"></div>   
    <div class="col-xs-8 col-sm-8">
         
      <div >      
        <p>&nbsp;</p>
         
        <form  class="form-horizontal" action="profilechange.do" method="post" enctype="multipart/form-data" modelAttribute="MemberDto" >
         <div class="form-group">
            <div class="col-sm-2 control-label">
                <label id="memid">이메일</label>
            </div>
            <div class="col-sm-6">
                <input type="email" class="form-control" name="memid" id="memid" readonly="readonly" value=${login.memid}>
            </div>
            
            
         </div>   
          
         <div class="form-group">
            <div class="col-sm-2 control-label">
                <label id="mempw">비밀번호</label>         
            </div>
            <c:choose>
                <c:when test="${logintype eq 'naver'}"><p>네이버계정은 비밀번호를 수정하실 수 없습니다.</c:when>
                <c:otherwise>
                <input type="button" onclick="location.href='PWchangeform.do'" value="비밀번호 수정" class="btn btn-primary" >
                </c:otherwise>
                </c:choose>
         </div>
          
         <div class="form-group">
            <div class="col-sm-2 control-label">
                <label id="memname">이름</label>
            </div>
            <div class="col-sm-6">
				<input type="text" class="form-control" name="memname" id="memname" readonly="readonly" value=${login.memname}>
            </div>
         </div>
         
         <div class="form-group">
            <div class="col-sm-2 control-label">
                <label id="memnick">닉네임</label>
            </div>
            <div class="col-sm-6">
                <input type="text" class="form-control" name="memnick" id="memnick" value=${login.memnick} >
                <span id="memnick_error" class="chk_error">닉네임을 입력해주세요</span>
            </div>
         </div>                

          
          <div class="form-group">
            <div class="col-sm-2 control-label">
                <label id="memzip">우편번호</label>
            </div>
            <div class="col-sm-6">
             <input type="text" id="memzip" name="memzip" class="form-control" readonly="readonly" value='${login.memzip}'>
             <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" class="btn btn-primary" >
             <span id="memaddr_error" class="chk_error">주소를 입력해주세요</span>
            </div>
         </div>   
         
            <div class="form-group" >
             <div class="col-sm-2 control-label">
                <label id="memaddr">주소</label>
             </div>
             <div class="col-sm-6">
                <input type="text" id="memaddr" name="memaddr"   class="form-control" readonly="readonly" value='${login.memaddr}'>
             </div>   
           </div>
      
          <div class="form-group"> 
             <div class="col-sm-2 control-label">
                <label id="memaddr2">상세주소</label>
             </div>
             <div class="col-sm-6"> 
               <input type="text" id="memaddr2" name="memaddr2"   class="form-control" value='${login.memaddr2}' >
               </div>
          </div>
          
     
 
          <div class="form-group">
            <div class="col-sm-2 control-label">
                <label id="memphone">전화번호</label>
            </div>
            <div class="col-sm-6">
                <input type="text" class="form-control" name="memphone" id="memphone" placeholder="-없이 적어주세요." value='${login.memphone}'>
                <span id="memphone_error" class="chk_error">전화번호를 입력해주세요</span>
            </div>
         </div>
         
         <div class="form-group">
            <div class="col-sm-2 control-label">
                <label id="membirth">생일</label>
            </div>
            <div class="col-sm-6">
                <input type="date" class="form-control" name="membirth" id="membirth" value='${membirth}' min="1900-01-01"  >
                <span id="membirth_error" class="chk_error">생일을 입력해주세요</span>
            </div>
         </div>
         
         <div class="form-group">
            <div class="col-sm-2 control-label">
                <label id="memgender">성별</label>
            </div>
            <div class="col-sm-6">
            	<c:choose>
            	<c:when test="${login.memgender eq '1'}"><input type="radio" name="memgender" value="1" checked="checked">남성&nbsp;<input type="radio" name="memgender" value="2">여성</c:when>
            	<c:when test="${login.memgender eq '2'}"><input type="radio" name="memgender" value="1">남성
                &nbsp;<input type="radio" name="memgender" value="2" checked="checked">여성</c:when>
                <c:otherwise>
                <input type="radio" name="memgender" value="1">남성
                &nbsp;
                <input type="radio" name="memgender" value="2">여성
                </c:otherwise>
                </c:choose>
            </div>
         </div>
         
         <div class="form-group">
            <div class="col-sm-2 control-label">
                <label for="memfile">프로필 사진</label>
            </div>
            <div class="col-sm-6">
                <input type="file" id="photofile" name="photofile" accept="image/*"/>
                <c:choose>
                	<c:when test="${not empty login.memfile }">
                		<div class="select_img"><img id="thumbnail" src="${login.memfile}" /></div>
                	</c:when>
                	<c:otherwise>
                		<div class="select_img"><img id="thumbnail" src="" /></div>
                	</c:otherwise>
                </c:choose>
                
            </div>
         </div>
         
         
          <div class="form-group">
            <div class="col-sm-2 control-label" style="max-width : fit-content">
            	<c:choose>
            	<c:when test="${login.memchk eq 'Y'}"><input type="checkbox" name="memchk" id="memchk" value="Y" checked="checked">&nbsp;<label>[선택]친구찾기를 위해 개인정보를 사용하시는거에 동의하십니까?</label></c:when>
            	<c:otherwise>
                <input type="checkbox" name="memchk" id="memchk" value="Y">&nbsp;<label>[선택]친구찾기를 위해 개인정보를 사용하시는거에 동의하십니까?</label>
                </c:otherwise>
                </c:choose>
            </div>
         </div>
         
 
          
          
         <div class="form-group" >
            <div class="col-sm-12  text-center">
            <input type="submit" value="수정" class="btn btn-success" onclick="return empty_change()"/>
            <input type="button" value="탈퇴" class="btn btn-warning" onclick="location.href='deleteuserform.do'"/>
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
	<script src="resources/js/profilechange.js?ver=1"></script>


</body>
</html>