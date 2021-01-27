<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CarMing</title>
</head>
<body>
	<%@ include file="../common/header.jsp" %>
	<section class="order_details section_gap">
		<div class="container">
			<h1 class="title_confirmation" style="font-size: 20pt;">감사합니다. 고객님의 주문이 완료되었습니다.</h1>
			<div class="row order_d_inner" style="margin-right: 0%; margin-left: 35%; width: 100%;">
				<div class="col-lg-4">
					<div class="details_item">
						<h4>주문 정보</h4>
						<ul class="list">
							<li><a href="#"><span>주문 번호</span> : 60235</a></li>
							<li><a href="#"><span>제품명</span> : 60235</a></li>
							<li><a href="#"><span>주문 날짜</span> : Los Angeles</a></li>
							<li><a href="#"><span>금액</span> : USD 2210</a></li>
							<li><a href="#"><span>결제 수단</span> : Check payments</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</section>
	<%@ include file="../common/footer.jsp" %>
</body>
</html>