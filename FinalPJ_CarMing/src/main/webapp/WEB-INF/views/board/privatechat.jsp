<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>        
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CarMing</title>
<style type="text/css">
	.card-container{margin: 50px 200px; padding: 0px; width: 1100px; height: 500px; border-radius: 10px; box-shadow: 10px 10px 30px silver;}
	.card-wrap{width: 100%;height: 550px;}	
	
	.card-chatlist{float: left;width:400px; height: 500px; border-radius: 10px 0px 0px 10px; border-right: 2px solid silver;}
	.next-left{width: 30px; height: 30px; margin: 20px 10px 20px 20px; padding: 0px; opacity: 50%;}
	.chatlist-header{border-bottom: 1px solid silver;}
	.chatlist-header-text{font-size:1.6em; margin-top: 10px; float:right; margin: 23px 245px 20px 0px;}
	.chatlist-profile{float: left; margin: 15px 20px 0px 20px;}
	.chatlist-body{width: 400px; height: 65px;}
	.chatlist-chk{float: right; margin: 15px 20px;}
	.chat-notread{width: 23px; height: 23px; margin: 1px 0px 0px 40px; border-radius: 15px; background-color: orange; text-align: center; color: white;}

	.card-chatscreen{float: left; width: 700px; height: 500px; margin-left: 0px; border-radius: 0px 10px 10px 0px;}
	.user-profile{width: 50px; height: 50px; border-radius: 5em;}
	.chat-opponent{width: 700px; border-radius: 0px 10px 0px 0px; border-bottom: 1px solid silver;}
	.chat-input{width: 700px;}
	.sendimg{width: 20px; height: 20px; opacity: 50%;}
	.chat-talk{width: 700px; height: 392px; background-color: orange;}
	.opponent-profile{width: 50px;height: 50px; margin: 10px 3px 10px 20px; }
	.btn btn-outline-secondary{background-color: gray;}
	#button-addon2{background-color: #fff5e9; border: 1px solid silver; border-radius: 0px 0px 10px 0px;}
</style>	
	
</head>
<body>
<!-- Start Header Area -->
<%@include file="../common/header.jsp"%>
<!-- End Header Area -->

<!-- Start Banner Area -->
<section class="banner-area organic-breadcrumb">
   <div class="container">
      <div class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
         <div class="col-first">
            <h1>The stars in the night sky</h1>
            <nav class="d-flex align-items-center">
               <a href="index.html">Home<span class="lnr lnr-arrow-right"></span></a>
               <a href="boardmainform.do">Talk</a>
            </nav>
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