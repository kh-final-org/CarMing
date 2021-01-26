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
	//
});
   
function submit() {
	alert("submit 함수 실행");   

 	var survey1 = $("select[name=survey1]").val();
	var survey2 = $("select[name=survey2]").val();
	var survey3 = $("select[name=survey3]").val();
	var survey4 = $("select[name=survey4]").val();
	var survey5 = $("select[name=survey5]").val();
	console.log(survey1 + "/" + survey2 + "/" + survey3 + "/" + survey4 + "/" + survey5 + "/");
	
	// JSON 형식으로 설문조사 결과 저장.
	var surveyVal = {
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
			 
			alert("ajax success");

			 if(msg.check==true) {
				alert("msg.check==true");
				
				// select [same]
				if(survey2 == "same") {
					alert("survey2 == same");
					//location.href="sameFriendList.do";
					
					$.ajax({
						type:"post",
						url:"sameFriendOne.do",
						data:JSON.stringify(surveyVal),
						contentType:"application/json",
						dataType:"json",
						
						success:function(data) {
							alert("same select success");
							//alert("data.check : " + data.no);
						},
						
						error:function() {
							alert("same select error");
						}
					});
				} else {
					alert("survey2 == other");
					
					
				}
				
				
			 } else {
				 alert("잘못");
				 //$("#loginChk").show();
				 //$("#loginChk").html("ID 혹은 PW가 잘못되었습니다.");
			 }
			 
		 },
		 error:function() {
			 alert("통신 실패???");
		 }
		  
	  });

}



	