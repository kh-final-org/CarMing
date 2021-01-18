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
	.card-container{margin: 50px 200px; padding: 0px;}
	
	.card-profile{float: left; width: 300px; height: 400px; margin-top: 40px; border-radius: 10px; box-shadow: 10px 10px 30px silver;}	
	.profilepage-profile{margin: 70px 63px 25px 63px;}	
	.user-profile{width: 170px; height: 170px;}
	.user-id{font-size:1.6em; margin: 15px 38px 10px 38px; width: 100px; text-align: center;}
	.profilepage-message{margin: 10px 0px 10px 95px;}
	.user-message{width: 30px; height: 30px;opacity: 35%;}
	.user-message-text{font-size:1.2em; color: silver;}
	
	.card-board{float: right; width: 730px; height: 600px; margin-bottom: 100px;}
	.boardlist{margin-bottom: 10px;}
	.card-boardtext{font-size:1.8em; margin-bottom: 17px;color: #5f5f5f;}
	.boardlist-img{width: 235px; height: 235px; border-radius: 5px; transform: scale(1.00);	transition: transform .2s;}
	.boardlist-img:hover{transform: scale(1.02);	transition: transform .2s;}
	.boardlistup{overflow: hidden; border-radius: 5px; margin-bottom: 10px;}
	
	#board-first{float: left;}
	#board-second{float: left; margin-left: 1.8%;}
	#board-third{float: right;}
</style>	

</head>
<body>
<!-- Start Header Area -->
<%@include file="../common/header.jsp"%>
<!-- End Header Area -->

<div class="card-container">
	<!-- 사용자 프로필 -->
	<div class="card-profile">
		<div class="profilepage-profile">
			<img class="user-profile" src="./resources/img/profile.png">
			<div class="user-id">황정민</div>
		</div>
		<div class="profilepage-message">
			<a href="privateform.do">
				<img class="user-message" src="./resources/img/message.png">
				<span class="user-message-text">&nbsp;1:1 채팅</span>
			</a>
		</div>
	</div>

	<!-- 사용자가 올린 게시글 목록 -->
	<!-- 게시글 1행 -->
	<div class="card-board">
		<div class="card-boardtext">게시글 보기</div>
		
		<!-- 1행 -->
		<div class="card-boardlist">
			<div class="boardlistup" id="board-first">
				<a href="boarddetailform.do"><img class="boardlist-img" src="./resources/img/boardUpload/mycamp18.JPG"></a>
			</div>
			<div class="boardlistup" id="board-second">
				<img class="boardlist-img" src="./resources/img/boardUpload/carcamp11.jpg">
			</div>
			<div class="boardlistup" id="board-third">
				<img class="boardlist-img" src="./resources/img/boardUpload/carcamp10-1.jpg">
			</div>
		</div>
		
		<!-- 2행 -->
		<div class="card-boardlist">
			<div class="boardlistup" id="board-first">
				<img class="boardlist-img" src="./resources/img/boardUpload/general10-1.jpg">
			</div>
			<div class="boardlistup" id="board-second">
				<img class="boardlist-img" src="./resources/img/boardUpload/glam11-1.jpg">
			</div>
			<div class="boardlistup" id="board-third">
				<img class="boardlist-img" src="./resources/img/boardUpload/carcamp14-1.jpg">
			</div>
		</div>
	</div>
	




</div>

	

</body>
</html>