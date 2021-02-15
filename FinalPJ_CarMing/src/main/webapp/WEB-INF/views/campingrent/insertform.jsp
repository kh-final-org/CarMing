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
<link rel="stylesheet" href="resources/css/productInsert.css">

<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="resources/js/insertform.js?ver=5"></script>

<style type="text/css">
	.col-first{margin: -1% 63.5% 0 -18%; } 
	.col-first > .maintext{font-weight: bold; font-size: 2.0em; color: #fff; text-align: left;}
	.text-1{margin: -5% 0 3%;}
	#banner-text-2{position: absolute; top: 60%; right: 14%;}
	
	.banner-btn{width: 115px; padding: 8px 0 10px; line-height: 18px; border: 2px solid #fff5e9; border-radius: 3px;
				font-size: 1.1em; text-align: center; color: #fff5e9; background: transparent; opacity: 0.95;  
				position:relative; overflow: hidden; transition: 0.95s; cursor: pointer;}
	.banner-btn:hover{background: #fff5e9; color: #5f5f5f;}
	.banner-btn::before{content: ""; position: absolute; left:0; width:100%; height: 0%; background: #fff5e9; z-index: -1; 
						top:0; border-radius: 0 0 50% 50%; transition: 0.95s;}
	.banner-btn:hover::before{height: 180%;}
	
	.card-container{padding: 50px 250px; margin: 0;}
	.comment-form{margin: 0 !important; padding: 40px !important; background: #fff; border-radius: 10px; box-shadow: 10px 10px 30px rgba(0, 0, 0, 0.14);}
	
	.main-text{font-size: 1.15em; font-weight: bold; display: inline-block; margin: 0 0 1% 0.5%;}
    li.option.selected{width: 452px;}
	#main-frame-form{margin-top: 1.5%;}
	input#input_img.form-control,input#input_img2.form-control,input#input_img3.form-control
		{border: 1px solid #e2e2e2; border-radius: 5px;}
	#input-form{border: 1px solid #e2e2e2; border-radius: 5px;}
	div.nice-select.form-control{border: 1px solid #e2e2e2; border-radius: 5px;}
	
	.uploadimg {width: 360px; height: 360px;}
	.img_wrap {width: 320px; height: 310px; margin-top: 16px; }
	.img_wrap img {max-width: 100%; max-height: 100%;}
	.center-block {display: block; margin-left: auto; margin-right: auto; margin: 20px 60px 0;}	
	.upload-img-form{position: relative; width: 600px; height: 350px; border: 1px solid #e2e2e2;
					 border-radius: 10px; margin: 3% 55% 8%; background: #fff;}
	
	.btn{width: 150px; height: 45px; border-radius: 8px; outline: none; margin-top: -4px;
   		 background-color: #fff5e9; color: #5f5f5f !important; font-size:1.2em; cursor: pointer;}
	.btn:hover{background: #ffe6be; transition: 0.2s; outline: none;}
	#btn-register{ background-color: #ffe6be; font-weight: bold;}
	#btn-register:hover{background: #ffdb9f; transition: 0.2s;}
	#btn-cancel{margin-left: 5px; background-color: #ffe6be; font-weight: bold;}
	#btn-cancel:hover{background: #ffdb9f; transition: 0.2s;}
	
	
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
	      <div class="section-top-border text-right" id="banner-text-2">
	       	 <div class="button-group-area mt-40" style="padding-bottom: 5em">
	       	 	<button class="banner-btn" id="goinsert" type="button" onclick="location.href='adminProductList.do'">제품 목록</button>
	         </div>
		  </div>
	   </div>
	</section>
	<!-- End Banner Area -->
	
	<!-- Start Container Area -->
	<div class="card-container">
		<div class="comment-form" style="background: #fff5e9;">
			<h3 style="font-weight: bold; color: #5f5f5f;">제품 등록</h3><br>
		    <form:form method="post" enctype="multipart/form-data" modelAttribute="fileUpload" action="productinsert.do">
		        <div class="form-group form-inline" style="margin: 0;">
		            <div class="form-group col-lg-6 col-md-6 name" id="main-frame-form">
		               	 <span class="main-text">카테고리</span>
		               	 <select name="pCategoryNo" class="form-control" id="category" placeholder="카테고리를 선택해주세요." 
		               	 		 onfocus="this.placeholder = ''" onblur="this.placeholder = '카테고리를 선택해주세요.'">
		               	 		<option value="0" selected disabled>카테고리 (필수)</option>
		                	 	<option value="1">텐트 / 타프</option>
		                	 	<option value="2">매트 / 침낭</option>
		                	 	<option value="3">코펠 / 버너 / 취사</option>
		                	 	<option value="4">체어 / 테이블</option>
		                	 	<option value="5">화로대 / BBQ</option>
		               	 </select>
		            </div>
		            
		            <div class="form-group col-lg-6 col-md-6 name" id="main-frame-form">
		                 <span class="main-text">제품명</span>
		                 <input type="text" class="form-control" id="input-form" name="pName"  placeholder="제품명을 입력해주세요. "
		                    	onfocus="this.placeholder = ''" onblur="this.placeholder = '제품명을 입력해주세요.'">
		            </div>
		            
		            <div class="form-group col-lg-6 col-md-6 name" id="main-frame-form">
		                <span class="main-text">제품 대표 사진</span>
		                <input type="file" class="form-control" id="input_img" name="prFile" accept="image/*">
		                <form:errors path="pFile"/>
		            </div>
		            
		            <div class="form-group col-lg-6 col-md-6 name" id="main-frame-form">
		                <span class="main-text">제품 설명</span>
		                <input type="file" class="form-control" id="sel_pName2" name="prDesc"><form:errors path="prDesc"/>
		                <input type="hidden" value="1">
		            </div>
					
					<div class="form-group col-lg-6 col-md-6 name" id="main-frame-form">
		                <span class="main-text">제품 사진-1</span>
		                <input type="file" class="form-control" id="input_img2" name="prFile2" accept="image/*">
		                <form:errors path="pFile2"/>
		            </div>
		            
		            <div class="form-group col-lg-6 col-md-6 name" id="main-frame-form">
						<span class="main-text">렌트 가격</span>
						<input type="number" class="form-control" id="input-form" name="pPrice" min="1">
					</div>
		            
		            <div class="form-group col-lg-6 col-md-6 name" id="main-frame-form">
		                <span class="main-text">제품 사진-2</span>
		                <input type="file" class="form-control" id="input_img3" name="prFile3" accept="image/*">
		                <form:errors path="pFile3"/>
		            </div>
					
					<div class="form-group col-lg-6 col-md-6 name" id="main-frame-form">
						<span class="main-text">렌트 가능한 재고</span>
						<input type="number" class="form-control" id="input-form" name="pAmount" min="1">
					</div>
					
					<!-- 사진 (미리보기) -->
	                <div class="form-group col-lg-6 col-md-6 name" id="main-frame-form">
	                	<div class="upload-img-form">
		                	<div class="img_wrap center-block">
									<img id="img" src="">
				  			</div>
	                	</div>
	               	</div>
            	</div>
            	
            	<!-- 버튼 -->  
	            <div class="form-group" >
	            	<div class="card-body-bottom">           
		                <input type="submit" value="등록" class="btn btn-light" id="btn-register">
		                <input type="button" value="취소" class="btn btn-light" id="btn-cancel" onclick="location.href='productlist.do'">
			    	</div>
			    </div>
		    </form:form>
	    </div>
    </div>
    <!-- End Container Area -->
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