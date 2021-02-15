<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CarMing | 관리자 페이지</title>
<!-- <link rel="stylesheet" href ="resources/css/adminPage.css"> -->
<style type="text/css">
	.col-first{margin: -1% 63.5% 0 -18%; } 
	.col-first > .maintext{font-weight: bold; font-size: 2.0em; color: #fff; text-align: left;}
	.text-1{margin: -5% 0 3%;}
	#banner-text-2{position: absolute; top: 62%; right: 14%;}
	
	.banner-btn{width: 115px; padding: 8px 0 10px; line-height: 18px; border: 2px solid #fff5e9; border-radius: 3px;
				font-size: 1.1em; text-align: center; color: #fff5e9; background: transparent; opacity: 0.95;  
				position:relative; overflow: hidden; transition: 0.95s; cursor: pointer;}
	.banner-btn:hover{background: #fff5e9; color: #5f5f5f;}
	.banner-btn::before{content: ""; position: absolute; left:0; width:100%; height: 0%; background: #fff5e9; z-index: -1; 
						top:0; border-radius: 0 0 50% 50%; transition: 0.95s;}
	.banner-btn:hover::before{height: 180%;}

	.card-container{width: 100%;}
	.card-profile{float: left; width: 20%; height: 500px; margin-right: 1%; margin-top: 5%; 
				  border-radius: 10px; box-shadow: 10px 10px 30px rgba(0, 0, 0, 0.14);}	
	.profilepage-profile{margin: 55px 63px 25px;}	
	.user-profile{width: 170px; height: 170px; border-radius: 5em;}
	.user-id{font-size:1.6em; margin: 15px 38px 10px 38px; width: 100px; text-align: center;}
	.user-email{font-size:1.2em; color: silver; margin: -5% 4% 0; text-align: center;}
	.my-desc{padding: 0 7%; margin-top: -1%; text-align: center;}
	.profile-btn{width: 140px; padding: 8px 0 10px; line-height: 20px; border: 0; border-radius: 4px; outline: none;
				font-size: 1.15em; text-align: center; color: #5f5f5f; background-color: #ffe6be; cursor: pointer;}
	.profile-btn:hover{background: #ffdb9f; transition: 0.2s;}
	#profile-btn-1{width: 115px !important; margin-right: 2px;}
	#profile-btn-1{margin: 0;}

	.card-body{float: right; width: 67%; height: 100%; padding: 0 !important; margin-top: 3%}
	.card-mypage-title{font-size:1.8em; margin-bottom: 17px; color: #5f5f5f;}
	.boardlistup{float: left; width: 33.3%}
	.boardlistup-frame{position: relative; width: 235px; height: 235px; overflow: hidden; border-radius: 5px;}
	.boardlist-img{width: 235px; height: 235px; border-radius: 5px; transform: scale(1.00);	transition: transform .2s;}
	.boardlist-img:hover{transform: scale(1.02); transition: transform .2s;}
	.boardlistup{overflow: hidden; border-radius: 5px; margin-bottom: 10px;}
	.card-boardlist-board{margin-bottom: 5%; width: 100%;}
	#board-photo{float: left;}
	.banner-btn{width: 115px; padding: 8px 0 10px; line-height: 18px; border: 2px solid #fff5e9; border-radius: 3px;
				font-size: 1.1em; text-align: center; color: #fff5e9; background: transparent; opacity: 0.95;  
				position:relative; overflow: hidden; transition: 0.95s; cursor: pointer;}
	.banner-btn:hover{background: #fff5e9; color: #5f5f5f;}
	.banner-btn::before{content: ""; position: absolute; left:0; width:100%; height: 0%; background: #fff5e9; z-index: -1; 
						top:0; border-radius: 0 0 50% 50%; transition: 0.95s;}
	.banner-btn:hover::before{height: 180%;}
	
	.card-container{padding: 50px 200px;}
	.card {position: relative; width: 80%; margin-left: auto; margin-right: auto;}

	.card-profile{float: left; width: 27%; height: 400px; margin: 3.8% 5% 0 0; 
			 	  border-radius: 10px; box-shadow: 10px 10px 30px rgba(0, 0, 0, 0.14);}	
	.profilepage-profile{margin: 19% 21.5% 5%;}
	.user-profile{width: 170px; height: 170px; border-radius: 10em;}
	.user-id{font-size:1.6em; margin: 8% -5%; width: 100%; text-align: center;}
	.user-email{font-size:1.2em; margin: 6% -15%; width:100%; text-align: center; color: silver;}
	.my-desc{padding: 0 7%; margin-top: -1%;}
	.profile-btn{width: 120px; padding: 8px 0 10px; line-height: 20px; border: 0; border-radius: 4px; outline: none;
				font-size: 1.15em; text-align: center; color: #5f5f5f; background-color: #fff; cursor: pointer;
				margin: -2% 7%;}
	
	div.blog_right_sidebar{float: right; width: 22%; margin-bottom: -1.5%; margin-right: 7.5%; border: 0; background: #fff;}
	.btn.btn-default{margin-top: -6%; margin-right: -3%;}
	.gaadiex-list {border-radius: 10px; list-style-type: none; margin: 0; padding: 0;}
	.gaadiex-list-title > h2{float:left; width: 25%; margin: 1% 0 0 10%; font-family:'Malgun Gothic'; color: #5f5f5f; font-size: 2.2em;}
	.gaadiex-list>.gaadiex-list-item {padding: 0 20px 0 25px;}
	.gaadiex-list-item {width: 45%; float:left; margin-left: 2%;}
	.gaadiex-list-item-img > img {float: left; width: 100px; height: 100px; margin: 50px 30px 8px 30px; border-radius: 50%;}
	.gaadiex-list-item-text {margin-top: 50px; color: gray; margin-left: 160px;}
	.gaadiex-list-item-text a{color: gray;}
	.gaadiex-list-item-text a:hover{color: #ffba00; color: gray;}
	.gaadiex-list-item-text h4{margin-bottom: 5px; font-weight: bold; color: gray;}
	.list-item-text-ck:hover{border-radius: 2px; background: #fff5e9; transition: 0.2s;}
	
	
	/* 렌트리스트 CSS  */
	.banner-btn{width: 130px; padding: 8px 0 10px; line-height: 18px; border: 2px solid #fff5e9; border-radius: 3px;
				font-size: 1.1em; text-align: center; color: #fff5e9; background: transparent; opacity: 0.95;  
				position:relative; overflow: hidden; transition: 0.95s; cursor: pointer;}
	.banner-btn:hover{background: #fff5e9; color: #5f5f5f;}
	.banner-btn::before{content: ""; position: absolute; left:0; width:100%; height: 0%; background: #fff5e9; z-index: -1; 
						top:0; border-radius: 0 0 50% 50%; transition: 0.95s;}
	.banner-btn:hover::before{height: 180%;}

	.card-container{padding: 50px 200px;}
	#memlist_tb{width:100%; }
	#memlist_tb:hover tbody tr:hover td {background: #fff5e9; transition: 0.2s; }
	#paging-container{margin: 50px 0px 20px 0px;}
	.gaadiex-list-title > h2{float:left; width: 25%; margin-top: 1%; font-family:'Malgun Gothic'; color: #5f5f5f; font-size: 1.5em;}
	div.blog_right_sidebar{float: right; width: 22%; margin-bottom: -1.5%; margin-right: -2.5%; border: 0; background: #fff; }
	.btn.btn-default{margin-top: -6%; margin-right: -3%;}
	
	img.avatar{width: 70px; height: 70px;}
	.table-responsive{position: relative; width: 100%; margin-left: auto; margin-right: auto;}
	.table-wrapper {min-width: 1000px; background: #fff; padding: 20px 25px; border-radius: 3px; box-shadow: 0 1px 1px rgba(0,0,0,.05);}
	.table-title {padding-bottom: 15px; background: #299be4; color: #fff; padding: 16px 30px; margin: -20px -25px 10px; border-radius: 3px 3px 0 0;}
	.table-title h2 {margin: 5px 0 0; font-size: 24px;}
	.table-title .btn {color: #566787; float: right; font-size: 13px; background: #fff; border: none; min-width: 50px;
					   border-radius: 2px; border: none; outline: none !important;margin-left: 10px;}
	.table-title .btn:hover, .table-title .btn:focus {color: #566787; background: #f2f2f2;}
	.table-title .btn i {float: left;font-size: 21px; margin-right: 5px;}
	.table-title .btn span {float: left;margin-top: 2px;}
	table.table tr th, table.table tr td {border-color: #e9e9e9; padding: 12px 15px; vertical-align: middle;}
	table.table tr th:first-child {width: 60px;} 
	table.table tr th:last-child {width: 100px;}
	table.table-striped tbody tr:nth-of-type(odd) {background-color: #fcfcfc;}
	table.table-striped.table-hover tbody tr:hover {background: #f5f5f5;}
	table.table-striped.table-hover tbody tr td{text-align: center;}
	table.table-striped.table-hover tbody tr td a img{margin: 0;}

	table.table-striped.table-hover thead tr th{text-align: center;}
	
	table.table th i {font-size: 13px;margin: 0 5px;cursor: pointer;}	
	table.table td:last-child i {opacity: 0.9; font-size: 22px; margin: 0 5px;}
	table.table td span {font-weight: bold; color: #5f5f5f; display: inline-block; text-decoration: none;}
	table.table td a {color: #5f5f5f; display: inline-block; text-decoration: none;}
	table.table td a:hover {font-weight: bold;}
	table.table td a.settings {color: #2196f3;}
	table.table td a.delete {color: #f44336;}
	table.table td i {font-size: 19px;}
	table.table .avatar {border-radius: 50%; vertical-align: middle; margin-right: 10px; }
	.avatar {width: 5em; height: 5em;}
	.status {font-size: 30px; margin: 2px 2px 7px; display: inline-block; vertical-align: middle; line-height: 10px;}
	.text-success {color: #10c469;}
	.text-info {color: #62c9e8;}
	.text-warning {color: #FFC107;}
	.text-danger {color: #ff5b5b;}
	.hint-text {float: left; margin-top: 10px; font-size: 13px;}
</style>

<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
</head>
<body>
	<%@ include file="../common/header.jsp" %>
	<!-- Start Banner Area -->
	<section class="banner-area organic-breadcrumb">
	   <div class="container">
	      <div class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
	         <div class="col-first" id="banner-text-1">
	         	<div class="maintext text-1">Everything has an end,</div>
	         	<div class="maintext text-2">so time feels more precious</div>
	         </div>
	      </div>
	      <div class="section-top-border text-right" id="banner-text-2">
	       	 <div class="button-group-area mt-40" style="padding-bottom: 5em">
	       	 	<button class="banner-btn" id="goinsert" type="button" onclick="location.href='inquirylist.do'">문의 목록</button>
	       	 	<button class="banner-btn" id="goinsert" type="button" onclick="location.href='reportlist.do'">신고 목록</button>
	       	 	<button class="banner-btn" id="goinsert" type="button" onclick="location.href='memberlist.do'">회원 목록</button>
	       	 	<button class="banner-btn" id="goinsert" type="button" onclick="location.href='adminProductList.do'">제품 목록</button>
	       	 	<button class="banner-btn" id="gomodify" type="button" onclick="location.href='profilechangeform.do'">프로필 수정</button>
	         </div>
		  </div>
	   </div>
	</section>
	<!-- End Banner Area -->
	<main role="main" style="padding: 3% 10% 5%; ">
	
	<!-- Start Container Area -->
		<!-- 사용자 프로필 -->
		<div class="card-profile">
			<div class="profilepage-profile">
				<img class="user-profile" src="${login.memfile}" alt="">
				<div class="user-id"><strong>${login.memnick }</strong></div>
				<div class="user-email">${login.memid }</div>
			</div>
		</div>
		
		<!-- Start BoardList/Map Area -->
		<div class="card-body" >
		<div class="gaadiex-list-title">
			<h3 style="color: #5f5f5f; font-family:'Malgun Gothic';">RENTAL LIST</h3>
		</div>
	
		<div class="table-responsive">
			<table class="table table-striped table-hover" id="memlist_tb" style="text-align: center; width: 100%;">
				<col style="width: 5%">
				<col style="width: 10%">
				<col style="width: 7.5%">
				<col style="width: 15%">
				<col style="width: 10%">
				<col style="width: 15%">
				<col style="width: 12%">
				<col style="width: 5%">
				<thead>
					<tr>
						<th>NO.</th>
						<th>프로필 사진</th>
						<th>닉네임</th>
						<th>카테고리</th>
						<th>결제번호</th>
						<th>렌트 종료날짜</th>
						<th>렌탈현황</th>
						<th>삭제</th>
					</tr>
				</thead>
				<c:forEach var="list" items="${list}">
					<tbody>
						<tr>
							<td class="cartNo" ><a href="adminRentDetail.do?cartNo=${list.cartNo}">${list.cartNo}</a></td>
							<td><a href="#"><img
									src= "${list.memFile }" class="avatar" style="width: 70px; height: 70px;"
									alt=""></a></td>
							<td>${list.memNick }</td>
							<td>${list.pCategoryName }</td>
							<td>#${list.payNo }</td>
	
							<td><fmt:formatDate pattern="yyyy-MM-dd"
									value="${list.endDate}" var="endDate"/>
									${endDate}</td>
							<td>
							<jsp:useBean id="toDay" class="java.util.Date" />
							<fmt:formatDate value='${toDay}' pattern='yyyy-MM-dd' var="nowDate"/>
							<c:set var="status" value="${list.stateNo}" /> 
									<c:choose>
									<c:when test="${ status == 4}">
										<span class="status text-danger">&bull;</span>
										${list.stateName }
									</c:when>
									<c:when test="${ status == 5}">
										<span class="status text-success">&bull;</span>
										${list.stateName }
									</c:when>
									<c:when test="${ endDate < nowDate}">
										<span class="status text-danger">&bull;</span>
										연체
									</c:when>
									<c:when test="${ status == 2}">
										<span class="status text-success">&bull;</span>
										${list.stateName }
									</c:when>
									<c:when test="${ status == 3}">
										<span class="status text-warning">&bull;</span>
										${list.stateName }
									</c:when>
									
									
									<c:when test="${ status == 6}">
										<span class="status text-danger">&bull;</span>
										${list.stateName }
									</c:when>
									
								</c:choose> 
							</td>
							<td>
							<a href="deleteRent.do?cartNo=${list.cartNo}" class="delete" title="Delete"
							data-toggle="tooltip"><i class="material-icons">&#xE5C9;</i></a>
							</td>
						</tr>
					</tbody>
				</c:forEach>
			</table>
		</div>
					<!-- ==================================================================================================
				================================================ paging ================================================ -->
			<c:set var="page" value="${(empty param.page) ? 1 : param.page}"></c:set>
			<c:set var="startNum" value="${page - (page-1) % 5}"></c:set>
			<c:set var="lastNum" value="${fn:substringBefore(Math.ceil(count/6), '.')}"></c:set>
			<!-- 현재 페이지 -->
<!-- 			<div class="hint-text"> -->
<%-- 					Showing <b>${(empty param.page) ? 1:param.page}</b> out of <b>${lastNum }</b> pages --%>
<!-- 			</div> -->
			<!-- paging 버튼  -->
			<div class="container ml-auto" id="paging-container" align="center">
				<nav aria-label="Page navigation example">
					<ul class="pagination justify-content-center" style="border-left: 0px;">
						<!-- 이전 버튼 -->
						<c:if test="${startNum > 1 }">
							<li class="page-item">
								<a class="page-link text-warning" href="?page=${startNum - 1 }&search=${param.search}" aria-label="Previous">
					 				<span aria-hidden="true" class="btn-prev">&laquo;</span>
						    	</a>
						   	</li>
						</c:if>		
					
						<c:if test="${startNum <= 1 }">
							<li class="page-item">
								<a class="page-link text-warning" aria-label="Previous">
					 				<span aria-hidden="true" class="btn-prev" onclick="alert('이전 페이지가 없습니다.');">&laquo;</span>
					    		</a>
						   	</li>
						</c:if>
					
						<c:forEach var="i" begin="0" end="4">
							<c:if test="${(startNum + i ) <= lastNum }">
							<!-- 현재 페이지 style 변경 -->
							<li class="page-item"><a class="page-link text-warning ${(page == (startNum + i)) ? 'active' : ''}" href="?page=${startNum + i }&search=${param.search}">${startNum + i }</a></li>
							</c:if>
						</c:forEach>
					  			
					  	<!-- 다음 버튼 -->
					  	<c:if test="${startNum + 4 < lastNum }">
						    <li class="page-item">
						    	<a class="page-link text-warning" href="?page=${startNum + i }&search=${param.search}" aria-label="Next">
						    		<span aria-hidden="true">&raquo;</span>
						      	</a>
						   	</li>
					  	</c:if>
					  	
					  	<c:if test="${startNum + 4 >= lastNum }">
						    <li class="page-item">
						    	<a class="page-link text-warning" aria-label="Next">
						    		<span aria-hidden="true" onclick="alert('다음 페이지가 없습니다.');">&raquo;</span>
						      	</a>
						   	</li>
					  	</c:if>	
					</ul>
				</nav>
			</div>
			</div>
			</div>
			<!-- ==================================================================================================
				================================================ paging ================================================ -->
		
		<%-- 	
			<div class="card-mypage-title">내 캠핑맵</div>
			<div class="card-boardlist-map">
				<div class="boardlistup" id="board-photo">
					<div class="boardlistup-frame">
						<a href="boarddetailform.do?brdno=${dto.brdno }&memno=${dto.memno}">
							<img class="boardlist-img" src="resources/img/board/${dto.brdfilename }">
						</a>
					</div>
				</div>
			</div>
		</div> --%>
		<!-- End BoardList/Map Area -->
	
	
	<!-- End Container Area -->
	<table class="table table-hover"></table>
	</main>
	
	<%@ include file="../common/footer.jsp" %>
</body>
</html>