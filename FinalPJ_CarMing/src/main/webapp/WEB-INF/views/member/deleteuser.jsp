<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CarMing</title>
<style type="text/css">
	#content{text-align: -webkit-center;}
	.panel-body{width: 80%;padding : 20px;}
	h4{padding-left : 40px;text-align : left;margin:20px}
	.col-lg-12{max-width: 80%;border : 1px solid #ccc	; padding : 40px;}

</style>
</head>
<body>

	<section id="header">
		<%@include file="../../views/common/header.jsp"%>
	</section>
	
	<!-- Start Banner Area -->
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
	<form  class="form-horizontal" action="deleteuser.do" method="post" onsubmit="delete_empty();">
         <div class="form-group">
         <h3>정말로 카밍에서 탈퇴하시겠습니까?</h3>
         <c:if test="${logintype eq 'normal'}">
            <div class="col-sm-3 control-label">
                <label for="memid">비밀번호 입력</label>
            </div>
            <div class="col-sm-6">
               <input type="password" class="form-control" name="mempw" id="mempw">
               <c:if test="${not empty missmatch}">
               <span id="mempwchk_error" class="chk_error">${missmatch}</span>
               </c:if>
            </div>
          </c:if>
           </div>
           
         <div class="form-group" >
            <div class="col-sm-12  text-center">
            <input type="submit" value="탈퇴" class="btn btn-success" onclick="return delete_empty()"/>
            <input type="button" value="취소" class="btn btn-warning" onclick="location.href='home.do'"/>
            </div>
         </div>
      </form>

	
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
<!-- 	<script src="resources/js/main.js"></script> -->
	<script src="resources/js/deleteuser.js"></script>
</body>
</html>