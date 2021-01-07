<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CarMing</title>
<style type="text/css">
	.card-container{
		margin: 50px 200px;
	}
		
	.card-body{
		padding: 0px;
	}
		
	.card-body-left{
	 	float: left;
	 	width: 530px;
	 	height: 400px;
	 	margin: 0px 0px 0px -20px;
	 	text-align: center;
	 	background-color: #fff5e9;
	 	border-radius: 20px;
	}
	 	
	.card-context{
		margin: 100px;
		font-size: 1.2em;
	}	 		
	
	.card-body-right{
	 	float: right;
	 	width: 530px;
	 	height: 450px;
	}
	 
	.camera-logo{
	 	margin-top: 5px;
	 	width: 120px;
	 	height: 120px;
	 	opacity: 25%;
	}
	
	.logo-bottom-context{
		color: gray;
	}
	 	
	.card-body-bottom{
	 	clear: both;
	 	margin: 50px 400px;
	 	padding: 0px;
	}
	 	
	.dropdown-item{
	 	width: 500px;
	}
	 
	.dropdown-menu{
	 	width: 500px;
	}
	 	
	.body-content{
	 	margin: 15px 0px 0px 0px; 
	 	font-size: 1.2em;
	}
	 	
	.location-logo{
	 	width: 25px;
	 	height: 25px;
	}
	 	
	.body-location{
	 	margin: 10px 0px;
	}
	 	
	.body-location-left{
	 	float: left;
	 	width: 77%;
	}
	 	
	.body-location-right{
	 	float: right;
	 	width: 23%;
	}
	 	
	.body-checklist{
	 	margin: 10px -10px;
	}	
	 	
	#button-write{
	 	width: 350px; 
	 	height: 50px; 
	 	background-color: silver; 
		border-radius: 10px; 
		font-size:1.2em;  
		margin: -20px 0px 50px 0px;
	}
	 	
	#button-dropdown{
		width: 500px; 
		text-align: left;
	}	
	
	.navi li a:hover{
		background-color: #fff5e9;
		cursor: pointer;
	}
	
	/*체크박스 디자인 */
	input[type="checkbox"]{
		display: none;
	}
	
	input[type="checkbox"] + label{
		cursor: pointer;
	}
	
	input[type="checkbox"] + label:before{
		content: "";
		display: inline-block;
		width: 20px;
		height: 20px;
		margin-right: 10px;
		border: 1px solid silver;
		border-radius: 3px;
		vertical-align: middle;
		transition: all 0.3s;
	}
	
	input[type=checkbox]:checked + label:before{
		background-color: orange;
		border-color: orange;
		box-shadow: insert 5px 5px 5px 5px gray;
	} 
	
	input[type=checkbox]:checked + label:after{ 
		background: url('./resources/img/check.png') no-repeat;
	}
	 	
</style>

<!-- 
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
</script>	
 -->	
	  
  
  
  
  
  
  

	
	
	
</head>
<body>
	<!-- Start Header Area -->
   	<%@include file="../common/header.jsp"%>
   	<!-- End Header Area -->

	<div class="card-container">
		<div class="card-head">
			<h2 style="color: #5f5f5f;">게시글 작성하기</h2>
		</div>
		
		<div class="card-body">
			<!-- 사진/동영상 올리기  -->
			<div class="card-body-left">
				<div class="card-context">
					<img class="camera-logo" src="./resources/img/camera.png"><br>
					<span class="logo-bottom-context">사진 또는 동영상 올리기</span><br>
					<span class="logo-bottom-context">(사진은 최대 5장, 동영상은 1개만)</span>
				</div>
			</div>
			
			<div class="card-body-right">
				<div class="body-category">
					<button class="btn btn-outline-secondary dropdown-toggle" type="button" id="button-dropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						&nbsp;&nbsp;&nbsp;카테고리&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
					</button>
					<div class="dropdown-menu">
						<ul class="navi">
							<li><a class="dropdown-item">일반 캠핑</a></li>
							<li><a class="dropdown-item">오토 캠핑</a></li>
							<li><a class="dropdown-item">카라반</a></li>
							<li><a class="dropdown-item">글램핑</a></li>
							<li><a class="dropdown-item">차박</a></li>
							<li><a class="dropdown-item">나만의 캠핑</a></li>
						</ul>
					</div>
				</div>
				
				<!-- 
				<div class="input-group mb-3" style="width: 500px;">
				  <select class="custom-select" id="inputGroupSelect03" aria-label="Example select with button addon" >
				    <option selected>카테고리</option>
				    <option value="1">일반 캠핑</option>
				    <option value="2">카라반</option>
				    <option value="3">글램핑</option>
				    <option value="4">차박</option>
				    <option value="5">나만의 캠핑</option>
				  </select>
				</div>
				 -->
				
				<div class="body-content">
				   	<textarea rows="11" cols="54" placeholder=" 내용을 입력해주세요." style="resize: none;"></textarea>
				</div>
				
				<div class="body-location">
					<div class="body-location-left">
						<div><img class="location-logo" src="./resources/img/placeholder.png">&nbsp;서울특별시 카밍캠핑장</div>
					</div>
					<div class="body-location-right">
						<div><img class="location-logo" src="./resources/img/precision.png">&nbsp;
							 <a href="#" style="color: gray;">위치 등록</a>
						</div>
					</div>
				</div>
				<br>
				
				<div class="body-checklist">
					<input type="checkbox" id="chkcarplace" value="chkcarplace">&nbsp;&nbsp;
						<label for="chkcarplace">차박 명소 등록하기</label>&emsp;&emsp;
					<input type="checkbox" id="chkprivate" value="chkprivate">&nbsp;&nbsp;
						<label for="chkprivate">나만 보기</label>
				</div>
			</div>
		</div>
		
		<div class="card-body-bottom">
			<button type="submit" class="btn btn-light" onclick="#" id="button-write">올리기</button>
		</div>








	</div>

</body>
</html>