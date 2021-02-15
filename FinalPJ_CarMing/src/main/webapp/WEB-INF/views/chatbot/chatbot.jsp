<%@page import="com.finalPJ.carming.model.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>ChatBot</title>

<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- KARMA의 BUTTON 가져와서 사용하기 위해서 링크 -->
<link rel="stylesheet" type="text/css" href="resources/chatbot/css/button.css">
<link rel="stylesheet" type="text/css" href="resources/chatbot/css/jquery.convform.css">

<!-- CSS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">
<link rel="stylesheet" type="text/css" href="resources/chatbot/css/chatbot.css">

<style type="text/css">
@font-face {
    font-family: 'TmoneyRoundWindRegular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-07@1.0/TmoneyRoundWindRegular.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
body {
    font-family: 'TmoneyRoundWindRegular';
}

</style>

<!-- ChatBot Javascript -->
<!-- <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script> -->
<script type="text/javascript" src="resources/chatbot/js/jquery.convform.js"></script>
<script type="text/javascript" src="resources/chatbot/js/custom.js"></script>


</head>
<body>
<%

	MemberDto login;
	
	if(session.getAttribute("login") != null) {
		login = (MemberDto)session.getAttribute("login");
		System.out.println("Session의 no : " + login.getMemno());
	}
	
%> 	 
<!-- Session에 값이 있으면  / 값이 없으면
	챗봇 기능 사용 가능 / 로그인해야 한다고만 띄우기.
 -->	

<c:set var="no" value= "${login.getMemno() }" />

<c:if test="${not empty no}">
	<script>
		var memno = ${no};
	</script>
</c:if>


<!-- ChatBot -->
<div class="chat_icon">
	<img src="resources/img/logo_chatbot.png" alt="PingGu" style="width:50px; height:50px" >
</div>
<div class="chat_box">
	<div class="fullHeaderStyle">
		<div class="headerTitle">Ping Gu 캠핑친구</div>
	</div>
	<div class="conv-form-wrapper">
		
			<form action="" method="GET" class="hidden" target="param">
				
				<c:choose>
				    <c:when test="${empty no}">
						<select name="category" onchange="if(this.value) location.href=(this.value);" data-conv-question="' CarMing ' 챗봇 서비스 핑구에요!서비스 이용을 위해 먼저 로그인 해주세요!">
							<!-- redirect로 로그인페이지로 이동. --> 
							<option value="loginform.do">로그인/회원가입 하러가기</option>
						</select>
				    </c:when>
				    <c:otherwise>
				        <!-- 질문1 -->
						<select name="category" data-conv-question="' CarMing ' 챗봇 서비스 핑구에요! 무엇을 도와드릴까요? :)">
							<!-- 선택지 -->
							<option value="friendFind">캠핑 친구 찾기</option>
							<option value="question">문의하기</option>
						</select>
						
						<!-- 대답1--> 
						<div data-conv-fork="category">
							<!-- 캠핑친구찾기 선택시 -->
							<div id="friendFind" data-conv-case="friendFind">
								<select name="survey1" data-conv-question="PingGu와 함께 친구를 찾아봐요 !! 1. 본인의 성별은 무엇입니까!?">
									<option value="male">남자</option>
									<option value="female">여자</option>
								</select>
								
								<select name="survey2" data-conv-question="2. 누구와 함께 가고싶습니까!?">
									<option value="same">동성끼리</option>
									<option value="opposite">이성과 함께</option>
								</select>
								
								<select name="survey3" data-conv-question="3. 여행은 몇 명이서 갈까요!?">
									<option value="two">친구와 둘이(2인)</option>
									<option value="threefour">친구들과(3~4인)</option>
									<option value="five">여럿이(5인 이상)</option>
								</select>
								
								<!-- 캠핑 종류  -->
								<select name="survey4" data-conv-question="4. 가고자하는 캠핑의 종류는!?">
									<option value="normal">일반 캠핑</option>
									<option value="glamping">글램핑</option>
									<option value="caravan">카라반</option>
									<option value="car">차박</option>
								</select>
								
								<select name="survey5" data-conv-question="5. 둘 중 좋아하는 장소는!?">
								<!-- <select name="survey5" data-conv-question="둘 중 좋아하는 장소는!?"> -->
									<option value="mountain">싱그러운 초록 산</option>
									<option value="sea">끝없이 푸르른 바다</option>
								</select>
								
								<!-- 제출하시겠습니까? -->
								<select id="vvs" name="a" data-conv-question="친구를 찾았어요!" onchange="submit()" >
									<!-- 제출 버튼 -->
									<option value="jechool">친구 프로필 보기</option>
								</select>
								
							</div>
							
							<!-- Q & A -->
							<div data-conv-case="question">
								<input type="text" data-conv-question="문의하기를 선택하셨습니다." data-no-answer="true">
								
								<select name="categoryno" data-conv-question="해당하는 카테고리를 선택해주세요.">
									<!-- 선택지 -->	
									<option value="1">상품 및 배송</option>
									<option value="2">교환 및 반품</option>
									<option value="3">기타</option>
								</select>
								
								<input type="text" name="inquirycontent" data-conv-question="문의할 내용을 입력해주세요.">
								
                                <!-- 제출하시겠습니까? -->
								<select id="vvss" name="b" data-conv-question="제출하시겠습니까?" onchange="inquiry()" >
									<!-- 제출 버튼 -->
									<option value="jechooll">제출하기</option>
								</select>
								
								<input type="text" data-conv-question="빠른 시일내에 답변드리겠습니다." data-no-answer="true">
							</div>
							
						</div>
						
								
						
						<!-- 제출하시겠습니까? -->
						<!-- <select data-conv-question="제출하시겠습니까 ?">
							제출 버튼
							<option value="confirm">confirm</option>
						</select> -->
						
				    </c:otherwise>
				</c:choose>
			</form>
			
			
			<!-- <select name="selectFrined" data-conv-question="캠핑 성향이 비슷한 친구를 찾았어요!">
				<h1>하이요</h1>
				선택지
				<option value="friendFind"></option>
				<option value="QNA">회원3</option>
				<option value="customerService">회원5</option>
			</select> -->
			
			
			
	</div>
</div>

<!-- iframe 설정 -->
<iframe id="if" name="param" style="visibillity:hidden; display:none;"></iframe>
	
<!-- ChatBot End-->
</body>
</html>