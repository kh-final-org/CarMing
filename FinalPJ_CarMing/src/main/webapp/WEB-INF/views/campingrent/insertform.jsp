<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@
	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CarMing</title>
	
</head>
<body>
	<%@ include file="../common/header.jsp" %>
	<!-- Start Banner Area -->
	<section class="banner-area organic-breadcrumb">
		<div class="container">
			<div class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
				<div class="col-first">
					<h1>제품 등록</h1>
					<nav class="d-flex align-items-center">
						<a href="index.html">홈<span class="lnr lnr-arrow-right"></span></a>
						<a href="category.html">캠핑 렌트<span class="lnr lnr-arrow-right"></span></a>
						<a href="category.html">제품 등록</a>
					</nav>
				</div>
			</div>
		</div>
	</section>
	<!-- End Banner Area -->
	<div class="comment-form" style="box-sizing: content-box;">
                        <h4>제품 등록</h4>
                        <form:form method="post" enctype="multipart/form-data" modelAttribute="fileUpload" action="productinsert.do">
                            <div class="form-group form-inline">
                                <div class="form-group col-lg-6 col-md-6 name">
                                   	 <span>카테고리</span><select name="pCategoryNo" class="form-control" id="category" placeholder="카테고리를 입력해주세요." onfocus="this.placeholder = ''" onblur="this.placeholder = '카테고리를 입력해주세요.'">
                                   	 		<option selected>카테고릐를 선택해주세요.</option>
	                                   	 	<option value="1">텐트 / 타프</option>
	                                   	 	<option value="2">매트 / 침낭</option>
	                                   	 	<option value="3">코펠 / 버너 / 취사</option>
	                                   	 	<option value="4">체어 / 테이블</option>
	                                   	 	<option value="5">화로대 / BBQ</option>
                                   	 </select>
                                </div>
                                <br>
                                <div class="form-group col-lg-6 col-md-6 name">
                                     <span>제품명</span><input type="text" class="form-control" name="pName" placeholder="제품명을 입력해주세요. "
                                        onfocus="this.placeholder = ''" onblur="this.placeholder = '제품명을 입력해주세요.'">
                                </div>
                                <br>
                                <div class="form-group col-lg-6 col-md-6 name">
                                    <span>제품 이미지1(대표)</span><input type="file" class="form-control" name="prFile"><form:errors path="prFile"/>
                                </div>
                               <%--  <div class="form-group col-lg-6 col-md-6 name">
                                    <span>제품 이미지2(대표)</span><input type="file" class="form-control" name="pFile2"><form:errors path="pFile2"/>
                                </div>
                                <div class="form-group col-lg-6 col-md-6 name">
                                    <span>제품 이미지3(대표)</span><input type="file" class="form-control" name="pFile3"><form:errors path="pFile3"/>
                                </div>
                                <br>
                                --%>
                                <div class="form-group col-lg-6 col-md-6 name">
                                    <span>제품 설명</span><input type="file" class="form-control" name="prDesc"><form:errors path="prDesc"/>
                                    <input type="hidden" value="1">
                                </div>
                                <br>
                                <div class="form-group col-lg-6 col-md-6 name">
									<span>렌트 가격</span><input type="number" class="form-control" name="pPrice" min="1">
								</div>
								<br>
								<div class="form-group col-lg-6 col-md-6 name">
									<span>렌트 가능한 재고</span><input type="number" class="form-control" name="pAmount" min="1">
								</div>
                            </div>              
                            <input type="submit" value="등록" class="primary-btn submit_btn">
                            <input type="button" value="취소" class="primary-btn submit_btn" onclick="location.href='productlist.do'">
                        </form:form>
       </div>
	<%@ include file="../common/footer.jsp" %>
</body>
</html>