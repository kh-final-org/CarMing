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
<link rel="stylesheet" href ="resources/css/adminPage.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
</head>
<body>
	<%@ include file="../common/header.jsp" %>
	<!-- Start Banner Area -->
	<section class="banner-area organic-breadcrumb">
	   <div class="container">
	      <div class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
	         <div class="col-first">
	            <h1>The stars in the night sky</h1>
	            <nav class="d-flex align-items-center">
	               <a href="home.do"><span class="lnr lnr-home"></span>Home</a>&emsp;
	               <a href="#"><span class="lnr lnr-arrow-right-circle"></span>Camping</a>
	            </nav>
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
			<div class="my-desc">
				<input type="button" class="profile-btn" id="profile-btn-1" value="문의 목록" onclick="location.href='inquirylist.do'">
				<input type="button" class="profile-btn" id="profile-btn-1" value="신고 목록" onclick="location.href='reportlist.do'">
			</div>
			<br>
			<div class="my-desc">
				<input type="button" class="profile-btn" id="profile-btn-1" value="회원 목록" onclick="location.href='memberlist.do'">
				<input type="button" class="profile-btn" id="profile-btn-1" value="제품 목록" onclick="location.href='adminProductList.do'">
			</div>
		</div>
		<!-- Start BoardList/Map Area -->
		<div class="card-body" >
		<div class="gaadiex-list-title">
			<h3>RENTAL LIST</h3>
		</div>
	
		<div class="table-responsive">
			<table class="table table-striped table-hover" id="memlist_tb" style="text-align: center; width: 100%;">
				<col style="width: 5%">
				<col style="width: 10%">
				<col style="width: 7.5%">
				<col style="width: 15%">
				<col style="width: 8%">
				<col style="width: 15%">
				<col style="width: 10%">
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
									src= "${list.memFile }" class="avatar"
									alt="Avatar"></a></td>
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
			<div class="hint-text">
					Showing <b>${(empty param.page) ? 1:param.page}</b> out of <b>${lastNum }</b> pages
			</div>
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