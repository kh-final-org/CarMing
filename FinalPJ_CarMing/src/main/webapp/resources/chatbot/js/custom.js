$(document).ready(function(){
	// chat_icon 클릭시 발생 이벤트
	$('.chat_icon').click(function(event) {
		// chat_box 에 active를 toggle로 추가/삭제
		$('.chat_box').toggleClass('active');
	});

	// 	
	$('.conv-form-wrapper').convform({selectInputStyle: 'disable'});
})

$(function(){
	$("#list").prepend("<li>새로 추가된 아이템</li>");
});
   
function submit() {
	console.log("submit 함수 실행");
	
 	var survey1 = $("select[name=survey1]").val();
	var survey2 = $("select[name=survey2]").val();
	var survey3 = $("select[name=survey3]").val();
	var survey4 = $("select[name=survey4]").val();
	var survey5 = $("select[name=survey5]").val();
	console.log(memno + "/" + survey1 + "/" + survey2 + "/" + survey3 + "/" + survey4 + "/" + survey5 + "/");
	
	// JSON 형식으로 설문조사 결과 저장.
	var surveyVal = {
		"memno" : memno,
		"survey1" : survey1,
		"survey2" : survey2,
		"survey3" : survey3,
		"survey4" : survey4,
		"survey5" : survey5
	};
	
	// INSERT || UPDATE
	$.ajax({
		 type:"post",
		 url:"insertAjax.do",
		 data:JSON.stringify(surveyVal),
		 contentType:"application/json",
		 dataType:"json",
		 success:function(msg) {
			//alert("insert ajax success");
		 },
		 error:function() {
			 alert("통신 실패???");
		 }
	});
	
	/* 비교할 값 변경  (동성은 그대로 실행) */ 
	// 이성일 경우 
	if(survey2 == "opposite") {
		// 남성이면 -> 여성찾기
		if(survey1 == "male") {
			surveyVal.survey1 = "female"
		// 여성이면 -> 남성찾기
		} else {
			surveyVal.survey1 = "male"
		}
	}
	
	// 친구 찾기 실행.
	friendOne(surveyVal);
}


// 캠핑 친구 검색
function friendOne(surveyVal) {
	console.log("friendOne() 실행");
	
	$.ajax({
		type:"post",
		url:"FriendOne.do",
		data:JSON.stringify(surveyVal),
		contentType:"application/json",
		dataType:"json",
		success:function(msg) {
			console.log("friendOne success");
			//console.log("친구의 번호는 : " + msg.friendNo);
			//console.log("친구의 파일은 : " + msg.friendFile);
			//console.log("친구의 닉네임은 : " + msg.friendNick);
			//console.log("친구의 성별은 : " + msg.friendGender);
			
			// profileCard()로 친구 번호 넘겨주자.
			//profileCard(msg.friendNo);
			profileCard(msg);
			
		},
		error:function() {
			console.log("friendOne error");
		}
	});
}

// 프로필 카드 보여주기.
function profileCard(friend) {
	console.log("profileCard() 실행");
	console.log("friendNo : " + friend.friendNo);
	console.log("친구의 파일은 : " + friend.friendFile);
	console.log("친구의 닉네임은 : " + friend.friendNick);
	console.log("친구의 성별은 : " + friend.friendGender);
	
	$(".cardProfile").css('display','none');
	
	
	
	// 비우기.
	$("#drag").empty();
	
	// 태그 추가.
	//$("#drag").append('<div class="option" onclick="friendProfile('+friendNo+')">' + friendNo + "번 친구</div>");
	// --> 프로필 카드로 변경하기.
	//$("#drag").append('<a href="#" class="btn btn-primary">프로필로 이동</a>');
	$("#drag").append('<div class="profileOption option"><div class="cardProfile"><div class="d-flex position-relative"><img src="resources/img/'+friend.friendFile+'" class="flex-shrink-0 me-3 cardImage" alt="..."><div><h5 class="mt-0 cardNickname">'+friend.friendNick+'</h5><p class="cardGender" style="font-size: 10px;">'+friend.friendGender+'</p></div></div><a href="#" class="btn btn-primary cardLink" onclick="friendProfile('+friend.friendNo+')">프로필 보기</a></div></div>');
	//$("#drag").append('<div class="cardProfile"><div class="d-flex position-relative"><img src="resources/chatbot/img/'+friend.friendFile+'" class="flex-shrink-0 me-3 cardImage" alt="..."><div><h5 class="mt-0 cardNickname">'+friend.friendNick+'</h5><p class="cardGender" style="font-size: 10px;">'+friend.friendGender+'</p></div></div><a href="#" class="btn btn-primary cardLink" onclick="friendProfile('+friend.friendNo+')">프로필 보기</a></div>');
	
	$("#drag").append('<div class="option" onclick="submit()"> 친구 다시 찾기 </div>');
	
	// 처음으로 돌아가기.
	$("#drag").append('<div class="option" onclick="location.reload()">처음으로 </div>');
		 
	//$(".typing_loader").css('display','none');
	
}
	
// 친구 프로필 페이지로 이동!
function friendProfile(friendNo) {
	// 유저페이지.jsp로 이동할 때 (친구번호)를 매개변수로 넘겨주자.
	// 예시) <a href="profileform.do?memno=${list.memNo}">
	window.location.href = "profileform.do?memno="+friendNo;
	
}


	