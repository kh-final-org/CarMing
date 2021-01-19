<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>ChatBot</title>

<!-- CSS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">
<link rel="stylesheet" type="text/css" href="resources/chatbot/css/chatbot.css">
<!-- KARMA의 BUTTON 가져와서 사용하기 위해서 링크 -->
<link rel="stylesheet" type="text/css" href="resources/chatbot/css/button.css">
<link rel="stylesheet" type="text/css" href="resources/chatbot/css/jquery.convform.css">

<!-- ChatBot Javascript -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="resources/chatbot/js/jquery.convform.js"></script>
<script type="text/javascript" src="resources/chatbot/js/custom.js"></script>


</head>
<body style="background: #dedede;">
<%
	//String no = "";
	
	//no = (String)session.getAttribute("memno");
	//System.out.println("Session의 memno : " + no);
	
	System.out.println("Session의 memno : " + session.getAttribute("memno"));
	
	
%>
	<h1>HI, Ping Gu</h1>
	
	<h1><a href="userLogin.do">login</a></h1>
	<h1><a href="userLogin.do?memno=1">login?memno=1</a></h1>
	<h1><a href="userLogin.do?memno=2">login?memno=2</a></h1>
	<h1><a href="userLogout.do">logout</a></h1>
	
	<h1><a href="surveyList.do">list</a></h1>
	<h1><a href="surveyOne.do?memno=1">one</a></h1>
	<h1><a href="insertres.do">insert</a></h1>
	
	
	<!-- 프로필 링크 -->
	<div class="card" style="width: 18rem;">
	  <img class="card-img-top profileImage" src="resources/chatbot/img/profile.jpg" alt="Card image cap">
	  <div class="card-body">
	    <h5 class="card-title">닉네임</h5>
	    <p class="card-text">설명</p>
	    <a href="#" class="btn btn-primary">프로필로 이동하기</a>
	  </div>
	</div>
	
	
<!-- Session에 값이 있으면  / 값이 없으면
	챗봇 기능 사용 가능 / 로그인해야 한다고만 띄우기.
	


 -->	
	
	
	
<!-- ChatBot -->
<div class="chat_icon">
	<img src="resources/img/logo_chatbot.png" alt="PingGu" style="width:50px; height:50px" >
</div>
<div class="chat_box">
	<div class="fullHeaderStyle">
		<div class="headerTitle">Ping Gu 캠핑친구</div>
	</div>
	<div class="conv-form-wrapper">
		
			<form action="insertres.do" method="GET" class="hidden" target="param">
			<!-- <form action="insertres.do" method="GET" class="hidden"> -->
				
				<!-- 질문1 -->
				<select name="category" data-conv-question="' CarMing '의 챗봇 서비스 핑구입니다! 무엇을 도와드릴까요? :)">
					<!-- 선택지 -->
					<option value="friendFind">캠핑 친구 찾기</option>
					<option value="QNA">Q & A</option>
					<option value="customerService">상담원 연결하기</option>
				</select>
				
				<!-- option 클릭시, session에 값이 없으면 로그인하여야 사용가능하다고 표시. -->
				
				<!-- 대답1--> 
				<div data-conv-fork="category">
					<!-- 캠핑친구찾기 선택시 -->
					<div data-conv-case="friendFind">
						<select name="survey1" data-conv-question="PingGu와 함께 친구 찾기를 시작해요! 본인의 성별은 무엇입니까!?">
							<option value="male">남자</option>
							<option value="female">여자</option>
						</select>
						
						<select name="survey2" data-conv-question="누구와 함께 가고싶습니까!?">
							<option value="same">동성끼리</option>
							<option value="opposite">이성과 함께</option>
						</select>
						
						<select name="survey3" data-conv-question="여행은 몇 명이서 갈까요!?">
							<option value="two">친구와 둘이(2인)</option>
							<option value="threefour">친구들과(3~4인)</option>
							<option value="five">여럿이(5인 이상)</option>
						</select>
						
						<!-- 캠핑 종류  -->
						<select name="survey4" data-conv-question="가고자하는 캠핑의 종류는!?">
							<option value="normal">일반 캠핑</option>
							<option value="glamping">글램핑</option>
							<option value="caravan">카라반</option>
							<option value="car">차박</option>
						</select>
						
						<select name="survey5" data-conv-question="둘 중 좋아하는 장소는!?">
							<option value="mountain">싱그러운 초록 산</option>
							<option value="sea">끝없이 푸르른 바다</option>
						</select>
						
						<!-- 추천 친구의 프로필. -->
						
					</div>
					
					<!-- Q & A -->
					<div data-conv-case="QNA">
						<select name="QNA1" data-conv-question="' CarMing '의 챗봇 서비스 핑구입니다! 무엇을 도와드릴까요? :)">
							<!-- 선택지 -->	
							<option value="1">질문1</option>
							<option value="2">질문2</option>
							<option value="3">질문3</option>
						</select>				
					</div>
					
					<!-- 상담원 연결하기 선택시-->
					<div data-conv-case="customerService">
						<input type="text" name="company_name" data-conv-question="상담원과 연결됩니다.">				
					</div>
				</div>
				
				<!-- 제출하시겠습니까? -->
				<select data-conv-question="제출하시겠습니까 ?">
					<!-- 제출 버튼 -->
					<option value="confirm">confirm</option>
				</select>
				
			</form>
			
	</div>
</div>

<!-- iframe 설정 -->
<iframe id="if" name="param" style="visibillity:hidden; display:none;"></iframe>
	
<!-- ChatBot End-->
</body>
</html>