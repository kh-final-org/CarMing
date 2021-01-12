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
		
	.card-head-first{
		float: left;
	}
		
	.card-head-second{
		float: left;
		margin-left: 620px;
	}
		
	.card-head-third{
		float: right;
	}
	
	.card-body{
		width: 1120px;
		height: 480px;	/*하단 여백이 안생겨서 추가함(추후 수정)*/
		margin: 0px;	
		padding: 0px;
	}
		
	.card-body-first{
	 	float: left;
	 	margin: 0px 0px 0px -20px;
	 	padding: 0px;
	}
		
	.card-body-second{
	 	float: left;
	 	margin-left: 1.9%;
	}
	 	
	.card-body-third{
	 	float: right;
		margin: 0px -20px 0px 0px;
	}
		
	.user-profile{
	 	width: 50px;
	 	height: 50px;
	}
		
	.uploadimg{
	 	width: 360px;
	 	height: 360px;
	 	border-radius: 10px;
	 	transform: scale(1.00);		/*마우스가 이미지를 벗어나도 자연스럽게 크기가 줄어들기 위함*/
	 	transition: transform .3s;	
	}
	 
	.uploadimg:hover{				/*마우스 호버시*/
		transform: scale(1.03);		/*이미지 확대*/
		transition: transform .3s;	/*시간 설정*/
	}
	
	.board-uploadimg{	
		overflow: hidden;			/*부모태그를 벗어나지 않고 내부에서만 확대*/
		border-radius: 10px;
	}
			
	.board-profile{
	 	margin: 0px 0px 8px 8px;
	}
		
	.board-count{
		width: 360px;
	 	font-size: 0.8em; 
	 	text-align: right;
	 	margin: 3px 0px 0px 0px;
	}
	
	#main-dropdown-menu {
		width: 120px;
	} 
	
	#dropdown-category{
	 	width: 140px; 
	 	text-align: left;
	 	border-color: silver;
	}
	
	#button-boardwrite{
		width: 140px; 
		color: #5f5f5f;	/*색상코드: 진회색*/
		background-color: #ffe6be;
	} 
	 
	.navi li a:hover{
		background-color: #fff5e9;
	}
	
</style>
	
</head>
<body>
<!-- Start Header Area -->
<%@include file="../common/header.jsp"%>
<!-- End Header Area -->

<!-- start of container -->
<div class="card-container">
	<div class="card-head">
		<div class="card-head-first">
			<h2 style="color: #5f5f5f;  font-family:'Malgun Gothic';">CAMPING TALK</h2>
		</div>
		<div class="card-head-second">
			<button type="button" class="btn btn-light" onclick="location.href='boardwriteform.do'" id="button-boardwrite">+ 게시글 쓰기</button>
		</div>
		<div class="card-head-third">
			<button class="btn btn-outline-secondary dropdown-toggle" type="button" id="dropdown-category" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">&nbsp;&nbsp;&nbsp;카테고리&emsp;</button>
			<div class="dropdown-menu">
				<ul class="navi">
					<li><a class="dropdown-item" href="#">일반 캠핑</a></li>
					<li><a class="dropdown-item" href="#">카라반</a></li>
					<li><a class="dropdown-item" href="#">글램핑</a></li>
					<li><a class="dropdown-item" href="#">차박</a></li>
					<li><a class="dropdown-item" href="#">나만의 캠핑</a></li>
				</ul>
			</div>
		</div>
	</div>
	<br><br><br><br>
	
	<!-- 게시글이 없을 경우 -->
	<c:if test="${empty list }">
			<p>작성된 게시글이 없습니다.</p>
	</c:if>
	
	<!-- 게시글이 있을 경우 -->
	<c:forEach items="${list }" var="dto">
		<div class="card-body">
			<div class="card-body-first">
				<!-- 프로필 사진/아이디 -->
				<div class="board-profile">
					<a href="profileform.do"><img class="user-profile" src="./resources/img/profile.png" alt="profile-photo"></a>&nbsp; 
					<span style="font-size:1.2em;">&nbsp;${dto.brdwriter}</span>
				</div>	
				<!-- 사용자가 업로드한 이미지 -->
				<div class="board-uploadimg">
					<a href="boarddetailform.do"><img class="uploadimg" src="./resources/img/boardUpload/${dto.brdfile}"></a><br>
					<div class="board-count">${dto.brdcount}</div>
				</div>
			</div>
	
			<div class="card-body-second">
				<!-- 프로필 사진/아이디 -->
				<div class="board-profile">
					<img class="user-profile" src="./resources/img/profile.png" alt="profile-photo">&nbsp; 
					<span style="font-size:1.2em;">&nbsp;${dto.brdwriter}</span>
				</div>	
				<!-- 사용자가 업로드한 이미지 -->
				<div class="board-uploadimg">
					<img class="uploadimg" src="./resources/img/boardUpload/${dto.brdfile}"><br>
					<div class="board-count">${dto.brdcount}</div>
				</div>
			</div>
			
			<div class="card-body-third">
				<!-- 프로필 사진/아이디 -->
				<div class="board-profile">
					<img class="user-profile" src="./resources/img/profile.png" alt="profile-photo">&nbsp; 
					<span style="font-size:1.2em;">&nbsp;${dto.brdwriter}</span>
				</div>	
				<!-- 사용자가 업로드한 이미지 -->
				<div class="board-uploadimg">
					<img class="uploadimg" src="./resources/img/boardUpload/${dto.brdfile}"><br>
					<div class="board-count">${dto.brdcount}</div>
				</div>
			</div>
		</div>
	</c:forEach>
</div>
<!-- end of container -->	
	
	
<!-- start paging -->
<div class="card-bottom">
	<tr>
		<td colspan="5">
			<!-- 처음 페이지로 이동: 현재 페이지가 1보다 크면 	[<<] 하이퍼 링크를 화면에 출력 -->
			<c:if test="${map.boardPager.curBlock > 1}">
				<a href="javascript:list('1')">[&laquo;]</a>
			</c:if>
			<!-- 이전페이지 블록으로 이동: 현재 페이지 블럭이 1보다 크면 [<] 하이퍼링크를 화면에 출력 -->
			<c:if test="${map.boardPager.curBlock > 1}">
				<a href="javascript:list('1')">[&lt;]</a>
			</c:if>
		
			<!-- **하나의 블럭 시작 페이지부터 끝 페이지까지 반복문 실행 -->
			<c:forEach var="num" begin="${map.boardPager.blockBegin}" end="${map.boardPager.blockEnd}">
				<!-- 현재페이지이면 하이퍼링크 제거 -->
				<c:choose>
					<c:when test="${num == map.boardPager.curPage}">
						<span style="color: red">${num}</span>&nbsp;
					</c:when>
					<c:otherwise>
						<a href="javascript:list('${num}')">${num}</a>&nbsp;
					</c:otherwise>
				</c:choose>
			</c:forEach>
			
			<!-- 다음페이지 블록으로 이동 : 현재 페이지 블럭이 전체 페이지 블럭보다 작거나 같으면 [>]하이퍼링크를 화면에 출력 -->
			<c:if test="${map.boardPager.curBlock <= map.boardPager.totBlock}">
				<a href="javascript:list('${map.boardPager.nextPage}')">[&gt;]</a>
			</c:if>
				
			<!-- 끝페이지로 이동 : 현재 페이지가 전체 페이지보다 작거나 같으면 [>>]하이퍼링크를 화면에 출력 -->
			<c:if test="${map.boardPager.curPage <= map.baordPager.totPage}">
				<a href="javascript:list('${map.boardPager.totPage}')">[&raquo;]</a>
			</c:if>
		</td>
	</tr>
</div>
<!-- end paging -->	

	
<!-- start footer Area -->
<!-- end footer Area -->

</body>
</html>