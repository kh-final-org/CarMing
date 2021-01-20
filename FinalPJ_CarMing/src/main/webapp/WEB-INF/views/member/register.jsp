<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#content{
	text-align: -webkit-center;
}
.panel-body{
	width: 80%;
	padding : 20px;
}
h4{
	padding-left : 40px;
	text-align : left;
	margin:20px
}
.col-lg-12{
	max-width: 80%;
	border : 1px solid #ccc	; 
	padding : 40px;
}

</style>
</head>
<body>

	<section id="header">
		<%@include file ="../common/header_register.jsp" %>
	</section>
	
	<section id="content">
	<div class="panel panel-default">
    <div class="panel-body">
        <div class="col-lg-12">
            <h4>이용약관</h4>
            <div class="panel-body" style="border: 1px solid #ccc">
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum tincidunt est vitae ultrices accumsan. Aliquam ornare lacus adipiscing, posuere lectus et, fringilla augue. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
        </div>
        <br>
        <h4>개인정보</h4>
        <div class="panel-body" style="border: 1px solid #ccc">
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum tincidunt est vitae ultrices accumsan. Aliquam ornare lacus adipiscing, posuere lectus et, fringilla augue. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
        </div>
        <br/>	
            <div class="form-group">
                <label class="checkbox-inline">
                    <input type="checkbox" name="agree" value="true">동의합니다.
                </label>
            </div>
            <button type="button" class="btn btn-default" onclick="law_check()">다음 단계</button>
	    </div>
	</div>
	</div>

	
	</section>








	<script type="text/javascript">
	
	}
	
	</script>
 	<script src="resources/js/vendor/jquery-2.2.4.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4"
	 crossorigin="anonymous"></script>
	<script src="resources/js/vendor/bootstrap.min.js"></script>
	<script src="resources/js/jquery.ajaxchimp.min.js"></script>
	<script src="resources/js/jquery.nice-select.min.js"></script>
	<script src="resources/js/jquery.sticky.js"></script>
	<script src="resources/js/nouislider.min.js"></script>
	<script src="resources/js/jquery.magnific-popup.min.js"></script>
	<script src="resources/js/owl.carousel.min.js"></script>
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCjCGmQ0Uq4exrzdcL6rvxywDDOvfAu6eE"></script>
	<script src="resources/js/gmaps.min.js"></script>
	<script src="resources/js/main.js"></script>
	<script src="resources/js/register.js"></script>
</body>
</html>