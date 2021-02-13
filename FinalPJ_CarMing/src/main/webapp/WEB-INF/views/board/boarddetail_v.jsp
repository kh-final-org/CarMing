<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>       
<%@ page import = "com.finalPJ.carming.model.dto.bcommentDto" %> 
      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CarMing | 캠핑토크 - 게시글 상세 페이지</title>
<style type="text/css">
	.col-first{margin: -1% 63.5% 0 -18%; } 
	.col-first > .maintext{font-weight: bold; font-size: 2.0em; color: #fff; text-align: left;}
	.text-1{margin: -5% 0 3%;}

	.card-first{float: left; margin: 100px 50px 100px 50px;}
	.card-second{float: left; width: 500px;}
	.card-third{float: right; margin: 100px 90px;}
	
	.user-profile{width: 50px; height: 50px; margin-right: 10px; border-radius: 5em;}
	.board-profile{float: left; margin: 5px 50px;}
	.board-location{float: right; text-align: right; margin: 10px 0px 5px 0px; }
	.board-usernick{display: inline-block; font-size: 1.2em; margin-left: -10px; font-weight: bold;}
	.uploadimg{width: 450px; height: 450px; margin: 0px 50px;}
	.board-uploadvideo{margin-left: 50px;}
	
	.card-body-3{margin: 10px 0px 30px 50px; position: relative;}
	.board-content{float: left; position: absolute; left: 0; width: 70%;}
	.board-count{float: left; text-align: right; position: absolute; left: 326px; width: 20%; font-size: 0.85em;} 
	.board-report{float: right; text-align: right; position: absolute; right: 0; width: 10%; font-size: 0.85em;}
	#board-report-target{color: silver;}
	#report{border: none; background-color: white;}	 	
		
	.board-comment-header-1{float: left; margin-left: 50px;}	
	.board-comment-head{float: left; font-size:1.2em;}
	.board-comment-count{float: right; margin-left: 15px; font-size: 1.2em;}
	.board-comment-header-2{float: right;}
	.board-share{float: right; margin-right: 10px; cursor: pointer; margin-left: 5px;  margin-right: -0.5px;}
	.share-kakaotalk{width: 20px; height: 100%;}
	.board-modify{float: left; margin-left: 0px 10px;}
	.board-delete{float: left; margin-left: 1px; margin-right: 5px;}
	#board-option-btn{color: gray; background:#fff; border: 0; padding: 0; cursor: pointer; outline: none;}
	textarea#update2{width: 315px; pdding: 0; border: none; resize: none; outline: none; color: gray;}
	
	.card-body-5{margin: 10px 0px;}
	#button-addon2{background-color: #fff5e9; border: 1px solid silver;}	
	.sendimg{width: 20px; height: 20px; opacity: 50%;}
	.board-profile-comment{float: left;	margin-left: 50px;}
	.board-input-comment{float: right; width: 385px; margin: 5px 0px;}
	input.form-control{font-size: 1.0em;}

	.card-body-6{float: left; width: 100%; margin-bottom: 13px;}
	.commentuser-first{float: left; margin-left: 50px;}
	.board-profile-commentuser{float: left;}
	.commentuser-comment{float: right; margin: 11px 5px 11px 20px;}
	.commentuser-second{float: right; margin: 10px 0px; font-size: 0.85em;}
	.comment-time{float: left; text-align: right;}
	.comment-delete{float: right;  margin-right: 2px;}
	.comment-report{float: right;}
	.board-delete-comment{color: #5f5f5f;}
	
</style>

<!-- kakao share -->
<script type="text/JavaScript" src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript">
	function sendLinkCustom() {
	       Kakao.init("ec2908c95e9e6b6c236066424e7e8fa2");
	       Kakao.Link.sendCustom({
	           templateId: 44747
	       });
	   }
</script>
<script>	
	try {
			function sendLinkDefault(brdno) {
				
			Kakao.init('ec2908c95e9e6b6c236066424e7e8fa2')
			Kakao.Link.sendDefault({
	 				objectType: 'feed',
	 				content: {
	   				title: 'Camping Talk',
	   				description: '아웃도어 라이프 우리 모두의 캠핑',
	   				imageUrl: 'https://postfiles.pstatic.net/MjAyMTAxMjFfNDgg/MDAxNjExMjE5MDc4MjE2.jLlgUhy3A2J847CYZ_4Sp4X5FI3S8gz_luJHphBr6ocg.czFVIO2I_A-hEsZD7ucwCMfehhtK-PWhH1QFSqbrUmog.JPEG.ghkdwjdals33/kakaoCarMing.JPG?type=w966',
	   				link: {
	     					mobileWebUrl: 'http://localhost:8787/carming/boarddetailform.do?brdno=' + brdno + '&brdfile',
	     					webUrl: 'http://localhost:8787/carming/boarddetailform.do?brdno=' + brdno,
	   				},
	 				},
	 				buttons: [{
	     				title: '게시글 보러가기',
	     				link: {
	       				mobileWebUrl: 'http://localhost:8787/carming/boarddetailform.do?brdno=' + brdno,
	       				webUrl: 'http://localhost:8787/carming/boarddetailform.do?brdno=' + brdno,
	     				},
	   			}],
				})
			}; window.kakaoDemoCallback && window.kakaoDemoCallback() }
	catch(e) { window.kakaoDemoException && window.kakaoDemoException(e) }
</script>

<script>
	function boardDel(brdno){
		var chk = confirm("삭제된 글은 복구가 불가능합니다.\n게시글을 삭제하시겠습니까?")
		if(chk){
			location.href='boarddelete.do?brdno='+${dto.brdno };
		}
	}
</script>

<!-- 수정하기 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
function update(brdno){
	var content =  document.getElementById("update2").value;
					
	console.log(content);
	
	var value = {
		"brdno"	: brdno,
		"brdcontent" : content
	};
	console.log(value);
	
	if(content == null|| content=="" ){
		alert("내용을 입력해 주세요.");
	}else{
		$.ajax({
			type:"post",
			url : "boardupdateRes.do",
			data : JSON.stringify(value),
			contentType : "application/json",
			dataType : "json",
			success:function(msg){
				if(msg.check==true){
					location.href="boarddetailform_v.do?brdno="+brdno;
				}else{
					alert("게시글 수정에 실패하였습니다.");
				}
			},
			error:function(){
				console.error("게시글 수정에 실패하였습니다.");
				alert("통신에러");
			}

	});
	}
}

</script>
<!-- 수정 폼 -->
<script type="text/javascript">
	function updateform() {
    	var value = document.getElementById("update").textContent;
		$("#update").empty();
    	
   	    var Y = document.createElement("textarea");
	    Y.setAttribute("name", "brdcontent");
	    Y.setAttribute("id","update2")
	   	Y.value += value;

	    document.getElementById("update").appendChild(Y);	
	    
	    $("#updatebutton").empty();
	    
	    var button = document.createElement("input");
	    button.setAttribute("onclick","update(${dto.brdno})");
	    button.setAttribute("type","button");
	    button.setAttribute("value","수정 완료");
	    button.setAttribute("id","board-option-btn");
	   // <input type="button" onclick="updateform()"  value="수정" id="board-option-btn">
	    
	   document.getElementById("updatebutton").appendChild(button);
	 };
	 
</script> 

<script>
	function boardUpdate(brdno){
		var chk = confirm("게시글을 수정하시겠습니까?")
		if(chk){
			location.href='javascript:updateform()';
		}
	}
</script>


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
<main role="main" style="padding: 50px 0px 50px 490px; ">

<!-- Start Container Area -->
<div class="card-container">
	<!-- Start BoardDetil Area -->
	<div class="card-second">
		<!-- 프로필 사진/아이디/위치/날짜 -->
		<div class="card-body-1">
			<div class="board-profile">
				<a href="profileform.do?memno=${dto.memno }&brdwriter=${dto.brdwriter }">
					<img class="user-profile" src="./resources/img/profile.png">
				</a>&nbsp; 
				<span class="board-usernick">&nbsp;${dto.brdwriter }</span>
			</div>	
			<div class="board-location">
				<div>${dto.mapname }</div>
				<div><fmt:formatDate pattern="yyyy.MM.dd" value="${dto.brddate }"/></div>
			</div>
		</div>
		
		<!-- 사용자가 업로드한 동영상 -->
		<div class="card-body-2">
			<div class="board-uploadvideo">
				<video src="resources/img/board/${dto.brdvideoname }" controls="controls" width="450" height="450"></video>
			</div>
		</div>
		
		<!-- 게시글 내용/조회수/신고 -->
		<div class="card-body-3">
			<div class="board-content" id="update">${dto.brdcontent }</div>
			<div class="board-count">조회수 ${dto.brdcount }</div>
			<div class="board-report">&nbsp;&nbsp;&middot;
				<a href="writereportform.do?targetNo=${dto.brdno}&targetTypeNo=1" class="board-report-target1" id="board-report-target">신고</a>
			</div>
		</div><br><br>
		
		<!-- 게시글 전체 댓글 수/카카오톡 공유/수정/삭제 -->
		<div class="card-body-4">
			<div class="board-comment-header-1">
				<div class="board-comment-head"><strong>댓글</strong></div>
				<div class="board-comment-count"><b>${dto.comcount}</b></div>
			</div>
			<div class="board-comment-header-2">
				<c:if test="${login.memnick == dto.brdwriter }">
					<div class="board-modify" id="updatebutton">
						<input type="button"  onclick="boardUpdate(${dto.brdno})"  value="수정" id="board-option-btn">
					</div>
					<div class="board-delete" >&nbsp;&#124;
						<input type="button" onclick="boardDel(${dto.brdno})" value="삭제" id="board-option-btn">
					</div>&#124;
				</c:if>
				<div class="board-share">
					<a id="kakao-link-btn" onClick="sendLinkDefault('${dto.brdno}');">
						<img class="share-kakaotalk" src="./resources/img/kakaotalk.png">
					</a>
				</div>
			</div>
		</div><br>
	
		<!-- 게시글에 댓글 입력하는 부분 -->
		<form:form action="writebcommentv.do?memno=${login.memno }&brdno=${dto.brdno }" method="post">
			<div class="card-body-5">
				<div class="board-profile-comment">
					<img class="user-profile" src="./resources/img/profile.png">
				</div>	
				<div class="board-input-comment">
					<div class="input-group mb-3" >
						<input type="text" class="form-control" name="comcontext" placeholder="댓글을 입력해 주세요." 
							   aria-label="Recipient's username" aria-describedby="button-addon2" required="required">
						<div class="input-group-append">
					    	<button class="btn btn-outline-secondary" type="submit" id="button-addon2">
					    		<img class="sendimg" src="./resources/img/send.png">
					    	</button>
					  	</div>
					</div>	
				</div>
			</div>
		</form:form>
		
		<!-- 댓글 -->
		<c:forEach var="comment" items="${comment }">
			<div class="card-body-6">
				<div class="commentuser-first">
					<div class="board-profile-commentuser">
						<a href="profileform.do?memno=${dto.memno }"><img class="user-profile" src="./resources/img/profile.png" ></a>
						<span><strong>${comment.comwriter }</strong></span>
					</div>
					<div class="commentuser-comment" id="comupdate">${comment.comcontext }</div>
				</div>
	
				<div class="commentuser-second">
					<div class="comment-time"><fmt:formatDate pattern="a HH:mm" value="${comment.comdate }"/></div>&nbsp;&middot;&nbsp;
					<div class="comment-report">
						<a href="writereportform.do?targetNo=${comment.comno }&targetTypeNo=2" class="board-report-target2" id="board-report-target">신고</a>
					</div>
					<c:if test="${login.memnick == comment.comwriter }">
					<div class="comment-delete">
						<!-- 
						<input type="button" onclick="commentDel(${comment.comno})" value="삭제" id="board-option-btn">-->
						<a href="deletebcomment.do?comno=${comment.comno }&brdno=${dto.brdno }" class="board-delete-comment">삭제</a>&nbsp;&middot;
					</div>
					</c:if>
				</div>
			</div>
		</c:forEach>
	</div>
	<!-- End BoardDetil Area -->
		
	<!-- 여백을 주기 위해 임시로 만들어 놓음 -->
	<table class="table table-hover"></table>
</div>
<!-- End Container Area -->
</main>


<!-- start Footer Area -->
<%@include file="../../views/common/footer.jsp"%>
<!-- End Footer Area -->
</body>
</html>