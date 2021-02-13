<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CarMing | 제품 등록</title>
<link rel="stylesheet" href="resources/scss/theme/_product.scss">
<style type="text/css">
	.col-first{margin: -1% 63.5% 0 -18%; } 
	.col-first > .maintext{font-weight: bold; font-size: 2.0em; color: #fff; text-align: left;}
	.text-1{margin: -5% 0 3%;}	
	
	
	
	
	
	*, ::after, ::before {
    	box-sizing: content-box;
</style>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	var sel_file;
	
	$(document).ready(function() {
		$("#input_img").on("change", handleImgFileSelect);
	});
	
	function handleImgFileSelect(e) {
		$("#img").empty(); //remove는 태그 자체를 지운다 
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);
	
		filesArr.forEach(function(f) {
			if (!f.type.match("image.*")) {
				alert("확장자는 이미지 확장자만 가능합니다.");
				return;
			}
			sel_file = f;
	
			var reader = new FileReader();
			reader.onload = function(e) {
				$("#img").attr("src", e.target.result);
				$("#img").attr("width", "90%");
				$("#img").attr("height", "440px");
			}
			reader.readAsDataURL(f);
		})
	}
	
	function resetInputFile() {
		$("#img").empty();
	}
</script>
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
	   </div>
	</section>
	<!-- End Banner Area -->
	
	<div class="comment-form" style="box-sizing: content-box;">
                        <h4>제품 등록</h4>
                        <form:form method="post" enctype="multipart/form-data" modelAttribute="fileUpload" action="productinsert.do">
                            <div class="form-group form-inline">
                                <div class="form-group col-lg-6 col-md-6 name">
                                   	 <span>카테고리</span><select name="pCategoryNo" class="form-control" id="category" placeholder="카테고리를 입력해주세요." onfocus="this.placeholder = ''" onblur="this.placeholder = '카테고리를 입력해주세요.'">
                                   	 		<option selected>카테고리를 선택해주세요.</option>
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
                                    <span>제품 이미지1(대표)</span><input type="file" class="form-control" id="input_img" name="prFile" accept="image/*"><form:errors path="pFile"/>
                                </div>
                                <div class="form-group col-lg-6 col-md-6 name">
                                    <span>제품 이미지2(대표)</span><input type="file" class="form-control" id="input_img2" name="prFile2" accept="image/*"><form:errors path="pFile2"/>
                                </div>
                                <div class="form-group col-lg-6 col-md-6 name">
                                    <span>제품 이미지3(대표)</span><input type="file" class="form-control" id="input_img3" name="prFile3" accept="image/*"><form:errors path="pFile3"/>
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
	                            <div class="form-group col-lg-6 col-md-6 name">
	                            	<div class="product_img">
	                            		<img id="img" src="">
	                            	</div>
                            	</div>
                            </div>              
                            <input type="submit" value="등록" class="primary-btn submit_btn">
                            <input type="button" value="취소" class="primary-btn submit_btn" onclick="location.href='productlist.do'">

                        </form:form>
       </div>
	<%@ include file="../common/footer.jsp" %>
	<script src="js/vendor/jquery-2.2.4.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4"
	 crossorigin="anonymous"></script>
	<script src="js/vendor/bootstrap.min.js"></script>
	<script src="js/jquery.ajaxchimp.min.js"></script>
	<script src="js/jquery.nice-select.min.js"></script>
	<script src="js/jquery.sticky.js"></script>
    <script src="js/nouislider.min.js"></script>
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<!--gmaps Js-->
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCjCGmQ0Uq4exrzdcL6rvxywDDOvfAu6eE"></script>
	<script src="js/gmaps.min.js"></script>
	<script src="js/main.js"></script>
</body>
</html>