<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>        
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CarMing | 캠핑토크 - DM 채팅</title>
<link rel="stylesheet" href="resources/css/privatechat.css">

</head>
<body>
<!-- Start Header Area -->
<%@include file="../common/header.jsp"%>
<!-- End Header Area -->

<!-- Start Banner Area -->
<section class="banner-area organic-breadcrumb">
   <div class="container">
      <div class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
         <div class="col-first" id="banner-text-1">
         	<div class="maintext text-1">Everything has an end,</div>
         	<div class="maintext text-2">so time feels more precious</div>
         </div>
      </div>
   </div>
</section>
<!-- End Banner Area -->

<!-- Start Container Area -->
<div class="card-container">
	<div class="card-wrap">
		<!-- 채팅목록 사용자 프로필/아이디/읽음 여부(갯수) -->
		<div class="card-chatlist">
			<div class="chatlist-header">
				<a href="profileform.do"><img class="next-left" src="./resources/img/left.png"></a>
				<div class="chatlist-header-text">채팅 목록</div>
			</div>

			<div class="chatlist-body">
				<div class="chatlist-profile">
					<a href="profileform.do"><img class="user-profile" src="./resources/img/profile.png"></a>&nbsp; 
					<span style="font-size:1.2em;">&nbsp;user8</span>
				</div>
				<div class="chatlist-chk">
					<div class="chat-time">오후 1:10</div>
					<div class="chat-notread">2</div>
				</div>
			</div>
		</div>
		
		<!-- 채팅하는 부분 -->
		<div class="card-chatscreen">
			<div class="chat-opponent">
				<img class="opponent-profile" src="./resources/img/profile.png">
				<span style="font-size:1.2em;">&nbsp;<strong>${login.memnick }</strong></span>
			</div>
			
			<div class="chat-talk"></div>
			
			<div class="chat-input">
				<div class="input-group mb-3" >
					<input type="text" class="form-control" placeholder="내용을 입력해 주세요." aria-label="Recipient's username" aria-describedby="button-addon2">
					<div class="input-group-append">
					    <button class="btn btn-outline-secondary" type="submit" id="button-addon2" ><img class="sendimg" src="./resources/img/send.png"></button>
					  </div>
				</div>	
			</div>
		</div>
	</div>


</div>
<!-- End Container Area -->
<!-- Start Footer Area -->
<%@ include file="../common/footer.jsp" %>
<!-- End Footer Area -->

</body>
</html>