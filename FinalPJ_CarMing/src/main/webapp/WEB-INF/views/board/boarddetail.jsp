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
	.card-container{
		margin: 50px 200px;
		padding: 0px;
	}
	
	.card-wrap{			/*하단 여백이 안생겨서 추가함(추후 수정)*/
		width: 100%;
		height: 800px;
	}	
		
	.card-first{
		float: left;
		margin: 100px 50px 100px 50px;
	}
	
	.card-second{
		float: left;
		width: 500px;
		margin-bottom: 50px;
	}
	
	.card-third{
		float: right;
		margin: 100px 80px;
	}
		
	.next-left{
		width: 40px;
		height: 40px;
		margin: 160px 0px 0px 150px;
		padding: 0px;
	}
	
	.next-right{
		width: 40px;
		height: 40px;
		margin: 160px 100px 0px 0px;
		padding: 0px;
	}	
		
	.user-profile{
	 	width: 50px;
	 	height: 50px;
	 }
		
	.board-profile{
		float: left;
		margin: 5px 50px;
	}
	
	.board-location{
		float: right;
		text-align: right;
		margin: 10px 0px 5px 0px;
	}
	
	.uploadimg{
	 	width: 450px;
	 	height: 100%;
	 	margin: 0px 50px;
	 }
	 
	 .card-body-3{
	 	margin: 10px 0px;
	 }
	 	
	 .board-content{
	 	float: left;
	 	margin-left: 50px;
	 }
	 	
	 .board-count{
	 	float: left;
	 	margin-left: 255px;
	 	text-align: right;
	 }
		 	
	 .board-report{
	 	float: right;
	 }
	 	
	 #report{
		border: none;
	 	background-color: white;
	 }	 	
		 	
	.share-kakaotalk{
	 	width: 25px;
	 	height: 25px;
	 }
	
	.board-comment-header-1{
		float: left;
		margin-left: 50px;
	}	
	
	.board-comment-header-2{
		float: right;
	}
		
	.board-comment-head{
		float: left;
		font-size:1.2em;
	}
	
	.board-comment-count{
		float: right;
		margin-left: 15px;
		font-size: 1.2em; 
	}
		
	.board-share{
		float: left;
		margin-right: 10px;
	}
	
	.board-modify{
		float: left;
		margin-left: 0px 10px;
	}

	.board-delete{
		float: right;
		margin-left: 8px;
	}

	.sendimg{
		width: 20px;
	 	height: 20px;
	 	opacity: 50%;
	 }
	 	
	 #button-addon2{
	 	background-color: silver;
		border: none;
	}	
	 	
	 .board-profile-comment{
	 	float: left;
	 	margin-left: 50px;
	 }
	 	
	.board-input-comment{
		float: right;
		width: 390px;
		margin: 5px 0px;	
	}
	
	.card-body-5{
		margin: 10px 0px;
	}
		
	.commentuser-first{
		float: left;
		margin-left: 50px;
	}
		
	.commentuser-second{
		float: right;
		margin: 10px 0px;
	}
		
	.comment-time{
		float: left;
		text-align: right;
	}
		
	.comment-report{
		float: right;
	}
		
	.board-profile-commentuser{
		float: left;
	}
		
	.commentuser-comment{
		float: right;
		margin: 10px 20px;
	}
		
		
		
	 	
	 	
	</style>

</head>
<body>
<!-- Start Header Area -->
<%@include file="../common/header.jsp"%>
<!-- End Header Area -->

<div class="card-container">
	<div class="card-wrap">
		<div class="card-first">
			<img class="next-left" src="./resources/img/left.png">
		</div>
	
		<div class="card-second">
			<div class="card-body-1">
				<!-- 프로필 사진/아이디 -->
				<div class="board-profile">
					<a href="profileform.do"><img class="user-profile" src="./resources/img/profile.png"></a>&nbsp; 
					<span style="font-size:1.2em;">&nbsp;user1</span>
				</div>	
				<div class="board-location">
					<div>서울특별시 카밍캠핑장</div>
					<div>2021.1.1</div>
				</div>
			</div>
			
			<div class="card-body-2">
				<!-- 사용자가 업로드한 이미지 -->
				<div class="board-uploadimg">
					<img class="uploadimg" src="./resources/img/boardUpload/mycamp18.JPG">
				</div>
			</div>
			
			<div class="card-body-3">
				<div class="board-content">게시글 내용</div>
				<div class="board-count">조회수 1,000</div>&nbsp;&middot;&nbsp;
				<div class="board-report">신고</div>
			</div><br><br>
			
			<div class="card-body-4">
				<div class="board-comment-header-1">
					<div class="board-comment-head"><strong>댓글</strong></div>
					<div class="board-comment-count"><b>2</b></div>
				</div>
				<div class="board-comment-header-2">
					<div class="board-share"><img class="share-kakaotalk" src="./resources/img/kakaotalk.png"></div>
					<div class="board-modify">&#124;&nbsp;&nbsp;수정</div>
					<div class="board-delete">&#124;&nbsp;&nbsp;삭제</div>
				</div>
			</div><br>
		
			<div class="card-body-5">
				<div class="board-profile-comment">
					<img class="user-profile" src="./resources/img/profile.png">&nbsp; 
				</div>	
				<div class="board-input-comment">
					<div class="input-group mb-3" >
						<input type="text" class="form-control" placeholder="댓글 달기.." aria-label="Recipient's username" aria-describedby="button-addon2">
						<div class="input-group-append">
					    	<button class="btn btn-outline-secondary" type="submit" id="button-addon2"><img class="sendimg" src="./resources/img/send.png"></button>
					  	</div>
					</div>	
				</div>
			</div>
			
			<div class="card-body-6">
				<div class="commentuser-first">
					<div class="board-profile-commentuser">
						<a href="profileform.do"><img class="user-profile" src="./resources/img/profile.png"></a>&nbsp; 
						<span><strong>&nbsp;user88</strong></span>
					</div>
					<div class="commentuser-comment">Comment</div>
				</div>
				
				<div class="commentuser-second">
					<div class="comment-time">오후 12:30</div>&nbsp;&middot;&nbsp;
					<div class="comment-report">신고</div>
				</div>
			</div>
			
		</div>
		
		<div class="card-third">
			<img class="next-right" src="./resources/img/right.png"> 
		</div>
	</div>
	
	
	
	
	
	
</div>



</body>
</html>