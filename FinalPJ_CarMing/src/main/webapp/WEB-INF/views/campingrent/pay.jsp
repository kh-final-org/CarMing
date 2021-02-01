<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CarMing</title>
<link rel="stylesheet" href="resources/scss/theme/_product.scss">
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	var width = 500;	//팝업의 너비
	var height = 600;	//팝업의 높이
	function sample4_execDaumPostcode() {
	    new daum.Postcode({
	    	width: width,
	    	height: height,
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
	            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	            var roadAddr = data.roadAddress; // 도로명 주소 변수
	            var extraRoadAddr = ''; // 참고 항목 변수
	
	            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                extraRoadAddr += data.bname;
	            }
	            // 건물명이 있고, 공동주택일 경우 추가한다.
	            if(data.buildingName !== '' && data.apartment === 'Y'){
	               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	            }
	            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	            if(extraRoadAddr !== ''){
	                extraRoadAddr = ' (' + extraRoadAddr + ')';
	            }
	
	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
	            document.getElementById('sample4_postcode').value = data.zonecode;
	            document.getElementById("sample4_roadAddress").value = roadAddr;
	            document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
	            
	            // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
	            if(roadAddr !== ''){
	                document.getElementById("sample4_extraAddress").value = extraRoadAddr;
	            } else {
	                document.getElementById("sample4_extraAddress").value = '';
	            }
	
	            var guideTextBox = document.getElementById("guide");
	            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
	            if(data.autoRoadAddress) {
	                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
	                guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
	                guideTextBox.style.display = 'block';
	
	            } else if(data.autoJibunAddress) {
	                var expJibunAddr = data.autoJibunAddress;
	                guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
	                guideTextBox.style.display = 'block';
	            } else {
	                guideTextBox.innerHTML = '';
	                guideTextBox.style.display = 'none';
	            }
	        }
	    }).open({
	    	left: (window.screen.width/2) - (width/2),
	    	top: (window.screen.heigth/2) - (height/2)
	    });
	}
</script>
</head>
<body>
	<%@ include file="../common/header.jsp" %>
	<!--================Cart Area =================-->
	<!-- Start Banner Area -->
	<section class="banner-area organic-breadcrumb">
		<div class="container">
			<div class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
				<div class="col-first">
					<h1>결제</h1>
					<nav class="d-flex align-items-center">
						<a href="index.html">홈<span class="lnr lnr-arrow-right"></span></a>
						<a href="category.html">결제<span class="lnr lnr-arrow-right"></span></a>
					</nav>
				</div>
			</div>
		</div>
	</section>
	<!-- End Banner Area -->
        <div class="order_details_table" style="margin: 10%;">
				<h2>배송지 입력</h2>
				<div class="table-responsive">
					<table class="table" style="padding: 10px;">
						<tbody>
							<tr>
								<td>
									<span>받는 분&nbsp;&nbsp;</span><input type="text" name="reciper" value="">
								</td>
							</tr>
							<tr>
								<span>우편번호&nbsp;&nbsp;</span><input type="text" id="sample4_postcode" name="name" value="" placeholder="우편번호">
								<input type="button" onclick="sample4_execDaumPostcode();"value="우편번호 찾기"><br>
								<input type="text" id="sample4_roadAddress" name="roadaddr" placeholder="도로명주소">
								<input type="text" id="sample4_jibunAddress" name="jibunaddr" placeholder="지번주소"><br>
								<span id="guide" style="color: $999; display: none;"></span>
								<input type="text" id="sample4_detailAddress" placeholder="상세주소">
								<input type="text" id="sample4_extraAddress" placeholder="참고항목">
							</tr>
							<tr>
								<td>
									<span>주소지&nbsp;&nbsp;</span><input type="text" name="addr" value="">
								</td>
							</tr>
							<tr>
								<td>
									<span>휴대전화&nbsp;&nbsp;</span><input type="text" name="phone" value="">
								</td>
							</tr>
							<tr>
								<td>
									<span>대여 기간&nbsp;&nbsp;</span><input type="text" name="rentdate" value="">
								</td>
							</tr>
							<tr>
								<td>
									<span>배송 메모&nbsp;&nbsp;</span><input type="text" name="memo" value="">
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<h2>주문자</h2>
				<div class="table-responsive">
					<table class="table">
						<tbody>
							<tr>
								<td>
									<span>이름&nbsp;&nbsp;</span><input type="text" name="indenter" value="">
								</td>
							</tr>
							<tr>
								<span>이메일&nbsp;&nbsp;</span><input type="text" name="email" value="">
							</tr>
							<tr>
								<td>
									<span>휴대전화&nbsp;&nbsp;</span><input type="text" name="phone" value="">
								</td>
							</tr>
					</table>
				</div>
				<h2>최종 주문 금액</h2>
					<table class="table">
						<thead>
							<tr>
								<th scope="col">상품</th>
								<th scope="col">수량</th>
								<th scope="col">총</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>
									<p>Pixelstore fresh Blackberry</p>
								</td>
								<td>
									<h5>x 02</h5>
								</td>
								<td>
									<p>$720.00</p>
								</td>
							</tr>
							<tr>
								<td>
									<p>Pixelstore fresh Blackberry</p>
								</td>
								<td>
									<h5>x 02</h5>
								</td>
								<td>
									<p>$720.00</p>
								</td>
							</tr>
							<tr>
								<td>
									<p>Pixelstore fresh Blackberry</p>
								</td>
								<td>
									<h5>x 02</h5>
								</td>
								<td>
									<p>$720.00</p>
								</td>
							</tr>
							<tr>
								<td>
									<h4>Total</h4>
								</td>
								<td>
									<h5></h5>
								</td>
								<td>
									<p>$2210.00</p>
								</td>
							</tr>
						</tbody>
					</table>
				<span><h2>결제 방법</h2></span>
				<div class="nice-select" tabindex="0" style="float:none; width:15%;">
					<span class="current">카드</span>
					<ul class="list">
						<li data-value=" 1" class="option selected focus">카드</li>
						<li data-value=" 1" class="option selected focus">계좌이체</li>
					</ul>
				</div>
				<table class="table">
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td><input type="checkbox">결제 진행 동의&nbsp;&nbsp;<button type="submit" value="submit" class="primary-btn">결제하기</button></td>
					</tr>
				</table>
		</div>		
    <!--================End Cart Area =================-->
	<%@ include file="../common/footer.jsp" %>
</body>
</html>